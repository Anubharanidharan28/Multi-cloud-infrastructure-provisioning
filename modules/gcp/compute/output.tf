############################################
# INSTANCE GROUP (FOR LOAD BALANCER)
############################################
output "instance_group" {
  description = "Instance group self link"
  value       = google_compute_instance_group_manager.mig.instance_group
}

############################################
# INSTANCE TEMPLATE
############################################
output "instance_template" {
  description = "Instance template ID"
  value       = google_compute_instance_template.template.id
}