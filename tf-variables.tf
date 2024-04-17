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
    type = list(object({
      name = string
      region = string
      ip_cidr_range = string
      private_ip_google_access = bool
      nat = object({
        nat_ip_allocate_option = string
        source_subnetwork_ip_ranges_to_nat = string
      })
      secondary_ip_ranges = list(object({
        range_name = string
        ip_cidr_range = string
      }))
    }))
    description = "List of GCP Subnetworks"
}
variable "auto_create_subnetworks" {
    type = bool
    description = "If auto_crea_subnetworks is true, subnet is created automality"
}

                  