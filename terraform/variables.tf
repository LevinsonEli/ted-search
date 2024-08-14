
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

########       INSTANCES       ########
variable "instance_ami_id" {
  type        = string
  description = "The ami id of the instances"
}

variable "instance_type" {
  type        = string
  description = "The type of the instances"
}

variable "ec2_user" {
  type        = string
  description = "User of the EC2 project instance"
}

variable "ssh_key_pair" {
  type        = string
  description = "The SSH key pair name"
}

########       NETWORK       ########
variable "subnet_id" {
  type        = string
  description = "The id of the subnet"
}

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



variable "ssh_key_path" {
  description = ""
  type        = string
}

variable "deploy_files_path" {
  description = ""
  type        = string
}

variable "ecr_login" {
  description = ""
  type        = string
}

variable "ecr_ted_search_url" {
  description = ""
  type        = string
}


variable "ecr_ted_search_image_name" {
  description = ""
  type        = string
}
variable "ted_search_image_name" {
  description = ""
  type        = string
}

variable "ted_search_image_tag" {
  description = ""
  type        = string
}