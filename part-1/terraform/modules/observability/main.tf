resource "oci_logging_log_group" "main" {
  compartment_id = var.compartment_ocid
  display_name   = "${var.name_prefix}-logs"
  description    = "Log group for the baseball analytics platform."

  freeform_tags = var.freeform_tags
}

resource "oci_ons_notification_topic" "main" {
  compartment_id = var.compartment_ocid
  name           = "${var.name_prefix}-alerts"
  description    = "Notifications for baseball analytics platform failures."

  freeform_tags = var.freeform_tags
}

resource "oci_ons_subscription" "email" {
  count = trimspace(var.notification_email) == "" ? 0 : 1

  compartment_id = var.compartment_ocid
  topic_id       = oci_ons_notification_topic.main.topic_id
  protocol       = "EMAIL"
  endpoint       = var.notification_email
}
