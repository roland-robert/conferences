import React from 'react'
import { Theme } from './Session';


export class User {
    id?: number;
    prenom?: string;
    nom?: string;
    mail?: string;
    profil?: Theme[];

    constructor({ id, prenom, nom, mail, profil }: User) {
        this.id = id;
        this.prenom = prenom;
        this.nom = nom;
        this.mail = mail;
        this.profil = profil;
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
}

export class TypeResponsabilite{
    id?: number;
    nom?: string;

    constructor({ id, nom }: TypeResponsabilite) {
        this.id = id;
        this.nom = nom;
    }
}

export class Responsable {
    id? : number;
    nom?: string;
    prenom?: string;
    emailPro?: string;
    email?: string;
    typeResponsabilite?: TypeResponsabilite;

    constructor({ id, nom, prenom, emailPro, email, typeResponsabilite }: Responsable) {
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
        this.emailPro = emailPro;
        this.email = email;
        this.typeResponsabilite = typeResponsabilite;
    }


}