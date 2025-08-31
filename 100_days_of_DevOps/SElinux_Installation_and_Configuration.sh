# Server Name	IP	Hostname	User	Password	Purpose
# stapp01	172.16.238.10	stapp01.stratos.xfusioncorp.com	tony	Ir0nM@n	Nautilus App 1

thor@jumphost ~$ ssh tony@172.16.238.10
# The authenticity of host '172.16.238.10 (172.16.238.10)' can't be established.
# ED25519 key fingerprint is SHA256:Q4oAR6zmxa5rdXlcO/u4Rst17tCS5XA+BYYyfLdrAVk.
# This key is not known by any other names
[tony@stapp01 ~]$ sudo yum install -y policycoreutils policycoreutils-python-utils selinux-policy selinux-policy-targeted libselinux-utils setroubleshoot-server setools setools-console mcstrans

[tony@stapp01 ~]$ sudo vi /etc/selinux/config

[tony@stapp01 ~]$ cat /etc/selinux/config | grep SELINUX=