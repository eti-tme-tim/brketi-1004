provider "google" {
  project = "gcp-tmecomp3-nprd-13027"
  region  = "us-central1"
  zone    = "us-central1-a"
}

variable "instance_names" {
  description = "List of instance names"
  type = list(string)
  default = [
    "control-plane",
    "worker-node1",
    "worker-node2"
  ]
}

resource "google_compute_network" "vpc_network" {
  name                    = "clus-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc_subnet" {
  name          = "clus-subnet"
  network       = google_compute_network.vpc_network.name
  ip_cidr_range = "192.168.200.0/24"
  region        = "us-central1"
}

resource "google_compute_firewall" "allow_internal" {
  name    = "allow-internal"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  source_ranges = ["192.168.200.0/24"]
}

resource "google_compute_firewall" "allow_external" {
  name    = "allow-external"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_instance" "vm_instance" {
  count        = 3
  name         = "${var.instance_names[count.index]}"
  machine_type = "e2-medium" # This is subject to change based on available machine types and pricing.
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2404-lts-amd64"
      size  = 20
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.vpc_subnet.name

    access_config {
      // Ephemeral public IP will be assigned to the instance
    }
  }

  service_account {
    email  = ""
    scopes = []
  }

  metadata = {
    user-date = file("configs/cloud-init.yaml")
  }

#   metadata_startup_script = <<-EOF
#     #!/bin/bash
#     # Add any startup script here
#   EOF
}

output "vm_instance_ips" {
  value = google_compute_instance.vm_instance.*.network_interface.0.access_config.0.nat_ip
}
