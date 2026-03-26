## 🚧 Current State of the Project

#prerequisites

* terraform-sa Service Account (Editor+Storage Admin)
* Enable API
* Enable OS-Login

The project is currently in an early but functional stage with a working Terraform-based infrastructure setup on Google Cloud Platform.

### ✅ Implemented

* **Terraform Bootstrap**

  * A dedicated bootstrap stack creates a **Google Cloud Storage bucket** for remote state
  * Remote state is fully functional and used by the main Terraform stack

* **Remote State Management**

  * Terraform state is stored in **GCS backend**
  * Enables reproducible and consistent infrastructure deployments via CI/CD

* **Infrastructure Provisioning**

  * Creation of a custom **VPC and subnet**
  * Deployment of **3 minimal k3s nodes (VMs)** using a Packer-built golden image
  * Instances are provisioned without public IPs (private networking)

* **CI/CD Integration**

  * Infrastructure is deployed via **GitHub Actions**
  * Uses **OIDC authentication** with GCP (no static credentials)

* **Lifecycle Management**

  * Full infrastructure lifecycle supported:

    * `terraform apply` → creates VPC + VMs
    * `terraform destroy` → clean teardown of all resources

---

### 🚧 Work in Progress

* Cloud NAT setup for outbound internet access
* External Load Balancer + NGINX Ingress
* Automated k3s cluster bootstrap (Ansible / cloud-init)
* Observability stack (Prometheus / Grafana)
* Security hardening and IAM refinement

---

### 🎯 Goal

The goal of this project is to build a **production-ready, fully automated k3s cluster on GCP**, including:

* Infrastructure as Code (Terraform)
* Immutable images (Packer)
* GitOps / CI-driven provisioning
* Secure, private-by-default networking
* Scalable and reproducible environments

---

### 🧠 Notes

* The project follows a **bootstrap → infrastructure separation pattern**
* Remote state is managed independently to avoid cyclic dependencies
* Designed with **platform engineering / DevOps best practices** in mind


🚧 This project is currently under active development.

# Production-ready k3s Cluster Automation

Automated Kubernetes (k3s) infrastructure provisioning on Google Cloud using Terraform and GitHub Actions with OIDC (keyless authentication).

---

## 🚀 Overview

This project demonstrates a production-oriented Infrastructure-as-Code setup:

- Terraform for provisioning cloud infrastructure
- GitHub Actions for CI/CD automation
- OIDC (Workload Identity Federation) for secure, keyless authentication
- Google Cloud as target platform

The goal is to build a fully automated k3s cluster deployment pipeline.

---

## ✨ Features

- Infrastructure provisioning with Terraform
- Automated CI/CD with GitHub Actions
- Secure authentication via OIDC (no static credentials)
- Reproducible cloud infrastructure
- Modular and extensible setup

---

## 📦 Packer

This project uses Packer to build reusable golden images.

Purpose:
- Preconfigure base system (Debian 13)
- Apply system hardening (Ansible)
- Prepare nodes for k3s installation

This reduces provisioning time and ensures reproducibility across environments.

---

## 🏗️ Architecture

Current state:

- Custom VPC (`k3s-vpc`)
- Subnet (`10.0.0.0/24`)
- Internal firewall rules

Planned:

- Compute instances (k3s nodes)
- Automated k3s installation
- Cluster bootstrap via Ansible

---

## 🔁 CI/CD Pipeline

GitHub Actions workflow:

- Pull Requests → terraform plan
- Push to master → terraform apply
- Authentication via OIDC (Workload Identity Federation)

No service account keys are used.

---

## 🔐 Authentication

Authentication is implemented using:

- GitHub OIDC tokens
- Google Cloud Workload Identity Federation
- Service Account impersonation

This avoids long-lived credentials and follows modern cloud security best practices.

---

## 📁 Project Structure

    infra/
      terraform/          # Terraform configuration
    .github/
      workflows/          # GitHub Actions pipeline

    QUICK PLANNED STRUCTURE OVERVIEW

    .
    ├── ci
    ├── infra
    │   └── terraform
    │       ├── main.tf
    │       ├── modules
    │       │   ├── network
    │       │   └── vm
    │       ├── outputs.tf
    │       ├── providers.tf
    │       ├── terraform.tfvars
    │       ├── variables.tf
    │       └── versions.tf
    ├── k3s
    ├── LICENSE
    ├── monitoring
    ├── packer-gcp-debian
    │   ├── ansible
    │   │   ├── golden-image.yml
    │   │   └── prepare-k3s.yml
    │   └── debian13-gcp.pkr.hcl
    └── README.md

---

## ⚙️ Terraform Setup

### Variables

    project_id = "your-project-id"
    region     = "europe-west3"
    zone       = "europe-west3-a"

---

### Local Usage

    gcloud auth application-default login

    cd infra/terraform
    terraform init
    terraform plan
    terraform apply

---

## 🧪 CI/CD Usage

Push changes to trigger the pipeline:

    git push origin master

Or trigger manually via GitHub Actions UI.

---

## 🔒 Security Notes

- No key.json or static credentials
- Authentication via short-lived OIDC tokens
- Principle of least privilege recommended for Service Accounts

---

## 📈 Roadmap

- [ ] Compute instances (k3s nodes)
- [ ] Automated cluster provisioning
- [ ] Multi-node setup
- [ ] Remote Terraform state
- [ ] Multi-environment support (dev / prod)

---

## 📌 Notes

This project focuses on real-world DevOps practices:

- Infrastructure as Code
- CI/CD automation
- Secure cloud authentication

