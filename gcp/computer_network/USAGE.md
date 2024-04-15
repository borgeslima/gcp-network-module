<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 5.24.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.24.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_address.this](https://registry.terraform.io/providers/hashicorp/google/5.24.0/docs/resources/compute_address) | resource |
| [google_compute_network.this](https://registry.terraform.io/providers/hashicorp/google/5.24.0/docs/resources/compute_network) | resource |
| [google_compute_router.this](https://registry.terraform.io/providers/hashicorp/google/5.24.0/docs/resources/compute_router) | resource |
| [google_compute_router_nat.this](https://registry.terraform.io/providers/hashicorp/google/5.24.0/docs/resources/compute_router_nat) | resource |
| [google_compute_subnetwork.this](https://registry.terraform.io/providers/hashicorp/google/5.24.0/docs/resources/compute_subnetwork) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_create_subnetworks"></a> [auto\_create\_subnetworks](#input\_auto\_create\_subnetworks) | If auto\_crea\_subnetworks is true, subnet is created automality | `bool` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of GCP Network | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Name of GCP Network | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | GCP Region | `string` | n/a | yes |
| <a name="input_subnetworks"></a> [subnetworks](#input\_subnetworks) | Name of GCP Network | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_google_compute_network_auto_create_subnetworks"></a> [google\_compute\_network\_auto\_create\_subnetworks](#output\_google\_compute\_network\_auto\_create\_subnetworks) | auto\_create\_subnetworks of network |
| <a name="output_google_compute_network_description"></a> [google\_compute\_network\_description](#output\_google\_compute\_network\_description) | Description of network |
| <a name="output_google_compute_network_gateway_ipv4"></a> [google\_compute\_network\_gateway\_ipv4](#output\_google\_compute\_network\_gateway\_ipv4) | gateway\_ipv4 of network |
| <a name="output_google_compute_network_id"></a> [google\_compute\_network\_id](#output\_google\_compute\_network\_id) | id of network |
| <a name="output_google_compute_network_internal_ipv6_range"></a> [google\_compute\_network\_internal\_ipv6\_range](#output\_google\_compute\_network\_internal\_ipv6\_range) | internal\_ipv6\_range of network |
| <a name="output_google_compute_network_name"></a> [google\_compute\_network\_name](#output\_google\_compute\_network\_name) | Name of network |
<!-- END_TF_DOCS -->