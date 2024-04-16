output "subnetworks" {
  value = module.network.subnetwork_self_link
}


output "subnetwork_secondary_ip_ranges" {
  value = module.network.subnetwork_secondary_ip_ranges
  description = "List of Subnetworks Secondary ip ranges"
}

