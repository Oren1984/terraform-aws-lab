# Task 20 – Output EC2 Tags

## 🎯 Goal
Output the tags of a tagged EC2 instance using Terraform.


## 📂 Files
- `main.tf`: Defines the EC2 instance with multiple tags.
- `outputs.tf`: Outputs the tags of the created instance.


## 🧪 Verification
After running `terraform apply`, you should see output similar to:

```hcl
Outputs:

instance_tags = {
  "Name" = "TaggedInstance"
  "Owner" = "oren"
  "Project" = "TerraformLab"
}


💡 Notes
* Tags are useful for organization, cost allocation, and automation.
* You can use aws_instance.example.tags["Name"] to output a specific tag.
