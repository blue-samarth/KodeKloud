# Server Name	IP	Hostname	User	Password	Purpose
# stapp01	172.16.238.10	stapp01.stratos.xfusioncorp.com	tony	Ir0nM@n	Nautilus App 1
# stapp02	172.16.238.11	stapp02.stratos.xfusioncorp.com	steve	Am3ric@	Nautilus App 2
# stapp03	172.16.238.12	stapp03.stratos.xfusioncorp.com	banner	BigGr33n	Nautilus App 3


thor@jumphost ~$ ssh tony@172.16.238.10
The authenticity of host '172.16.238.10 (172.16.238.10)' can't be established.
ED25519 key fingerprint is SHA256:JavhDqNGV93wzAaTTV9WZl+23HbCXn84zVmKDwpejp4.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '172.16.238.10' (ED25519) to the list of known hosts.
tony@172.16.238.10's password: 

[tony@stapp01 ~]$ sudo vi /etc/ssh/sshd_config
[tony@stapp01 ~]$ sudo sshd -t
[tony@stapp01 ~]$ sudo systemctl restart sshd
[tony@stapp01 ~]$ sudo sshd -T | grep permitrootlogin
permitrootlogin no
[tony@stapp01 ~]$ exit
logout
Connection to 172.16.238.10 closed.
thor@jumphost ~$ 
thor@jumphost ~$ ssh steve@172.16.238.11
# The authenticity of host '172.16.238.11 (172.16.238.11)' can't be established.
# ED25519 key fingerprint is SHA256:LJjCcc4npwEgfbDsLrjXyJG04uOiMlyw9skCrGOB1HU.
# This key is not known by any other names
# Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
# Warning: Permanently added '172.16.238.11' (ED25519) to the list of known hosts.
# steve@172.16.238.11's password: 
[steve@stapp02 ~]$ sudo vi /etc/ssh/sshd_config

# We trust you have received the usual lecture from the local System
# Administrator. It usually boils down to these three things:

#     #1) Respect the privacy of others.
#     #2) Think before you type.
#     #3) With great power comes great responsibility.

# [sudo] password for steve: 
[steve@stapp02 ~]$ sudo sshd -t
[steve@stapp02 ~]$ sudo systemctl restart sshd
[steve@stapp02 ~]$ exit
logout
Connection to 172.16.238.11 closed.
thor@jumphost ~$ ssh banner@172.16.238.12
# The authenticity of host '172.16.238.12 (172.16.238.12)' can't be established.
# ED25519 key fingerprint is SHA256:1mXgf5W1PFWjh3ftddJYLgI3XFv+djfOx6g1/+nUNuQ.
# This key is not known by any other names
# Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
# Warning: Permanently added '172.16.238.12' (ED25519) to the list of known hosts.
# banner@172.16.238.12's password: 
[banner@stapp03 ~]$ sudo vi /etc/ssh/sshd_config

# We trust you have received the usual lecture from the local System
# Administrator. It usually boils down to these three things:

#     #1) Respect the privacy of others.
#     #2) Think before you type.
#     #3) With great power comes great responsibility.

# [sudo] password for banner: 
[banner@stapp03 ~]$ sudo sshd -t
[banner@stapp03 ~]$ sudo systemctl restart sshd
[banner@stapp03 ~]$ exit
logout
Connection to 172.16.238.12 closed.