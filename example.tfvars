# Tenda infrastructure configuration — EXAMPLE
# Copy this file to terraform.tfvars and fill in real values:
#   cp example.tfvars terraform.tfvars
# terraform.tfvars is gitignored and must NEVER be committed.

# AWS region for all resources (we use eu-west-2 - London)
aws_region = "eu-west-2"

# Environment name, used as a prefix in every resource name
environment = "production"

# VPC address space; /16 gives 65,536 private IPs
vpc_cidr = "10.0.0.0/16"

# Number of Availability Zones (2 = full HA as per architecture)
az_count = 2

# Container ports (must match what the apps listen on - see Dockerfiles)
server_port          = 3000
admin_port           = 3100
db_instance_class    = "db.t4g.micro"
db_allocated_storage = 20
multi_az             = true
node_type            = "cache.t4g.micro"
domain_name          = "netforgetech.online"