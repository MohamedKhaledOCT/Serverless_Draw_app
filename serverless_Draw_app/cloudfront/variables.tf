variable "s3_bucket" {
  description = "S3 bucket used as the origin for CloudFront distribution"
  type        = object({
    id                        = string,
    bucket_regional_domain_name = string
  })
}
