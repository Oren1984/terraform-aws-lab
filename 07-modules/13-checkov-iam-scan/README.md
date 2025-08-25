# Task 50 – Scan a Terraform IAM User with High Permissions (Checkov)

**Goal:** Use Checkov to detect high‑risk IAM policies in Terraform.  
We’ll scan an IAM user with an inline policy that grants **`Action="*"` on `Resource="*"`**, which is overly permissive.

---

## Files
```
13-checkov-iam-scan/
├─ iam-user.tf
└─ README.md
```

### `iam-user.tf`
```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "admin" {
  name = "admin-user"
}

resource "aws_iam_user_policy" "admin_policy" {
  name = "admin-policy"
  user = aws_iam_user.admin.name

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [{
      "Action"   : "*",
      "Effect"   : "Allow",
      "Resource" : "*"
    }]
  })
}
```

---

## How to Run (on Ubuntu with Checkov installed)
1) Navigate to the folder:
```bash
cd 13-checkov-iam-scan
```

2) Scan with Checkov:
```bash
checkov -d .
```

**Expected outcome:** Checkov will flag the inline IAM policy as **overly permissive** (wildcards on both `Action` and `Resource`).

---

## Typical Findings You May See
- **IAM policy allows full administrative privileges** (wildcard action on wildcard resource).  
- Recommendation: Replace with **least‑privilege** permissions and/or attach specific AWS managed policies rather than an inline `*:*` policy.

---

## Fix Ideas (Least Privilege)
- Prefer attaching **scoped managed policies** (e.g., `ReadOnlyAccess`, or a custom policy with specific actions and resources).
- If admin powers are truly required, attach **`AdministratorAccess`** to a **group** and assign the user to that group (centralized management, easier auditing), and gate usage behind MFA + strong controls.

---

## Clean Up (if you applied Terraform for a live test)
```bash
terraform destroy -auto-approve
```

> This task is intended for **scan/demo only**. Do not use such permissive policies in real environments.
