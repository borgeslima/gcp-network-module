output "id" {
  value = google_compute_network.this.id
  description = "Id of network"
}


output "name" {
  value = google_compute_network.this.name
  description = "Name of network"
}

output "description" {
  value = google_compute_network.this.description
  description = "Description of network"
}

output "internal_ipv6_range" {
  value = google_compute_network.this.internal_ipv6_range
  description = "internal_ipv6_range of network"
}

output "gateway_ipv4" {
  value = google_compute_network.this.gateway_ipv4
  description = "gateway_ipv4 of network"
}

output "auto_create_subnetworks" {
  value = google_compute_network.this.auto_create_subnetworks
  description = "auto_create_subnetworks of network"
}

output "subnetworks" {
  value = toset([for subnetwork in google_compute_subnetwork.this: subnetwork.name])
  description = "List of subnetworks"
}

output "subnetwork_range_names" {
  value = toset([for subnet in google_compute_subnetwork.this: [for secondary in subnet.secondary_ip_range : secondary.range_name]])
  description = "List of Subnetworks of network"
}




