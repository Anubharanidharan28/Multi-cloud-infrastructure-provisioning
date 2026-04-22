############################################
# GENERAL CONFIGURATION
############################################

variable "name" {
  type        = string
  description = "Base name used for load balancer resources"
}


############################################
# HEALTH CHECK CONFIGURATION
############################################

variable "port" {
  type        = number
  description = "Port used by the HTTP health check"
}


############################################
# BACKEND CONFIGURATION
############################################

variable "instance_group" {
  type        = string
  description = "Instance group self-link to attach as backend"
}


############################################
# NETWORK CONFIGURATION
############################################

# variable "forwarding_port" {
#   type        = string
#   description = "Port exposed by the global forwarding rule (e.g., 80 for HTTP)"
# }