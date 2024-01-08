import React from 'react'
import { Theme } from './Session';


export class User {
    id?: number;
    prenom?: string;
    nom?: string;
    email?: string;
    password?: string;
    profil?: Theme[];

    constructor({ id, prenom, nom, email: email, password, profil }: User) {
        this.id = id;
        this.prenom = prenom;
        this.nom = nom;
        this.email = email;
        this.profil = profil;
        this.password = password;
    }

    static fromJSON(json: any): User {
        return new User({
            id: json.id_utilisateur,
            prenom: json.nom,
            nom: json.prenom,
            email: json.email,
            profil: json.themes?.map((theme: any) => Theme.fromJSON(theme)),
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
