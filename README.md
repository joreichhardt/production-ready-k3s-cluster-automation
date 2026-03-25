# production-ready-k3s-cluster-automation

End-to-end automation for building and deploying a production-style k3s cluster.

## Overview

This project demonstrates a practical DevOps / Platform Engineering workflow:

1. Build a reusable Debian golden image with **Packer**
2. Provision networking and virtual machines with **Terraform**
3. Bootstrap a **k3s** cluster on top of the provisioned nodes
4. Add production-style platform components step by step

The goal is not just to install Kubernetes, but to show a reproducible, modular and automation-first infrastructure workflow.

---

## Architecture

### Image Layer
- **Packer**
- Debian 13 base image
- Preinstalled base packages
- `jre` user with SSH key
- OS baseline configuration
- Prepared for Kubernetes node usage

### Infrastructure Layer
- **Terraform**
- Virtual network / subnet
- Security rules / firewall rules
- Control plane node(s)
- Worker node(s)
- SSH access / metadata / instance configuration

### Cluster Layer
- **k3s**
- Automated bootstrap of the first server node
- Join additional server/worker nodes
- Kubeconfig retrieval
- Optional add-ons

### Platform Layer (planned)
- Ingress
- cert-manager
- ExternalDNS
- Monitoring stack
- Logging
- GitOps
- Backup / restore
- Node hardening

---

## Goals

- Reproducible infrastructure
- Immutable image approach
- Minimal manual steps
- Clear separation of image build, provisioning and cluster bootstrap
- Portfolio-ready DevOps / Platform Engineering project

---

## Repository Structure

```text
.
├── packer/
│   ├── debian13-gcp.pkr.hcl
│   └── ansible/
│       └── site.yml
├── terraform/
│   ├── modules/
│   ├── environments/
│   └── main.tf
├── scripts/
│   ├── bootstrap-k3s.sh
│   └── fetch-kubeconfig.sh
├── docs/
│   ├── architecture.md
│   ├── roadmap.md
│   └── decisions/
└── README.md
