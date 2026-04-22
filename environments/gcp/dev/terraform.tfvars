############################################
# Project Config
############################################

project_id = "testing-bharani"
region     = "asia-south1"

############################################
# VPC
############################################

vpc_name = "dev-vpc"

############################################
# Subnets (2 subnets)
############################################

subnets = [
  {
    name   = "dev-subnet-1"
    cidr   = "10.0.1.0/24"
    region = "asia-south1"
  },
  {
    name   = "dev-subnet-2"
    cidr   = "10.0.2.0/24"
    region = "us-central1"
  }
]

############################################
# Firewall
############################################

firewalls = [
  {
    name          = "allow-ssh"
    ports         = ["22"]
    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["ssh-enabled"]
  },
  {
    name          = "allow-http"
    ports         = ["80"]
    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["web-server"]
  },
  {
    name          = "allow-tomcat"
    ports         = ["8080"]
    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["tomcat-server"]
  }
]


############################################
# Compute
############################################

instance_name = "tomcat"
machine_type  = "e2-medium"
zone          = "asia-south1-a"
target_size = 2

instance_tags = [
  "web-server",
  "tomcat-server"
]

############################################
# Load Balancer
############################################

lb_name = "tomcat-lb"
lb_port = 8080