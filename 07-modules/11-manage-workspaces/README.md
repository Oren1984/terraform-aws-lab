# Task 48 – List and Delete Workspaces

**Goal:** Practice Terraform workspace management commands (list, select, delete).

---

## Steps

1) **List all workspaces**
```bash
terraform workspace list


Example output:

* default
  dev
  prod


Delete the dev workspace

⚠️ You cannot delete the workspace you are currently in.
Always switch back to default before deletion.

terraform workspace select default
terraform workspace delete dev


Expected output:

Deleted workspace "dev"!


Verify deletion

terraform workspace list


Example output:

* default
  prod

Notes

Each workspace has its own state. Deleting a workspace will remove its state directory from .terraform/terraform.tfstate.d/.

Deleting a workspace does not delete resources in AWS automatically.

If you want to clean up the resources tied to that workspace, run:

terraform workspace select dev
terraform destroy -auto-approve


before deleting the workspace.

The default workspace cannot be deleted.
