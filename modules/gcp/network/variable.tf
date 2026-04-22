############################################
# VPC Configuration
############################################

variable "vpc_name" {
  type        = string
  description = "Name of the VPC network to be created in GCP"
}


############################################
# Subnet Configuration
############################################

variable "subnets" {
  type = list(object({
    name   = string
    cidr   = string
    region = string
  }))

  description = "List of subnets with name, CIDR range, and region"
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
# Labels (GCP tagging system)
############################################

variable "labels" {
  description = "Common labels applied to all GCP resources"
  type        = map(string)
}