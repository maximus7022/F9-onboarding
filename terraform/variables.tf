variable "env" {
  default = "dev"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  default = "10.0.2.0/24"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "sg_port_list" {
  default = [22, 8080, 80, 443]
}

variable "cidr_block" {
  default = "173.38.209.0/24"
}

variable "bucket_name" {
  default = "f9-onboarding-s3-bucket"
}
