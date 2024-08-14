
########       GENERAL       ########
variable "bootcamp_tags" {
  type = map(string)
}

variable "region" {
  type = string
}

variable "naming_prefix" {
  type        = string
  description = "Prefix for resources names to be unique"
}

variable "project_name" {
  type        = string
  description = "Name of current project that will be part of name of each resource"
}

variable "my_ip" {
  type        = string
  description = "MY IP"
}

variable "jenkins_ip" {
  type        = string
  description = "Jenkins EC2 IP"
}

########       NETWORK       ########
variable "vpc_id" {
  type        = string
  description = "The id of the VPC"
}


########       SECURITY       ########
variable "ecr_access_policy_actions" {
  type        = list(string)
  description = "The actions list of the access policy for the ECR"
}
variable "jenkins_sg_id" {
  type        = string
  description = "The actions list of the access policy for the ECR"
}