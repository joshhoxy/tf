provider "aws" {
  region  = var.region
  profile = "default"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }
    tls = {
      source = "hashicorp/tls"
    }
  }

  # Terraform 버전
  required_version = ">=0.13"

  # State 저장용 S3 Backend 구성
  backend "s3" {
    bucket                  = "s3-snbx-tf-backend"
    key                     = "tf-basicFramework/env.terraform.tfstate"
    region                  = "ap-northeast-2"
    dynamodb_table          = "TerraformStateLockForSNBX"
    acl                     = "bucket-owner-full-control"
    shared_credentials_file = "~/.aws/credentials"
  }
}

data "aws_availability_zones" "all" {}