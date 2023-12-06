
# pour être plus secure, changer le hardcodage ici en variables d'environnement
POSTGRES_DB = 'conferences'
POSTGRES_USER = 'conferences_admin'
POSTGRES_PASSWORD = 'conferences_admin'
POSTGRES_PORT = 5432

POSTGRES_URI = f'postgresql://{POSTGRES_USER}:{POSTGRES_PASSWORD}@localhost:{POSTGRES_PORT}/{POSTGRES_DB}'
