variable "certificate_arn" {
  description = "The ARN of the ACM certificate for the custom domain"
}
variable "hosted_zone_id" {
  description = "The Hosted Zone ID for the Route 53 domain"
}
variable "region" {
  description = "AWS region where resources are deployed"
   default     = "us-west-1"
}

variable "account_id" {
  description = "AWS account ID"
}
#test