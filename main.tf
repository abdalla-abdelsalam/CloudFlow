module "network" {
  source   = "./Network"
  cidr     = var.vpc_cidr
  sub_pub  = var.sub_public
  azs      = var.availability_zones
  sub_priv = var.sub_private
}

module "eks" {
  source                    = "./EKS"
  node_group_ami_type       = "AL2_x86_64"
  node_group_capacity_type  = "ON_DEMAND"
  node_group_instance_types = ["t2.micro"]
}