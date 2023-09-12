#!/bin/bash

cd fm

chmod +x ./entrypoint.sh

./entrypoint.sh

docker-compose up --build -d
echo "Waiting for Nextcloud to initialize..."
sleep 10
docker-compose exec -T nextcloud /var/www/api/scripts/initialize-nextcloud.sh
