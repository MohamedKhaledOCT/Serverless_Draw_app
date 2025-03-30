provider "aws" {
  region = "us-east-1"
}

resource "aws_route53domains_registered_domain" "draw_domain" {
  domain_name = "test-draw.com"

  name_server {
    name = "ns-195.awsdns-24.com"
  }

  name_server {
    name = "ns-874.awsdns-45.net"
  }

  tags = {
    Environment = "Test"
    Project     = "TestProject"
  }
}

resource "aws_route53_zone" "draw_hosted_zone" {
  name = "test-draw.com"

  tags = {
    Environment = "Test"
    Project     = "TestProject"
  }
}


