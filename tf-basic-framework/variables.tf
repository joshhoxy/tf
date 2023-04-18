##############################
##### Common information #####
##############################
variable "region" {
  default = "ap-northeast-2"
}

##############################
####### VPC Definition #######
##############################

variable "vpc-dev-dmz-name" {
  default = "SNBX-AN2-DEV-DMZ-VPC"
}

variable "vpc-dev-dmz-cidr" {
  default = "10.100.0.0/16"
}

variable "vpc-dev-int-name" {
  default = "SNBX-AN2-DEV-INT-VPC"
}

variable "vpc-dev-int-cidr" {
  default = "10.200.0.0/16"
}




##############################
##### subnet Definition ######
##############################

# DMZ-VPC
variable "sbn-dev-dmz-pub-a-name" {
  default = "SNBX-AN2-DEV-DMZ-PUB-A"
}
variable "sbn-dev-dmz-pub-a-cidr" {
  default = "10.100.0.0/26"
}
variable "sbn-dev-dmz-pub-c-name" {
  default = "SNBX-AN2-DEV-DMZ-PUB-C"
}
variable "sbn-dev-dmz-pub-c-cidr" {
  default = "10.100.0.64/26"
}


# INT-VPC
variable "sbn-dev-int-pri-a-name" {
  default = "SNBX-AN2-DEV-INT-PRI-A"
}
variable "sbn-dev-int-pri-a-cidr" {
  default = "10.200.0.0/26"
}
variable "sbn-dev-int-pri-c-name" {
  default = "SNBX-AN2-DEV-INT-PRI-C"
}
variable "sbn-dev-int-pri-c-cidr" {
  default = "10.200.0.64/26"
}


##############################
####### Tag Definition #######
##############################

variable "tags-common" {
  default = {
    Owner     = "Josh"
    Service   = "SNBX"
    Framework = "tf"
  }
}

