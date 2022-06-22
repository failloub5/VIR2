#!/bin/sh
rm script.sh
apt update -qqq
apt install -qqq docker docker-compose git wget
git clone -q https://github.com/7ric/Photoblog.git /Photoblog
sed -i 's/localhost/db/g' /Photoblog/classes/db.php
wget -nc https://raw.githubusercontent.com/failloub5/VIR2/main/docker-compose.yaml
docker-compose up -d
docker-compose exec websrv docker-php-ext-install mysql
docker-compose exec websrv /etc/init.d/apache2 reload
exec docker run --tty --interactive kalilinux/kali-rolling /bin/bash -c 'apt update; apt install -y sqlmap lynx w3m links; exec bash'

