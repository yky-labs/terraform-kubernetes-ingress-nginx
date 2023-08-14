# Terraform Kubernetes ingress-nginx module

This Terraform module installs the NGINX ingress controller for Kubernetes.

## Prerequisites

- Terraform >= 0.13
- Kubernetes cluster

## Usage

```terraform
module "ingress_controller" {
  source = "yky-labs/ingress-controller/kubernetes"

  create_namespace = true
  namespace        = "ingress-nginx"
  name             = "ingress-nginx"
  chart_version    = "4.0.6"
  platform         = "generic"
  chart_values     = [
    # Add any additional chart values here
  ]
}
```

## Inputs

| Name               | Description                                                     | Type           | Default           | Required |
| ------------------ | --------------------------------------------------------------- | -------------- | ----------------- | :------: |
| platform           | The platform to install the ingress controller on               | `string`       | `"generic"`       |    no    |
| name               | The name of the ingress controller                              | `string`       | `"ingress-nginx"` |    no    |
| namespace          | The namespace to install the ingress controller into            | `string`       |                   |   yes    |
| create\_namespace  | Whether to create the namespace                                 | `bool`         | `false`           |    no    |
| chart\_version     | The version of the ingress controller chart to install          | `string`       | `null`            |    no    |
| chart\_values      | Additional chart values to pass to the ingress controller chart | `list(string)` | `[]`              |    no    |
| is\_default        | Whether the ingress controller is the default one               | `bool`         | `true`            |    no    |
| load\_balancer\_ip | The IP address to assign to the load balancer                   | `string`       | `null`            |    no    |

## Outputs

No outputs.

## Supported platforms

The `platform` input is used to configure the ingress controller for a specific platform. The following platforms are supported:

- `generic` (default)
- `azure`

## License

This code is licensed under the MIT license. See LICENSE for details.

## Credits

This code was created by yky-labs in 2023.

## Contributing

Contributions are always welcome! If you have any suggestions or find any
issues, please open an issue or pull request on the GitHub repository. Please
make sure to follow the code of conduct when contributing to this project.
