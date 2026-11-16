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

# --- EKS Module Variables ---
variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "dev-01"
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
  default     = "main-node-group"
}

variable "node_instance_types" {
  description = "List of EC2 instance types for the node group"
  type        = list(string)
  default     = ["t3.micro"]
}

variable "node_desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "node_max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 3
}

variable "node_min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}
