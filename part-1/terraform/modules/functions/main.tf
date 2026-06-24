locals {
  application_name   = "${var.name_prefix}-ingest-app"
  dynamic_group_name = "${var.name_prefix}-functions-dg"
  repository_name    = "${var.project_name}/${var.environment}/ingestion-base"
}

resource "oci_artifacts_container_repository" "ingestion_base" {
  compartment_id = var.compartment_ocid
  display_name   = local.repository_name
  is_immutable   = false
  is_public      = false

  freeform_tags = var.freeform_tags
}

resource "oci_functions_application" "ingestion" {
  compartment_id = var.compartment_ocid
  display_name   = local.application_name
  subnet_ids     = [var.functions_subnet_id]
  shape          = "GENERIC_X86"

  config = {
    BUCKET_NAME         = var.bucket_name
    OBJECT_NAMESPACE    = var.object_storage_namespace
    ADB_ID              = var.adb_id
    PROJECT_NAME        = var.project_name
    PROJECT_ENVIRONMENT = var.environment
  }

  freeform_tags = var.freeform_tags
}

resource "oci_identity_dynamic_group" "functions" {
  compartment_id = var.tenancy_ocid
  name           = local.dynamic_group_name
  description    = "Functions in the ${var.name_prefix} platform compartment."

  matching_rule = "ALL {resource.type = 'fnfunc', resource.compartment.id = '${var.compartment_ocid}'}"

  freeform_tags = var.freeform_tags
}

resource "oci_identity_policy" "functions" {
  compartment_id = var.compartment_ocid
  name           = "${var.name_prefix}-functions-policy"
  description    = "Least-privilege access for baseball analytics ingestion Functions."

  statements = [
    "Allow dynamic-group ${oci_identity_dynamic_group.functions.name} to manage objects in compartment id ${var.compartment_ocid} where all {target.bucket.name='${var.bucket_name}'}",
    "Allow dynamic-group ${oci_identity_dynamic_group.functions.name} to read buckets in compartment id ${var.compartment_ocid}",
    "Allow dynamic-group ${oci_identity_dynamic_group.functions.name} to use log-content in compartment id ${var.compartment_ocid}",
    "Allow dynamic-group ${oci_identity_dynamic_group.functions.name} to read autonomous-databases in compartment id ${var.compartment_ocid}"
  ]

  freeform_tags = var.freeform_tags
}
