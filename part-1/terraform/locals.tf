locals {
  name_prefix = "${var.project_name}-${var.environment}"
  bucket_name = local.name_prefix

  tags = merge(var.freeform_tags, {
    project     = var.project_name
    environment = var.environment
    managed_by  = "terraform"
    series      = "oci-baseball-analytics"
  })
}
