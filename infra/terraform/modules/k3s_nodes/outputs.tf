output "nodes" {
  value = [
    for node in google_compute_instance.nodes : {
      name       = node.name
      private_ip = node.network_interface[0].network_ip
      role       = node.name == "k3s-01" ? "init" : "join"
    }
  ]
}
