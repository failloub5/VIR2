#!/bin/sh
apt update -y
apt install -y docker docker-compose git wget
git clone https://github.com/7ric/Photoblog.git
sed -i 's/localhost/db/g' ~/Photoblog/classes/db.php
wget -nc https://raw.githubusercontent.com/failloub5/VIR2/main/docker-compose.yaml
docker-compose up -d
docker-compose exec websrv docker-php-ext-install mysql
docker-compose exec websrv /etc/init.d/apache2 reload
