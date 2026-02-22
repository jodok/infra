# Agent Instructions

## SaltStack-specific instructions (this repo is executed on servers)

This repository contains Salt states and pillar data that are applied directly to Ubuntu servers.
Changes here affect live system configuration.

### Execution model
- Salt formulas in `salt/` are applied via `salt-call state.apply` or highstate.
- Pillars in `pillar/` provide configuration and may contain encrypted values.
- Treat all edits as infrastructure changes, not just code changes.

### Required workflow for changes
- Prefer idempotent states (safe to run repeatedly).
- Never introduce interactive commands in states.
- Validate syntax before committing:
  - `salt-call --local state.show_sls <state>`
  - `salt-call --local state.apply test=True`
- For host package changes on `bertrand`, use this workflow:
  - Add the state include in `salt/bertrand/init.sls` (for nginx: `- nginx`).
  - Create a branch, push to GitHub, and open a pull request.
  - Wait for acknowledgement, then merge to `main`.
  - SSH to `admin@bertrand`, run `git pull`, then `sudo salt-call --local state.apply terse=true`.

### Deployment learnings (bertrand)
- Remote checkout path is `~/sandbox/infra` for user `admin`.
- Prefer non-interactive deployment command to avoid hanging on sudo prompts:
  - `ssh admin@bertrand 'cd ~/sandbox/infra && git pull && sudo -n salt-call --local state.apply terse=true'`
- If `git pull` is blocked by local modifications, inspect first (`git status`, `git diff`) and only then stash/resolve intentionally before pulling.
- Repository branch protections require PR-based merges to `main`; do not rely on direct pushes to `main`.
- The human reviewer/user performs PR approvals; agents should not self-approve unless explicitly asked.
- When certbot fails during apply, capture and report the exact failing domains/status codes (for DNS/HTTP challenge debugging) instead of masking the error.

## Terraform-specific instructions

- Treat Terraform changes as production infrastructure changes.
- Always run `terraform fmt` on edited `.tf` files.
- Validate before commit with `terraform validate`.
- Generate a plan and review it before apply:
  - `terraform plan -out=tfplan`
  - If apply is approved: `terraform apply tfplan`
- Never apply Terraform changes automatically without explicit user approval.
- Keep Terraform state/backends unchanged unless explicitly requested.

### Secrets handling
- Sensitive pillar values are encrypted with GPG renderer.
- Do not commit plaintext secrets.
- Encrypted pillar files must remain decryptable on the Salt master.

### Target OS assumptions
- Primary target is Ubuntu 24.04+ on Hetzner cloud-init provisioned hosts.
- Systemd is present; use `service.running` not init scripts.

### Formatting and conventions
- Use Jinja sparingly; keep states readable.
- Prefer `pkg.installed`, `file.managed`, `service.running`.
- Avoid shell commands unless no Salt module exists.

### Before proposing changes
Always answer:
- What state/pillar is affected?
- What host impact occurs?
- How can it be tested safely (`test=True`)?

## General guidelines for all agents

- Delete unused or obsolete files when your changes make them irrelevant (refactors, feature removals, etc.), and revert files only when the change is yours or explicitly requested. If a git operation leaves you unsure about other agents' in-flight work, stop and coordinate instead of deleting.
- **Before attempting to delete a file to resolve a local type/lint failure, stop and ask the user.** Other agents are often editing adjacent files; deleting their work to silence an error is never acceptable without explicit approval.
- NEVER edit `.env` or any environment variable files—only the user may change them.
- Coordinate with other agents before removing their in-progress edits—don't revert or delete work you didn't author unless everyone agrees.
- Moving/renaming and restoring files is allowed.
- ABSOLUTELY NEVER run destructive git operations (e.g., `git reset --hard`, `rm`, `git checkout`/`git restore` to an older commit) unless the user gives an explicit, written instruction in this conversation. Treat these commands as catastrophic; if you are even slightly unsure, stop and ask before touching them. *(When working within Cursor or Codex Web, these git limitations do not apply; use the tooling's capabilities as needed.)*
- Never use `git restore` (or similar commands) to revert files you didn't author—coordinate with other agents instead so their in-progress work stays intact.
- Always double-check git status before any commit
- Keep commits atomic: commit only the files you touched and list each path explicitly. For tracked files run `git commit -m "<scoped message>" -- path/to/file1 path/to/file2`. For brand-new files, use the one-liner `git restore --staged :/ && git add "path/to/file1" "path/to/file2" && git commit -m "<scoped message>" -- path/to/file1 path/to/file2`.
- Quote any git paths containing brackets or parentheses (e.g., `src/app/[candidate]/**`) when staging or committing so the shell does not treat them as globs or subshells.
- When running `git rebase`, avoid opening editors—export `GIT_EDITOR=:` and `GIT_SEQUENCE_EDITOR=:` (or pass `--no-edit`) so the default messages are used automatically.
- Never amend commits unless you have explicit written approval in the task thread.
