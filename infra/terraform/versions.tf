terraform {
  required_version = ">= 1.5.0"

  backend "gcs" {
    bucket = "project-84ddd43d-e408-4cb9-8cb-k3s-tf-state"
    prefix = "k3s-cluster"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}
