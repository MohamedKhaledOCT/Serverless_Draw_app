provider "aws" {
  region = "us-east-1"
}

module "dynamodb" {
  source = "./dynamodb"
}

module "iam_role" {
  source = "./iam"
}

module "apply_draw_function" {
  source          = "./lambda/apply_draw"
  lambda_role_arn = module.iam_role.lambda_role_arn
}

module "count_draw_function" {
  source          = "./lambda/count_draw"
  lambda_role_arn = module.iam_role.lambda_role_arn
}

module "draw_draw_function" {
  source          = "./lambda/draw_draw"
  lambda_role_arn = module.iam_role.lambda_role_arn
}