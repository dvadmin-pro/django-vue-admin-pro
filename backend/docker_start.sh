# python manage.py makemigrations
# python manage.py migrate
# python manage.py init -y
daphne -b 0.0.0.0 -8000 application.asgi:application