resource "aws_acm_certificate" "website_cert" {
  domain_name               = "test-draw.com" 
  validation_method         = "EMAIL"

  subject_alternative_names = [
    "www.test-draw.com"      
  ]

  tags = {
    Environment = "Production"
    Project     = "DrawApp"
  }
}


