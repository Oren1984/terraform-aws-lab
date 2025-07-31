variable "tagged_buckets" {
  description = "Map of bucket names and their purpose"
  type        = map(string)
  default = {
    logs   = "Logging"
    photos = "Media"
  }
}
