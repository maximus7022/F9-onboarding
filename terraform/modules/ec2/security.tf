# Bastion security group
resource "aws_security_group" "bastion_sg" {
  name   = "${var.env}-bastion-sg"
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = ["22"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.cidr_block]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# HTTP/HTTPS/SSH security group
resource "aws_security_group" "jenkins_sg" {
  name   = "${var.env}-jenkins-sg"
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.sg_port_list
    content {
      from_port       = ingress.value
      to_port         = ingress.value
      protocol        = "tcp"
      security_groups = [aws_security_group.bastion_sg.id]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
