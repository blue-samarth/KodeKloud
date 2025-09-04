# Create the mysql directory if it doesn't exist
sudo mkdir -p /var/lib/mysql

# Move all the database files from mysqld to mysql
sudo mv /var/lib/mysqld/* /var/lib/mysql/

# Ensure proper ownership
sudo chown -R mysql:mysql /var/lib/mysql/

# Set proper permissions
sudo chmod -R 755 /var/lib/mysql/
sudo chmod 640 /var/lib/mysql/ib*
sudo chmod 640 /var/lib/mysql/aria_log*

# Now try starting MariaDB
sudo systemctl start mariadb