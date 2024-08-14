
########       GENERAL       ########
variable "bootcamp_tags" {
  type = map(string)
}

variable "naming_prefix" {
  type        = string
  description = "Prefix for resources names to be unique"
}

variable "project_name" {
  type        = string
  description = "Name of current project that will be part of name of each resource"
}

variable "region" {
  type = string
}


########       NETWORK       ########
variable "subnet_id" {
  type        = string
  description = "The id of the subnet"
}


variable "jenkins_ip" {
  type        = string
  description = "Jenkins EC2 IP"
}

########       SECURITY GROUPS       ########
variable "app_sg_id" {
  type = string
}


########       COMPUTE       ########
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
variable "ted_search_image_tag" {
  description = ""
  type        = string
}
variable "ted_search_image_name" {
  description = ""
  type        = string
}

variable "role_name" {
  type = string
}


locals {
  ecr_ted_search_image_full_url = "${var.ecr_ted_search_url}/${var.ecr_ted_search_image_name}:${var.ted_search_image_tag}"
  ted_search_image_local_name   = "${var.ted_search_image_name}:${var.ted_search_image_tag}"
  ec2_home_path                 = "/home/${var.ec2_user}"
}