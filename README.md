# terraform-google-apphub

## Description
### Tagline
This is an auto-generated module.

### Detailed
This module was generated from [terraform-google-module-template](https://github.com/terraform-google-modules/terraform-google-module-template/), which by default generates a module that simply creates a GCS bucket. As the module develops, this README should be updated.

The resources/services/activations/deletions that this module will create/trigger are:

- Create a GCS bucket with the provided name

### PreDeploy
To deploy this blueprint you must have an active billing account and billing permissions.

## Architecture
![alt text for diagram](https://www.link-to-architecture-diagram.com)
1. Architecture description step no. 1
2. Architecture description step no. 2
3. Architecture description step no. N

## Documentation
- [Hosting a Static Website](https://cloud.google.com/storage/docs/hosting-static-website)

## Deployment Duration
Configuration: X mins
Deployment: Y mins

## Cost
[Blueprint cost details](https://cloud.google.com/products/calculator?id=02fb0c45-cc29-4567-8cc6-f72ac9024add)

## Usage

Basic usage of this module is as follows:

```hcl
module "apphub" {
  source  = "terraform-google-modules/apphub/google"
  version = "~> 0.1"

  project_id  = "<PROJECT ID>"
  bucket_name = "gcs-test-bucket"
}
```

Functional examples are included in the
[examples](./examples/) directory.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| application\_id | n/a | `string` | n/a | yes |
| attributes | n/a | <pre>object({<br>    environment : optional(object({ type : string })),<br>    criticality : optional(object({ type : string })),<br>    business_owners : optional(object({ email : string, display_name : optional(string, "") })),<br>    developer_owners : optional(object({ email : string, display_name : optional(string, "") })),<br>    operator_owners : optional(object({ email : string, display_name : optional(string, "") }))<br>  })</pre> | `null` | no |
| create\_application | n/a | `bool` | `false` | no |
| create\_service\_attachment | n/a | `bool` | `false` | no |
| description | n/a | `string` | `""` | no |
| display\_name | n/a | `string` | `""` | no |
| host\_project\_id | n/a | `string` | `null` | no |
| location | n/a | `string` | n/a | yes |
| project\_id | The project ID to deploy to | `string` | n/a | yes |
| scope | n/a | `object({ type : string })` | n/a | yes |
| service\_uris | n/a | `list(object({ service_uri : string, service_id : string }))` | `[]` | no |
| workload\_uris | n/a | `list(object({ workload_uri : string, workload_id : string }))` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| application\_id | n/a |
| service\_ids | n/a |
| workload\_ids | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

These sections describe requirements for using this module.

### Software

The following dependencies must be available:

- [Terraform][terraform] v0.13
- [Terraform Provider for GCP][terraform-provider-gcp] plugin v3.0

### Service Account

A service account with the following roles must be used to provision
the resources of this module:

- Storage Admin: `roles/storage.admin`

The [Project Factory module][project-factory-module] and the
[IAM module][iam-module] may be used in combination to provision a
service account with the necessary roles applied.

### APIs

A project with the following APIs enabled must be used to host the
resources of this module:

- Google Cloud Storage JSON API: `storage-api.googleapis.com`

The [Project Factory module][project-factory-module] can be used to
provision a project with the necessary APIs enabled.

## Contributing

Refer to the [contribution guidelines](./CONTRIBUTING.md) for
information on contributing to this module.

[iam-module]: https://registry.terraform.io/modules/terraform-google-modules/iam/google
[project-factory-module]: https://registry.terraform.io/modules/terraform-google-modules/project-factory/google
[terraform-provider-gcp]: https://www.terraform.io/docs/providers/google/index.html
[terraform]: https://www.terraform.io/downloads.html

## Security Disclosures

Please see our [security disclosure process](./SECURITY.md).
