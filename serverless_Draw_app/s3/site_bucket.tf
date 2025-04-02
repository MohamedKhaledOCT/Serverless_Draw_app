resource "aws_s3_bucket" "static_site" {
  bucket = "test-draw.com"

  tags = {
    Project     = "DrawApp"
    Environment = "Production"
  }
}

resource "aws_s3_bucket_website_configuration" "static_site_website" {
  bucket          = aws_s3_bucket.static_site.id
}

