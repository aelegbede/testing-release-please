terraform {
  required_version = ">= v1.0.7"
  backend "local" {}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.2.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  access_key =  var.access_key
  secret_key =  var.secret_key

}

resource "random_id" "random" {
  byte_length = 8
}
