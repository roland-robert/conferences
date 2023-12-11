export class Filters {
    pays?: { value: string, label: string };
    serie?: { value: string, label: string };
    editeur?: { value: string, label: string };
    themes?: { value: string, label: string }[];
    conferenceType?: { value: string, label: string };

    constructor({ pays, serie, editeur, themes, conferenceType }: Filters) {
        this.pays = pays;
        this.serie = serie;
        this.editeur = editeur;
        this.themes = themes;
        this.conferenceType = conferenceType;
    }

}