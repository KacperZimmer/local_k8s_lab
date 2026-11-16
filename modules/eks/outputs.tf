output "cluster_id" {
  description = "The ID of the EKS cluster"
  value       = aws_eks_cluster.cluster01.id
}

output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = aws_eks_cluster.cluster01.name
}

output "cluster_endpoint" {
  description = "The endpoint for the EKS cluster API server"
  value       = aws_eks_cluster.cluster01.endpoint
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data required to communicate with the cluster"
  value       = aws_eks_cluster.cluster01.certificate_authority[0].data
}

output "node_group_id" {
  description = "The ID of the EKS node group"
  value       = aws_eks_node_group.node_group.id
}
