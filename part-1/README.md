# Part 1: Set Up the Baseball Analytics Platform on OCI

Part 1 provisions the shared foundation for the baseball analytics platform. It intentionally creates only the OCI Functions application shell; source-specific functions begin in Part 2.

## Resources provisioned

- Private Object Storage bucket named `bb-analytics-<env>`
- Private Functions subnet with NAT and Oracle Services Network access
- OCI Functions application shell
- Private OCIR repository for future ingestion images
- Functions dynamic group and least-privilege compartment policy
- Autonomous Data Warehouse
- OCI Data Science project
- Oracle Analytics Cloud
- Logging group
- Notifications topic and optional email subscription

## Object Storage layout

Object Storage prefixes are logical key prefixes, not directories:

- `raw/` — immutable source payloads exactly as retrieved
- `staged/` — normalized or flattened intermediate data
- `curated/` — curated exports used for sharing, testing, or downstream consumption

Example:

```text
raw/source=mlb_stats_api/dataset=schedule/ingest_date=2026-06-23/part-<run-id>.json
```

## Deploy with OCI Resource Manager

1. Download the ready-to-upload [`part-1-resource-manager.zip`](https://github.com/jameshufforacle/oci-baseball-analytics-blog/releases/latest/download/part-1-resource-manager.zip). To build it yourself instead, create a ZIP from `part-1/terraform` with the Terraform files and `modules/` at the ZIP root.
2. In OCI, open **Developer Services > Resource Manager > Stacks**.
3. Create a stack from the ZIP.
4. Review and set all required variables.
5. Store `adb_admin_password` and `oac_idcs_access_token` as sensitive values.
6. Run **Plan** and confirm the expected resources.
7. Run **Apply**.
8. Run [`sql/adb_bootstrap.sql`](sql/adb_bootstrap.sql) against ADB as `ADMIN`.
9. Follow the [validation checklist](../docs/part-1-validation-checklist.md).

The Resource Manager principal must be allowed to create tenancy-scoped dynamic groups and the required policies. The deployer must also obtain a current IDCS access token that is valid for OAC provisioning.

For a service-by-service explanation and selected Terraform excerpts, see the [Part 1 deployment guide](../docs/part-1-deployment-guide.md).
