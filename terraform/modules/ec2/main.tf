# AWS AMI from datasource
data "aws_ami" "amazon_linux_ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Bastion host provisioning
resource "aws_instance" "bastion_ec2" {
  ami                         = data.aws_ami.amazon_linux_ami.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.key_pair.key_name
  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]
  subnet_id                   = var.public_subnet_id
  associate_public_ip_address = true

  tags = {
    Name = "${var.env}-bastion"
  }
}

# Jenkins instance provisioning
resource "aws_instance" "jenkins_ec2" {
  ami                         = data.aws_ami.amazon_linux_ami.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.key_pair.key_name
  vpc_security_group_ids      = [aws_security_group.jenkins_sg.id]
  subnet_id                   = var.private_subnet_id
  iam_instance_profile        = aws_iam_instance_profile.instance_profile.name
  associate_public_ip_address = true

  tags = {
    Name = "${var.env}-jenkins"
  }
}
