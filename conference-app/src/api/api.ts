import axios from "axios";
import { Conference, EditeurConference, Serie } from "../models/Conference";
import { Pays, Ville } from "../models/Localisation";
import { Theme } from "../models/Session";
import { privateQuery } from "../services";
import { Responsable, TypeResponsabilite, User } from "../models/Person";



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

    static async loginUser(username: string, password: string) {

        try {
            const formData = new FormData();
            formData.append('username', username);
            formData.append('password', password);

            const response = await axios.post('http://localhost:8000/token', formData, {
                headers: {
                    'Content-Type': 'multipart/form-data',
                },
            });
            return response;
        }
        catch (error: any) {
            console.log(error);
            return error.response;
        }

    }

    static async getUserData(): Promise<User | undefined> {
        try {
            var resp = await privateQuery("GET", `/user/me`)
            var user = User.fromJSON(resp);
            return user;
        }
        catch (error) {
            console.log(error);
        }
    }


    static async updateUserThemes2(themes: Theme[]) {
        var user = await API.getUserData();
        if (user === undefined) {
            return;
        }
        try {
            var data = {
                utilisateur: {
                    prenom: user.prenom,
                    nom: user.nom,
                    id_utilisateur: user.id,
                },
                themes: themes.map((theme) => {
                    return {
                        id_theme: theme.id,
                        nom: theme.nom,
                    }
                })
            }
            var resp = await privateQuery("PUT", `/utilisateur_and_themes`, { data: data })
            console.log(resp);
        }
        catch (error) {
            console.log(error);
        }
    }

    static async getConferences(params?: any): Promise<Conference[]> {
        try{
            var resp = await privateQuery("GET", `/conferences`, { params: params })
            var conferences = resp.map((event: any) => Conference.fromJSON(event));
            return conferences;
        }
        catch(error){
            console.log(error);
            return [];
        }
    };

    static async getConference(id: number): Promise<Conference | undefined> {
        try {
            var resp = await privateQuery("GET", `/conference/${id}`)
            var conference = Conference.fromJSON(resp);
            return conference;
        }
        catch (error) {
            console.log(error);
        }
    }

    static async getWorkshopsAssocies(id: number): Promise<Conference[]> {
        return await API.getConferences({ id_conference_du_workshop: id });
    }

    static async getUsers(): Promise<User[]> {
        try {
            var resp = await privateQuery("GET", `/utilisateurs`)
            var users = resp.map((user: any) => User.fromJSON(user));
            return users;
        }
        catch (error) {
            console.log(error);
            return []
        }

    }

    static async createUser(user: User) {
        var data = {
            prenom: user.prenom,
            nom: user.nom,
            email: user.email,
            password: user.password,
        }
        const response = await privateQuery("POST", `/utilisateur`, { data: data })
            .then((events: any) => {
                console.log(events);
            })
            .catch((err: any) => {
                console.log(err);
            });
        return response;
    }

    static async getEditeurs() {
        try {
            var resp = await privateQuery("GET", `/editeurs_conference`)
            var editeurs = resp.map((editeur: any) => EditeurConference.fromJSON(editeur));
            return editeurs;
        }
        catch (error) {
            console.log(error);
        }
    }

    static async getTypesResponsabilite(): Promise<TypeResponsabilite[]> {
        try {
            var resp = await privateQuery("GET", `/types_responsabilite`)
            var typeResponsabilites = resp.map((typeResponsabilite: any) => TypeResponsabilite.fromJSON(typeResponsabilite));
            return typeResponsabilites;
        }
        catch (error) {
            console.log(error);
            return [];
        }
    }

    static async getResponsables() {
        try {
            var resp = await privateQuery("GET", `/responsables`)
            var responsables = resp.map((responsable: any) => Responsable.fromJSON(responsable));
            return responsables;
        }
        catch (error) {
            console.log(error);
        }
    }
}





