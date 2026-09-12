# Terraform Settings Block
terraform {
  required_version = "~> 1.16.2"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 8.2.0"
    }
  }
}

# Terraform Provider Block
provider "google" {
  project = var.gcp_project # PROJECT_ID
  region = var.gcp_region1
  alias = "alias_us-central1"

  default_labels = {
    environment = "dev"
    cost-center = "dev-budget"
    managed_by  = "terraform"
  }
}

