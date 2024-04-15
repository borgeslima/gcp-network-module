variable "region" {
    type = string
    description = "GCP Region"
}

variable "name" {
    type = string
    description = "Name of GCP Network"
}
variable "project" {
    type = string
    description = "Name of GCP Network"
}
variable "subnetworks" {
    type = any
    description = "List of GCP Subnetworks"
}
variable "auto_create_subnetworks" {
    type = bool
    description = "If auto_crea_subnetworks is true, subnet is created automality"
}

                  