# Server Name	IP	Hostname	User	Password	Purpose
# stapp03	172.16.238.12	stapp03.stratos.xfusioncorp.com	banner	BigGr33n	Nautilus App 3

thor@jumphost ~$ ssh banner@172.16.238.12
# The authenticity of host '172.16.238.12 (172.16.238.12)' can't be established.
# ED25519 key fingerprint is SHA256:Gkj8ucYgwY3zIfs/+qibC01OPEVUonxMtUwAg3Fy5n8.
# This key is not known by any other names
# Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
# Warning: Permanently added '172.16.238.12' (ED25519) to the list of known hosts.
# banner@172.16.238.12's password: 
[banner@stapp03 ~]$ ls -al /tmp/xfusioncorp.sh 
---------- 1 root root 40 Aug 30 10:59 /tmp/xfusioncorp.sh
[banner@stapp03 ~]$ sudo chmod +x /tmp/xfusioncorp.sh

# We trust you have received the usual lecture from the local System
# Administrator. It usually boils down to these three things:

#     #1) Respect the privacy of others.
#     #2) Think before you type.
#     #3) With great power comes great responsibility.

# [sudo] password for banner: 
[banner@stapp03 ~]$ ls -al /tmp/xfusioncorp.sh 
---x--x--x 1 root root 40 Aug 30 10:59 /tmp/xfusioncorp.sh
[banner@stapp03 ~]$ 