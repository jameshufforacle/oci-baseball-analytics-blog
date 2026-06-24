variable "tenancy_ocid" {
  type = string
}

variable "compartment_ocid" {
  type = string
}

variable "name_prefix" {
  type = string
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "functions_subnet_id" {
  type = string
}

variable "object_storage_namespace" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "adb_id" {
  type = string
}

variable "freeform_tags" {
  type = map(string)
}
