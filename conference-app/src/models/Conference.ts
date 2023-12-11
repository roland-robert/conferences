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

}

export class EditeurConference {
    id?: number;
    nom?: string;

    constructor({ id, nom }: EditeurConference) {
        this.id = id;
        this.nom = nom;
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
    image?: string;
    sessions?: Session[];
    isWorkshop?: boolean;
    
    constructor({ id, serie, intitule, dateDebut, dateFin, editeur, organisateur, texteIntroductif, ville, image, sessions, isWorkshop: isworkshop }: Conference) {
        this.id = id;
        this.serie = serie;
        this.intitule = intitule;
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
        this.editeur = editeur;
        this.organisateur = organisateur;
        this.texteIntroductif = texteIntroductif;
        this.ville = ville;
        this.image = image;
        this.sessions = sessions;
        this.isWorkshop = isworkshop;
    }
}

// export class Workshop extends Conference {
//     constructor({ id, serie, intitule, dateDebut, dateFin, editeur, organisateur, texteIntroductif, ville, image }: Conference) {
//         super({ id, serie, intitule, dateDebut, dateFin, editeur, organisateur, texteIntroductif, ville, image });
//     }
// }



