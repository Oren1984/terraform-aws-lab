terraform {
  backend "s3" {
    bucket = "oren-terraform-state-bucket"
    key    = "state/modules/task37.tfstate"
    region = "us-east-1"
  }
}
