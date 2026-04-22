############################################
# VPC
############################################
resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false


}

############################################
# SUBNETS
############################################
resource "google_compute_subnetwork" "subnets" {
  count = length(var.subnets)

  name          = var.subnets[count.index].name
  ip_cidr_range = var.subnets[count.index].cidr
  region        = var.subnets[count.index].region
  network       = google_compute_network.vpc.id

}

############################################
# FIREWALL RULES
############################################
resource "google_compute_firewall" "rules" {
  for_each = { for f in var.firewalls : f.name => f }

  name    = each.value.name
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = each.value.ports
  }

  source_ranges = each.value.source_ranges

  target_tags = try(each.value.target_tags, null)


}