variable "lambda_role_arn" {}

resource "aws_lambda_function" "count_draw" {
  function_name = "count_Draw"
  runtime       = "nodejs20.x"
  role          = var.lambda_role_arn
  handler       = "index.handler"

  filename      = "lambda/count_draw/count_draw.zip"
  source_code_hash = filebase64sha256("lambda/count_draw/count_draw.zip")
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
