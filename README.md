# Linux Server Administration & Security Lab

## Project Overview

This project is a hands-on Linux server administration and security lab designed to simulate a basic company server environment.

The project demonstrates practical Linux administration skills including:

- User and group management
- File and directory permissions
- Ownership management
- Department-level access control
- Shared directory access
- Process management
- Linux service management
- Nginx troubleshooting
- Log analysis
- Configuration validation
- Bash automation
- Git and GitHub project management

The project focuses on understanding **why and how Linux administration commands are used**, rather than simply memorizing commands.

---

## Project Scenario

A company Linux server is divided into different departments:


Linux Server
│
├── Development
├── Operations
├── Finance
└── Shared
Each department has its own users, groups, and directory permissions.

Users
User	Department	Group
developer1	Development	developers
opsadmin	Operations	operations
finance1	Finance	finance
Shared Access

A sharedteam group was created to provide controlled access to the shared directory.

The following users were added to the shared group:

developer1
opsadmin
finance1
Project Structure
linux-server-administration-security/
│
├── README.md
│
├── company/
│   ├── development/
│   ├── operations/
│   ├── finance/
│   └── shared/
│
├── docs/
│   ├── user-management.md
│   ├── permissions.md
│   └── troubleshooting.md
│
├── scripts/
│   └── server-health.sh
│
└── screenshots/

1. User and Group Management
Linux users and groups were created to represent different company departments.
Groups
developers
operations
finance
sharedteam
Users
developer1
opsadmin
finance1
Users were assigned to their respective department groups.
The sharedteam group was used to provide controlled access to shared resources.

Detailed documentation:
User Management Documentation

2. File Ownership
Department directories were assigned appropriate owners and groups.

Example:
sudo chown developer1:developers development
sudo chown opsadmin:operations operations
sudo chown finance1:finance finance

The shared directory was assigned to the shared team group:
sudo chgrp sharedteam shared
This demonstrates how Linux ownership can be used to control access to server resources.

3. Linux Permissions
Department directories were configured using Linux permissions.

Example:
sudo chmod 770 development
sudo chmod 770 operations
sudo chmod 770 finance
Permission Meaning
7 = read + write + execute
7 = read + write + execute
0 = no permissions

Therefore:

770
│││
││└── Others: no access
│└─── Group: read/write/execute
└──── Owner: read/write/execute

Department-level access was tested using the different users.
Unauthorized users were prevented from accessing other department directories.

Detailed documentation:
Permissions Documentation

4. Shared Directory
A sharedteam group was created for controlled access to shared resources.
Users:
developer1
opsadmin
finance1
were added to the group.

The shared directory was configured with:
sudo chgrp sharedteam shared
sudo chmod 770 shared
This provides controlled access to users belonging to the shared team.

5. Umask
The umask configuration was also investigated.

The user's umask was checked using:
umask

The observed value was:
0002

For regular files:
666 - 002 = 664
Result:
rw-rw-r--

For directories:
777 - 002 = 775

Result:
rwxrwxr-x
This demonstrated how umask influences the default permissions of newly created files and directories.

6. Process Management:
Linux processes were investigated using:
ps
ps aux
top

A test process was created:
sleep 300

The process was located using:
ps aux | grep sleep | grep -v grep

The PID was then used to terminate the process:
kill <PID>
This demonstrated basic process identification and management.

7. Nginx Service Management:
Nginx was used as the web server for service-management and troubleshooting exercises.

The service status was checked using:
systemctl status nginx

Additional checks included:
systemctl is-active nginx
systemctl is-enabled nginx
The project also simulated an Nginx service outage.

Nginx was stopped:
sudo systemctl stop nginx
The service state was checked and the failure was identified.

Nginx was then restored:
sudo systemctl start nginx
The service was verified again.

8. Nginx Log Analysis
Nginx service logs were investigated using:
sudo journalctl -u nginx --no-pager | tail -10

Another useful command:
sudo journalctl -u nginx -n 20 --no-pager
Logs were used as part of the troubleshooting process to understand service events and identify possible problems.

9. Nginx Configuration Validation
Before applying configuration changes, the Nginx configuration was tested using:
sudo nginx -t
A configuration error was intentionally simulated to understand how Nginx reports invalid configuration directives.

The original configuration was backed up before testing:
sudo cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup
After detecting the configuration error, the original configuration was restored.

The configuration was tested again:
sudo nginx -t

After confirming that the configuration was valid, Nginx was reloaded.
sudo systemctl reload nginx

Detailed troubleshooting information:
Troubleshooting Documentation

10. Bash Automation
A Bash server-health-check script was created:
scripts/server-health.sh

The script checks important server information including:
Current date
Hostname
Current user
Disk usage
Memory usage
Nginx service status
Recent Nginx logs

The script can be executed using:
./scripts/server-health.sh
The script demonstrates basic Bash scripting and Linux system monitoring.

11. Troubleshooting Methodology
The project follows a basic troubleshooting workflow:
Identify the problem
        ↓
Check process/service status
        ↓
Check logs
        ↓
Validate configuration
        ↓
Fix the problem
        ↓
Reload/restart if required
        ↓
Verify the result
This approach was practiced through simulated process and Nginx failures.

## Skills Demonstrated:
Linux
Linux command line
Files and directories
Users and groups
Ownership
Permissions
chmod
chown
chgrp
umask
Processes
PIDs
kill
Services
systemctl
Logs
journalctl
Web Server
Nginx service management
Nginx configuration validation
Nginx logs
Service failure simulation
Configuration recovery
Bash
Bash scripting
Conditional statements
Command substitution
System health checks
Service status checks
Git & GitHub
Repository management
Project documentation
Version control
GitHub portfolio development

## Key Learning Outcomes:
By completing this project, I practiced how to:
Create and manage Linux users and groups.
Organize users according to departments.
Configure file and directory ownership.
Control access using Linux permissions.
Configure shared resources using groups.
Understand directory permissions.
Understand umask.
Identify and terminate Linux processes.
Manage Linux services using systemctl.
Analyze service logs.
Validate Nginx configurations.
Simulate and troubleshoot service failures.
Recover from configuration errors.
Automate server health checks using Bash.
Document Linux administration and troubleshooting procedures.

## Project Purpose:
This project was created as a practical Cloud and DevOps learning project to build foundational Linux administration, security, troubleshooting, and automation skills.
The project focuses on practical hands-on administration rather than command memorization.

## Documentation:
Detailed project documentation:
User Management
Permissions & Ownership
Troubleshooting

## Future Improvements:
Possible future improvements include:
Linux ACL configuration
Advanced Bash monitoring
Disk-space alert thresholds
Automated log monitoring
SSH security hardening
Automated backups
Docker deployment
CI/CD integration
Infrastructure as Code using Terraform

## Author:
Cloud & DevOps Learning Project
Built as part of a hands-on AWS and DevOps learning journey.
