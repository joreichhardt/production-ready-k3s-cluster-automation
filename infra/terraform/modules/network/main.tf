resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "${var.vpc_name}-subnet"
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc.id
}

resource "google_compute_firewall" "allow_internal" {
  name    = "${var.vpc_name}-allow-internal"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports = [
      "22",
      "6443",
      "2379-2380",
      "10250",
      "30000-32767",
      "80",
      "443"
    ]
  }

  allow {
    protocol = "udp"
    ports = [
      "8472"
    ]
  }

  source_ranges = [var.subnet_cidr]
  target_tags   = ["k3s"]
}

resource "google_compute_firewall" "allow_iap_ssh" {
  name    = "${var.vpc_name}-allow-iap-ssh"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["35.235.240.0/20"]
  target_tags   = ["k3s"]
}

resource "google_compute_firewall" "allow_lb_healthchecks" {
  name    = "${var.vpc_name}-allow-lb-healthchecks"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports = [
      "80",
      "443"
    ]
  }

  source_ranges = [
    "35.191.0.0/16",
    "130.211.0.0/22"
  ]

  target_tags = ["k3s"]
}
