resource "oci_database_autonomous_database" "warehouse" {
  compartment_id              = var.compartment_ocid
  db_name                     = var.adb_db_name
  display_name                = "${var.name_prefix}-adw"
  db_workload                 = "DW"
  compute_model               = "ECPU"
  compute_count               = var.adb_ecpu_count
  data_storage_size_in_tbs    = var.adb_storage_tbs
  admin_password              = var.adb_admin_password
  is_auto_scaling_enabled     = false
  license_model               = "LICENSE_INCLUDED"
  is_mtls_connection_required = true

  freeform_tags = var.freeform_tags
}
