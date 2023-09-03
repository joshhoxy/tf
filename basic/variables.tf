variable "vpc-dev-dmz-cidr" {
  default = "100.1.0.0/16"
}

variable "vpc-dev-int-cidr" {
  default = "100.2.0.0/16"
}

variable "vpc-dev-dmz-name" {
  default = "BASIC-DEV-DMZ-VPC"
}

variable "vpc-dev-int-name" {
  default = "BASIC-DEV-INT-VPC"
}

variable "sbn-dev-dmz-pub-a-name" {
  default = "BASIC-DEV-DMZ-SBN-PUB-A"
}

variable "sbn-dev-dmz-pub-c-name" {
  default = "BASIC-DEV-DMZ-SBN-PUB-C"
}

variable "sbn-dev-dmz-pri-a-name" {
  default = "BASIC-DEV-DMZ-SBN-PRI-A"
}

variable "sbn-dev-dmz-pri-c-name" {
  default = "BASIC-DEV-DMZ-SBN-PRI-C"
}


## SBN-IP
variable "sbn-dev-dmz-pub-a-cidr" {
  default = "100.1.1.0/27"
}

variable "sbn-dev-dmz-pub-c-cidr" {
  default = "100.1.1.32/27"
}

variable "sbn-dev-dmz-pri-a-cidr" {
  default = "100.1.2.0/27"
}

variable "sbn-dev-dmz-pri-c-cidr" {
  default = "100.1.2.32/27"
}

########################################
################## TAG #################
########################################
variable "tags-josh-test" {
  default = {
    Owner       = "Josh"
    Environment = "DEV"
    Purpose     = "Test"
  }
}

variable "az-a" {
  default = "ap-northeast-2a"
}

variable "az-b" {
  default = "ap-northeast-2b"
}

variable "az-c" {
  default = "ap-northeast-2c"
}

variable "az-d" {
  default = "ap-northeast-2d"
}