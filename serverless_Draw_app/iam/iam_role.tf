resource "aws_iam_role" "lambda_draw_role" {
  name = "lambda_draw_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Environment = "Production"
    Project     = "DrawApp"
  }
}

resource "aws_iam_policy" "dynamodb_execution_policy" {
  name        = "dynamodb_execution_policy"
  description = "Policy for Lambda to execute and invoke DynamoDB actions"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "dynamodb:GetItem",
          "dynamodb:PutItem",
          "dynamodb:Query",
          "dynamodb:UpdateItem",
          "dynamodb:DeleteItem"
        ],
        Resource = "*"
      },
      {
        Effect   = "Allow",
        Action   = "dynamodb:InvokeFunction",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_dynamodb_execution" {
  role       = aws_iam_role.lambda_draw_role.name
  policy_arn = aws_iam_policy.dynamodb_execution_policy.arn
}
