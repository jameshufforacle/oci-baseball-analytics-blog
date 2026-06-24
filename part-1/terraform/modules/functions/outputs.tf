output "application_id" {
  value = oci_functions_application.ingestion.id
}

output "dynamic_group_name" {
  value = oci_identity_dynamic_group.functions.name
}

output "policy_id" {
  value = oci_identity_policy.functions.id
}

output "container_repository_id" {
  value = oci_artifacts_container_repository.ingestion_base.id
}

output "container_repository_name" {
  value = oci_artifacts_container_repository.ingestion_base.display_name
}
