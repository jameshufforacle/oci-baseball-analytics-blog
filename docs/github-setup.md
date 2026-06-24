# GitHub repository initialization and push

Create an empty GitHub repository named `oci-baseball-analytics-blog`. Do not initialize it with a README, license, or `.gitignore`, because those files already exist locally.

Before the first commit, configure a publication-safe Git identity. Use the public display name and GitHub-provided `users.noreply.github.com` address associated with the account or organization that will own the repository:

```bash
git config user.name "<public-display-name>"
git config user.email "<github-noreply-email>"
```

From the repository root:

```bash
git init
git branch -M main
git add .
git commit -m "Add Part 1 OCI baseball analytics platform foundation"
git remote add origin https://github.com/<github-owner>/oci-baseball-analytics-blog.git
git push -u origin main
```

Before pushing:

```bash
git status
git diff --cached
git grep -nE 'ocid1\\.|BEGIN PRIVATE KEY|idcs_access_token\\s*=|adb_admin_password\\s*='
```

Review any matches and ensure only placeholders or variable names are present.

Also verify that `git log --format=fuller` shows only the intended public commit identity before pushing.
