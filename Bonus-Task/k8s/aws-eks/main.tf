terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# 1) VPC module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "eks-dr-vpc"
  cidr = "10.20.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.20.1.0/24", "10.20.2.0/24"]
  public_subnets  = ["10.20.11.0/24", "10.20.12.0/24"]

  enable_nat_gateway = true
}

# 2) EKS module
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "eks-dr-cluster"
  cluster_version = "1.30"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # EKS API endpoint - public everywhere (lab only!)
  cluster_endpoint_private_access        = true
  cluster_endpoint_public_access         = true
  cluster_endpoint_public_access_cidrs   = ["0.0.0.0/0"]

  # Let the Terraform caller (your admin user) be cluster admin
  authentication_mode                      = "API_AND_CONFIG_MAP"
  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    default = {
      min_size      = 1
      max_size      = 2
      desired_size  = 1
      instance_types = ["t3.small"]
    }
  }
}