import React from 'react'


export class Ville {
    id?: number;
    nom?: string;
    pays?: Pays;

    constructor({ id, nom: nom, pays }: Ville) {
        this.id = id;
        this.nom = nom;
        this.pays = pays;
    }
}

export class Pays {
    id?: number;
    nom?: string;

    constructor({ id, nom }: Pays) {
        this.id = id;
        this.nom = nom;
    }
}

