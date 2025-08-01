module "logs_bucket" {
  source      = "./modules/s3-bucket"
  bucket_name = "oren-logs-bucket-20250801"
}

module "media_bucket" {
  source      = "./modules/s3-bucket"
  bucket_name = "oren-media-bucket-20250801"
}
