#!/bin/bash

# Ensure the script is run as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Update and upgrade the system packages
echo "Updating system packages..."
apt-get update && apt-get upgrade -y
apt-get autoremove -y

# Install essential security packages if not already installed
echo "Installing essential security packages..."
apt-get install -y ufw fail2ban

# Configure Firewall with UFW (Uncomplicated Firewall)
echo "Setting up the firewall..."
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw enable

# Setup Fail2Ban to ban suspicious IPs
echo "Configuring Fail2Ban..."
systemctl enable fail2ban
systemctl start fail2ban

# Harden SSH Configuration
echo "Hardening SSH configurations..."
sed -i 's/#Port 22/Port 22/g' /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
sed -i 's/#MaxAuthTries 6/MaxAuthTries 3/g' /etc/ssh/sshd_config
systemctl restart sshd

# Disable unused filesystems
echo "Disabling unused filesystems..."
cat >> /etc/modprobe.d/hardening.conf <<EOF
install cramfs /bin/true
install freevxfs /bin/true
install jffs2 /bin/true
install hfs /bin/true
install hfsplus /bin/true
install squashfs /bin/true
install udf /bin/true
install vfat /bin/true
EOF

# Audit system security
echo "Installing and configuring audit tools..."
apt-get install -y auditd
systemctl enable auditd
systemctl start auditd

echo "OS hardening script execution completed!"
