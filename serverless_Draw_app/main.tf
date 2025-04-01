provider "aws" {
  region = "us-west-1"
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

module "route53" {
  source = "./route53"
}
module "acm" {
  source         = "./acm"
  hosted_zone_id = module.route53.hosted_zone_id
}
module "api_gateway" {
  source              = "./api_gateway"
  certificate_arn     = module.acm.certificate_arn
  hosted_zone_id      = module.route53.hosted_zone_id
  lambda_count_draw_arn    = module.count_draw_function.count_draw_arn
  lambda_count_draw_name   = module.count_draw_function.count_draw_function_name
  lambda_draw_arn          = module.draw_draw_function.draw_draw_arn
  lambda_draw_name         = module.draw_draw_function.draw_draw_function_name
  lambda_apply_arn         = module.apply_draw_function.apply_draw_arn
  lambda_apply_name        = module.apply_draw_function.apply_draw_function_name
}

