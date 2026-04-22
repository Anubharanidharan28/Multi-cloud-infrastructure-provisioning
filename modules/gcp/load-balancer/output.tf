############################################
# LOAD BALANCER PUBLIC IP
############################################
output "lb_ip" {
  description = "External IP of Load Balancer"
  value       = google_compute_global_forwarding_rule.fw.ip_address
}