resource "aws_s3_bucket" "truststore_bucket" {
  bucket = "truststore-bucket"

  tags = {
    Environment = "Production"
    Project     = "DrawApp"
  }
}

resource "aws_s3_bucket_acl" "truststore_bucket_acl" {
  bucket = aws_s3_bucket.truststore_bucket.id
  acl    = "private"
}


resource "aws_s3_object" "truststore_object" {
  bucket       = aws_s3_bucket.truststore_bucket.id
  key          = "ca-bundle.pem"
  source       = "~/.ssh/ca-bundle.pem"
  content_type = "application/x-pem-file"
  tags = {
    Environment = "Testing"
    Project     = "DrawApp"
  }
}


  

