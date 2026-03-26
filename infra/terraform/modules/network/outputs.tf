output "network_id" {
  value = google_compute_network.vpc.id
}

output "network_name" {
  value = google_compute_network.vpc.name
}

output "subnetwork_id" {
  value = google_compute_subnetwork.subnet.id
}

output "subnetwork_name" {
  value = google_compute_subnetwork.subnet.name
}

output "subnetwork_self_link" {
  value = google_compute_subnetwork.subnet.self_link
}

output "subnet_cidr" {
  value = google_compute_subnetwork.subnet.ip_cidr_range
}
