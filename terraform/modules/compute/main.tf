

resource "aws_instance" "instances" {
  ami                    = var.instance_ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.ssh_key_pair
  vpc_security_group_ids = [var.app_sg_id]
  iam_instance_profile   = var.role_name

  provisioner "file" {
    source      = var.deploy_files_path
    destination = local.ec2_home_path

    connection {
      type        = "ssh"
      user        = var.ec2_user
      private_key = file(var.ssh_key_path)
      host        = self.public_ip
    }
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = var.ec2_user
      private_key = file(var.ssh_key_path)
      host        = self.public_ip
    }

    inline = [
      # Adding Permissions for Config Files
      "sudo chmod -R 755 nginx/",

      # Install Docker
      "sudo apt update -y",
      "sudo apt install -y docker.io docker-compose unzip",

      # Initialize Docker
      "sudo systemctl start docker",
      "sudo systemctl enable docker",

      # Install Docker Compose
      "sudo curl -L \"https://github.com/docker/compose/releases/download/v2.29.1/docker-compose-$(uname -s)-$(uname -m)\" -o /usr/local/bin/docker-compose",
      "sudo chmod +x /usr/local/bin/docker-compose",

      # Install AWS-CLI
      "sudo curl \"https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip\" -o \"awscliv2.zip\"",
      "sudo unzip awscliv2.zip",
      "sudo ./aws/install",

      # Pull Ted-Search Image from ECR
      "sudo aws ecr get-login-password --region ${var.region} | sudo docker login --username ${var.ecr_login} --password-stdin ${var.ecr_ted_search_url}",
      "sudo docker pull ${local.ecr_ted_search_image_full_url}",
      "sudo docker tag ${local.ecr_ted_search_image_full_url} ${local.ted_search_image_local_name}",

      # Run Docker Compose
      "cd /home/ubuntu && sudo docker-compose up -d"
    ]
  }

  tags = merge(
    var.bootcamp_tags,
    {
      Name = "${var.naming_prefix}-${var.project_name}-instance"
    }
  )
}