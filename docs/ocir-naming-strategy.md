# OCIR naming strategy

## Recommendation

Use one repository per deployable function image:

```text
bb-analytics/<env>/<function-name>
```

Examples:

```text
bb-analytics/demo/mlb-schedule-ingest
bb-analytics/demo/mlb-game-feed-ingest
bb-analytics/demo/statcast-ingest
bb-analytics/demo/retrosheet-ingest
bb-analytics/demo/lahman-ingest
```

Part 1 creates:

```text
bb-analytics/<env>/ingestion-base
```

This repository is reserved for a shared base image or build validation. Part 2 should create each source-specific repository beside it.

## Rationale

A single shared ingestion repository makes image ownership and lifecycle ambiguous as the number of functions grows. Per-function repositories provide clearer image history, independent retention and deployment, and a direct mapping between a Function and its container image.
