output "vcn_id" {
  value = oci_core_vcn.main.id
}

output "functions_subnet_id" {
  value = oci_core_subnet.functions.id
}
