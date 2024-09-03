terraform {
  backend "remote" {
    organization = "test-organization-20240902140951"
    workspaces {
      name = "test-repo1"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-00c79d83cf718a893"
  instance_type = "t3.nano"

  tags = {
    Name = var.instance_name
  }
}

