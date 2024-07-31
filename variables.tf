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
  description = "The project ID to deploy to"
  type        = string
}

variable "location" {
  type = string
}

variable "host_project_id" {
  type    = string
  default = null
}

variable "create_application" {
  type    = bool
  default = false
}

variable "create_service_attachment" {
  type    = bool
  default = false
}

variable "application_id" {
  type = string
}

variable "display_name" {
  type    = string
  default = ""
}

variable "description" {
  type    = string
  default = ""
}

variable "scope" {
  type = object({ type : string })
}

variable "attributes" {
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
  type    = list(object({ service_uri : string, service_id : string }))
  default = []
}

variable "workload_uris" {
  type    = list(object({ workload_uri : string, workload_id : string }))
  default = []
}
