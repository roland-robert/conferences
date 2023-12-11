// france, allemagne, espagne, italie, états unis

import { Session } from "./Session";
import { Conference, EditeurConference, Serie } from "./Conference";
import { Pays, Ville } from "./Localisation";
import { Theme } from "./Session";
import { Organisateur } from "./Person";

export const allCities: Ville[] = [
    { id: 1, nom: 'Paris', pays: { id: 1, nom: 'France' } },
    { id: 2, nom: 'Lyon', pays: { id: 1, nom: 'France' } },
    { id: 3, nom: 'Marseille', pays: { id: 1, nom: 'France' } },
    { id: 4, nom: 'Berlin', pays: { id: 2, nom: 'Allemagne' } },
    { id: 5, nom: 'Munich', pays: { id: 2, nom: 'Allemagne' } },
    { id: 6, nom: 'Hambourg', pays: { id: 2, nom: 'Allemagne' } },
    { id: 7, nom: 'Madrid', pays: { id: 3, nom: 'Espagne' } },
    { id: 8, nom: 'Barcelone', pays: { id: 3, nom: 'Espagne' } },
    { id: 9, nom: 'Valence', pays: { id: 3, nom: 'Espagne' } },
    { id: 10, nom: 'Rome', pays: { id: 4, nom: 'Italie' } },
    { id: 11, nom: 'Milan', pays: { id: 4, nom: 'Italie' } },
    { id: 12, nom: 'Turin', pays: { id: 4, nom: 'Italie' } },
    { id: 13, nom: 'New York', pays: { id: 5, nom: 'États-Unis' } },
    { id: 14, nom: 'Los Angeles', pays: { id: 5, nom: 'États-Unis' } },
    { id: 15, nom: 'Chicago', pays: { id: 5, nom: 'États-Unis' } }
]

export const allCountries = allCities.map(v => v.pays).filter((p, i, self) => self.findIndex(s => s!.id === p!.id) === i)

export const mockThemes: Theme[] = [
    new Theme({ id: 1, nom: 'Aérospatial' }),
    new Theme({ id: 2, nom: 'Sport' }),
    new Theme({ id: 3, nom: 'Nature' }),
    new Theme({ id: 4, nom: 'Technologie' }),
    new Theme({ id: 5, nom: 'Histoire' }),
    new Theme({ id: 6, nom: 'Géographie' }),
    new Theme({ id: 7, nom: 'Cuisine' }),
    new Theme({ id: 8, nom: 'Musique' }),
    new Theme({ id: 9, nom: 'Littérature' }),
    new Theme({ id: 10, nom: 'Cinéma' }),
    new Theme({ id: 11, nom: 'Politique' }),
];

export const mockEditeurs = [
    new EditeurConference({ id: 1, nom: 'Le Monde' }),
    new EditeurConference({ id: 2, nom: 'Ecole Centrale Lyon' })
]

export const mockOrganisateurs = [
    new Organisateur({ id: 1, nom: 'Jean Dupont', adresse: '1 rue de la Paix', email: 'jdupont@dovmail.com'}),
    new Organisateur({ id: 2, nom: 'Paul Martin', adresse: '2 rue de la Paix', email: 'pmartin@dovmail.com'}),
]



export const mockSessions = [
    new Session({ themes: [mockThemes[0], mockThemes[2]] }),
    new Session({ themes: [mockThemes[7], mockThemes[4]] }),
    new Session({ themes: [mockThemes[4], mockThemes[6]] }),
    new Session({ themes: [mockThemes[3], mockThemes[1]] }),
    new Session({ themes: [mockThemes[8], mockThemes[10]] }),
    new Session({ themes: [mockThemes[5], mockThemes[9]] }),
]

export const mockConferences = [
    new Conference({
        id: 0,
        intitule: 'Ce nouveau moyen de transport révolutionnaire pour éléphant',
        dateDebut: new Date(2020, 11, 1, 12, 0, 0),
        dateFin: new Date(2020, 11, 17, 12, 0, 0),
        texteIntroductif: 'lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
        image: 'img1.jpg',
        ville: allCities[7],
        sessions: [mockSessions[0], mockSessions[1]],
        editeur: mockEditeurs[0],
        organisateur: mockOrganisateurs[0]
    }),

    new Conference({
        id: 1,
        intitule: 'La Chine lance son premier sous marin nucléaire en forme de panda',
        dateDebut: new Date(2020, 11, 1, 12, 0, 0),
        dateFin: new Date(2020, 11, 17, 12, 0, 0),
        texteIntroductif: 'lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
        image: 'img2.avif',
        ville: allCities[0],
        sessions: [mockSessions[2]],
        editeur: mockEditeurs[0],
        organisateur: mockOrganisateurs[0]
    }),
    new Conference({
        id: 2,
        intitule: 'Le fléau des images en 144p',
        dateDebut: new Date(2020, 11, 1, 12, 0, 0),
        dateFin: new Date(2020, 11, 17, 12, 0, 0),
        texteIntroductif: 'lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
        image: 'img3.jfif',
        ville: allCities[12],
        sessions: [],
        editeur: mockEditeurs[0],
        organisateur: mockOrganisateurs[0]

    }),
    new Conference({
        id: 3,
        intitule: 'Ce nouveau virus qui vous transforme en arbre',
        dateDebut: new Date(2020, 11, 1, 12, 0, 0),
        dateFin: new Date(2020, 11, 17, 12, 0, 0),
        texteIntroductif: 'lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
        image: 'img4.webp',
        ville: allCities[5],
        sessions: [mockSessions[3], mockSessions[4]],
        editeur: mockEditeurs[1],
        organisateur: mockOrganisateurs[1]
    }),
    new Conference({
        id: 4,
        intitule: '5 astuces pour mourir noyé en moins de 5 minutes',
        dateDebut: new Date(2020, 11, 1, 12, 0, 0),
        dateFin: new Date(2020, 11, 17, 12, 0, 0),
        texteIntroductif: 'lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
        image: 'img5.jpg',
        ville: allCities[1],
        sessions: [mockSessions[5]],
        editeur: mockEditeurs[1],
        organisateur: mockOrganisateurs[1]
    }),
];

export const mockTypes = [
    { id: 1, nom: 'Conférence' },
    { id: 2, nom: 'Workshop' },
];



export const mockSeries: Serie[] = [
    { id: 1, nom: 'SDH' },
    { id: 2, nom: 'AQH' },
    { id: 3, nom: 'CMS' }
]

export const mockSubmissions: Conference[] = [
    mockConferences[0],
    mockConferences[4],
]

