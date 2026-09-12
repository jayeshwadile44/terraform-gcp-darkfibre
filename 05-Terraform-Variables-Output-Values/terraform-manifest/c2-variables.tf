#Input Variables

#GCP Project
variable "gcp_project" {
    description = "project in which gcp resources to be created"
    type = string
    default = "darkfiber-terraform"
}

#GCP region
variable "gcp_region1" {
    description = "region in which gcp resource is created"
    type = string
    default = "us-central1"
} 

#Machine Type
variable "machine_type" {
    description = "compute version machine type"
    type = string
    default = "e2-small"
}