#!/usr/bin/env bash
set -o errexit

pip install -r requirements.txt
python manage.py collectstatic --no-input
python manage.py migrate
python manage.py createsuperuser --no-input --username Beto --email beto@correo.com || true
python manage.py shell -c "from django.contrib.auth import get_user_model as g; U=g(); u=U.objects.get(username='Beto'); u.set_password('1003270'); u.save()"