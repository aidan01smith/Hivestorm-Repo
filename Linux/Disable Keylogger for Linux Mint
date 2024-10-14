# keep in mind that this may not work depending on the keylogger that they use for the comp. If it doesn't, then we will have to kill it using the PID and kill command seen in the other linux file
# Most of this was written by Perplexity AI, so there might be some weird stuff that happens

#!/bin/bash

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "This script must be run as root"
  exit 1
fi

# Check if the system is Linux Mint
if ! grep -q "DISTRIB_ID=LinuxMint" /etc/lsb-release; then
  echo "This script is intended for Linux Mint only"
  exit 1
fi

echo "Disabling potential keyloggers on Linux Mint..."

# Remove common keylogging packages
apt-get remove -y logkeys keylogger

# Restrict access to input event files
chmod 0600 /dev/input/event*

# Block kernel module loading for common keyloggers
echo "blacklist usbhid" >> /etc/modprobe.d/blacklist.conf
echo "blacklist hid_generic" >> /etc/modprobe.d/blacklist.conf

# Disable Accessibility features that could be exploited
gsettings set org.gnome.desktop.a11y.applications screen-keyboard-enabled false
gsettings set org.gnome.desktop.a11y.applications screen-reader-enabled false

# Check for and remove any suspicious cron jobs
crontab -r
for user in $(cut -f1 -d: /etc/passwd); do
  crontab -r -u $user
done
