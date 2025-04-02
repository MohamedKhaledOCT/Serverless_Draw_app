resource "aws_cloudfront_distribution" "static_site_distribution" {
  origin {
    domain_name = var.s3_bucket.bucket_regional_domain_name
    origin_id   = "S3-${var.s3_bucket.id}"
  }

  enabled             = true
  default_root_object = "index.html"

  default_cache_behavior {
  viewer_protocol_policy = "redirect-to-https"
  allowed_methods        = ["GET", "HEAD", "OPTIONS"]
  cached_methods         = ["GET", "HEAD"]
  target_origin_id       = "S3-${var.s3_bucket.id}"

  forwarded_values {
    query_string = false
    headers      = ["Origin", "Authorization", "Content-Type"]
    cookies {
      forward = "none"
    }
  }
}

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags = {
    Project     = "DrawApp"
    Environment = "Production"
  }
}
