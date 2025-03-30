resource "aws_apigatewayv2_api" "draw_http_api" {
  name          = "draw"
  protocol_type = "HTTP"
  description   = "HTTP API for Draw Application"

  tags = {
    Environment = "Production"
    Project     = "DrawApp"
  }
}

resource "aws_apigatewayv2_stage" "dev_stage" {
  api_id      = aws_apigatewayv2_api.draw_http_api.id
  name        = "dev"
  auto_deploy = true

  tags = {
    Environment = "Production"
    Project     = "DrawApp"
  }
}

resource "aws_apigatewayv2_domain_name" "custom_domain" {
  domain_name = "api.test-draw.com"

  domain_name_configuration {
    certificate_arn = var.certificate_arn 
    endpoint_type   = "REGIONAL"
    security_policy = "TLS_1_2"
  }

  tags = {
    Environment = "Production"
    Project     = "DrawApp"
  }
}

resource "aws_apigatewayv2_api_mapping" "api_mapping" {
  api_id      = aws_apigatewayv2_api.draw_http_api.id
  domain_name = aws_apigatewayv2_domain_name.custom_domain.id
  stage       = aws_apigatewayv2_stage.dev_stage.name
}
