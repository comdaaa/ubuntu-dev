#!/bin/bash
mkdir /var/run/sshd
useradd -ms /bin/bash "$user"
echo "$user:$password" | sudo chpasswd && echo "Password setting success"
if [ "$user"=="root" ]; then
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
else
    echo "$user    ALL=(ALL)    ALL" >> /etc/sudoers && echo "Sudoer add success"
fi
#echo "PermitRootLogin yes" >> /etc/ssh/sshd_config           
#if the user is root then it will change root password && enable root remote ssh
#else enable this user to use "sudo" command
/usr/sbin/sshd -D
#run openssh-server
