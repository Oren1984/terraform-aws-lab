# Task 54 – GitHub Actions + Terraform (Workspaces / Multiple Environments)

**Goal:** Extend the GitHub Actions workflow to use **Terraform workspaces** so that resources are provisioned per environment (e.g., `dev`, `prod`).

This example uses an S3 bucket whose name includes the current **`terraform.workspace`** to keep environments isolated.

---

## Structure
```
17-github-actions-terraform-workspaces/
├─ .github/
│  └─ workflows/
│     └─ terraform.yml
├─ main.tf
├─ variables.tf
├─ versions.tf
└─ .gitignore
```

---

## Workflow Highlights (`.github/workflows/terraform.yml`)
```yaml
- name: Select Workspace
  run: |
    terraform workspace new dev || terraform workspace select dev

- name: Terraform Plan
  run: terraform plan -var="environment=dev"

- name: Terraform Apply
  run: terraform apply -auto-approve -var="environment=dev"
```
> The workflow ensures the `dev` workspace exists and then runs plan/apply with `environment=dev`.

---

## Terraform (per‑workspace bucket)
- Bucket name includes the current workspace: `gha-ws-demo-${terraform.workspace}-<suffix>`.
- Outputs include both the bucket name and the active workspace.

```hcl
resource "random_id" "suffix" {
  byte_length = 2
}

resource "aws_s3_bucket" "example" {
  bucket = "gha-ws-demo-${terraform.workspace}-${random_id.suffix.hex}"
  acl    = "private"

  tags = {
    Environment = var.environment
    ManagedBy   = "GitHubActions"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.example.id
}

output "workspace" {
  value = terraform.workspace
}
```

---

## Secrets Required
Create GitHub repository secrets:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

> For production: prefer **OIDC to assume an IAM role** instead of long‑lived keys.

---

## Optional: Multi‑env Matrix
To support both `dev` and `prod` in a single workflow, use a matrix strategy:
```yaml
strategy:
  matrix:
    env: [dev, prod]

steps:
  - name: Select Workspace
    run: |
      terraform workspace new ${{ matrix.env }} || terraform workspace select ${{ matrix.env }}

  - name: Terraform Plan
    run: terraform plan -var="environment=${{ matrix.env }}"

  - name: Terraform Apply
    run: terraform apply -auto-approve -var="environment=${{ matrix.env }}"
```
This will run the job **twice** (once for each environment), creating separate resources per workspace.

---

## Cleanup
To destroy resources from GitHub Actions, create a manual job (`workflow_dispatch`) that does:
```bash
terraform workspace select dev
terraform destroy -auto-approve -var="environment=dev"
```
Repeat for other workspaces (e.g., `prod`).

---

## Notes
- Workspaces isolate **state**; including the workspace name in resource identifiers avoids name collisions.
- Consider remote state (S3 + DynamoDB) for teams.
- Add Checkov or fmt/validate steps for compliance & quality.
