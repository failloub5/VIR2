#!/bin/bash
#############################################################################
#   Jérémy Failloubaz - script.sh - version 1 - 22.06.22
#   Script de déploiement d'un pentest lab pour le module ICT-182
#############################################################################
#suppression du scripte dans le répertoire de l'hôte
rm script.sh
echo "Installation..."
#installation des paquets
apt update &>/dev/null
apt install -y docker docker-compose git wget lolcat &>/dev/null 
echo "Preparation du Pentestlab..." | /usr/games/lolcat
#récupération du site depuis github et configuration
git clone -q https://github.com/7ric/Photoblog.git /Photoblog
sed -i 's/localhost/db/g' /Photoblog/classes/db.php
#Récupération et éxecution du fichier docker-compose
wget -qnc https://raw.githubusercontent.com/failloub5/VIR2/main/docker-compose.yaml
docker-compose pull -q
docker-compose up -d websrv db
docker-compose exec -T websrv docker-php-ext-install mysql &>/dev/null
docker-compose exec -T websrv /etc/init.d/apache2 reload &>/dev/null
echo "site web accessible sur http://websrv" | /usr/games/lolcat
#démarrage du conteneur KALI
exec docker-compose run kali

