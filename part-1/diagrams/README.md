# Part 1 diagrams

Store publication-ready architecture diagrams here.

Recommended Part 1 figure:

```text
Public baseball data sources
  -> OCI Functions application
  -> Object Storage (raw / staged / curated)
  -> Autonomous Database (STG / CUR / FEAT / ML)
  -> OCI Data Science / OCI Generative AI / Oracle Analytics Cloud

Supporting services: OCIR, Logging, Notifications
```
