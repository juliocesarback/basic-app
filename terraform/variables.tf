variable "project_id" {}

variable "region" {
  description = "The region to host the cluster in"
  default     = "europe-west1"
}

variable "network" {
  description = "The VPC network created to host the cluster in"
  default     = "gke-network"
}

variable "subnetwork" {
  description = "The subnetwork created to host the cluster in"
  default     = "gke-subnet"
}

variable "ip_range_pods_name" {
  description = "The secondary ip range to use for pods"
  default     = "ip-range-pods"
}

variable "ip_range_services_name" {
  description = "The secondary ip range to use for services"
  default     = "ip-range-services"
}

variable "project_name" {
  description = "The name of project"
  default     = "wordpress"
}

variable "instance_size" {
  type = map(string)
}

##################################################################################
# LOCALS
##################################################################################

locals {
  env_name = lower(terraform.workspace)

  common_tags = {
    Environment = local.env_name
  }

}