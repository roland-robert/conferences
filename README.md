# Conferences

## Setup

Install docker

Run local PSQL with initialised data

    docker compose up

OR for detached docker container :

    docker compose up -d

Check if container is running :

    docker container ls

Check PSQL works :

    docker exec -e PGPASSWORD=conferences_admin -it postgres psql -U conferences_admin conferences

In PSQL console, run test query like `SELECT * FROM responsable;`

```
conferences=# SELECT * FROM responsable;
 id_responsable | prenom |   nom   |     adresse_pro      |    adresse_email    | id_type_responsabilite 
----------------+--------+---------+----------------------+---------------------+------------------------
              1 | Jean   | Dupont  | 789 Rue des Affaires | jean.d@example.com  |                      1
              2 | Marie  | Leblanc | 101 Rue des Sciences | marie.l@example.com |                      1
(2 rows)
conferences=#
```

Note: container is persistent, so you need to delete container before re-running it if you change initialisation SQL script.