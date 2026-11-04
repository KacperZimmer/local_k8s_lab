terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.36.0"
    }
  }
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr_block              = var.vpc_cidr_block
  availability_zone_1         = var.availability_zone_1
  availability_zone_2         = var.availability_zone_2
  public_subnet_1_cidr_block  = var.public_subnet_1_cidr_block
  public_subnet_2_cidr_block  = var.public_subnet_2_cidr_block
  private_subnet_1_cidr_block = var.private_subnet_1_cidr_block
  private_subnet_2_cidr_block = var.private_subnet_2_cidr_block
}
