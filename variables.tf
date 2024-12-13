/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "project_id" {
  description = "The project ID of the service project where service and workloads are present"
  type        = string
}

variable "location" {
  description = "The location of apphub resources"
  type        = string
}

variable "host_project_id" {
  description = "The project ID of the host project. Use project_id by default."
  type        = string
  default     = null
}

variable "create_application" {
  description = "Create apphub application when true"
  type        = bool
  default     = false
}

variable "create_service_attachment" {
  description = "Create service attachment between host and service project when true"
  type        = bool
  default     = false
}

variable "application_id" {
  description = "The AppHub application identifier"
  type        = string
}

variable "display_name" {
  description = "User-defined name for the AppHub application"
  type        = string
  default     = ""
}

variable "description" {
  description = "User-defined description of AppHub application"
  type        = string
  default     = ""
}

variable "scope" {
  description = "Scope of the AppHub application. Possible values are: REGIONAL, GLOBAL."
  type        = object({ type : string })
  default     = { type : "REGIONAL" }
}

variable "attributes" {
  description = "Attributes for the AppHub application"
  type = object({
    environment : optional(object({ type : string })),
    criticality : optional(object({ type : string })),
    business_owners : optional(object({ email : string, display_name : optional(string, "") })),
    developer_owners : optional(object({ email : string, display_name : optional(string, "") })),
    operator_owners : optional(object({ email : string, display_name : optional(string, "") }))
  })
  default = null
}

variable "service_uris" {
  description = "The list of service uris in CAIS style to register"
  type        = list(object({ service_uri : string, service_id : string }))
  default     = []
}

variable "workload_uris" {
  description = "The list of workload uris in CAIS style to register"
  type        = list(object({ workload_uri : string, workload_id : string }))
  default     = []
}
