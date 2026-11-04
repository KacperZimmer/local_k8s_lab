variable "aws_region" {
  description = "AWS region for deploying resources"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "availability_zone_1" {
  description = "First availability zone"
  type        = string
}

variable "availability_zone_2" {
  description = "Second availability zone"
  type        = string
}

variable "public_subnet_1_cidr_block" {
  description = "CIDR block for the first public subnet"
  type        = string
}

variable "public_subnet_2_cidr_block" {
  description = "CIDR block for the second public subnet"
  type        = string
}

variable "private_subnet_1_cidr_block" {
  description = "CIDR block for the first private subnet"
  type        = string
}

variable "private_subnet_2_cidr_block" {
  description = "CIDR block for the second private subnet"
  type        = string
}
