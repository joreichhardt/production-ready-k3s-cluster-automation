locals {
  nodes = {
    k3s-01 = "10.0.0.11"
    k3s-02 = "10.0.0.12"
    k3s-03 = "10.0.0.13"
  }
}

data "google_compute_image" "golden" {
  name    = var.image_name
  project = var.image_project
}

resource "google_compute_instance" "nodes" {
  for_each     = local.nodes
  name         = each.key
  machine_type = var.machine_type
  zone         = var.zone
  tags         = var.tags

  boot_disk {
    auto_delete = true

    initialize_params {
      image = data.google_compute_image.golden.self_link
      size  = var.disk_size_gb
      type  = var.disk_type
    }
  }

  network_interface {
    subnetwork = var.subnetwork_self_link
    network_ip = each.value
  }

  service_account {
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
  }

  shielded_instance_config {
    enable_secure_boot          = false
    enable_vtpm                 = true
    enable_integrity_monitoring = true
  }
}
