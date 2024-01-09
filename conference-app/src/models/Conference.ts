import React from 'react'

import { Organisateur } from "./Person";
import { Ville } from './Localisation';
import { Session } from './Session';


export class Serie {
    id?: number;
    nom?: string;

    constructor({ id, nom }: Serie) {
        this.id = id;
        this.nom = nom;
    }

    static fromJSON(json: any): Serie {
        return new Serie({
            id: json.id_serie,
            nom: json.nom
        });
    }
}

export class EditeurConference {
    id?: number;
    nom?: string;

    constructor({ id, nom }: EditeurConference) {
        this.id = id;
        this.nom = nom;
    }

    static fromJSON(json: any): EditeurConference {
        return new EditeurConference({
            id: json.id_editeur_conference,
            nom: json.nom
        });
    }
}


export class CategorieSoumission{
    conferenceId?: number;
    nom?  : string;
    nombreMaxiPages?: number;
    font?: string;
    fontSize?: number;
    typeLogiciel?: string;
    dateSoumission?: Date;
    dateNotificationAcceptation?: Date;
    dateLimiteEnvoiVersionCorrigee?: Date;

    constructor({ conferenceId, nom, nombreMaxiPages, font, fontSize, typeLogiciel, dateSoumission, dateNotificationAcceptation: dateAcceptation, dateLimiteEnvoiVersionCorrigee: dateLimiteEnvoiSersionCorrigee }: CategorieSoumission) {
        this.conferenceId = conferenceId;
        this.nom = nom;
        this.nombreMaxiPages = nombreMaxiPages;
        this.font = font;
        this.fontSize = fontSize;
        this.typeLogiciel = typeLogiciel;
        this.dateSoumission = dateSoumission;
        this.dateNotificationAcceptation = dateAcceptation;
        this.dateLimiteEnvoiVersionCorrigee = dateLimiteEnvoiSersionCorrigee;
    }

    static fromJSON(json: any): CategorieSoumission {
        return new CategorieSoumission({
            conferenceId: json.id_conference,
            nom: json.nom_categorie,
            nombreMaxiPages: json.nombre_maxi_pages,
            font: json.font,
            fontSize: json.font_size,
            typeLogiciel: json.type_logiciel,
            dateSoumission: new Date(json.date_soumission),
            dateNotificationAcceptation: new Date(json.date_notification_acceptation),
            dateLimiteEnvoiVersionCorrigee: new Date(json.date_limite_envoi_version_corrigee)
        });
    }
}


export class Conference {
    id?: number;
    serie?: Serie;
    intitule?: string;
    dateDebut?: Date;
    dateFin?: Date;
    editeur?: EditeurConference;
    organisateur?: Organisateur;
    texteIntroductif?: string;
    ville?: Ville;
    image_url?: string;
    sessions?: Session[];
    workshopConferenceId?: number;
    isWorkshop?: boolean;
    categoriesSoumission?: CategorieSoumission[];
    userId?: number;

    constructor({ id, serie, intitule, dateDebut, dateFin, editeur, organisateur, texteIntroductif, ville, image_url, sessions, workshopConferenceId, categoriesSoumission: categoriesSoumission, userId }: Conference) {
        this.id = id;
        this.serie = serie;
        this.intitule = intitule;
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
        this.editeur = editeur;
        this.organisateur = organisateur;
        this.texteIntroductif = texteIntroductif;
        this.ville = ville;
        this.image_url = image_url;
        this.sessions = sessions;
        this.workshopConferenceId = workshopConferenceId;
        this.isWorkshop = this.workshopConferenceId !== null;
        this.categoriesSoumission = categoriesSoumission;
        this.userId = userId;
    }

    
    static fromJSON(json: any): Conference {
        return new Conference({
            userId: json.id_utilisateur,
            id: json.id_conference,
            serie: Serie.fromJSON(json.serie),
            intitule: json.intitule,
            dateDebut: new Date(json.date_debut),
            dateFin: new Date(json.date_fin),
            editeur: EditeurConference.fromJSON(json.editeur_conference),
            organisateur: Organisateur.fromJSON(json.organisateur),
            texteIntroductif: json.texte_introductif,
            ville: Ville.fromJSON(json.ville),
            image_url: json.image_url,
            sessions: json.sessions.map((session: any) => Session.fromJSON(session)),
            workshopConferenceId: json.id_conference_du_workshop,
            isWorkshop: json.id_conference_du_workshop !== null,
            categoriesSoumission: json.categories_soumission?.map((categorie: any) => CategorieSoumission.fromJSON(categorie))

        });
    }
}

export enum ConferenceType {
    CONFERENCE = "CONFERENCE",
    WORKSHOP = "WORKSHOP"
}

