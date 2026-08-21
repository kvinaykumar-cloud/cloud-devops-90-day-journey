# Day 01 — 90-Day Cloud & DevOps Journey

**Date:** 2026-08-21  
**Domain Focus:** [Linux / Git / Onboarding]  
**Status:** [ Completed ]

---

## 🎯 Objectives
- [1] Complete workstation verification ticket (DEV-001) in WSL2 Ubuntu.
- [2] Initialize and structure the 90-day Cloud & DevOps engineering repository.
- [3] Master Git working tree, staging area, commit, and remote synchronization workflows.
- [4] Understand Linux filesystem hierarchy standards (`/etc`, `/var`, `/home`, etc.).
- [5] Formulate structured troubleshooting methodology for incident INC-001.

---

## 🎫 Ticket: DEV-001 — Workstation Environment Verification

### Collected Evidence
1. **Current User:**
   - **Command:** `whoami`
   - **Output:** `vinay`
   - **Explanation:** Displays the active username of the logged-in shell session.

2. **Current Directory:**
   - **Command:** `pwd`
   - **Output:** `/home/vinay`
   - **Explanation:** Prints the absolute path of the working directory.

3. **Linux Version & Distribution:**
   - **Command:** `uname -a` (and `cat /etc/os-release`)
   - **Output:** `Linux LAPTOP-KQDVL41E 6.18.33.2-microsoft-standard-WSL2 #1 SMP PREEMPT_DYNAMIC Thu Jun 18 21:54:43 UTC 2026 x86_64 GNU/Linux`
   - **Explanation:** Displays kernel release details, architecture, and Ubuntu OS distribution specs.

4. **Directory Listing:**
   - **Command:** `ls -la`
   - **Output:** Lists all project directories (`aws`, `docker`, `daily-log`, etc.) including hidden `.git` and `.gitkeep` files.
   - **Explanation:** Outputs directory entries in long format with file permissions, ownership, and hidden dotfiles.

5. **Disk Space Usage:**
   - **Command:** `df -h`
   - **Output:** Displays available filesystem storage in human-readable gigabytes (GB).
   - **Explanation:** Reports mounted filesystem disk capacity, consumed space, and available space.

6. **Git Version:**
   - **Command:** `git --version`
   - **Output:** `git version 2.53.0`
   - **Explanation:** Confirms Git binary installation and outputs the active client version.

---

## 🧪 Practical Task: Linux Filesystem Navigation & Standards

| Directory | Purpose | Realistic Example |
| :--- | :--- | :--- |
| **`/`** | Root directory of the entire Linux hierarchy | Top-level mount point (`/initrd.img`, `/vmlinuz`) |
| **`/home`** | Personal directories for standard non-root users | `/home/vinay/` |
| **`/etc`** | System-wide configuration files and scripts | `/etc/ssh/sshd_config`, `/etc/hosts` |
| **`/var`** | Variable, dynamically changing runtime data | `/var/log/syslog`, `/var/log/nginx/` |
| **`/tmp`** | Ephemeral temporary files (cleared on reboot) | `/tmp/session_lock_1001` |
| **`/bin`** | Essential user command binaries | `/bin/bash`, `/bin/ls`, `/bin/cat` |
| **`/usr`** | User utilities, shared libraries, and user-space binaries | `/usr/bin/git`, `/usr/lib/` |

> **Diagnostic Insight:** If an application misbehaves, check `/etc` first to verify configuration syntax, port bindings, and parameters. Next, inspect `/var/log` to examine runtime stack traces and error output.

---

## 🔧 Incident Investigation: INC-001

**Scenario:** "The application isn't behaving correctly. Please investigate."

- **A. Information Already Available:** An unspecified application in the Development environment has an unknown runtime issue.
- **B. Information Missing:** Application/service name, Process ID (PID), exact error logs, reproduction steps, expected behavior vs. actual behavior, and recent deployment changes.
- **C. What to Check First:** Verify whether the target service process is active/running and inspect the application's most recent runtime log stream.
- **D. Why Check It:** To identify active crashes, fatal exceptions, or misconfigured ports without modifying system files blindly.
- **E. Diagnostic Commands:**
  - `systemctl status <service_name>` or `ps aux | grep <app_name>`
  - `journalctl -u <service_name> -n 50 --no-pager` or `tail -n 100 /var/log/<app_name>/error.log`
  - `ss -tulnp` (check network port bindings)

---

## 🧠 Day 1 Anti-Cheating & Concepts Review

1. **Difference between `/etc` and `/var`:** `/etc` stores static configuration files that define program behavior, while `/var` holds dynamic runtime data such as logs and database storage.
2. **Why inspect `/etc` on failure:** To detect accidental syntax errors, invalid IP/port configurations, or corrupt setting values introduced in recent edits.
3. **Why inspect `/var` on failure:** To check `/var/log` for timestamped error traces, failed database connections, or unhandled exceptions.
4. **Git Lifecycle (`Working Tree` → `Staging Area` → `Commit`):**
   - *Working Tree:* Uncommitted file changes on disk.
   - *Staging Area (Index):* Selected files gathered via `git add` to prepare a snapshot.
   - *Commit:* A permanent, cryptographically hashed snapshot in the repository history.
5. **Information shown by `git status`:** Active branch name, remote sync status, untracked files (red), modified unstaged files (red), and staged files ready to commit (green).
6. **Should you restart a broken server immediately after a configuration change?** No. Restarting can destroy volatile in-memory diagnostics, propagate downtime to dependent services, or prevent the server from rebooting. Always inspect logs, validate syntax, and revert bad configurations first.

---

## 💻 Commands & Code Snippets

```bash
# Workstation Verification
whoami
pwd
uname -a
ls -la
df -h
git --version

# Git Workspace Management
git status
git add daily-log/day-01.md
git commit -m "docs(daily-log): complete day-01 dev-001, inc-001, and linux fundamentals"
git push origin main
```
---
📖 Key Concepts Learned
Linux Filesystem Hierarchy: Understanding standard mount paths (/etc for configurations, /var/log for runtime traces).

Git State Flow: Navigating changes between Working Tree, Staging Index, and Commit snapshots.

⚠️ Challenges & Troubleshooting
Issue: Navigating and listing directory contents while situated in the home directory (~) rather than the target project workspace directory.

Resolution: Used absolute and relative paths (cd) to position the shell directly inside the target repository before verifying repository contents with ls -la.

🔗 Resources & Artifacts
Doc/Link: daily-log/day-01.md

Related Repo Path: ./daily-log/day-01.md