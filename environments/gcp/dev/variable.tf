variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "Default region"
  type        = string
}

############################################
# VPC Configuration
############################################
variable "vpc_name" {
  description = "VPC name"
  type        = string
}

############################################
# Subnet Configuration
############################################
variable "subnets" {
  description = "List of subnets"
  type = list(object({
    name   = string
    cidr   = string
    region = string
  }))
}

############################################
# Firewall Configuration
############################################
variable "firewalls" {
  type = list(object({
    name          = string
    ports         = list(string)
    source_ranges = list(string)
    target_tags  =list(string)
  }))
}

############################################
# COMPUTE CONFIGURATION
############################################

variable "instance_name" {
  description = "Base name for compute resources (instance template & MIG)"
  type        = string
}

variable "machine_type" {
  description = "Machine type for VM instances"
  type        = string
}

variable "zone" {
  description = "Zone where compute resources will be deployed"
  type        = string
}

variable "instance_tags" {
  description = "Network tags applied to VM instances"
  type        = list(string)
}

variable "target_size" {
  type        = number
  description = "Number of VM instances in the managed instance group"
}

############################################
# LOAD BALANCER CONFIGURATION
############################################

variable "lb_name" {
  description = "Name of the load balancer resources"
  type        = string
}

variable "lb_port" {
  description = "Port used for health check and backend service"
  type        = number
}