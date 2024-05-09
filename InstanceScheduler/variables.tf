################################################
##################### PJ Code ##################
################################################
variable "pj-code" {
  default = "JOSH-OTL"
}

########################################
################## TAG #################
########################################
variable "tags-default" {
  default = {
    User            = "joshcloud@mz.co.kr"
    Owner           = "Josh"
    Application     = "Ansible test"
    Environment     = "DEV"
    Auto-Start_Stop = "True"
  }
}


################################################
################ CloudWatch Event ##############
################################################
variable "cw-event-rule-instances_stop" {
  default = "JOSH-OTL-EBR-RUL-EC2_STOP"
}

variable "cw-event-target-instances_stop" {
  default = "JOSH-OTL-EBR-TG-EC2_STOP"
}

################################################
################### IAM  #######################
################################################

#ROLE
variable "iam-role-lmabda-ec2-scheduler" {
  default = "JOSH-OTL-IAM-ROL-LMD-EC2-SCHEDULER"
}

#POLICY
variable "iam-pol-cw-logging" {
  default = "JOSH-OTL-IAM-POL-CW-Logging"
}

variable "iam-pol-ec2-stop_start" {
  default = "JOSH-OTL-IAM-POL-EC2-StopStart"
}


################################################
################# LAMBDA  ######################
################################################

variable "lambda-function-ec2-scheduler" {
  default = "JOSH-OTL-LMD-EC2-STOP"
}