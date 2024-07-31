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
output "application_id" {
  description = "The apphub application id in format projects/{{project}}/locations/{{location}}/applications/{{application_id}}"
  value       = var.create_application ? google_apphub_application.apphub_application[0].id : null
}

output "service_ids" {
  description = "The list of service ids registered with application."
  value       = [for service in google_apphub_service.register_services : service.id]
}

output "workload_ids" {
  description = "The list of workload ids registered with application."
  value       = [for workload in google_apphub_workload.register_workloads : workload.id]
}
