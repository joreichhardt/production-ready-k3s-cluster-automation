## 🚧 Current State of the Project

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

