variable "project_id" {
  type        = string
  description = "GCP Project ID"
}

variable "region" {
  type        = string
  description = "GCP Region"
  default     = "europe-west3"
}

variable "zone" {
  type        = string
  description = "GCP Zone"
  default     = "europe-west3-b"
}

variable "ssh_user" {
  type    = string
  default = "jre"
}

variable "image_name" {
  type    = string
  default = "debian13-golden-v1"
}

variable "vpc_name" {
  type        = string
  default     = "k3s-vpc"
}

variable "subnet_name" {
  type        = string
  default     = "k3s-subnet"
}

variable "subnet_cidr" {
  type        = string
  default     = "10.0.0.0/24"
}

variable "machine_type" {
  type        = string
  description = "Machine type for k3s nodes"
  default     = "e2-custom-2-4096"
}

variable "disk_size_gb" {
  type        = number
  description = "Boot disk size in GB"
  default     = 20
}

variable "disk_type" {
  type        = string
  description = "Boot disk type"
  default     = "pd-balanced"
}
