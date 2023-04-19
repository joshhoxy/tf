#!/bin/bash
useradd -u 2001 sysadmin 
usermod -G wheel sysadmin
echo "ad12#$" | passwd --stdin sysadmin
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd