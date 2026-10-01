# Linux Server Troubleshooting

## Project Objective

This section documents common Linux server troubleshooting scenarios tested during the project.

The troubleshooting exercises covered:

- Process management
- Nginx service failures
- Nginx configuration validation
- Service logs
- Service recovery

---

## 1. Process Troubleshooting

A running process was simulated using:

```bash
sleep 300
The process ID (PID) was identified.

The process was then terminated using:
kill <PID>
The process was verified to ensure that it was no longer running.

Key Learning
A PID uniquely identifies a running process.
The normal approach is to use:
kill <PID>
This sends a graceful termination signal.

If a process does not respond, an administrator can use:
kill -9 <PID>
This forcefully terminates the process and should generally be used only when necessary.

2. Nginx Service Troubleshooting
The Nginx service was checked using:
systemctl status nginx

The service state was also checked using:
systemctl is-active nginx
The service was confirmed to be running.

3. Simulating an Nginx Failure
Nginx was intentionally stopped to simulate a service outage:
sudo systemctl stop nginx

The service status was then checked:
systemctl is-active nginx
The result showed that Nginx was inactive.

The service was restored using:
sudo systemctl start nginx

The service was verified again:
systemctl is-active nginx
Nginx returned to an active state.

Troubleshooting Flow
Website unavailable
       ↓
Check Nginx status
       ↓
Nginx inactive
       ↓
Start Nginx
       ↓
Verify service
       ↓
Website restored

4. Checking Nginx Logs
Recent Nginx service logs were checked using:
sudo journalctl -u nginx --no-pager | tail -10

Another useful command is:
sudo journalctl -u nginx -n 20 --no-pager
These commands help identify recent service events and errors.

5. Nginx Configuration Validation
Before changing or reloading an Nginx configuration, the configuration was tested using:
sudo nginx -t
A valid configuration returned a successful syntax test.

Why nginx -t is important
It helps detect configuration errors before applying a reload or restart.
This reduces the risk of causing a service outage because of an invalid configuration.

6. Simulating a Configuration Error
A backup of the Nginx configuration was created before testing:
sudo cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup
An invalid directive was temporarily added to the configuration.

The configuration was tested using:
sudo nginx -t
The test failed and reported an unknown/invalid directive.
This demonstrated how an administrator can detect configuration problems before restarting the service.

7. Recovering the Configuration
The original configuration was restored from the backup:
sudo cp /etc/nginx/nginx.conf.backup /etc/nginx/nginx.conf

The configuration was tested again:
sudo nginx -t

After confirming that the configuration was valid, Nginx could safely be reloaded:
sudo systemctl reload nginx

Key Troubleshooting Lessons:
The main troubleshooting workflow learned from this project was:
1. Identify the problem
        ↓
2. Check service/process status
        ↓
3. Check logs
        ↓
4. Validate configuration
        ↓
5. Fix the problem
        ↓
6. Restart/reload if required
        ↓
7. Verify the result

Important commands learned:
ps aux
kill <PID>
systemctl status nginx
systemctl is-active nginx
journalctl -u nginx
nginx -t
systemctl start nginx
systemctl reload nginx

Conclusion
These troubleshooting exercises demonstrate basic Linux server administration skills, including process management, service management, log analysis, configuration validation, failure simulation, and service recovery.
