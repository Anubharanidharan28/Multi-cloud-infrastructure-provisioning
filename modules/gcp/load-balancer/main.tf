############################################
# HEALTH CHECK
############################################
resource "google_compute_health_check" "hc" {
  name = "${var.name}-health-checks"

  http_health_check {
    port = var.port
  }
}

############################################
# BACKEND SERVICE
############################################
resource "google_compute_backend_service" "backend" {
  name          = "${var.name}-backend"
  protocol      = "HTTP"
  health_checks = [google_compute_health_check.hc.id]

  backend {
    group = var.instance_group
    balancing_mode = "UTILIZATION"
  }
}

############################################
# URL MAP
############################################
resource "google_compute_url_map" "urlmap" {
  name            = "${var.name}-urlmap"
  default_service = google_compute_backend_service.backend.id
}

############################################
# TARGET PROXY
############################################
resource "google_compute_target_http_proxy" "proxy" {
  name    = "${var.name}-proxy"
  url_map = google_compute_url_map.urlmap.id
}

############################################
# FORWARDING RULE (PUBLIC IP)
############################################
resource "google_compute_global_forwarding_rule" "fw" {
  name       = "${var.name}-fw"
  target     = google_compute_target_http_proxy.proxy.id
  port_range = "80"
}