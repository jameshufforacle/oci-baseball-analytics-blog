# Publication sanitization

Before every public release:

- Use placeholders for tenancy and compartment OCIDs.
- Never commit Terraform state or plan files.
- Never commit passwords, access tokens, security tokens, API keys, private keys, fingerprints, or credentials files.
- Do not publish real Object Storage namespaces, OAC service URLs, notification addresses, local filesystem paths, user names, or workstation details.
- Use neutral example resource names and environments.
- Keep `.terraform/`, `.git/`, `.DS_Store`, editor metadata, and generated archives out of release archives.
- Use a GitHub `users.noreply.github.com` address for commit metadata when a private email address should not be public.
- Inspect every screenshot for OCIDs, namespaces, URLs, account names, email addresses, and browser profile details.
- Run the repository secret scan and inspect the final ZIP contents before publishing.
