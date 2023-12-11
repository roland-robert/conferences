import React from 'react'
import { Responsable } from './Person';

export class Session {
    id?: number;
    idConference?: number;
    intitule?: string;
    responsables?: Responsable[];
    themes?: Theme[];

    constructor({ id, idConference, intitule, responsables, themes }: Session) {
        this.id = id;
        this.idConference = idConference;
        this.intitule = intitule;
        this.responsables = responsables;
        this.themes = themes;
    }

    }

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

export class Theme {
    id?: number;
    nom?: string;
    color?: string;

    constructor({ id, nom }: Theme) {
        this.id = id;
        this.nom = nom;
        this.color = colorPalette[id! % colorPalette.length];
    }
}
