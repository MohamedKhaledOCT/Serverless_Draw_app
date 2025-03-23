resource "aws_lambda_function" "count_draw" {
  function_name = "count_Draw"
  runtime       = "nodejs20.x"
  role          = "arn:aws:iam::024848465625:role/lambda_draw_role"
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
