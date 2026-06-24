data "oci_core_services" "all_services" {
  filter {
    name   = "name"
    values = ["All .* Services In Oracle Services Network"]
    regex  = true
  }
}

resource "oci_core_vcn" "main" {
  compartment_id = var.compartment_ocid
  cidr_block     = var.vcn_cidr_block
  display_name   = "${var.name_prefix}-vcn"
  dns_label      = "bbanalytics"

  freeform_tags = var.freeform_tags
}

resource "oci_core_nat_gateway" "functions" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.main.id
  display_name   = "${var.name_prefix}-nat"

  freeform_tags = var.freeform_tags
}

resource "oci_core_service_gateway" "services" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.main.id
  display_name   = "${var.name_prefix}-service-gateway"

  services {
    service_id = data.oci_core_services.all_services.services[0].id
  }

  freeform_tags = var.freeform_tags
}

resource "oci_core_route_table" "functions" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.main.id
  display_name   = "${var.name_prefix}-functions-rt"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_nat_gateway.functions.id
  }

  route_rules {
    destination       = data.oci_core_services.all_services.services[0].cidr_block
    destination_type  = "SERVICE_CIDR_BLOCK"
    network_entity_id = oci_core_service_gateway.services.id
  }

  freeform_tags = var.freeform_tags
}

resource "oci_core_security_list" "functions" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.main.id
  display_name   = "${var.name_prefix}-functions-sl"

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }

  freeform_tags = var.freeform_tags
}

resource "oci_core_subnet" "functions" {
  compartment_id             = var.compartment_ocid
  vcn_id                     = oci_core_vcn.main.id
  cidr_block                 = var.functions_subnet_cidr_block
  display_name               = "${var.name_prefix}-functions-subnet"
  dns_label                  = "functions"
  route_table_id             = oci_core_route_table.functions.id
  security_list_ids          = [oci_core_security_list.functions.id]
  prohibit_public_ip_on_vnic = true

  freeform_tags = var.freeform_tags
}
