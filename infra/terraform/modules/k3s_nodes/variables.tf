variable "zone" {
  type = string
}

variable "subnetwork_self_link" {
  type = string
}

variable "image_name" {
  type = string
}

variable "machine_type" {
  type    = string
  default = "e2-custom-2-4096"
}

variable "disk_size_gb" {
  type    = number
  default = 20
}

variable "disk_type" {
  type    = string
  default = "pd-balanced"
}

variable "tags" {
  type    = list(string)
  default = ["k3s"]
}
