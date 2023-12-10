import os

# POSTGRES
# Pour aller plus loin, utiliser des variables d'environnement
POSTGRES_DB = 'conferences'
POSTGRES_USER = 'conferences_admin'
POSTGRES_PASSWORD = 'conferences_admin'
POSTGRES_PORT = 5432

if os.environ.get('IS_DOCKER') == 'yes':
    POSTGRES_URI = f'postgresql://{POSTGRES_USER}:{POSTGRES_PASSWORD}@postgres:{POSTGRES_PORT}/{POSTGRES_DB}'
else:
    POSTGRES_URI = f'postgresql://{POSTGRES_USER}:{POSTGRES_PASSWORD}@localhost:{POSTGRES_PORT}/{POSTGRES_DB}'

print('POSTGRES URI HERE IS : ', POSTGRES_URI)
