# Linux Permissions & Ownership

## Project Objective

The purpose of this part of the project was to implement department-level access control on a Linux server.

The server contains separate directories for:

- Development
- Operations
- Finance
- Shared

Each department directory is owned by its corresponding user and group.

## Directory Ownership

The following ownership configuration was implemented:

| Directory | Owner | Group |
|---|---|---|
| development | developer1 | developers |
| operations | opsadmin | operations |
| finance | finance1 | finance |
| shared | — | sharedteam |

Ownership was configured using `chown` and group ownership using `chgrp`.

Examples:

```bash
sudo chown developer1:developers development
sudo chown opsadmin:operations operations
sudo chown finance1:finance finance
sudo chgrp sharedteam shared
Department Permissions

Department directories were configured to restrict access between teams.

Example:

sudo chmod 770 development
sudo chmod 770 operations
sudo chmod 770 finance

The permission value 770 means:

Owner: rwx
Group: rwx
Others: ---

Therefore, users outside the authorized owner/group do not receive access through these directory permissions.

Shared Directory

A separate group called sharedteam was created for resources that need to be accessed by multiple departments.

The following users were added to the shared group:
developer1
opsadmin
finance1

The shared directory was configured with:

sudo chgrp sharedteam shared
sudo chmod 770 shared
Understanding Directory Permissions

Linux directory permissions behave differently from file permissions.

Read (r)

Allows a user to list the names of files inside the directory.

Write (w)

Allows a user to create, delete, or rename entries inside the directory.
Execute (x)

Allows a user to enter/traverse the directory and access items inside it.

Access Testing

Access was tested using the department users.

Expected behavior:

developer1 → Development access
opsadmin → Operations access
finance1 → Finance access
All three users → Shared directory access

Unauthorized department access resulted in permission restrictions.

Umask

The default umask of developer1 was checked using:

umask
The result was:

0002

For regular files, Linux starts with a default permission base of 666.

With a umask of 002:

666 - 002 = 664

Therefore, newly created regular files normally receive:

rw-rw-r--

Directories start with 777.

With a umask of 002:

777 - 002 = 775
Therefore, newly created directories normally receive:

rwxrwxr-x
Key Learning

Linux permissions allow administrators to control who can:

Read resources
Modify resources
Enter directories
Create or delete files
Access department-specific resources

combining users, groups, ownership, and permissions provides the foundation for Linux server security.
