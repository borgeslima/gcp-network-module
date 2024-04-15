################################################################################
# NETWORK
################################################################################

resource "google_compute_network" "this" {
  name                    = lower(var.name)
  auto_create_subnetworks = var.auto_create_subnetworks
  project                 = var.project
}

################################################################################
# SUBNET
################################################################################

resource "google_compute_subnetwork" "this" {

  for_each = var.subnetworks

  name                     = lower(each.value.name)
  project                  = google_compute_network.this.project
  network                  = google_compute_network.this.name
  ip_cidr_range            = each.value.ip_cidr_range
  region                   = each.value.region
  private_ip_google_access = try(each.value.private_ip_google_access, true)

  dynamic "secondary_ip_range" {

    for_each = each.value.secondary_ip_ranges

    content {
      range_name    = secondary_ip_range.value["range_name"]
      ip_cidr_range = secondary_ip_range.value["ip_cidr_range"]
    }
  }

  depends_on = [google_compute_network.this]
}

################################################################################
# ADDRESS
################################################################################

resource "google_compute_address" "this" {
  for_each = var.subnetworks

  name    = format("%s-nat-ip-${each.key}", each.key)
  project = google_compute_network.this.project
  region  = each.value.region
  depends_on = [
    google_compute_subnetwork.this
  ]
}


################################################################################
# ROUTER
################################################################################

resource "google_compute_router" "this" {
  for_each = var.subnetworks

  name    = format("%s-cloud-router-${each.key}", google_compute_network.this.name)
  project = google_compute_network.this.project
  network = google_compute_network.this.name
  region  = each.value.region

  depends_on = [google_compute_network.this]
}


################################################################################
# ROUTER NAT
################################################################################

resource "google_compute_router_nat" "this" {

  for_each = var.subnetworks

  name                               = format("%s-cloud-nat-${each.key}", google_compute_network.this.name)
  project                            = google_compute_network.this.project
  router                             = google_compute_router.this[each.key].name
  region                             = each.value.region
  nat_ips                            = toset([google_compute_address.this[each.key].self_link ])
  nat_ip_allocate_option             = try(each.value.nat.nat_ip_allocate_option, "MANUAL_ONLY")
  source_subnetwork_ip_ranges_to_nat = try(each.value.nat.source_subnetwork_ip_ranges_to_nat, "LIST_OF_SUBNETWORKS")


  subnetwork {
    name                    = google_compute_subnetwork.this[each.key].self_link 
    source_ip_ranges_to_nat = try(each.value.source_ip_ranges_to_nat, ["PRIMARY_IP_RANGE", "LIST_OF_SECONDARY_IP_RANGES"])
    secondary_ip_range_names = toset([for range in each.value.secondary_ip_ranges : range.range_name ])
  }


  depends_on = [
    google_compute_network.this
  ]
}
