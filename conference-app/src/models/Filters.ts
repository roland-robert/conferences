import { Theme } from "@mui/material";
import { Conference, ConferenceType, Serie } from "./Conference";
import { Pays } from "./Localisation";

export class Filters {
    pays?: Pays;
    serie?: Serie;
    editeur?: string;
    themes?: Theme[];
    conferenceType?: ConferenceType;

    constructor({ pays, serie, editeur, themes, conferenceType }: Filters) {
        this.pays = pays;
        this.serie = serie;
        this.editeur = editeur;
        this.themes = themes;
        this.conferenceType = conferenceType;
    }
}