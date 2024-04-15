output "google_compute_network_name" {
  value = google_compute_network.this.name
  description = "Name of network"
}

output "google_compute_network_description" {
  value = google_compute_network.this.description
  description = "Description of network"
}

output "google_compute_network_id" {
  value = google_compute_network.this.id
  description = "id of network"
}

output "google_compute_network_internal_ipv6_range" {
  value = google_compute_network.this.internal_ipv6_range
  description = "internal_ipv6_range of network"
}

output "google_compute_network_gateway_ipv4" {
  value = google_compute_network.this.gateway_ipv4
  description = "gateway_ipv4 of network"
}

output "google_compute_network_auto_create_subnetworks" {
  value = google_compute_network.this.auto_create_subnetworks
  description = "auto_create_subnetworks of network"
}




