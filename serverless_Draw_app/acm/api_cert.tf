variable "hosted_zone_id" {}

resource "aws_acm_certificate" "api_certificate" {
  domain_name       = "api.test-draw.com"
  validation_method = "EMAIL" 

  tags = {
    Environment = "Production"
    Project     = "TestProject"
  }
}

resource "aws_acm_certificate_validation" "validate_certificate" {
  certificate_arn = aws_acm_certificate.api_certificate.arn

}
