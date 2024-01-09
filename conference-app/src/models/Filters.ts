import { Conference, ConferenceType, EditeurConference, Serie } from "./Conference";
import { Pays } from "./Localisation";
import { Responsable } from "./Person";
import { Theme } from "./Session";

export class Filters {
    pays?: Pays;
    serie?: Serie;
    editeur?: EditeurConference;
    themes?: Theme[];
    responsable?: string;
    conferenceType?: ConferenceType;
    minDate?: string;
    maxDate?: string;

    constructor({ pays, serie, editeur, themes, conferenceType, minDate, maxDate, responsable }: Filters) {
        this.pays = pays;
        this.serie = serie;
        this.editeur = editeur;
        this.themes = themes;
        this.conferenceType = conferenceType;
        this.minDate = minDate;
        this.maxDate = maxDate;
        this.responsable = responsable;
    }
}