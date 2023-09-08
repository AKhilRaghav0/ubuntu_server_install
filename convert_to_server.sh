#!/bin/bash

# Check if the script is running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root"
  exit 1
fi

# Step 1: Install essential server packages
echo "Step 1: Installing Server Packages"
sudo apt update
sudo apt install ubuntu-server -y

# Step 2: Setting the Default Target
echo "Step 2: Setting the Default Target"
sudo systemctl set-default multi-user.target

# Step 3: Disable suspend-on-close
echo "Step 3: Disabling suspend-on-close"
sudo sed -i 's/#HandleLidSwitch=suspend/HandleLidSwitch=ignore/g' /etc/systemd/logind.conf
sudo systemctl restart systemd-logind.service

# Step 4: Install SSH
echo "Step 4: Installing SSH"
sudo apt install openssh-server -y

# Step 5: Configure SSH to auto-start on boot
echo "Step 5: Configuring SSH auto-start on boot"
sudo systemctl enable ssh
sudo systemctl start ssh

# Step 6: Install Web-based system administration tools (Webmin or Cockpit)
echo "Step 6: Installing Web-based system administration tool (Webmin or Cockpit)"
# Choose one of the following options based on your preference
# To install Webmin:
# sudo apt install webmin -y
# To install Cockpit:
# sudo apt install cockpit -y

# Step 7: Removing Unnecessary Packages (Optional)
echo "Step 7: Removing Unnecessary Packages (Optional)"
sudo apt purge ubuntu-desktop -y
sudo apt autoremove -y
sudo apt autoclean

# Step 8: Final Reboot
echo "Step 8: Final Reboot"
sudo reboot
