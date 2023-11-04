module "network" {
  source             = "./network"
  vpc_cidr           = var.vpc_cidr
  pub_subnet         = var.sub_public
  priv_subnet        = var.sub_private
  availability_zones = var.availability_zones
}

module "eks" {
  source                    = "./eks"
  node_group_ami_type       = "AL2_x86_64"
  node_group_capacity_type  = "ON_DEMAND"
  node_group_instance_types = ["t2.micro"]
  node_group_subnet_ids     = module.network.private_subnets[*].id
  eks_cluster_subnet_ids    = flatten([module.network.public_subnets[*].id, module.network.private_subnets[*].id])
}
