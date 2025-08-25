variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name (e.g., dev, prod). Used for tags or conditional logic."
  type        = string
  default     = "dev"
}
