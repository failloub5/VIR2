#!/bin/bash
rm script.sh
echo "Installation..."
apt update &>/dev/null
apt install -y docker docker-compose git wget lolcat &>/dev/null
echo "Preparation du Pentestlab..." | /usr/games/lolcat
git clone -q https://github.com/7ric/Photoblog.git /Photoblog
sed -i 's/localhost/db/g' /Photoblog/classes/db.php
wget -qnc https://raw.githubusercontent.com/failloub5/VIR2/main/docker-compose.yaml
docker-compose pull
docker-compose up -d websrv db
docker-compose exec -T websrv docker-php-ext-install mysql &>/dev/null
docker-compose exec -T websrv /etc/init.d/apache2 reload &>/dev/null
echo "site web accessible sur http://websrv" | /usr/games/lolcat
exec docker-compose run -q kali

