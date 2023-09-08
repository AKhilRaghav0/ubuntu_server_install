# Setting Up an Always-On Home Server with Ubuntu Desktop

Have an old laptop lying around? Want to turn it into a reliable network-attached storage and media streaming server? You're in the right place! This guide will walk you through the process of repurposing an old laptop as a home server using Ubuntu Desktop.

## Why Use an Old Laptop?

- **Cost-Effective**: Laptops you already have can be repurposed at little to no extra cost, especially if you're not using them.

- **Built-In Features**: Old laptops often come with built-in hardware like a display, keyboard, multiple ports, and storage, which can be a hassle or additional expense with alternatives like a Raspberry Pi.

- **Battery Backup**: If the laptop's battery still holds a charge, you have a built-in uninterruptible power supply (UPS).

## Why Use Ubuntu Desktop Over Ubuntu Server?

While Ubuntu Server is an excellent choice for many server setups, Ubuntu Desktop has its own advantages:

- **User-Friendly**: Ubuntu Desktop offers a more user-friendly experience for configuring network connections, especially for those who are new to server administration.

- **Software Flexibility**: You can easily install a wide range of software packages from the Ubuntu repositories, making it flexible for hosting various services.

- **LivePatch and Network Manager**: Ubuntu Desktop can be coupled with a Ubuntu Pro License to unlock features like LivePatch and Network Manager, simplifying system maintenance and networking tasks.

## How to Set Up Your Home Server:

1. **Install Ubuntu Desktop**:
   - Follow the traditional way of [installing Ubuntu Desktop](https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview).

2. **Configuration**:
   - **Enable SSH**: Install the SSH package by running `sudo apt install openssh-client`, and enable it to start on boot with `sudo systemctl start ssh`.

   - **Open SSH Port**: Allow SSH traffic through the firewall using `sudo ufw allow ssh`.

3. **Terminal Multiplexer: tmux**:
   - Install `tmux` for efficient terminal session management with `sudo apt install tmux`.

4. **Converting Ubuntu-Desktop to Ubuntu-Server**:
   - Install essential server packages with `sudo apt install ubuntu-server`.

   - Set the default target to multi-user mode with `sudo systemctl set-default multi-user.target`.

   - Disable suspension on lid closure by editing `/etc/systemd/logind.conf`.

   - Install a web-based system administration tool like Webmin or Cockpit (choose one).

5. **Optional: Removing Unnecessary Packages**:
   - Streamline your desktop by purging unnecessary packages with `sudo apt purge ubuntu-desktop -y && sudo apt autoremove -y && sudo apt autoclean`.

6. **Final Reboot**:
   - Reboot your system with `sudo reboot` to apply the changes.

That's it! Your old laptop is now a fully functional home server. Enjoy the benefits of having your own "always-on, always-available" server for backups, media streaming, and more.
