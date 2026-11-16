variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "dev-01"
}

variable "cluster_role_name" {
  description = "Name of the IAM role for the EKS cluster"
  type        = string
  default     = "eks-cluster-role"
}

variable "worker_role_name" {
  description = "Name of the IAM role for the EKS worker nodes"
  type        = string
  default     = "eks-worker-role"
}

variable "subnet_list" {
  description = "List of subnet IDs for the cluster and node group to run in"
  type        = list(string)
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
  default     = "main-node-group"
}

variable "instance_types" {
  description = "List of EC2 instance types for the node group"
  type        = list(string)
  default     = ["t3.micro"]
}

variable "desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 3
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}
