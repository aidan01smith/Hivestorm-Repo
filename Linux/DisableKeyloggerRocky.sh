# Credit to Perplexity for writing this becasue I couldn't find anything else that would explicitly state disabling keyloggers besides juts killing it with PID

#!/bin/bash

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "This script must be run as root"
  exit 1
fi

# Check if the system is Rocky Linux
if [ ! -f /etc/rocky-release ]; then
  echo "This script is intended for Rocky Linux only"
  exit 1
fi

echo "Disabling potential keyloggers on Rocky Linux..."

# Remove common keylogging packages
dnf remove -y logkeys

# Restrict access to input event files
chmod 0600 /dev/input/event*

# Block kernel module loading for common keyloggers
echo "blacklist usbhid" >> /etc/modprobe.d/blacklist.conf
echo "blacklist hid_generic" >> /etc/modprobe.d/blacklist.conf

# Disable SSH root login
sed -i 's/^PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
systemctl restart sshd

# Remove all cron jobs
for user in $(cut -f1 -d: /etc/passwd); do
  crontab -r -u $user
done

# Disable and stop the SSH service if not needed
systemctl disable sshd
systemctl stop sshd
