# Task 55 – GitHub Actions + Terraform with IAM Role (OIDC, No Access Keys)

**Goal:** Use a GitHub OIDC‑backed IAM role to authenticate to AWS **without** storing long‑lived access keys.  
The workflow assumes an AWS IAM role via OpenID Connect (OIDC) and then runs Terraform (init/plan/apply).

---

## Folder Structure
```
18-github-actions-terraform-oidc/
├─ .github/
│  └─ workflows/
│     └─ terraform-oidc.yml
├─ main.tf
├─ variables.tf
├─ versions.tf
└─ .gitignore
```

---

## Step 1 — Create an IAM Role for GitHub OIDC

### 1.1 Create/Use AWS OIDC Provider for GitHub
AWS now supports **token.actions.githubusercontent.com** as the OIDC provider for GitHub.  
When creating the role in the console, choose **Web Identity** → **GitHub** (or manually create a provider):
- Provider URL: `https://token.actions.githubusercontent.com`
- Audience: `sts.amazonaws.com`

### 1.2 Trust Policy (restrict to your repo/branch)
Replace `<ORG_OR_USER>`, `<REPO>`, and `<BRANCH>`:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": { "Federated": "arn:aws:iam::<ACCOUNT_ID>:oidc-provider/token.actions.githubusercontent.com" },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
        },
        "StringLike": {
          "token.actions.githubusercontent.com:sub": "repo:<ORG_OR_USER>/<REPO>:ref:refs/heads/<BRANCH>"
        }
      }
    }
  ]
}
```

> Example `sub` patterns you can use:
> - A single branch: `repo:org/repo:ref:refs/heads/main`
> - Any branch: `repo:org/repo:ref:refs/heads/*`
> - Pull requests: `repo:org/repo:pull_request`

### 1.3 Permissions Policy (least‑privilege)
Attach a policy that allows the actions Terraform needs. For the demo S3 bucket, a minimal example could include:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:CreateBucket",
        "s3:DeleteBucket",
        "s3:ListBucket",
        "s3:GetBucketLocation",
        "s3:GetBucketTagging",
        "s3:PutBucketTagging",
        "s3:PutEncryptionConfiguration",
        "s3:GetEncryptionConfiguration"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:PutBucketPolicy",
        "s3:DeleteBucketPolicy"
      ],
      "Resource": "*"
    }
  ]
}
```
> In real projects, scope resources with ARNs and add only the specific actions needed.

---

## Step 2 — Update GitHub Actions Workflow

`.github/workflows/terraform-oidc.yml`:

```yaml
name: Terraform CI (OIDC Role)

on:
  push:
    branches: [ "main" ]
  workflow_dispatch:

jobs:
  terraform:
    runs-on: ubuntu-latest
    permissions:
      id-token: write   # required for OIDC
      contents: read
    steps:
      - name: Checkout repo
        uses: actions/checkout@v4

      - name: Configure AWS credentials via OIDC
        uses: aws-actions/configure-aws-credentials@v4
        with:
          role-to-assume: arn:aws:iam::<ACCOUNT_ID>:role/<ROLE_NAME>
          aws-region: us-east-1

      - name: Terraform Version
        run: terraform -version

      - name: Terraform Init
        run: terraform init

      - name: Terraform Validate
        run: terraform validate

      - name: Terraform Plan
        run: terraform plan -out=tfplan

      - name: Terraform Apply
        if: github.ref == 'refs/heads/main'
        run: terraform apply -auto-approve tfplan || terraform apply -auto-approve
```

> No secrets for access keys are needed; the job exchanges the OIDC token for temporary AWS credentials.

---

## Terraform Example
A small S3 bucket with a random suffix to avoid collisions:

```hcl
resource "random_id" "suffix" {
  byte_length = 2
}

resource "aws_s3_bucket" "example" {
  bucket = "gha-oidc-demo-${random_id.suffix.hex}"
  acl    = "private"

  tags = {
    ManagedBy = "GitHubActionsOIDC"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.example.id
}
```

---

## Run It
1. Push this folder to your repo.
2. Create the IAM role in AWS with the trust & permission policies above.
3. Trigger the workflow (push to `main` or manual **Run workflow**).  
   The workflow will assume the role and run Terraform **without** any stored access keys.

---

## Cleanup
If you created real resources, destroy them either locally or via a similar OIDC workflow that runs:
```bash
terraform destroy -auto-approve
```

---

## Notes
- Prefer OIDC + IAM roles in CI/CD over long‑lived access keys.
- Lock state remotely (S3 + DynamoDB) for teams.
- Add format/validate and security scans (e.g., **Checkov**) to the pipeline.
