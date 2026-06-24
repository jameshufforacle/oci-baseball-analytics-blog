output "object_storage_namespace" {
  description = "Object Storage namespace discovered from OCI."
  value       = module.object_storage.namespace
}

output "bucket_name" {
  description = "Canonical platform Object Storage bucket."
  value       = module.object_storage.bucket_name
}

output "vcn_id" {
  value = module.network.vcn_id
}

output "functions_subnet_id" {
  value = module.network.functions_subnet_id
}

output "adb_id" {
  value = module.database.adb_id
}

output "adb_db_name" {
  value = module.database.adb_db_name
}

output "functions_application_id" {
  value = module.functions.application_id
}

output "functions_dynamic_group_name" {
  value = module.functions.dynamic_group_name
}

output "functions_policy_id" {
  value = module.functions.policy_id
}

output "container_repository_id" {
  value = module.functions.container_repository_id
}

output "container_repository_name" {
  value = module.functions.container_repository_name
}

output "data_science_project_id" {
  value = module.data_science.project_id
}

output "oac_instance_id" {
  value = module.analytics.oac_instance_id
}

output "notification_topic_id" {
  value = module.observability.notification_topic_id
}
