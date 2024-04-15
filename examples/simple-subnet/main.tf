provider "google" {}

locals {
  name                    = "quark-labs"
  region                  = "us-east1"
  project                 = "quarks-labs"
  auto_create_subnetworks = false
}

module "network" {
  source                  = "../.."
  region                  = local.region
  name                    = local.name
  auto_create_subnetworks = local.auto_create_subnetworks
  project                 = local.project

  subnetworks = {
    subenet1 = {
      name                     = "default-us-east1"
      region                   = "us-east1"
      ip_cidr_range            = "172.28.0.0/27"
      private_ip_google_access = false
      nat = {
        nat_ip_allocate_option             = "MANUAL_ONLY"
        source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
      }
      secondary_ip_ranges = {
        primary = {
          range_name    = "primary"
          ip_cidr_range = "172.1.16.0/20"
        }
        secondary = {
          range_name    = "secondary"
          ip_cidr_range = "172.1.32.0/20"
        }
      }
    }
  }
}