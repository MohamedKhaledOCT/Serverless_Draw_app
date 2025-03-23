resource "aws_lambda_function" "apply_draw" {
  function_name = "apply_Draw"
  runtime       = "nodejs20.x"
  role          = "arn:aws:iam::024848465625:role/lambda_draw_role"
  handler       = "index.handler"

  filename      = "lambda/apply_draw/apply_draw.zip"
  source_code_hash = filebase64sha256("lambda/apply_draw/apply_draw.zip")
  timeout = 1

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
