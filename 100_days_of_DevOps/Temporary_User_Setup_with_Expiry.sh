# Server Name    IP    Hostname    User    Password    Purpose
# stapp03    172.16.238.12    stapp03.stratos.xfusioncorp.com    banner    BigGr33n    Nautilus App 3

thor@jumphost ~$ ssh banner@172.16.238.12
# The authenticity of host '172.16.238.12 (172.16.238.12)' can't be established.
# ED25519 key fingerprint is SHA256:AC2SbdZGa1AoXN41WXYzZFM2nbL4R14OIWxyJNXei/4.
# This key is not known by any other names
# Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
# Warning: Permanently added '172.16.238.12' (ED25519) to the list of known hosts.
# banner@172.16.238.12's password: 
[banner@stapp03 ~]$ sudo useradd -m rose

# We trust you have received the usual lecture from the local System
# Administrator. It usually boils down to these three things:

#     #1) Respect the privacy of others.
#     #2) Think before you type.
#     #3) With great power comes great responsibility.

# [sudo] password for banner: 
[banner@stapp03 ~]$ sudo chage -E 2024-03-28 rose
[banner@stapp03 ~]$ sudo chage -l rose
# Last password change                                    : Aug 28, 2025
# Password expires                                        : never
# Password inactive                                       : never
# Account expires                                         : Mar 28, 2024
# Minimum number of days between password change          : 0
# Maximum number of days between password change          : 99999
# Number of days of warning before password expires       : 7
[banner@stapp03 ~]$ 