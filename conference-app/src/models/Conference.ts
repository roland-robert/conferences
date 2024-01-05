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

    constructor({ id, serie, intitule, dateDebut, dateFin, editeur, organisateur, texteIntroductif, ville, image_url: image_url, sessions, workshopConferenceId: workshopConferenceId }: Conference) {
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
    }

    
    static fromJSON(json: any): Conference {
        return new Conference({
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
            isWorkshop: json.id_conference_du_workshop !== null
        });
    }
}

export enum ConferenceType {
    CONFERENCE = "CONFERENCE",
    WORKSHOP = "WORKSHOP"
}

