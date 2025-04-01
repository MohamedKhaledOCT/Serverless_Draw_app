resource "aws_s3_bucket" "truststore_bucket" {
  bucket = "my-truststore-bucket"

  acl = "private"

  tags = {
    Environment = "Testing"
    Project     = "DrawApp"
  }
}

resource "aws_s3_bucket_object" "truststore_object" {
  bucket = aws_s3_bucket.truststore_bucket.bucket
  key    = "ca-bundle.pem"
  source = "~/.ssh/ca-bundle.pem"

  tags = {
    Environment = "Testing"
    Project     = "DrawApp"
  }
}
