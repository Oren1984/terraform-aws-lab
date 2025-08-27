# Define the AWS region variable
# This allows flexibility to deploy the S3 bucket in different regions
variable "aws_region" {
  description = "AWS region for the S3 bucket"
  type        = string
  default     = "us-east-1"  # default region is US East (N. Virginia)
}
