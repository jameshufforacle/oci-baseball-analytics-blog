# Build a Baseball Analytics Platform on OCI with AI and ML

> **Companion GitHub repository:** All Terraform, SQL, diagrams, code samples, and companion assets for this series are available in the GitHub repository.

This repository is the public companion for a six-part series that builds an end-to-end baseball analytics platform on Oracle Cloud Infrastructure (OCI).

The platform uses public baseball data, OCI Functions, Object Storage, Autonomous Database, OCI Data Science, OCI Generative AI, and Oracle Analytics Cloud (OAC). Part 1 provisions the shared foundation. Source-specific ingestion begins in Part 2.

## Series overview

The canonical platform flow is:

```text
Public baseball data
  -> OCI Functions
  -> Object Storage (raw / staged / curated)
  -> Autonomous Database (STG / CUR / FEAT / ML)
  -> OCI Data Science + OCI Generative AI + OAC
```

Logging and Notifications provide operational visibility across the platform.

## Repository structure

```text
oci-baseball-analytics-blog/
├── overview/
├── part-1/
│   ├── terraform/
│   ├── sql/
│   ├── diagrams/
│   └── screenshots/
├── part-2/
├── part-3/
├── part-4/
├── part-5/
├── part-6/
└── docs/
```

## Blog series roadmap

1. **Set Up the Baseball Analytics Platform on OCI** — provision the shared platform foundation.
2. **Data Ingestion (CSV + MLB API) End-to-End** — implement source-specific OCI Functions.
3. **Data Cleaning + Prep** — create curated tables and reusable feature data.
4. **OCI Data Science** — train models and write scores back to Autonomous Database.
5. **AI Decision Support with OCI Generative AI** — ground answers in structured outputs and retrieved context.
6. **OAC Dashboards** — publish interactive analytics and model outputs.

## Part 1 deployment path

1. Download the ready-to-upload [`part-1-resource-manager.zip`](https://github.com/jameshufforacle/oci-baseball-analytics-blog/releases/latest/download/part-1-resource-manager.zip), or clone the repository to inspect and package the Terraform source yourself.
2. Review the [Part 1 architecture notes](part-1/README.md) and [deployment guide](docs/part-1-deployment-guide.md).
3. If building the bundle yourself, create a ZIP whose root is the contents of `part-1/terraform/`.
4. Upload the ZIP to OCI Resource Manager.
5. Supply the required stack variables, including the OAC IDCS access token.
6. Run **Plan**, review the resources, and run **Apply**.
7. Execute [`part-1/sql/adb_bootstrap.sql`](part-1/sql/adb_bootstrap.sql) as the ADB `ADMIN` user.
8. Complete the [Part 1 validation checklist](docs/part-1-validation-checklist.md).
9. Continue to Part 2 for source-specific ingestion.

## Public data disclaimer

This series uses publicly available baseball data sources and endpoints. These sources are not affiliated with or endorsed by MLB. Readers are responsible for complying with applicable terms of use and usage limitations.

## Security

Never commit OCIDs that identify private environments, passwords, IDCS access tokens, API keys, private keys, service URLs, or generated Terraform state. Enter secrets as sensitive OCI Resource Manager variables.

Follow the [publication sanitization checklist](docs/publication-sanitization.md) before each public release.
