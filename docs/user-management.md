# Linux User & Group Management

## Project Scenario

This project simulates a company Linux server with three departments:

- Development
- Operations
- Finance

Each department has its own Linux group and user.

## Groups Created

- developers
- operations
- finance
- sharedteam

## Users Created

| User | Department | Group |
|---|---|---|
| developer1 | Development | developers |
| opsadmin | Operations | operations |
| finance1 | Finance | finance |

## Commands Used

### Create Groups

```bash
sudo groupadd developers
sudo groupadd operations
sudo groupadd finance
sudo groupadd sharedteam
### Create Users
sudo adduser developer1
sudo adduser opsadmin
sudo adduser finance1
### Add Users to Department Groups
sudo usermod -aG developers developer1
sudo usermod -aG operations opsadmin
sudo usermod -aG finance finance1
### Configure Shared Team
sudo usermod -aG sharedteam developer1
sudo usermod -aG sharedteam opsadmin
sudo usermod -aG sharedteam finance1
### verification
User group membership was verified using:
groups developer1
groups opsadmin
groups finance1
The users were successfully associated with their respective department and shared groups.

Purpose:
Separating users into groups allows Linux administrators to control access to department-specific resources while providing controlled access to shared resources.
