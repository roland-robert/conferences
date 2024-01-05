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

    static fromJSON(json: any): Ville {
        return new Ville({
            id: json.id_ville,
            nom: json.nom_ville,
            pays: Pays.fromJSON(json.pays)
        });
    }
}

export class Pays {
    id?: number;
    nom?: string;

    constructor({ id, nom }: Pays) {
        this.id = id;
        this.nom = nom;
    }

    static fromJSON(json: any): Pays {
        return new Pays({
            id: json.id_pays,
            nom: json.nom
        });
    }
}

