variable "compartment_ocid" {
  type = string
}

variable "name_prefix" {
  type = string
}

variable "oac_idcs_access_token" {
  type      = string
  sensitive = true
}

variable "oac_olpu_count" {
  type = number
}

variable "oac_whitelisted_ips" {
  type = list(string)
}

variable "freeform_tags" {
  type = map(string)
}
