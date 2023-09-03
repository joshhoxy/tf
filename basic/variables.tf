variable "vpc-dev-dmz-cidr" {
  default = "100.1.0.0/16"
}

variable "vpc-dev-int-cidr" {
  default = "100.2.0.0/16"
}

variable "vpc-dev-dmz-name" {
  default = "SNBX-DEV-DMZ-VPC"
}

variable "josh-test-dev-tags" {
  default = {
    Owner       = "Josh"
    Environment = "DEV"
    Purpose     = "Test"
  }
}