terraform {
  backend "s3" {
    bucket = "oren-terraform-state-bucket"
    key    = "state/ec2/task29.tfstate"
    region = "us-east-1"
  }
}
