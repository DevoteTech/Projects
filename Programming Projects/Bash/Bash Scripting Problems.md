## Bash Scripting Problems

---

### 1. **Log File Rotation and Archival**

**Problem:**  
Log files in a system or application grow indefinitely, consuming excessive disk space. You need to automatically rotate, compress, and archive logs while keeping a limited number of backups.

**Requirements:**
- Detect if a log file exceeds a certain size (e.g., 100 MB).
- Rotate the log file, compress it (e.g., using `gzip`), and archive it.
- Remove the oldest backups while keeping only the last N backups (e.g., 5).

---

### 2. **Automated Backup Script**

**Problem:**  
You need to back up critical directories and databases to a remote server regularly.

**Requirements:**
- Create a timestamped archive of the `/var/www/html` directory.
- Use `rsync` or `scp` to transfer the archive to a remote server.
- Ensure the script handles errors gracefully and logs success or failure.
- Schedule the script with `cron` for automation.

---

### 3. **User and Group Management Automation**

**Problem:**  
In a growing environment, you need to ensure user accounts and groups are managed consistently.

**Requirements:**
- Create a script to add multiple users based on a CSV file (with fields like username, group, and home directory).
- Ensure the users are assigned to appropriate groups and home directories.
- Handle cases where users already exist, and log the actions taken.

---

### 4. **System Health Check and Monitoring**

**Problem:**  
You need to check the health of multiple servers by monitoring key metrics like CPU, memory, disk usage, and running services.

**Requirements:**
- Check CPU usage (`top` or `mpstat`), memory usage (`free`), and disk space (`df`).
- Ensure critical services (e.g., `nginx`, `mysql`) are running.
- Send an email or Slack notification if any threshold is exceeded or a service is down.

---

### 5. **File Integrity Monitoring**

**Problem:**  
You need to ensure critical configuration files haven't been tampered with.

**Requirements:**
- Monitor a set of configuration files (e.g., `/etc/nginx/nginx.conf`).
- Use `md5sum` or `sha256sum` to check file hashes against known good values.
- If a discrepancy is detected, send an alert and optionally revert to a backup.
