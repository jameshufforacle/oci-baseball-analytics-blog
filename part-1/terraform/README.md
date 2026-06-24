# Part 1 Terraform / OCI Resource Manager stack

This stack provisions the canonical Part 1 foundation:

- Object Storage bucket `bb-analytics-<env>`
- Private Functions networking with NAT and Oracle Services Network routing
- Autonomous Data Warehouse
- OCI Functions application shell
- OCIR `bb-analytics/<env>/ingestion-base` repository
- Functions dynamic group and least-privilege compartment policy
- OCI Data Science project
- Oracle Analytics Cloud
- Logging group
- Notifications topic and optional email subscription

OAC and Functions IAM are required parts of this stack. There are no `deploy_oac` or `create_functions_*` switches in the public deployment path.

## Resource Manager ZIP

Download the ready-to-upload bundle from the [latest GitHub release](https://github.com/jameshufforacle/oci-baseball-analytics-blog/releases/latest/download/part-1-resource-manager.zip).

To build the same ZIP locally, run from this directory:

```bash
zip -r part-1-resource-manager.zip . \
  -x '.terraform/*' '*.tfstate*' '*.tfplan' '.DS_Store'
```

Upload the resulting ZIP to OCI Resource Manager. Enter `adb_admin_password` and `oac_idcs_access_token` as sensitive variables.

The Resource Manager principal must have permission to create dynamic groups in the tenancy, policies in the target compartment, and every service resource represented by this stack.
