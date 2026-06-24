variable "compartment_ocid" {
  type = string
}

variable "name_prefix" {
  type = string
}

variable "adb_db_name" {
  type = string
}

variable "adb_admin_password" {
  type      = string
  sensitive = true
}

variable "adb_ecpu_count" {
  type = number
}

variable "adb_storage_tbs" {
  type = number
}

variable "freeform_tags" {
  type = map(string)
}
