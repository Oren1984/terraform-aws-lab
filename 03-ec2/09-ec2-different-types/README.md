📁 Task 29 – Create EC2 Instances with Different Types

📌 Goal
Launch two EC2 instances, each with a different instance type, using for_each and a variable map.

** Files
* main.tf: Contains the main Terraform configuration to launch EC2 instances.
* variables.tf: Defines the instance type mapping.
* outputs.tf: Displays public IPs and instance types after provisioning.


** Example Output After terraform apply
utputs:
instance_ips = {
  "web1" = "16.171.194.220"
  "web2" = "13.51.238.149"
}

instance_types = {
  "web1" = "t3.micro"
  "web2" = "t3.small"
}


** Notes
We use for_each to create multiple resources dynamically based on a map variable.

Tags are assigned using each.key, which results in Name = web1 and Name = web2.

Ensure the AMI ID corresponds to your AWS region (eu-north-1 in this case).

t2.micro and t2.small are not supported in eu-north-1, so we used t3.micro and t3.small.

