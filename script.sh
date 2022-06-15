#!/bin/bash
DOCKER_COMPOSE="version: '3'
services:
  websrv:
    image: php:5-apache
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ~/Photoblog:/var/www/html
  db:
    image: mysql:5
    ports:
      - "3306:3306"
    environment:
      - MYSQL_ROOT_PASSWORD=password
      - MYSQL_USER=pentesterlab
      - MYSQL_PASSWORD=pentesterlab
      - MYSQL_DATABASE=photoblog
    volumes:
      - ~/Photoblog/photoblog.sql:/docker-entrypoint-initdb.d/photoblog.sql"

apt update -y
apt install -y docker docker-compose git
git clone https://github.com/7ric/Photoblog.git
sed -i 's/localhost/db/g' ~/Photoblog/classes/db.php
echo $DOCKER_COMPOSE > docker-compose.yaml
docker-compose up -d
docker-compose exec websrv docker-php-ext-install mysql
docker-compose exec websrv /etc/init.d/apache2 reload
