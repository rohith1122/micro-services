terraform {
   required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  backend "s3" {
    bucket         = "triangle-soft-terraform-state-bucket"
    key            = "static-website/terraform.tfstate"
    region         = "eu-west-2"
    encrypt        = true
    dynamodb_table = "terraform-state-locking"

  }
}

provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}

