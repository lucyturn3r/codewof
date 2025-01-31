#!/bin/bash

export DJANGO_SETTINGS_MODULE="config.settings.production"

source ./codewof/load-prod-envs.sh

echo "Compiling message files"
/docker_venv/bin/python3 ./manage.py compilemessages

# Start gunicorn service
echo "Starting gunicorn"
/docker_venv/bin/gunicorn -c gunicorn.conf.py -b :8080 config.wsgi
