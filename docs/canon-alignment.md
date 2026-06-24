# Part 1 canon alignment

The repository applies the following controlling decisions:

- The end-to-end solution is called a **platform**.
- OCI Functions is the canonical ingestion compute.
- Part 1 provisions the shared Functions application shell only.
- Source-specific Functions begin in Part 2.
- OAC is mandatory and is provisioned by Terraform through OCI Resource Manager.
- The OAC IDCS access token is a required sensitive stack input.
- The stack creates the Functions dynamic group and compartment policy.
- Object Storage uses `bb-analytics-<env>` and the `raw/`, `staged/`, and `curated/` logical prefixes.
- ADB uses the `STG`, `CUR`, `FEAT`, and `ML` schema families.
- `STG.INGEST_RUNS`, `STG.FILE_MANIFEST`, and `STG.DQ_RESULTS` are required.
- The canonical public sources are MLB Stats API, Baseball Savant / Statcast, Retrosheet, and Lahman.
- OCI Generative AI remains a required downstream platform component, implemented in Part 5.
