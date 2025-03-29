variable "lambda_role_arn" {}

resource "aws_lambda_function" "draw_draw" {
  function_name = "draw_Draw"
  runtime       = "nodejs20.x"
  role          = var.lambda_role_arn
  handler       = "index.handler"

  filename      = "lambda/draw_draw/draw_draw.zip"
  source_code_hash = filebase64sha256("lambda/draw_draw/draw_draw.zip")
  timeout       = 1

  environment {
    variables = {
      ENVIRONMENT = "Production"
    }
  }

  tags = {
    Environment = "Production"
    Project     = "DrawApp"
  }
}
