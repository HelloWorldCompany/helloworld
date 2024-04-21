# ---------------------------------------------
# Terraform configuration
# ---------------------------------------------
terraform {
  required_version = ">=0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket  = "helloworld-tfstate-bucket-kj"
    key     = "helloworld-dev.tfstate"
    region  = "ap-northeast-1"
    profile = "terraform"
  }
}

# ---------------------------------------------
# Provider
# ---------------------------------------------
provider "aws" {
  profile = "terraform"
  region  = "ap-northeast-1"
  ignore_changes = [
    aws_ssm_parameter.database.value,  
  ]
}

provider "aws" {
  alias   = "virginia"
  profile = "terraform"
  region  = "us-east-1"
}
