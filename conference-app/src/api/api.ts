import { Serie } from "../models/Conference";
import { Pays, Ville } from "../models/Localisation";
import { Theme } from "../models/Session";
import { privateQuery } from "../services";

export class API {

    static async getCountries(setCountries: any) {
        privateQuery("GET", `/pays`)
            .then((events: any) => {
                var countries = events.map((event: any) => Pays.fromJSON(event));
                countries.sort((a: Pays, b: Pays) => a.nom!.localeCompare(b.nom!));
                setCountries(countries);
            })
            .catch((err: any) => {
                console.log(err);
            });
    };

    static async getCities(setCities: any) {
        privateQuery("GET", `/villes`)
            .then((events: any) => {
                var cities = events.map((event: any) => Ville.fromJSON(event));
                cities.sort((a: Pays, b: Pays) => a.nom!.localeCompare(b.nom!));
                setCities(cities);
            })
            .catch((err: any) => {
                console.log(err);
            });
    }

    static async getSeries(setSeries: any) {
        privateQuery("GET", `/serie`)
            .then((events: any) => {
                var series = events.map((event: any) => Serie.fromJSON(event));
                series.sort((a: Serie, b: Serie) => a.nom!.localeCompare(b.nom!));
                setSeries(series);
            })
            .catch((err: any) => {
                console.log(err);
            });
    };

    static async getThemes(setThemes: any) {
        privateQuery("GET", `/themes`)
            .then((events: any) => {
                var themes = events.map((event: any) => Theme.fromJSON(event));
                themes.sort((a: Theme, b: Theme) => a.nom!.localeCompare(b.nom!));
                setThemes(themes);
            })
            .catch((err: any) => {
                console.log(err);
            });
    };

}

