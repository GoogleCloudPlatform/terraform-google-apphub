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

locals {
  apphub_host_project = var.host_project_id != null ? var.host_project_id : var.project_id
}

#Creating the application
resource "google_apphub_application" "apphub_application" {
  count          = var.create_application ? 1 : 0
  project        = local.apphub_host_project
  location       = var.location
  application_id = var.application_id
  display_name   = var.display_name
  description    = var.description

  scope {
    type = var.scope.type
  }
  dynamic "attributes" {
    for_each = var.attributes[*]
    content {
      dynamic "environment" {
        for_each = attributes.value.environment[*]
        content {
          type = environment.value.type
        }
      }
      dynamic "criticality" {
        for_each = attributes.value.criticality[*]
        content {
          type = criticality.value.type
        }
      }
      dynamic "business_owners" {
        for_each = attributes.value.business_owners[*]
        content {
          email        = business_owners.value.email
          display_name = business_owners.value.display_name
        }
      }
      dynamic "developer_owners" {
        for_each = attributes.value.developer_owners[*]
        content {
          email        = developer_owners.value.email
          display_name = developer_owners.value.display_name
        }
      }
      dynamic "operator_owners" {
        for_each = attributes.value.operator_owners[*]
        content {
          email        = operator_owners.value.email
          display_name = operator_owners.value.display_name
        }
      }
    }
  }
}

#Attaching service project; assuming host project and service project are the same
resource "google_apphub_service_project_attachment" "attach_service_project" {
  count                         = var.create_service_attachment ? 1 : 0
  project                       = local.apphub_host_project
  service_project_attachment_id = var.project_id
}

#Discover a service
data "google_apphub_discovered_service" "services" {
  for_each = { for service in var.service_uris : service.service_id => service }

  project     = var.project_id
  location    = var.location
  service_uri = each.value.service_uri
  depends_on  = [google_apphub_service_project_attachment.attach_service_project]
}

# Register a service
resource "google_apphub_service" "register_services" {
  for_each = { for service in var.service_uris : service.service_id => service }

  project            = var.project_id
  location           = var.location
  application_id     = var.application_id
  service_id         = each.value.service_id
  discovered_service = data.google_apphub_discovered_service.services[each.value.service_id].name
}

#Discover a workload
data "google_apphub_discovered_workload" "workloads" {
  for_each = { for workload in var.workload_uris : workload.workload_id => workload }

  project      = var.project_id
  location     = var.location
  workload_uri = each.value.workload_uri
  depends_on   = [google_apphub_service_project_attachment.attach_service_project]
}

# Register a workload
resource "google_apphub_workload" "register_workloads" {
  for_each = { for workload in var.workload_uris : workload.workload_id => workload }

  project             = var.project_id
  location            = var.location
  application_id      = var.application_id
  workload_id         = each.value.workload_id
  discovered_workload = data.google_apphub_discovered_workload.workloads[each.value.workload_id].name
}
