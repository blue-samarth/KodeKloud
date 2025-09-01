# Server Name	IP	Hostname	User	Password	Purpose
# stapp01	172.16.238.10	stapp01.stratos.xfusioncorp.com	tony	Ir0nM@n	Nautilus App 1
# stapp02	172.16.238.11	stapp02.stratos.xfusioncorp.com	steve	Am3ric@	Nautilus App 2
# stapp03	172.16.238.12	stapp03.stratos.xfusioncorp.com	banner	BigGr33n	Nautilus App 3

# For each server ssh into it and run these commands
sudo yum install -y cronie
sudo systemctl start crond
sudo systemctl enable crond
echo "*/5 * * * * echo hello > /tmp/cron_text" | sudo crontab -
sudo crontab -l
