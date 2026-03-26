variable "region" {
  type = string
}

variable "vpc_name" {
  type    = string
  default = "k3s-vpc"
}

variable "subnet_name" {
  type    = string
  default = "k3s-subnet"
}

variable "subnet_cidr" {
  type    = string
  default = "10.0.0.0/24"
}
