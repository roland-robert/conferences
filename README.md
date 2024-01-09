https://github.com/roland-robert/conferences

# Setup using ONLY docker (very easy)

Install docker

    docker compose -f docker-compose-full.yml up

You now have psql server AND fastapi sqlalchemy server running

check, go to http://127.0.0.1:8000

check other stuff :

http://127.0.0.1:8000/conferences

http://127.0.0.1:8000/docs

# Setup manually

## Setup Python and requirements

Install python > 3.10

    pip install -r requirements.txt

If dependency conflicts, please create a virtual environment.

## Run postgreSQL in docker (or run your own postgres server)

Install docker

    docker compose up

Or setup your own postgresql server (make sure you use same credentials as specified in docker compose):

      POSTGRES_DB: conferences
      POSTGRES_USER: conferences_admin
      POSTGRES_PASSWORD: conferences_admin

## initialise psql db (using SQLalchemy)

    python executor.py create_and_populate_all

## Run Fast API server

    uvicorn main:app --port 8000 --reload

# Test if it works

### Check if container is running

(skip if you setup psql yourself)

    docker container ls

### Check PSQL is running in docker

(skip if you setup psql yourself)

    docker exec -e PGPASSWORD=conferences_admin -it postgres psql -U conferences_admin conferences

In PSQL console, run test query like `SELECT * FROM responsable;`

You can also check you can access the PSQL server and browse data with which ever application you prefer (PGadmin, VScode extension, Pycharm...) (URI : `postgresql://conferences_admin:conferences_admin@localhost:5432/conferences
`)

### Check api is working

You can test in your browser, or with any other API testing app (curl, postman...)

Basic test :

    http://127.0.0.1:8000/test

you should get basic json response {"test": test}

query conferences test :

    http://127.0.0.1:8000/conferences

you should get json list response with all conferences

You can also check the API docs :D

    http://127.0.0.1:8000/docs
