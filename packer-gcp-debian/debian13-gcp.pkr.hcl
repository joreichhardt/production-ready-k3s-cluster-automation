packer {
  required_plugins {
    googlecompute = {
      version = ">= 1.2.5"
      source  = "github.com/hashicorp/googlecompute"
    }
    ansible = {
      version = "~> 1.1"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

variable "project_id" {
  type    = string
  default = "project-84ddd43d-e408-4cb9-8cb"
}

variable "zone" {
  type    = string
  default = "europe-west3-c"
}

variable "image_family" {
  type    = string
  default = "debian-13-golden"
}

source "googlecompute" "debian13" {
  project_id              = var.project_id
  zone                    = var.zone

  source_image_family     = "debian-13"
  source_image_project_id = ["debian-cloud"]

  machine_type            = "e2-medium"
  disk_size               = 20
  disk_type               = "pd-balanced"

  ssh_username            = "packer"

  image_name              = "debian-13-golden-{{timestamp}}"
  image_family            = var.image_family
  image_description       = "Debian 13 golden image built with Packer and Ansible"

  omit_external_ip        = false
  use_internal_ip         = false

  tags                    = ["packer-build"]
}

build {
  name    = "debian13-gcp-image"
  sources = ["source.googlecompute.debian13"]

  provisioner "ansible" {
    playbook_file = "./ansible/golden-image.yml"
    user          = "packer"
    extra_arguments = [
      "--ssh-extra-args", "-o IdentitiesOnly=yes"
    ]
  }
}
