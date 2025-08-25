variable "instance_name" {
  type        = string
  description = "Name tag for the EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "Instance type (e.g. t2.micro)"
  default     = "t2.micro"
}

variable "ami_id" {
  type        = string
  description = "AMI ID to use (e.g. ami-xxxxxxxx)"
}
