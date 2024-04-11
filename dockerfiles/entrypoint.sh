#!/bin/bash

if [ "$APP_ENV" = "local" ]; then
    composer install --no-progress --no-interaction
else
    composer install --optimize-autoloader --no-dev --no-progress --no-interaction
fi
