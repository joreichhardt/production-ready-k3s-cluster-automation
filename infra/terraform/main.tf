resource "google_compute_network" "vpc" {
  name                    = "k3s-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "k3s-subnet"
  ip_cidr_range = "10.0.0.0/24"
  region        = var.region
  network       = google_compute_network.vpc.id
}

resource "google_compute_firewall" "allow_internal" {
  name    = "allow-internal"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
  }

  allows {
    protocol = "udp"
  }

  source_ranges = ["10.0.0.0/24"]
}
