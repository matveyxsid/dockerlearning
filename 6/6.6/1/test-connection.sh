#!/bin/bash

echo "Проверка сетевых подключений..."
echo "1. Проверка подключения web → api..."
docker-compose exec web ping -c 2 api
echo "2. Проверка подключения web → db..."
docker-compose exec web ping -c 2 db
echo "3. Проверка подключения api → web..."
docker-compose exec api ping -c 2 web
echo "4. Проверка подключения api → db..."
docker-compose exec api ping -c 2 db
echo "Проверка завершена."
