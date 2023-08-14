#!/bin/bash

cd fm

chmod +x ./entrypoint.sh

./entrypoint.sh

docker-compose up --build -d
