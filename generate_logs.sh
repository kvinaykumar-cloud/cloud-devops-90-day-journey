#!/usr/bin/env bash
set -euo pipefail
mkdir -p daily-log
for day in $(seq -w 1 90); do
  file="daily-log/day-${day}.md"
  cat << ENTRY > "$file"
# Day ${day} — 90-Day Cloud & DevOps Journey

**Date:** YYYY-MM-DD  
**Domain Focus:** [Linux / Networking / Bash / AWS / Docker / K8s / CI-CD / Terraform / Monitoring]  
**Status:** [ Planned | In Progress | Completed ]

---

## 🎯 Objectives
- [ ] Task 1: 
- [ ] Task 2: 

---

## 📖 Key Concepts Learned
- **Concept 1:** 
- **Concept 2:** 

---

## 💻 Commands & Code Snippets
\`\`\`bash
# Insert key commands used today
\`\`\`

---

## ⚠️ Challenges & Troubleshooting
- **Issue:** 
- **Resolution:** 

---

## 🔗 Resources & Artifacts
- **Doc/Link:** 
- **Related Repo Path:** \`./\`
ENTRY
done
echo "✅ Generated 90 daily log templates in ./daily-log/"
