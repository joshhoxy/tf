################################################
##################### PJ Code ##################
################################################
variable "pj-code" {
  default = "JOSH-OTL"
}

################################################
##################### VPC ######################
################################################
variable "vpc-dev-dmz-cidr" {
  default = "172.16.0.0/22"
}

variable "vpc-dev-int-cidr" {
  default = "172.24.0.0/22"
}

variable "vpc-dev-dmz-name" {
  default = "JOSH-OTL-DMZ-VPC"
}

variable "vpc-dev-int-name" {
  default = "JOSH-OTL-INT-VPC"
}

################################################
##################### IGW ######################
################################################
variable "igw-dev-dmz-name"{
  default = "JOSH-OTL-DMZ-IGW"
}


#################################################
##################### Subnet ####################
#################################################
variable "sbn-dev-dmz-pub-1-name" {
  default = "JOSH-OTL-DMZ-SBN-PUB-1"
}

variable "sbn-dev-dmz-pub-2-name" {
  default = "JOSH-OTL-DMZ-SBN-PUB-2"
}

variable "sbn-dev-dmz-ap-1-name" {
  default = "JOSH-OTL-DMZ-SBN-AP-1"
}

variable "sbn-dev-dmz-ap-2-name" {
  default = "JOSH-OTL-DMZ-SBN-AP-2"
}

variable "sbn-dev-dmz-pub-1-cidr" {
  default = "172.16.0.0/28"
}

variable "sbn-dev-dmz-pub-2-cidr" {
  default = "172.16.1.0/28"
}

variable "sbn-dev-dmz-ap-1-cidr" {
  default = "172.16.0.16/28"
}

variable "sbn-dev-dmz-ap-2-cidr" {
  default = "172.16.1.16/28"
}

# INT VPC
variable "sbn-dev-int-ext-1-name" {
  default = "JOSH-OTL-INT-SBN-EXT-1"
}

variable "sbn-dev-int-ext-2-name" {
  default = "JOSH-OTL-INT-SBN-EXT-2"
}

variable "sbn-dev-int-ap-1-name" {
  default = "JOSH-OTL-INT-SBN-AP-1"
}

variable "sbn-dev-int-ap-2-name" {
  default = "JOSH-OTL-INT-SBN-AP-2"
}

variable "sbn-dev-int-ext-1-cidr" {
  default = "172.24.0.0/28"
}

variable "sbn-dev-int-ext-2-cidr" {
  default = "172.24.1.0/28"
}

variable "sbn-dev-int-ap-1-cidr" {
  default = "172.24.0.64/26"
}

variable "sbn-dev-int-ap-2-cidr" {
  default = "172.24.1.64/26"
}




########################################
################## TAG #################
########################################
variable "tags-josh-default" {
  default = {
    User = "joshcloud@mz.co.kr"
    Owner           = "Josh"
    Application     = "Ansible test"
    Environment     = "DEV"
    Auto-Start_Stop = "True"
  }
}

variable "az-1-number" {
  default = 0
}

variable "az-2-number" {
  default = 1
}

variable "az-3-number" {
  default = 2
}
variable "az-4-number" {
  default = 3
}

########################################
################## AMI #################
########################################

variable "ami-amlx2" {
  default = "ami-084e92d3e117f7692"
}

variable "ami-amlx3" {
  default = "ami-0c031a79ffb01a803"
}


########################################
################## role ################
########################################

variable "role-dev-ec2-default-name" {
  default = "JOSH-OTL-IAM-ROL-EC2-DEFAULT"
}


########################################
################## SG #################
########################################

variable "sg-dev-dmz-pub-bst-1-name" {
  default = "JOSH-OTL-DMZ-SG-BST-1"
}

variable "sg-dev-dmz-ap-mgd-1-name" {
  default = "JOSH-OTL-DMZ-SG-AP-MGD-1"
}



########################################
################## EC2 #################
########################################
variable "ec2-dev-dmz-bst-1-name" {
  default = "JOSH-OTL-DMZ-EC2-BST-1"
}
variable "ec2-dev-dmz-web-1-name" {
  default = "JOSH-OTL-DMZ-EC2-WEB-1"
}
variable "ec2-dev-dmz-web-2-name" {
  default = "JOSH-OTL-DMZ-EC2-WEB-2"
}


#######################################
################## IP #################
########################################

variable "ec2-dev-dmz-bst-1-ip" {
  default = "172.16.0.10"
}
variable "ec2-dev-dmz-web-1-ip" {
  default = "172.16.0.20"
}
variable "ec2-dev-dmz-web-2-ip" {
  default = "172.16.1.20"
}
 

#######################################
############# Route table ##############
########################################


variable "rt-dev-dmz-pub-name" {
  default = "JOSH-OTL-DMZ-RT-PUB"
}

variable "rt-dev-dmz-ap-name" {
  default = "JOSH-OTL-DMZ-RT-AP"
}


