## Champs à rajouter en BDD:
Table conference:
- `image`: image de la conférence, juste l'url d'une image google je pense pcq un peu la flemme de convertir en base 64 et tout
- `id_utilisateur`: id de l'utilisateur qui a soumis la conférence

Table utilisateur
- un champ dans la Table utilisateur pour définir si c'est un admin ou non (je sais plus si c'est déjà fait)

## API
### GET /filtered_conferences
Body:
- order_by: str - default: date de début
- order: str - default: 'asc'
- id_pays: int | None
- id_theme_list: list[int] | None
- id_serie: int | None
- id_editeur: int | None
- responsable: str | None
- min_date: str | None
- max_date: str | None
- is_workshop: bool | None

Retourne la liste des conférences filtrées, ordonnée avec tous ces filtres. (Pour la page principale)

Eventuellement limiter à 20 et ajouter un paramètre page pour la pagination? (Ou OSEF?)

- Pour les champs avec une liste de (thèmes et responsables), filtrer toutes les conférences qui ont AU MOINS un thème ou un responsable dans la liste, et pas exclusivement ceux de la liste.

- Pour le responsable, l'utilisateur peut entrer un nom ou un prénom, et on doit filtrer les conférences qui ont un responsable dont le nom ou le prénom contient la chaîne de caractères entrée par l'utilisateur. (Il y a une fonction SQL pour ça, si jamais c'est sensible à la casse et aux accents, preprocess la chaîne de caractères pour les retirer)

- Pour min_date et max_date, filtrer les conférences qui ont une date de début comprise entre les deux dates (incluses)

- Pour is_workshop: si true, uniquement les workshop, si false: uniquement les conférences, si null, les deux.

Format d'une conférence (avec uniquement les champs nécessaires pour cette requête, ie les infos dont on a besoin sur la page d'acceuil)

```js
 class Conference {
    id?: number;
    serie?: {id?: number, nom?: string};
    intitule?: string;
    dateDebut?: Date;
    dateFin?: Date;
    texteIntroductif?: string;
    ville?: Ville;
    image?: string;
    workshopConferenceId?: int;
}
```
Pour la ville et la série, juste l'id? ou l'objet complet? (Plus simple pour moi mais peut-être plus lourd donc à voir)\
Format des classes villes/ pays et série au cas où:
```js

class Ville {
    id?: number;
    nom?: string;
    pays?: {id?: number, nom?: string};
}

```
***
### GET /conference/{id}
Retourne la conférence avec l'id passé en paramètre, avec tous ses champs (Besoin pour la page de détails d'une conférence)

Params:
- id: int (id de la conférence)

```js
class Conference {
    id?: number;
    userId?: number; //id de l'utilisateur qui a créé la conférence, à ajouter en BDD
    serie?: Serie;
    intitule?: string;
    dateDebut?: Date;
    dateFin?: Date;
    editeur?: {id?: number, nom?: string};
    organisateur?: Organisateur;
    texteIntroductif?: string;
    ville?: Ville;
    image?: string;
    sessions?: Session[];
    workshopConferenceId?: int;
}
```
Format des classes en plus:
```js

class Organisateur {
    id?: number;
    nom?: string;
    adresse?: string;
    email?: string;
}

class Session {
    id?: number;
    idConference?: number;
    intitule?: string;
    responsables?: Responsable[];
    themes?: {id?: number, nom?: string}[];
 }

 class Responsable {
    id? : number;
    nom?: string;
    prenom?: string;
    emailPro?: string;
    email?: string;
    typeResponsabilite?: {id?: number, nom?: string};
}

```

***

GET /submitted_conferences 

***

### POST /update_conference
Body:
- conference: Conference
- token: str (token de l'utilisateur)

CREE OU MODIFIE une conférence en base de donnée, associée à l'utilisateur qui la crée.
--> Penser à créer ou modifier tous les trucs associés (sessions etc)

Si la conférence à un id, checker si l'id existe en BDD. si oui, modifie la conférence, si non supprimer l'id et créer la conférence (mais normalement ça ne devrait pas arriver)\
Si pas d'id, créer la conférence

```js
class Conference {
    id?: number;
    userId?: number;
    serie?: Serie;
    intitule?: string;
    dateDebut?: Date;
    dateFin?: Date;
    editeur?: {id?: number, nom?: string};
    organisateur?: Organisateur;
    texteIntroductif?: string;
    ville?: Ville;
    image?: string;
    sessions?: Session[];
    workshopConferenceId?: int;
}

class Organisateur {
    id?: number;
    nom?: string;
    adresse?: string;
    email?: string;
}

class Session {
    id?: number;
    idConference?: number;
    intitule?: string;
    responsables?: Responsable[];
    themes?: {id?: number, nom?: string}[];
 }

 class Responsable {
    id? : number;
    nom?: string;
    prenom?: string;
    emailPro?: string;
    email?: string;
    typeResponsabilite?: {id?: number, nom?: string};
}
```


***

### GET /filters_options
Retourne un objet avec toutes les options de filtres possibles pour la page d'acceuil, ie toutes les villes (avec pays), series, themes et editeurs en BDD

```js
{
    themes: {id: number, nom: string}[];
    villes: Ville[];
    series: {id: number, nom: string}[];
    editeurs: {id: number, nom: string}[];
}

class Ville {
    id?: number;
    nom?: string;
    pays?: {id?: number, nom?: string};
}
```

***

### GET /user
Body:
- mail: string
- password: string

Retourne l'utilisateur ou null si aucun utilisateur n'a été trouvé + un TOKEN de connexion

```js
{
    user: User,
    token: str
}

class User {
    id?: number;
    prenom?: string;
    nom?: string;
    mail?: string;
    profil?: {id?: number, nom?: string}[];
    isAdmin?: boolean;
}
```

***

### POST /update_user
Body:
- token: str (token de l'utilisateur)
- user: User (que les champs non commentés ci dessous)

```js
 class User {
    //id?: number;
    prenom?: string;
    nom?: string;
    //mail?: string;
    profil?: {id?: number, nom?: string}[];
    //isAdmin?: boolean;
}
```

(+ faut passer le token je suppose? en parametre?)

Update un utilisateur (que prenom, nom et profil (ie liste de thèmes auquel l'utilisateur est intéressé.))
Si un champ est null, alors pas de modification de ce champ.

*** 

### POST /create_user
Body:
- user: User (avec que les champs non commentés)
```js
 class User {
    //id?: number;
    prenom?: string;
    nom?: string;
    mail?: string;
    profil?: {id?: number, nom?: string}[];
    //isAdmin?: boolean;
}
```





