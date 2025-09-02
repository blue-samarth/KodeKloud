# Server Name	IP	Hostname	User	Password	Purpose
# stapp01	172.16.238.10	stapp01.stratos.xfusioncorp.com	tony	Ir0nM@n	Nautilus App 1
# stapp02	172.16.238.11	stapp02.stratos.xfusioncorp.com	steve	Am3ric@	Nautilus App 2
# stapp03	172.16.238.12	stapp03.stratos.xfusioncorp.com	banner	BigGr33n	Nautilus App 3

ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa -N ""

ssh-copy-id tony@stapp01
ssh-copy-id steve@stapp02
ssh-copy-id banner@stapp03

ssh tony@stapp01 "whoami"
ssh steve@stapp02 "whoami"
ssh banner@stapp03 "whoami"