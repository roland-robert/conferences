## get_filtered_conferences
- **order_by** — str 
- **order** — str - default: 'asc'
- **country_id** — int
- **themes** — list[int]
- **serie_id** — int
- **responsibles** — list[int]
- **editor_id** — int
- **start_date** — str
- **end_date** — str
--> retourne seulement les infos importantes des conférences (titre, texte, date, image)

## get_conference
- **conference_id** — int
--> retourne toutes les infos manquantes de la conférence

## get_submitted_conferences
- **user_id** — int


## get_user_recommended_conferences
- **user_id** — int

## get_conference_workshops
- **conference_id** — int

## get_conference_responsibles
- **conference_id** — int


## get_villes
- --> retourne toutes les villes (avec pays)

*

### GET /filtered_conferences
Query params:
- order_by: str - default: date de début
- order: str - default: 'asc'
- id_pays: int | None
- id_theme_list: list[int] | None
- id_serie: int | None
- id_editeur: list[int] | None
- start_date: str | None
- end_date: str | None

