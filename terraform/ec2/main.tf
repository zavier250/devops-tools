provider "aws" {
  region = "ap-southeast-2"
}

terraform {
  backend "s3" {
    bucket         = "terraform-state-storage-2024"     # Replace with your actual bucket name
    key            = "jenkins-server/terraform.tfstate" # Path to the state file inside S3
    region         = "ap-southeast-2"
    dynamodb_table = "terraform-lock-table" # Locking mechanism
    encrypt        = true                   # Enable state encryption
  }
}

# Main resources
resource "aws_instance" "jenkins" {
  ami                    = "ami-0013d898808600c4a" # Amazon Linux 2023 AMI
  instance_type          = "t3.medium"
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]

  user_data = file("${path.module}/user-data.sh")

  tags = {
    Name  = "Jenkins-Server"
    Usage = "pipeline"
  }
}

# Allocate an Elastic IP
resource "aws_eip" "jenkins_eip" {
  domain   = "vpc"
}

# Associate the Elastic IP with the Jenkins EC2 instance
resource "aws_eip_association" "jenkins_eip_assoc" {
  instance_id   = aws_instance.jenkins.id
  allocation_id = aws_eip.jenkins_eip.id
}

