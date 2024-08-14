terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.9.2"

  backend "s3" {
    bucket = "plz-be-unique-bucket"
    key    = "ted-search/terraform.state"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}


module "security" {
  source = "./modules/security"

  region                    = var.region
  bootcamp_tags             = var.bootcamp_tags
  naming_prefix             = var.naming_prefix
  project_name              = var.project_name
  my_ip                     = var.my_ip
  vpc_id                    = var.vpc_id
  ecr_access_policy_actions = var.ecr_access_policy_actions
  jenkins_sg_id             = var.jenkins_sg_id
  jenkins_ip                = var.jenkins_ip
}

module "compute" {
  depends_on = [module.security]
  source     = "./modules/compute"

  app_sg_id = module.security.app_sg_id
  role_name = module.security.role_name

  region          = var.region
  bootcamp_tags   = var.bootcamp_tags
  naming_prefix   = var.naming_prefix
  project_name    = var.project_name
  instance_ami_id = var.instance_ami_id
  instance_type   = var.instance_type
  ec2_user        = var.ec2_user
  ssh_key_pair    = var.ssh_key_pair
  subnet_id       = var.subnet_id
  jenkins_ip      = var.jenkins_ip

  ssh_key_path              = var.ssh_key_path
  deploy_files_path         = var.deploy_files_path
  ecr_login                 = var.ecr_login
  ecr_ted_search_url        = var.ecr_ted_search_url
  ecr_ted_search_image_name = var.ecr_ted_search_image_name
  ted_search_image_name     = var.ted_search_image_name
  ted_search_image_tag      = var.ted_search_image_tag
}