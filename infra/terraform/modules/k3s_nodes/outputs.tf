output "instance_names" {
  value = [for i in google_compute_instance.nodes : i.name]
}

output "instance_self_links" {
  value = [for i in google_compute_instance.nodes : i.self_link]
}

output "private_ips" {
  value = {
    for k, v in google_compute_instance.nodes : k => v.network_interface[0].network_ip
  }
}
