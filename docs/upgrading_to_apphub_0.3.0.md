# Upgrading to v0.3.0

The v0.3.0 release contains backwards-incompatible changes.

## Changes in v0.3.0

### Removes `host_project_id` input variable

  You can use `project_id` in place of `host_project_id`. `project_id` input variable itself is the project id of the host project where the apphub application is created.
  Earlier `project_id` was a service project. It was used to create service attachment with host project. After this change,`service_project_ids` can be used to create service attachment with the `project_id` host project.

  ```diff
  module "apphub" {
  source  = "GoogleCloudPlatform/apphub/google"
  version = "~> 0.0.1"

- host_project_id    = "host_project_id"
+ project_id         = "host_project_id"
  application_id     = "ci-apphub-application-id"
  location           = "us-central1"
  create_application = true
}
  ```

### Removes `create_service_attachment` input variable
  There is no need for `create_service_attachment` (true/false) after this change. No service attachmnet will be created if the `service_project_ids` is not defined/empty list. Service attachmnet will be created only if `service_project_ids` is non-empty list of project ids.

  ```diff
  module "apphub" {
  source  = "GoogleCloudPlatform/apphub/google"
  version = "~> 0.0.1"

- host_project_id    = "host_project_id"
- project_id         = "service_project_id"
+ project_id         = "host_project_id"
  application_id     = "ci-apphub-application-id"
  location           = "us-central1"
  create_application = true

- create_service_attachment = true
+ service_project_ids = [ "service_project_id"]
}
  ```
