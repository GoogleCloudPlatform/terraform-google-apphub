# Upgrading to AppHub v0.2.0

The release v0.2.0 of AppHub is backward incompatible. The variable type of `attributes` has been modified. 

## Migration instruction


Earlier `business_owners`, `develope_owners` and `operator_owners` could have only one owner. After this change, you should be able to provide list of owners.
Below example shows way to update terraform code wherever this module is being used.

```json
module "apphub" {
  source  = "GoogleCloudPlatform/apphub/google"
  version = "~> 0.0.1"

  project_id         = var.project_id
  application_id     = "ci-apphub-application-id"
  location           = "us-central1"
  scope              = { type : "REGIONAL" }
  create_application = true
-  attributes         = { business_owners: { email: "xyz@gmail.com", display_name: "xyz" }}
+  attributes         = { business_owners: [{ email: "xyz@gmail.com", display_name: "xyz" }]}
}
```
