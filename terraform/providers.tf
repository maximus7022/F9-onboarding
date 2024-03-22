terraform {
  required_version = ">= 1.2.0"

  backend "s3" {
    bucket         = "f9-remote-state-bucket"
    key            = "terraform/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "f9-remote-state-lock"
    session_name   = "terraform"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}
