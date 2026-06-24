variable "compartment_ocid" {
  type = string
}

variable "name_prefix" {
  type = string
}

variable "vcn_cidr_block" {
  type = string
}

variable "functions_subnet_cidr_block" {
  type = string
}

variable "freeform_tags" {
  type = map(string)
}
