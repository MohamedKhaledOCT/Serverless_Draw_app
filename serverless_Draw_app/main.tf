provider "aws" {
  region = "us-east-2"
}

module "iam_role" {
  source = "./iam"
}

module "dynamodb" {
  source = "./dynamodb"
}

module "apply_draw_function" {
  source = "./lambda/apply_draw"
}

module "count_draw_function" {
  source          = "./lambda/count_draw"
}


