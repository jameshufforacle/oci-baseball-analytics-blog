resource "oci_datascience_project" "main" {
  compartment_id = var.compartment_ocid
  display_name   = "${var.name_prefix}-datascience"
  description    = "OCI Data Science project for the baseball analytics platform."

  freeform_tags = var.freeform_tags
}
