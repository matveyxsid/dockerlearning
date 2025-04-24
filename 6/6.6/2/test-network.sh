#!/bin/bash

echo "=== Создание внешней сети ==="
docker network create public_network

echo "=== Запуск сервисов ==="
docker-compose up -d

echo "=== Проверка сетевой доступности ==="
echo "1. web -> api:"
docker-compose exec web ping -c 2 api
echo "2. web -> db:"
docker-compose exec web ping -c 2 db
echo "3. web -> cache:"
docker-compose exec web ping -c 2 cache
echo "4. api -> web:"
docker-compose exec api ping -c 2 web
echo "5. api -> db:"
docker-compose exec api ping -c 2 db
echo "6. api -> cache:"
docker-compose exec api ping -c 2 cache

echo "=== Проверка нахождения в нужных сетях ==="
echo "Сети для web:"
docker container inspect -f '{{range $net, $conf := .NetworkSettings.Networks}}{{$net}} {{end}}' $(docker-compose ps -q web)
echo "Сети для api:"
docker container inspect -f '{{range $net, $conf := .NetworkSettings.Networks}}{{$net}} {{end}}' $(docker-compose ps -q api)
echo "Сети для db:"
docker container inspect -f '{{range $net, $conf := .NetworkSettings.Networks}}{{$net}} {{end}}' $(docker-compose ps -q db)
echo "Сети для cache:"
docker container inspect -f '{{range $net, $conf := .NetworkSettings.Networks}}{{$net}} {{end}}' $(docker-compose ps -q cache)

