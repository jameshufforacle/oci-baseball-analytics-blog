resource "oci_analytics_analytics_instance" "oac" {
  compartment_id    = var.compartment_ocid
  name              = replace("${var.name_prefix}-oac", "-", "")
  description       = "Oracle Analytics Cloud instance for the baseball analytics platform."
  feature_set       = "SELF_SERVICE_ANALYTICS"
  license_type      = "LICENSE_INCLUDED"
  idcs_access_token = var.oac_idcs_access_token

  capacity {
    capacity_type  = "OLPU_COUNT"
    capacity_value = var.oac_olpu_count
  }

  network_endpoint_details {
    network_endpoint_type = "PUBLIC"
    whitelisted_ips       = var.oac_whitelisted_ips
  }

  freeform_tags = var.freeform_tags
}
