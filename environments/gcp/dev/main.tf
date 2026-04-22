terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

############################################
# Provider
############################################
provider "google" {
  project = var.project_id
  region  = var.region
}

############################################
# LOCALS (COMMON LABELS)
############################################
locals {
  common_labels = {
    environment = "dev"
    project     = var.project_id
    region      = var.region
    managed_by  = "terraform"
    owner       = "anubharanidharan-m"
  }
}

############################################
# NETWORK MODULE
############################################
module "network" {
  source = "../../../modules/gcp/network"

  vpc_name  = var.vpc_name
  subnets   = var.subnets
  firewalls = var.firewalls

  labels = local.common_labels
}

############################################
# COMPUTE MODULE
############################################
module "compute" {
  source = "../../../modules/gcp/compute"

  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  subnet       = module.network.subnet_ids[0]

  instance_tags = var.instance_tags
  target_size   = var.target_size  
  labels         = local.common_labels
}

############################################
# LOAD BALANCER MODULE
############################################
module "lb" {
  source = "../../../modules/gcp/load-balancer"

  name           = var.lb_name
  instance_group = module.compute.instance_group
  port           = var.lb_port
}