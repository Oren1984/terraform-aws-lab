# ✅ Requirements – Task 29: Create EC2 Instances with Different Types

## Files Needed:
- `main.tf`: Defines EC2 resources using for_each and a map.
- `variables.tf`: Holds instance type definitions.
- `outputs.tf`: Prints names of created instances.
- `backend.tf`: Stores remote state in S3.
- `result.txt`: Logs the outcome and final output.

## Commands to Run:

```bash
terraform init
terraform plan
terraform apply
Ensure AMI ID is valid for your selected AWS region.
