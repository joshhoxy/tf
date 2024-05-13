#!/bin/bash
useradd -u 2001 sysadmin 
usermod -G wheel sysadmin
echo "ad12#$" | passwd --stdin sysadmin
echo "root12#$" | passwd --stdin root
sed -i 's/#PermitRootLogin/PermitRootLogin/g' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sed -i 's/#Port 22/Port 30022/g' /etc/ssh/sshd_config
systemctl restart sshd