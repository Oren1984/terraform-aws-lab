output "bucket_tags" {
  value = {
    for k, b in aws_s3_bucket.buckets :
    k => b.tags
  }
}
