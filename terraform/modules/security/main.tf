
resource "aws_security_group" "app_sg" {
  name   = "${var.naming_prefix}-${var.project_name}-sg"
  vpc_id = var.vpc_id

  tags = merge(
    var.bootcamp_tags,
    {
      Name = "${var.naming_prefix}-${var.project_name}-sg"
    }
  )
}

resource "aws_vpc_security_group_ingress_rule" "ssh_my_ip" {
  security_group_id = aws_security_group.app_sg.id

  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"
  cidr_ipv4   = var.my_ip

  tags = merge(
    var.bootcamp_tags,
    {
      Name = "${var.naming_prefix}-${var.project_name}-ssh-my-ip"
    }
  )
}

resource "aws_vpc_security_group_ingress_rule" "http_my_ip" {
  security_group_id = aws_security_group.app_sg.id

  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"
  cidr_ipv4   = var.my_ip

  tags = merge(
    var.bootcamp_tags,
    {
      Name = "${var.naming_prefix}-${var.project_name}-http-my-ip"
    }
  )
}

resource "aws_vpc_security_group_ingress_rule" "http_jenkins_ip" {
  security_group_id = aws_security_group.app_sg.id

  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"
  cidr_ipv4   = var.jenkins_ip

  tags = merge(
    var.bootcamp_tags,
    {
      Name = "${var.naming_prefix}-${var.project_name}-http-jenkins-ip"
    }
  )
}

resource "aws_vpc_security_group_ingress_rule" "ssh_jenkins" {
  security_group_id = aws_security_group.app_sg.id

  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"
  cidr_ipv4   = var.jenkins_ip

  tags = merge(
    var.bootcamp_tags,
    {
      Name = "${var.naming_prefix}-${var.project_name}-ssh-jenkins"
    }
  )
}

resource "aws_vpc_security_group_egress_rule" "outbound_global" {
  security_group_id = aws_security_group.app_sg.id

  ip_protocol = "-1"
  cidr_ipv4   = "0.0.0.0/0"

  tags = merge(
    var.bootcamp_tags,
    {
      Name = "${var.naming_prefix}-${var.project_name}-outbound-global"
    }
  )
}


resource "aws_iam_role" "ecr_s3_access_role" {
  name = "${var.naming_prefix}-${var.project_name}-role"

  assume_role_policy = jsonencode({
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = merge(
    var.bootcamp_tags,
    {
      Name = "${var.naming_prefix}-${var.project_name}-role"
    }
  )
}

resource "aws_iam_role_policy" "ecr_access_policy" {
  name = "${var.naming_prefix}-${var.project_name}-ecr-access-policy"
  role = aws_iam_role.ecr_s3_access_role.id

  policy = jsonencode({
    Statement = [
      {
        Effect   = "Allow",
        Action   = var.ecr_access_policy_actions,
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_instance_profile" "ecr_s3_instance_profile" {
  name = "${var.naming_prefix}-${var.project_name}-profile"
  role = aws_iam_role.ecr_s3_access_role.name

  tags = merge(
    var.bootcamp_tags,
    {
      Name = "${var.naming_prefix}-${var.project_name}-profile"
    }
  )
}