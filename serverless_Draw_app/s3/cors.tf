resource "aws_s3_bucket_cors_configuration" "static_site_cors" {
  bucket = aws_s3_bucket.static_site.id

  cors_rule {
    allowed_methods = ["GET", "POST", "OPTIONS"]
    allowed_origins = ["https://api.test-draw.com", "https://test-draw.com", "https://your-apidomain.com"]
    allowed_headers = ["Authorization", "Content-Type", "x-amz-date", "x-api-key", "x-amz-security-token"]
    expose_headers  = ["x-amz-security-token"]
    max_age_seconds = 3600
  }
}
