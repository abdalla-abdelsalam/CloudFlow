variable "node_group_ami_type" {
  description = "AMI ID for node group instances"
  type        = string
}

variable "node_group_capacity_type" {
  description = "Capacity type for node group instances"
  type        = string
}

variable "node_group_instance_types" {
  description = "instance types associated with the EKS Node Group"
  type        = list(any)
}

