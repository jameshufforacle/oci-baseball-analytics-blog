module "network" {
  source = "./modules/network"

  compartment_ocid            = var.compartment_ocid
  name_prefix                 = local.name_prefix
  vcn_cidr_block              = var.vcn_cidr_block
  functions_subnet_cidr_block = var.functions_subnet_cidr_block
  freeform_tags               = local.tags
}

module "object_storage" {
  source = "./modules/object-storage"

  compartment_ocid = var.compartment_ocid
  bucket_name      = local.bucket_name
  freeform_tags    = local.tags
}

module "database" {
  source = "./modules/database"

  compartment_ocid   = var.compartment_ocid
  name_prefix        = local.name_prefix
  adb_db_name        = var.adb_db_name
  adb_admin_password = var.adb_admin_password
  adb_ecpu_count     = var.adb_ecpu_count
  adb_storage_tbs    = var.adb_storage_tbs
  freeform_tags      = local.tags
}

module "functions" {
  source = "./modules/functions"

  tenancy_ocid             = var.tenancy_ocid
  compartment_ocid         = var.compartment_ocid
  name_prefix              = local.name_prefix
  project_name             = var.project_name
  environment              = var.environment
  functions_subnet_id      = module.network.functions_subnet_id
  object_storage_namespace = module.object_storage.namespace
  bucket_name              = module.object_storage.bucket_name
  adb_id                   = module.database.adb_id
  freeform_tags            = local.tags
}

module "data_science" {
  source = "./modules/data-science"

  compartment_ocid = var.compartment_ocid
  name_prefix      = local.name_prefix
  freeform_tags    = local.tags
}

module "analytics" {
  source = "./modules/analytics"

  compartment_ocid      = var.compartment_ocid
  name_prefix           = local.name_prefix
  oac_idcs_access_token = var.oac_idcs_access_token
  oac_olpu_count        = var.oac_olpu_count
  oac_whitelisted_ips   = var.oac_whitelisted_ips
  freeform_tags         = local.tags
}

module "observability" {
  source = "./modules/observability"

  compartment_ocid   = var.compartment_ocid
  name_prefix        = local.name_prefix
  notification_email = var.notification_email
  freeform_tags      = local.tags
}
