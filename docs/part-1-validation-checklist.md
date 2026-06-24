# Part 1 validation checklist

## Static validation

- [ ] `terraform fmt -check -recursive` succeeds.
- [ ] `terraform init -backend=false` succeeds.
- [ ] `terraform validate` succeeds.
- [ ] No real OCIDs, passwords, access tokens, keys, namespaces, or service URLs are committed.
- [ ] The Resource Manager ZIP has Terraform files and `modules/` at its root.

## Resource Manager

- [ ] All required variables are populated.
- [ ] `adb_admin_password` is stored as a sensitive value.
- [ ] `oac_idcs_access_token` is stored as a sensitive value.
- [ ] Plan includes Object Storage, networking, ADB, Functions, OCIR, Data Science, OAC, Logging, Notifications, the dynamic group, and the Functions policy.
- [ ] Apply succeeds.
- [ ] A second plan reports no pending infrastructure changes.

## Object Storage

- [ ] Bucket name is `bb-analytics-<env>`.
- [ ] Bucket access type is private.
- [ ] No namespace or tenancy-specific value is hardcoded.
- [ ] Documentation identifies `raw/`, `staged/`, and `curated/`.

## Functions and OCIR

- [ ] The Functions application exists.
- [ ] No source-specific Function is deployed by Part 1.
- [ ] The application subnet is private and has outbound access through NAT.
- [ ] The application configuration contains the bucket name, namespace, ADB ID, project name, and environment.
- [ ] The dynamic group includes Functions in the target compartment.
- [ ] The policy grants bucket object access, bucket inspection, log-content use, and ADB metadata read.
- [ ] The `bb-analytics/<env>/ingestion-base` OCIR repository exists and is private.

## Autonomous Database

- [ ] ADB is Available.
- [ ] `STG`, `CUR`, `FEAT`, and `ML` users exist.
- [ ] `STG.INGEST_RUNS` exists.
- [ ] `STG.FILE_MANIFEST` exists.
- [ ] `STG.DQ_RESULTS` exists.

## OAC and downstream services

- [ ] OAC is Active.
- [ ] Oracle Analytics home opens.
- [ ] The OCI Data Science project exists.
- [ ] The Logging group exists.
- [ ] The Notifications topic exists.
- [ ] Any configured email subscription has been confirmed.
