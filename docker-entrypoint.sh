#!/bin/bash


echo "Enter MySQL root password:"
read -s mysqlPassword

/etc/init.d/mysql start 

mysql -u root << EOF
use mysql;
update user set password=PASSWORD("${mysqlPassword}") where User='root';
flush privileges;
GRANT ALL PRIVILEGES ON *.*  TO 'root'@'%' IDENTIFIED BY '${mysqlPassword}' WITH GRANT OPTION ;
FLUSH PRIVILEGES;
EOF

tail -F -n0 /etc/hosts
 exec "$@"

