# Node Group for Cluster
resource "aws_eks_node_group" "cluster-node-group" {
  cluster_name    = aws_eks_cluster.goviolin-eks.name
  node_group_name = "eks-node-group"
  node_role_arn   = aws_iam_role.eks-node-group-role.arn
  subnet_ids      = var.node_group_subnet_ids
  #  Configuration block with scaling settings
  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  ami_type       = var.node_group_ami_type
  capacity_type  = var.node_group_capacity_type
  disk_size      = 20
  instance_types = var.node_group_instance_types
  #  Desired max number of unavailable worker nodes during node group update.
  update_config {
    max_unavailable = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
}

