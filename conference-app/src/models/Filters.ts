import { Theme } from "@mui/material";
import { Conference, ConferenceType, EditeurConference, Serie } from "./Conference";
import { Pays } from "./Localisation";

export class Filters {
    pays?: Pays;
    serie?: Serie;
    editeur?: EditeurConference;
    themes?: Theme[];
    conferenceType?: ConferenceType;
    minDate?: string;
    maxDate?: string;

    constructor({ pays, serie, editeur, themes, conferenceType, minDate, maxDate }: Filters) {
        this.pays = pays;
        this.serie = serie;
        this.editeur = editeur;
        this.themes = themes;
        this.conferenceType = conferenceType;
        this.minDate = minDate;
        this.maxDate = maxDate;
    }
}