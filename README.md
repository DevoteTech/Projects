# Projects Folder

## Introduction
My name is Gerrick Sands, a CyberSecurity engineer with a focus in automation. This repository is to be my working portfolio for active projects. Feel free to use what you find useful.

## Projects
1. Automated Patch Management and Security Updates
    - **Problem:**  
    Managing security updates and patches across a large fleet of Linux servers can be challenging. Without automation, it increases the risk of human error, delayed patches, and potential security vulnerabilities due to outdated software.

    - **Solution:**  
        - **Automation Goal:** Implement an automated solution to handle patch management, update verification, and reboot scheduling.  
        - **Tools:** Ansible, Bash scripts, Cron jobs, Puppet, Chef.

    - **Key Steps:**  
        - **Inventory Management:** Use Ansible to dynamically inventory servers.  
        - **Patch Installation:** Automate the installation of security patches with `yum`, `dnf`, or `apt` depending on the distro.  
        - **Compliance Checks:** Create scripts to verify if critical patches have been applied.  
        - **Reboot Scheduling:** Automate reboots after updates, with logic to avoid downtime during peak hours.  
        - **Reporting:** Generate automated patch reports to confirm patch compliance and identify servers that missed updates.