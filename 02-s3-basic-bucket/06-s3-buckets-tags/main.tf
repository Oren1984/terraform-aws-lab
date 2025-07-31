resource "aws_s3_bucket" "buckets" {
  for_each = var.tagged_buckets

  bucket = "oren-${each.key}-2025"

  tags = {
    purpose = each.value
  }
}

