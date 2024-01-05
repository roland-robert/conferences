import React from 'react'
import { Responsable } from './Person';

export const colorPalette = [
    '#f94144',
    '#f3722c',
    '#f8961e',
    '#f9844a',
    '#f9c74f',
    '#90be6d',
    '#43aa8b',
    '#4d908e',
    '#577590',
    '#277da1',
    '#264653',

]

export class Session {
    id?: number;
    conferenceId?: number;
    intitule?: string;
    responsables?: Responsable[];
    themes?: Theme[];

    constructor({ id, conferenceId: conferenceId, intitule, responsables, themes }: Session) {
        this.id = id;
        this.conferenceId = conferenceId;
        this.intitule = intitule;
        this.responsables = responsables;
        this.themes = themes;
    }

    static fromJSON(json: any): Session {
        return new Session({
            id: json.id_session,
            conferenceId: json.id_conference,
            intitule: json.intitule,
            responsables: json.responsables.map((responsable: any) => Responsable.fromJSON(responsable)),
            themes: json.themes.map((theme: any) => Theme.fromJSON(theme))
        });
    }
}



export class Theme {
    id?: number;
    nom?: string;
    color?: string;

    constructor({ id, nom }: Theme) {
        this.id = id;
        this.nom = nom;
        this.color = colorPalette[id! % colorPalette.length];
    }

    static fromJSON(json: any): Theme {
    
        var id = json.id_theme as number;
        return new Theme({
            id: id,
            nom: json.nom,
            color: colorPalette[id % colorPalette.length]
        });
    }
}
