variable "environment" {}
variable "execution_role_arn" {}
variable "function_name" {}
variable "handler" {}
variable "runtime" {}
variable "s3_bucket" {}
variable "s3_key" {}

variable subnet_ids {
  type = "list"
}

variable security_group_ids {}

resource "aws_lambda_function" "test_lambda" {
  handler       = "${var.handler}"
  function_name = "${var.function_name}"
  role          = "${var.execution_role_arn}"
  runtime       = "${var.runtime}"
  s3_bucket     = "${var.s3_bucket}"
  s3_key        = "${var.function_name}/lambda.zip"

  vpc_config {
    subnet_ids         = "${var.subnet_ids}"
    security_group_ids = ["${var.security_group_ids}"]
  }
}

# --vpc-config SubnetIds=comma-separated-vpc-subnet-ids,SecurityGroupIds=comma-separated-security-group-ids


# vpcid: vpc-01e6f6ab1884e178c (rialto-core)
# subnets:
#  subnet-04eedbd7c0c894ba0 (us-east-1a Public subnet)
#  subnet-0cc6f7d84c649faf4 (us-east-1a Private subnet)
# security groups:
#  sg-050d6c6dea43e12fd (rialto-core)

