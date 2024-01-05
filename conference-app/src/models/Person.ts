import React from 'react'
import { Theme } from './Session';


export class User {
    id?: number;
    prenom?: string;
    nom?: string;
    email?: string;
    profil?: Theme[];

    constructor({ id, prenom, nom, email: email, profil }: User) {
        this.id = id;
        this.prenom = prenom;
        this.nom = nom;
        this.email = email;
        this.profil = profil;
    }

    static fromJSON(json: any): User {
        return new User({
            id: json.id_utilisateur,
            prenom: json.prenom,
            nom: json.nom,
            email: json.mail,
            profil: json.profil
        });
    }

}

export class Organisateur {
    id?: number;
    nom?: string;
    adresse?: string;
    email?: string;

    constructor({ id, nom, adresse, email }: Organisateur) {
        this.id = id;
        this.nom = nom;
        this.adresse = adresse;
        this.email = email;
    }

    static fromJSON(json: any): Organisateur {
        return new Organisateur({
            id: json.id_organisateur,
            nom: json.nom,
            adresse: json.adresse,
            email: json.email
        });
    }
}

export class TypeResponsabilite{
    id?: number;
    nom?: string;

    constructor({ id, nom }: TypeResponsabilite) {
        this.id = id;
        this.nom = nom;
    }

    static fromJSON(json: any): TypeResponsabilite {
        return new TypeResponsabilite({
            id: json.id_type_responsabilite,
            nom: json.nom
        });
    }
}

export class Responsable {
    id? : number;
    utilisateur?: User;  
    adressePro?: string;
    typeResponsabilite?: TypeResponsabilite;

    constructor({ id, utilisateur, adressePro, typeResponsabilite }: Responsable) {
        this.id = id;
        this.utilisateur = utilisateur;
        this.adressePro = adressePro;
        this.typeResponsabilite = typeResponsabilite;
    }

    static fromJSON(json: any): Responsable {
        return new Responsable({
            id: json.id_responsable,
            utilisateur: User.fromJSON(json.utilisateur),
            adressePro: json.adresse_pro,
            typeResponsabilite: TypeResponsabilite.fromJSON(json.type_responsabilite)
        });
    }
}