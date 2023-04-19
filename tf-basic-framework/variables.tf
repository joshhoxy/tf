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
  default = "SNBX-AN2-DEV-DMZ-SBN-PUB-A"
}
variable "sbn-dev-dmz-pub-a-cidr" {
  default = "10.100.0.0/26"
}
variable "sbn-dev-dmz-pub-c-name" {
  default = "SNBX-AN2-DEV-DMZ-SBN-PUB-C"
}
variable "sbn-dev-dmz-pub-c-cidr" {
  default = "10.100.0.64/26"
}


# INT-VPC
variable "sbn-dev-int-pri-a-name" {
  default = "SNBX-AN2-DEV-INT-SBN-PRI-A"
}
variable "sbn-dev-int-pri-a-cidr" {
  default = "10.200.0.0/26"
}
variable "sbn-dev-int-pri-c-name" {
  default = "SNBX-AN2-DEV-INT-SBN-PRI-C"
}
variable "sbn-dev-int-pri-c-cidr" {
  default = "10.200.0.64/26"
}



##############################
####### RT definition  #######
##############################

variable "rt-dev-dmz-pub-name" {
  default = "SNBX-AN2-DEV-DMZ-RT-PUB"
}



##############################
####### SG Definition ########
##############################

variable "sg-dev-dmz-ap-bst-name" {
  default = "SNBX-AN2-DEV-DMZ-SG-BST"
}






##############################
####### IP Definition ########
##############################

variable "ec2-dev-dmz-bst-ip" {
  default = "10.100.0.10"
}







##############################
####### EC2 Definition #######
##############################

variable "ec2-dev-dmz-bst-name" {
  default = "SNBX-AN2-DEV-DMZ-EC2-BST"
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






##############################
####### IAM Definition #######
##############################

variable "role-dev-ec2-default-name" {
  default = "SNBX-AN2-DEV-IAM-ROL-EC2-DEFAULT"
}


##############################
####### KMS Definition #######
##############################

variable "key-cmk-ebs-arn" {
  default = "arn:aws:kms:ap-northeast-2:176247174993:key/c4db37e3-79ae-4f53-ac5a-8a4872eeeffd"

}