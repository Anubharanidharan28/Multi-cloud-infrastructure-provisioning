############################################
# INSTANCE TEMPLATE
############################################
resource "google_compute_instance_template" "template" {
  name         = "${var.name}-template"
  machine_type = var.machine_type

  tags = var.instance_tags

  labels = var.labels

  disk {
    source_image = "debian-cloud/debian-11"
    auto_delete  = true
    boot         = true
  }

  network_interface {
    subnetwork = var.subnet
    access_config {}
  }

metadata_startup_script = <<-EOF
#!/bin/bash
set -eux

apt update -y
apt install -y default-jdk wget tar

cd /opt

wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.85/bin/apache-tomcat-9.0.85.tar.gz

tar -xvzf apache-tomcat-9.0.85.tar.gz

mv apache-tomcat-9.0.85 tomcat

chmod +x /opt/tomcat/bin/*.sh

/opt/tomcat/bin/startup.sh

sleep 10
ps -ef | grep tomcat > /tmp/tomcat.log
EOF
}

############################################
# MANAGED INSTANCE GROUP (MIG)
############################################
resource "google_compute_instance_group_manager" "mig" {
  name               = "${var.name}-mig"
  base_instance_name = var.name
  zone               = var.zone

  version {
    instance_template = google_compute_instance_template.template.id
  }

    target_size = var.target_size
      named_port {
    name = "http"
    port = 8080
  }
}