# Server Name	IP	Hostname	User	Password	Purpose
# stapp03	172.16.238.12	stapp03.stratos.xfusioncorp.com	banner	BigGr33n	Nautilus App 3
# stbkp01	172.16.238.16	stbkp01.stratos.xfusioncorp.com	clint	H@wk3y3	Nautilus Backup Server

ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
ssh-copy-id clint@172.16.238.16


sudo yum install zip
sudo vim /scripts/blog_backup.sh

```
#!/bin/bash
zip -r "/backup/xfusioncorp_blog.zip" "/var/www/html/blog"
scp "/backup/xfusioncorp_blog.zip" "clint@172.16.238.16:/backup/"
```


sudo chmod 766 /scripts/blog_backup.sh
/scripts/blog_backup.sh