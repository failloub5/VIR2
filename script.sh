#!/bin/sh
#rm script.sh
apt update &>/dev/null
apt install -y docker docker-compose git wget lolcat &>/dev/null
echo "Pret a devenir un hackeres ????" | /usr/games/lolcat
git clone -q https://github.com/7ric/Photoblog.git /Photoblog
sed -i 's/localhost/db/g' /Photoblog/classes/db.php
wget -nc https://raw.githubusercontent.com/failloub5/VIR2/main/docker-compose.yaml
docker-compose up -d --quiet-pull
echo "le super" | /usr/games/lolcat
docker-compose exec -T websrv docker-php-ext-install mysql &>/dev/null
docker-compose exec -T websrv /etc/init.d/apache2 reload &>/dev/null
exec docker run --tty --interactive kalilinux/kali-rolling /bin/bash -c 'apt update &>/dev/null; apt install -y sqlmap lynx w3m links &>/dev/null; exec bash'

