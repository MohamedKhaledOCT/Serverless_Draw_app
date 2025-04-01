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
resource "aws_apigatewayv2_route" "count_route" {
  api_id    = aws_apigatewayv2_api.draw_http_api.id
  route_key = "GET /count"
  target    = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${var.lambda_count_draw_arn}/invocations"
}

resource "aws_lambda_permission" "api_gateway_permission" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_count_draw_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:${var.region}:${var.account_id}:${aws_apigatewayv2_api.draw_http_api.id}/*/GET/count"
}


