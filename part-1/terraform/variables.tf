variable "region" {
  description = "OCI region identifier."
  type        = string
  default     = "us-ashburn-1"
}

variable "tenancy_ocid" {
  description = "Root tenancy OCID. Resource Manager normally prepopulates this variable."
  type        = string

  validation {
    condition     = startswith(var.tenancy_ocid, "ocid1.tenancy.")
    error_message = "tenancy_ocid must be a tenancy OCID."
  }
}

variable "compartment_ocid" {
  description = "Compartment OCID for the platform resources."
  type        = string

  validation {
    condition     = startswith(var.compartment_ocid, "ocid1.compartment.")
    error_message = "compartment_ocid must be a compartment OCID."
  }
}

variable "project_name" {
  description = "Project name used in resource names."
  type        = string
  default     = "bb-analytics"

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{2,30}$", var.project_name))
    error_message = "project_name must start with a lowercase letter and contain only lowercase letters, numbers, and hyphens."
  }
}

variable "environment" {
  description = "Environment suffix used in resource names."
  type        = string
  default     = "demo"

  validation {
    condition     = can(regex("^[a-z][a-z0-9]{1,7}$", var.environment))
    error_message = "environment must be 2-8 lowercase alphanumeric characters and start with a letter."
  }
}

variable "freeform_tags" {
  description = "Additional free-form tags applied to supported resources."
  type        = map(string)
  default     = {}
}

variable "vcn_cidr_block" {
  description = "CIDR block for the platform VCN."
  type        = string
  default     = "10.42.0.0/16"
}

variable "functions_subnet_cidr_block" {
  description = "CIDR block for the private regional Functions subnet."
  type        = string
  default     = "10.42.10.0/24"
}

variable "adb_admin_password" {
  description = "ADMIN password for Autonomous Database. Enter as a sensitive Resource Manager variable."
  type        = string
  sensitive   = true

  validation {
    condition     = length(var.adb_admin_password) >= 12
    error_message = "adb_admin_password must contain at least 12 characters."
  }
}

variable "adb_ecpu_count" {
  description = "ECPU count for Autonomous Data Warehouse."
  type        = number
  default     = 4

  validation {
    condition     = var.adb_ecpu_count > 0
    error_message = "adb_ecpu_count must be greater than zero."
  }
}

variable "adb_storage_tbs" {
  description = "Storage size in TB for Autonomous Data Warehouse."
  type        = number
  default     = 1

  validation {
    condition     = var.adb_storage_tbs >= 1
    error_message = "adb_storage_tbs must be at least 1."
  }
}

variable "adb_db_name" {
  description = "ADB database name. Must be alphanumeric."
  type        = string
  default     = "BBADBDEMO"

  validation {
    condition     = can(regex("^[A-Za-z][A-Za-z0-9]{0,29}$", var.adb_db_name))
    error_message = "adb_db_name must start with a letter and contain at most 30 alphanumeric characters."
  }
}

variable "oac_idcs_access_token" {
  description = "Current IDCS access token required to create OAC. Enter as a sensitive Resource Manager variable."
  type        = string
  sensitive   = true

  validation {
    condition     = length(trimspace(var.oac_idcs_access_token)) > 0
    error_message = "oac_idcs_access_token is required because OAC is part of the canonical Part 1 deployment."
  }
}

variable "oac_olpu_count" {
  description = "OAC capacity in OLPUs."
  type        = number
  default     = 1

  validation {
    condition     = var.oac_olpu_count >= 1
    error_message = "oac_olpu_count must be at least 1."
  }
}

variable "oac_whitelisted_ips" {
  description = "Optional public CIDR allowlist for OAC."
  type        = list(string)
  default     = []
}

variable "notification_email" {
  description = "Optional email endpoint for the Notifications topic."
  type        = string
  default     = ""
}
