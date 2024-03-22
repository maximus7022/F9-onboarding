variable "env" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_id" {
  type = string
}

variable "private_subnet_id" {
  type = string
}

variable "sg_port_list" {
  type = list(any)
}

variable "cidr_block" {
  type = string
}

variable "bucket_name" {
  type = string
}
