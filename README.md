# update-system-tool
# 🔧 Update System Tool

This script automates system updates using Linux shell scripting, complete with logging, error handling, and scheduled execution via cron. It's portable, version-controlled, and easily deployable via GitHub or USB.

##  Features

- Automated system updates
- Logging and error handling
- Cron scheduling for regular execution
- GitHub integration for version control
- USB compatibility for offline deployment

## ⚙️ Git Usage Highlights

```bash
git init
git remote add origin https://github.com/omuel39/update-system-tool.git
git pull origin main --rebase
git push --set-upstream origin main

## 🛡 Security & Logging

- Logs are stored in `/var/log/apt` and `/myproject/logs/update.log`
- Updates are audited weekly for stability and integrity

##  Optional Email Notifications

- Integrate `mailutils` to receive update reports via email

##  Deliverables

-  Script: `~/myproject/scripts/update_system.sh`
-  Documentation: `~/myproject/docs/project_readme.md`
-  Screenshots: `tail update.log`, `crontab -l`
-  Optional: Email alerts via `mailutils`


