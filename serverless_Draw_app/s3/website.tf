resource "aws_s3_object" "apply_page" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "apply.html"
  source       = "../static_site/apply.html"
  content_type = "text/html"
  acl          = "public-read"
}

resource "aws_s3_object" "draw_page" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "draw.html"
  source       = "../static_site/draw.html"
  content_type = "text/html"
  acl          = "public-read"
}
