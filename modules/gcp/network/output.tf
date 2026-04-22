############################################
# VPC OUTPUT
############################################
output "vpc_id" {
  description = "VPC ID"
  value       = google_compute_network.vpc.id
}

############################################
# SUBNET OUTPUTS
############################################
output "subnet_ids" {
  description = "List of subnet IDs"
  value       = google_compute_subnetwork.subnets[*].id
}

output "subnet_names" {
  description = "List of subnet names"
  value       = google_compute_subnetwork.subnets[*].name
}