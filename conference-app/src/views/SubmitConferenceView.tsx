import React, { useEffect, useState } from 'react';
import { Button, Container, Form } from 'react-bootstrap';
import { Conference } from '../models/Conference';
import { API } from '../api/api';
import { Pays, Ville } from '../models/Localisation';




function SubmitConferenceView() {

    const [countries, setCountries] = useState<Pays[]>([]);
    const [cities, setCities] = useState<Ville[]>([]);
    const [series, setSeries] = useState<any[]>([]);

    const [pays, setPays] = useState<Pays | undefined>(undefined);

    const [conference, setConference] = useState<Conference | undefined>(undefined);

    async function initData() {
        await API.getCountries(setCountries);
        await API.getCities(setCities);
        await API.getSeries(setSeries);

    }

    function initConference() {
        var defaultCity = cities.find((_city) => _city!.nom === 'Paris') ?? cities[0];
        setPays(defaultCity!.pays);
        setConference(new Conference({
            ville: defaultCity,
            serie: series[0],
            organisateur: undefined, //par défaut l'utilisateur connecté
            intitule: '',
            dateDebut: new Date(),
            dateFin: new Date(),
        }));
    }

    useEffect(() => {
        initData();
    }
        , []);

    useEffect(() => {
        if (conference !== undefined) return;
        if (cities.length == 0 || series.length == 0) return;
        initConference();
    }
        , [cities, series]);


    function handleTitleChange(e: any) {
        setConference(new Conference({
            ...conference,
            intitule: e.target.value,
        }));
    }

    function handleImageChange(e: any) {
        setConference(new Conference({
            ...conference,
            image_url: e.target.value,
        }));
    }

    function handleIntroTextChange(e: any) {
        setConference(new Conference({
            ...conference,
            texteIntroductif: e.target.value,
        }));
    }



    function handleCountryChange(e: any) {
        var country = countries.find((country) => country!.id == e.target.value)!;
        setPays(country);
    }

    function handleCityChange(e: any) {
        var city = cities.find((city) => city.id == e.target.value)!;
        setConference(new Conference({
            ...conference,
            ville: city,
        }));
    }

    function handleSerieChange(e: any) {
        var serie = series.find((_serie) => _serie.id == e.target.value)!;
        setConference(new Conference({
            ...conference,
            serie: serie,
        }));
    }

    if (cities.length == 0 || series.length == 0 || pays == undefined || conference == undefined) {
        //TODO: loading
        return <></>;
    }

    return (
        <Container >
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
                    {countries.map((_pays) => (<option key={_pays!.id} value={_pays!.id}>{_pays!.nom}</option>))}
                </Form.Select>
                <Form.Label>Ville</Form.Label>
                <Form.Select onChange={handleCityChange} value={conference.ville!.id}>
                    {cities.filter((_ville) => _ville!.pays!.id === pays!.id).map((_ville) => (<option key={_ville.id} value={_ville.id}>{_ville.nom}</option>))}
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
                    {series.map((_serie) => (<option key={_serie.id} value={_serie.id}>{_serie.nom}</option>))}
                </Form.Select>

            </Form.Group>


        </Container>
    );


}

export default SubmitConferenceView;