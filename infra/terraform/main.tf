module "network" {
  source = "./modules/network"

  region      = var.region
  vpc_name    = var.vpc_name
  subnet_name = var.subnet_name
  subnet_cidr = var.subnet_cidr
}

module "k3s_nodes" {
  source = "./modules/k3s_nodes"

  zone                 = var.zone
  subnetwork_self_link = module.network.subnetwork_self_link

  image_name           = var.image_name

  machine_type         = var.machine_type
  disk_size_gb         = var.disk_size_gb
  disk_type            = var.disk_type
  tags                 = ["k3s"]
}
