resource "aws_lambda_function" "draw_draw" {
  function_name = "draw_Draw"
  runtime       = "nodejs20.x"
  role          = "arn:aws:iam::024848465625:role/lambda_draw_role"
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
