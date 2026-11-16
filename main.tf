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

module "eks" {
  source = "./modules/eks"

  cluster_name    = var.cluster_name
  subnet_list     = module.vpc.private_subnet_ids
  node_group_name = var.node_group_name
  instance_types  = var.node_instance_types
  desired_size    = var.node_desired_size
  max_size        = var.node_max_size
  min_size        = var.node_min_size
}