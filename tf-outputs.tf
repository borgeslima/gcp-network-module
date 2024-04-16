output "network_id" {
  value = google_compute_network.this.id
  description = "Id of network"
}

output "network_self_link" {
  value = google_compute_network.this.self_link
  description = "Network Self Link"
}

output "network_name" {
  value = google_compute_network.this.name
  description = "Name of network"
}

output "network_description" {
  value = google_compute_network.this.description
  description = "Description of network"
}

output "network_internal_ipv6_range" {
  value = google_compute_network.this.internal_ipv6_range
  description = "internal_ipv6_range of network"
}

output "network_gateway_ipv4" {
  value = google_compute_network.this.gateway_ipv4
  description = "gateway_ipv4 of network"
}

output "subnetwork_names" {
  value = [for subnetwork in google_compute_subnetwork.this: subnetwork.name]
  description = "List of subnetworks"
}

output "subnetwork_self_link" {
  value = [for subnetwork in google_compute_subnetwork.this: subnetwork.self_link]
  description = "List of subnetworks"
}

output "subnetwork_secondary_ip_ranges" {
  value = [for subnet in google_compute_subnetwork.this: [for secondary in subnet.secondary_ip_range : secondary.range_name]]
  description = "List of Subnetworks Secondary ip ranges"
}


