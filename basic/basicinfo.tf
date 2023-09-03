provider "aws" {
  region = "ap-northeast-2"
}

terraform {
  # Library 버전
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    tls = {
      source = "hashicorp/tls"
    }
  }

  backend "s3" {
    bucket = "snbx-s3-terraform"
    key    = "basic/terraform.tfstate"
    acl    = "bucket-owner-full-control"
  }
}