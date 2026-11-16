aws_region     = "eu-central-1"
vpc_cidr_block = "10.0.0.0/16"

availability_zone_1         = "eu-central-1a"
public_subnet_1_cidr_block  = "10.0.1.0/24"
private_subnet_1_cidr_block = "10.0.2.0/24"

availability_zone_2         = "eu-central-1b"
public_subnet_2_cidr_block  = "10.0.3.0/24"
private_subnet_2_cidr_block = "10.0.4.0/24"

# EKS Cluster & Node Group configuration
cluster_name        = "dev-01"
node_group_name     = "main-node-group"
node_instance_types = ["t3.medium"]
node_desired_size   = 2
node_max_size       = 3
node_min_size       = 1
