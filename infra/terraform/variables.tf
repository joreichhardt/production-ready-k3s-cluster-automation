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

variable "ssh_public_key" {
  type        = string
  description = "SSH Public Key"
}

variable "image_name" {
  type    = string
  default = "debian13-golden-v1"
}

variable "image_project" {
  type        = string
  description = "Project where image lives"
}
