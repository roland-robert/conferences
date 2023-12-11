import React, { useState } from 'react';
import { Button, Container, Form } from 'react-bootstrap';
import { allCountries, allCities, mockSeries } from '../models/mockData';
import { Conference } from '../models/Conference';




function SubmitConferenceView() {
    const [pays, setPays] = useState(allCities[0].pays);

    const [conference, setConference] = useState<Conference>(new Conference({
        ville: allCities[0],
        serie: mockSeries[0],
        organisateur: undefined, //par défaut l'utilisateur connecté
        intitule: '',
        dateDebut: new Date(),
        dateFin: new Date(),
    }));

    function handleTitleChange(e: any) {
        setConference(new Conference({
            ...conference,
            intitule: e.target.value,
        }));
    }

    function handleImageChange(e: any) {
        setConference(new Conference({
            ...conference,
            image: e.target.value,
        }));
    }

    function handleIntroTextChange(e: any) {
        setConference(new Conference({
            ...conference,
            texteIntroductif: e.target.value,
        }));
    }



    function handleCountryChange(e: any) {
        var country = allCountries.find((country) => country!.id == e.target.value)!;
        setPays(country);
    }

    function handleCityChange(e: any) {
        var city = allCities.find((city) => city.id == e.target.value)!;
        setConference(new Conference({
            ...conference,
            ville: city,
        }));
    }

    function handleSerieChange(e: any) {
        var serie = mockSeries.find((_serie) => _serie.id == e.target.value)!;
        setConference(new Conference({
            ...conference,
            serie: serie,
        }));
    }

    return (
        <Container >
            {/* Intitule */}
            <Form.Group onChange={handleTitleChange} className="mb-3">
                <Form.Label>Intitulé</Form.Label>
                <Form.Control placeholder="Intitulé" />
            </Form.Group>
            {/* Image */}
            <Form.Group onChange={handleImageChange} className="mb-3">
                <Form.Label>Image d'illustration</Form.Label>
                <Form.Control type="file" accept='png' />
            </Form.Group>
            {/* Localisation */}
            <Form.Group className="mb-3">
                <Form.Label>Pays</Form.Label>
                <Form.Select onChange={handleCountryChange} value={pays!.id}>
                    {allCountries.map((_pays) => (<option key={_pays!.id} value={_pays!.id}>{_pays!.nom}</option>))}
                </Form.Select>
                <Form.Label>Ville</Form.Label>
                <Form.Select onChange={handleCityChange} value={conference.ville!.id}>
                    {allCities.filter((_ville) => _ville!.pays!.id === pays!.id).map((_ville) => (<option key={_ville.id} value={_ville.id}>{_ville.nom}</option>))}
                </Form.Select>
            </Form.Group>
            {/* Description */}
            <Form.Group onChange={handleIntroTextChange} className="mb-3">
                <Form.Label>Texte introductif</Form.Label>
                <Form.Control as="textarea" rows={5} />
            </Form.Group>
            {/* Série */}
            <Form.Group className="mb-3">
                <Form.Label>Série</Form.Label>
                <Form.Select onChange={handleSerieChange} value={conference.serie!.id}>
                    {mockSeries.map((_serie) => (<option key={_serie.id} value={_serie.id}>{_serie.nom}</option>))}
                </Form.Select>

            </Form.Group>

        </Container>
    );


}

export default SubmitConferenceView;