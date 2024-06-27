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

  # backend "s3" {
  #   bucket = "snbx-s3-terraform"
  #   key    = "basic/terraform.tfstate"
  #   acl    = "bucket-owner-full-control"
  # }
}

data "aws_availability_zones" "all" {}

data "aws_ami" "amlx2023" {
  most_recent = true
  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }
}


data "aws_ami" "amlx2" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

data "aws_ami" "ubuntu-2204" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}