############################################
# GENERAL CONFIGURATION
############################################

variable "name" {
  type        = string
  description = "Base name used for instance template and managed instance group"
}


############################################
# COMPUTE CONFIGURATION
############################################

variable "machine_type" {
  type        = string
  description = "Machine type for VM instances (e.g., e2-medium, n1-standard-1)"
}

variable "zone" {
  type        = string
  description = "Zone where the managed instance group will be deployed"
}


############################################
# NETWORK CONFIGURATION
############################################

variable "subnet" {
  type        = string
  description = "Subnetwork self-link or name where instances will be attached"
}


############################################
# METADATA & TAGGING
############################################

variable "instance_tags" {
  type        = list(string)
  description = "Network tags applied to VM instances"
}

variable "labels" {
  type        = map(string)
  description = "Key-value labels applied to resources for organization and billing"
}


############################################
# SCALING CONFIGURATION
############################################

variable "target_size" {
  type        = number
  description = "Number of VM instances in the managed instance group"
}