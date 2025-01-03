# terraform-google-apphub

This module creates AppHub related resources. This includes,
1. Creation of an AppHub application in host project
2. Creation of service attachment between host project and service project
3. Registration of services with application
4. Registration of workloads with application

## Assumptions and Prerequisites
1. All required APIs are enabled in the GCP Project. The AppHub api is enabled in host project

## Usage

Basic usage of this module is as follows:

```hcl
module "apphub" {
  source  = "terraform-google-modules/apphub/google"
  version = "~> 0.2"

  project_id  = "<PROJECT ID>"
  application_id = "<APPHUB_APPLICATION_ID>"
  location = "<LOCATION>"
  scope = { type: "REGIONAL"}
  create_application = true // Create new apphub application
}
```

Functional examples are included in the
[examples](./examples/) directory.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| application\_id | The AppHub application identifier | `string` | n/a | yes |
| attributes | Attributes for the AppHub application | <pre>object({<br>    environment : optional(object({ type : string })),<br>    criticality : optional(object({ type : string })),<br>    business_owners : optional(object({ email : string, display_name : optional(string, "") })),<br>    developer_owners : optional(object({ email : string, display_name : optional(string, "") })),<br>    operator_owners : optional(object({ email : string, display_name : optional(string, "") }))<br>  })</pre> | `null` | no |
| create\_application | Create apphub application when true | `bool` | `false` | no |
| description | User-defined description of AppHub application | `string` | `""` | no |
| display\_name | User-defined name for the AppHub application | `string` | `""` | no |
| location | The location of AppHub application. | `string` | n/a | yes |
| project\_id | The project ID of the host project where AppHub application is created. | `string` | n/a | yes |
| scope | Scope of the AppHub application. Possible values are: REGIONAL, GLOBAL. | `object({ type : string })` | <pre>{<br>  "type": "REGIONAL"<br>}</pre> | no |
| service\_project\_ids | The list of service projects to attach with host project. | `list(string)` | `[]` | no |
| service\_uris | The list of service uris in CAIS style to register | `list(object({ service_uri : string, service_id : string, location : string }))` | `[]` | no |
| workload\_uris | The list of workload uris in CAIS style to register | `list(object({ workload_uri : string, workload_id : string, location : string }))` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| application\_id | The apphub application id in format projects/{{project}}/locations/{{location}}/applications/{{application\_id}} |
| service\_ids | The list of service ids registered with application. |
| workload\_ids | The list of workload ids registered with application. |

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

- App Hub Admin: `roles/apphub.admin`

The [Project Factory module][project-factory-module] and the
[IAM module][iam-module] may be used in combination to provision a
service account with the necessary roles applied.

### APIs

A project with the following APIs enabled must be used as host project for this
 module:

- Google AppHub API: `apphub.googleapis.com`

The [Project Factory module][project-factory-module] can be used to
provision a project with the necessary APIs enabled.

## Contributing

Refer to the [contribution guidelines](./CONTRIBUTING.md) for
information on contributing to this module.

## Security Disclosures

Please see our [security disclosure process](./SECURITY.md).
