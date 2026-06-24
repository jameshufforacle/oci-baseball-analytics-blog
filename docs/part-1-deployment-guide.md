# Part 1 deployment guide

Part 1 is a Terraform and OCI Resource Manager quickstart. The blog should explain the architecture and selected Terraform excerpts, while this repository carries the complete deployable bundle.

## Service inventory

| Resource | Part 1 purpose | Later use |
|---|---|---|
| Object Storage | Private `raw/`, `staged/`, and `curated/` lake | Parts 2–5 |
| VCN, private subnet, NAT, service gateway | Secure outbound network for OCI Functions | Part 2 |
| OCI Functions application | Shared ingestion application shell | Part 2 |
| OCIR repository | Shared ingestion base/build image location | Part 2 |
| Functions dynamic group and policy | Resource-principal access to platform resources | Part 2 |
| Autonomous Data Warehouse | STG/CUR/FEAT/ML warehouse and serving layer | Parts 2–6 |
| OCI Data Science project | Home for notebook, training, and scoring work | Parts 3–5 |
| Oracle Analytics Cloud | Dashboard service provisioned before analytics content is built | Part 6 |
| Logging group | Central platform log destination | Parts 2–6 |
| Notifications topic | Failure and job notification destination | Parts 2–6 |

## Selected Terraform excerpts

### Canonical bucket naming

```hcl
locals {
  name_prefix = "${var.project_name}-${var.environment}"
  bucket_name = local.name_prefix
}
```

With the publication defaults, this creates `bb-analytics-demo` without hardcoding an Object Storage namespace.

### Functions application shell

```hcl
resource "oci_functions_application" "ingestion" {
  compartment_id = var.compartment_ocid
  display_name   = "${var.name_prefix}-ingest-app"
  subnet_ids     = [var.functions_subnet_id]
  shape          = "GENERIC_X86"
}
```

Part 1 creates the application only. Part 2 adds source-specific functions.

### Mandatory OAC

```hcl
resource "oci_analytics_analytics_instance" "oac" {
  compartment_id    = var.compartment_ocid
  idcs_access_token = var.oac_idcs_access_token
  # ...
}
```

The public stack has no optional OAC switch. The token is supplied as a sensitive Resource Manager variable.

### Functions resource principal

```hcl
resource "oci_identity_dynamic_group" "functions" {
  compartment_id = var.tenancy_ocid
  matching_rule   = "ALL {resource.type = 'fnfunc', resource.compartment.id = '${var.compartment_ocid}'}"
}
```

The paired policy limits object management to the platform bucket and grants the metadata/log access needed by later ingestion functions.

## Resource Manager flow

1. Download the repository.
2. Review this guide and `part-1/terraform/`.
3. ZIP the contents of `part-1/terraform/`.
4. Create a Resource Manager stack from the ZIP.
5. enter the required placement, ADB, and OAC values.
6. Run Plan.
7. Review the inventory of resources.
8. Run Apply.
9. Execute `part-1/sql/adb_bootstrap.sql`.
10. Complete the validation checklist.
