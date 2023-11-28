# Conferences

## Setup Python

Install python > 3.10

    pip install -r requirements.txt

If dependency conflicts, please create a virtual environment.

## Run postgreSQL in docker

Install docker

    docker compose up

## initialise psql db (using SQLalchemy)

    python executor.py create_and_populate_all

## Run Fast API server

    uvicorn main:app --port 8000 --reload

## Test if it works

### Check if container is running

    docker container ls

### Check PSQL is running in docker

    docker exec -e PGPASSWORD=conferences_admin -it postgres psql -U conferences_admin conferences

In PSQL console, run test query like `SELECT * FROM responsable;`

You can also check you can access the PSQL server and browse data with which ever application you prefer (PGadmin, VScode extension, Pycharm...) (URI : `postgresql://conferences_admin:conferences_admin@localhost:5432/conferences
`)

### Check api is working

You can test in your browser, or with any other API testing app (curl, postman...)

Basic test :

    http://127.0.0.1:8000/test

you should get basic json response {"test": test}

query organizers test :

    http://127.0.0.1:8000/organizers

you should get json list response with all organizers

    [{"id_organisateur":1,"nom":"Organizer1","adresse":"Address1","email":"organizer1@example.com"},...

You can also check the API docs :D

    http://127.0.0.1:8000/docs
