## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.69.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.69.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.nat_gw_ip](https://registry.terraform.io/providers/hashicorp/aws/5.69.0/docs/resources/eip) | resource |
| [aws_internet_gateway.gw](https://registry.terraform.io/providers/hashicorp/aws/5.69.0/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.natgw_1a](https://registry.terraform.io/providers/hashicorp/aws/5.69.0/docs/resources/nat_gateway) | resource |
| [aws_route_table.private_rt](https://registry.terraform.io/providers/hashicorp/aws/5.69.0/docs/resources/route_table) | resource |
| [aws_route_table.public_rt](https://registry.terraform.io/providers/hashicorp/aws/5.69.0/docs/resources/route_table) | resource |
| [aws_route_table_association.private_rt_associate](https://registry.terraform.io/providers/hashicorp/aws/5.69.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_rt_associate](https://registry.terraform.io/providers/hashicorp/aws/5.69.0/docs/resources/route_table_association) | resource |
| [aws_subnet.private_subnet](https://registry.terraform.io/providers/hashicorp/aws/5.69.0/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet](https://registry.terraform.io/providers/hashicorp/aws/5.69.0/docs/resources/subnet) | resource |
| [aws_vpc.minha_vpc](https://registry.terraform.io/providers/hashicorp/aws/5.69.0/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_igw_name"></a> [igw\_name](#input\_igw\_name) | n/a | `string` | `"tf_igw"` | no |
| <a name="input_nat_gateway_name"></a> [nat\_gateway\_name](#input\_nat\_gateway\_name) | n/a | `string` | `"tf_natgw"` | no |
| <a name="input_private_rt_name"></a> [private\_rt\_name](#input\_private\_rt\_name) | n/a | `string` | `"tf_private_rt"` | no |
| <a name="input_public_rt_name"></a> [public\_rt\_name](#input\_public\_rt\_name) | n/a | `string` | `"tf_public_rt"` | no |
| <a name="input_subnet_private_name"></a> [subnet\_private\_name](#input\_subnet\_private\_name) | n/a | `string` | `"tf_private_subnet_1a"` | no |
| <a name="input_subnet_public_name"></a> [subnet\_public\_name](#input\_subnet\_public\_name) | n/a | `string` | `"tf_public_subnet_1a"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | n/a | `string` | `"vpc_clc12_terraform"` | no |

## Outputs

No outputs.
