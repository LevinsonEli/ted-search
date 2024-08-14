bootcamp_tags = {
  owner           = "eliyahu.levinson"
  bootcamp        = "BC21"
  expiration_date = "05-08-2024"
}

region        = "us-east-1"
naming_prefix = "eliyahu"
project_name  = "ted-search"
my_ip         = "5.28.181.12/32"
jenkins_ip    = "34.201.26.223/32"
vpc_id        = "vpc-0ecc7b74"
subnet_id     = "subnet-f5a33892"

instance_ami_id = "ami-04a81a99f5ec58529"
instance_type   = "t3a.micro"
ec2_user        = "ubuntu"
ssh_key_pair    = "jenkins-key-pair"



ecr_login                 = "AWS"
ecr_ted_search_url        = "644435390668.dkr.ecr.us-east-1.amazonaws.com"
ecr_ted_search_image_name = "ted-search-app"
ted_search_image_name     = "ted-search"
ted_search_image_tag      = "1.0"

ecr_access_policy_actions = [
  "ecr:GetDownloadUrlForLayer",
  "ecr:BatchGetImage",
  "ecr:BatchCheckLayerAvailability",
  "ecr:GetAuthorizationToken"
]

jenkins_sg_id = "sg-0f073f4924be83697"