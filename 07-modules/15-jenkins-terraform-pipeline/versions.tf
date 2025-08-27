# Terraform settings and provider requirements
terraform {
  # Minimum Terraform version required
  required_version = ">= 1.5.0"

  # Providers used in this project
  required_providers {
    # AWS provider to manage AWS resources
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    # Random provider to generate random values (e.g., suffix for S3 bucket)
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

# AWS provider configuration
provider "aws" {
  # Region is passed as a variable (default = us-east-1, see variables.tf)
  region = var.aws_region
}
