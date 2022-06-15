#!/bin/bash
apt update -y
apt install -y docker docker-compose git
git clone https://github.com/7ric/Photoblog.git
sed -i 's/localhost/db/g' ~/Photoblog/classes/db.php
docker-compose up -d
docker-compose exec websrv docker-php-ext-install mysql
docker-compose exec websrv /etc/init.d/apache2 reload
