import React, { useEffect, useState } from 'react';
import { Button, Container, Form } from 'react-bootstrap';
import { Conference, EditeurConference, Serie } from '../models/Conference';
import { API } from '../api/api';
import { Pays, Ville } from '../models/Localisation';
import { Session, Theme } from '../models/Session';
import '../styles/SubmitConferenceView.css';
import { Organisateur, Responsable, User } from '../models/Person';
import { FaCirclePlus, FaXmark } from 'react-icons/fa6';
import { TitleRow } from '../utils/TitleRow';



function SubmitConferenceView() {

    function handletest() {
        console.log(conference);
    }

    const [countries, setCountries] = useState<Pays[]>([]);
    const [cities, setCities] = useState<Ville[]>([]);
    const [series, setSeries] = useState<Serie[]>([]);
    const [themes, setThemes] = useState<Theme[]>([]);
    const [users, setUsers] = useState<User[]>([]);


    const [selectedcountry, setSelectedCountry] = useState<Pays | undefined>(undefined);
    const [conference, setConference] = useState<Conference | undefined>(undefined);

    async function initData() {
        await API.getCountries(setCountries);
        await API.getCities(setCities);
        await API.getSeries(setSeries);
        await API.getThemes(setThemes);
        var users = await API.getUsers();
        setUsers(users);
    }

    function initConference() {
        var defaultCity = cities.find((_city) => _city!.nom === 'Paris') ?? cities[0];
        setSelectedCountry(defaultCity!.pays);
        setConference(new Conference({
            ville: defaultCity,
            serie: series[0],
            organisateur: new Organisateur({}), //par défaut l'utilisateur connecté
            intitule: '',
            image_url: '',
            texteIntroductif: '',
            editeur: new EditeurConference({}),
            sessions: [],
            workshopConferenceId: undefined,
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


    function handleOrganizerNameChange(e: any) {
        var organisateur = conference!.organisateur!;
        organisateur.nom = e.target.value;
        setConference(new Conference({
            ...conference,
            organisateur: organisateur,
        }));
    }

    function handleOrganizerEmailChange(e: any) {
        var organisateur = conference!.organisateur!;
        organisateur.email = e.target.value;
        setConference(new Conference({
            ...conference,
            organisateur: organisateur,
        }));
    }

    function handleOrganizerAddressChange(e: any) {
        var organisateur = conference!.organisateur!;
        organisateur.adresse = e.target.value;
        setConference(new Conference({
            ...conference,
            organisateur: organisateur,
        }));
    }


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

    function handleEditorChange(e: any) {
        var editeur = conference!.editeur!;
        editeur.nom = e.target.value;
        setConference(new Conference({
            ...conference,
            editeur: editeur,
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
        setSelectedCountry(country);
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

    function handleAddSession() {
        var sessions = conference!.sessions!;
        var newSession = new Session({
            intitule: '',
            themes: [],
            responsables: [],
        });
        sessions.push(newSession);
        setConference(new Conference({
            ...conference,
            sessions: sessions,
        }));
    }

    function handleDeleteSession(index: number) {
        var sessions = conference!.sessions!;
        sessions.splice(index, 1);
        setConference(new Conference({
            ...conference,
            sessions: sessions,
        }));
    }

    function handleSessionInituleChange(e: any, index: number) {
        var sessions = conference!.sessions!;
        sessions[index].intitule = e.target.value;
        setConference(new Conference({
            ...conference,
            sessions: sessions,
        }));
    }

    function handleSessionThemeChange(e: any, index: number) {
        var sessions = conference!.sessions!;
        var theme = themes.find((_theme) => _theme.id == e.target.value)!;
        sessions[index].themes!.push(theme);
        setConference(new Conference({
            ...conference,
            sessions: sessions,
        }));
    }

    function handleAddResponsable(index: number) {
        var sessions = conference!.sessions!;
        var responsables = sessions[index].responsables!;
        var newResponsable = new Responsable({
            utilisateur: undefined,
            typeResponsabilite: undefined,
        });
        responsables.push(newResponsable);
        setConference(new Conference({
            ...conference,
            sessions: sessions,
        }));
    }

    function handleDeleteResponsable(sessionIndex: number, responsableIndex: number) {
        var sessions = conference!.sessions!;
        var responsables = sessions[sessionIndex].responsables!;
        responsables.splice(responsableIndex, 1);
        setConference(new Conference({
            ...conference,
            sessions: sessions,
        }));
    }

    function handleSessionResponsableChange(e: any, sessionIndex: number) {
        var sessions = conference!.sessions!;
        var responsables = sessions[sessionIndex].responsables!;
        var responsable = responsables.find((_responsable) => _responsable.utilisateur!.id == e.target.value)!;
        responsables.push(responsable);
        setConference(new Conference({
            ...conference,
            sessions: sessions,
        }));
    }

    function handleSessionTypeResponsabiliteChange(e: any, sessionIndex: number) {
        var sessions = conference!.sessions!;
        var responsables = sessions[sessionIndex].responsables!;
        var responsable = responsables.find((_responsable) => _responsable.utilisateur!.id == e.target.value)!;
        responsables.push(responsable);
        setConference(new Conference({
            ...conference,
            sessions: sessions,
        }));
    }

    if (cities.length == 0 || series.length == 0 || selectedcountry == undefined || conference == undefined) {
        //TODO: loading
        return <></>;
    }

    const sessionResponsableForm = (sessionIndex: number, index: number) => {
        return (
            <div key={index} className='session-responsable-form ms-4'>
                <div className='d-flex'>
                    <Form.Group className="mb-3 me-2 w-100" onChange={(e) => handleSessionResponsableChange(e, sessionIndex)}>
                        <Form.Label>Utilisateur</Form.Label>
                        <Form.Select>
                            {users.map((_user) => (<option key={_user.id} value={_user.id}>{`${_user.prenom} ${_user.nom}`}</option>))}
                        </Form.Select>
                    </Form.Group>
                    <Form.Group className="mb-3 me-2 w-100" onChange={(e) => handleSessionTypeResponsabiliteChange(e, sessionIndex)}>
                        <Form.Label>Type de responsabilité</Form.Label>
                        <Form.Control placeholder='Program chair' />
                    </Form.Group>
                    <Form.Group className="mb-3 w-100" onChange={(e) => handleSessionTypeResponsabiliteChange(e, sessionIndex)}>
                        <Form.Label>Adresse Pro</Form.Label>
                        <Form.Control placeholder='john@doe@pro.fr' />
                    </Form.Group>
                    <Button className='d-flex align-self-center mx-2' variant="secondary" onClick={() => handleDeleteResponsable(sessionIndex, index)}><FaXmark /></Button>
                </div>
            </div>
        )
    }


    const sessionForm = (index: number) => {
        return (
            <div key={index} className='session-form'>
                <div className='d-flex justify-content-between'>
                    <h2 className='ms-2'>Session {index + 1}</h2>
                    <Button className='d-flex align-self-center mx-2' variant="secondary" onClick={() => handleDeleteSession(index)}><FaXmark /></Button>
                </div>

                <Form.Group className="mb-3" onChange={(e) => handleSessionInituleChange(e, index)}>
                    <Form.Label>Intitulé</Form.Label>
                    <Form.Control placeholder="Intitulé" />
                </Form.Group>
                <Form.Group className="mb-3" onChange={(e) => handleSessionThemeChange(e, index)}>
                    <Form.Label>Thèmes</Form.Label>
                    <Form.Select>
                        {themes.map((_theme) => (<option key={_theme.id} value={_theme.id}>{_theme.nom}</option>))}
                    </Form.Select>
                </Form.Group>

                <Form.Group className="">
                    <Form.Label>Responsables</Form.Label>
                </Form.Group>
                {conference!.sessions![index].responsables!.map((responsable, index) => sessionResponsableForm(index, index))}
                <Button variant="secondary" onClick={() => handleAddResponsable(index)}><FaCirclePlus className='me-3' />Ajouter un responsable</Button>
                <hr className="dotted" ></hr>
            </div>
        )
    }

    return (
        <Container >
            <h2>Organisateur</h2>
            <div className='d-flex'>
                <Form.Group onChange={handleOrganizerNameChange} className="mb-3 me-2 w-100">
                    <Form.Label>Nom</Form.Label>
                    <Form.Control placeholder="Ecole Centrale de Lyon" />
                </Form.Group>

                <Form.Group onChange={handleOrganizerEmailChange} className="mb-3 w-100">
                    <Form.Label>Adresse email</Form.Label>
                    <Form.Control placeholder="ecl@etu.ec-lyon.fr" />
                </Form.Group>
            </div>
            <Form.Group onChange={handleOrganizerAddressChange} className="mb-3">
                <Form.Label>Adresse</Form.Label>
                <Form.Control placeholder="36 Av. Guy de Collongue, 69134 Écully" />
            </Form.Group>
            <hr className="dashed"></hr>
            <h2>Général</h2>
            <Form.Group onChange={handleTitleChange} className="mb-3">
                <Form.Label>Intitulé de la conférence</Form.Label>
                <Form.Control placeholder="Intitulé" />
            </Form.Group>
            {/* Image */}
            <Form.Group onChange={handleImageChange} className="mb-3">
                <Form.Label>Image d'illustration (URL)</Form.Label>
                <Form.Control placeholder='URL' />
                {conference.image_url && <img src={conference.image_url!} alt="illustration" className='submit-illustration mt-2' />}
            </Form.Group>
            <Form.Group onChange={handleEditorChange} className="mb-3">
                <Form.Label>Editeur de la conférence</Form.Label>
                <Form.Control placeholder="Editeur" />
            </Form.Group>
            {/* Localisation */}
            <Form.Group className="mb-3 d-flex">
                <div className='w-50 me-1'>
                    <Form.Label>Pays</Form.Label>
                    <Form.Select onChange={handleCountryChange} value={selectedcountry!.id}>
                        {countries.map((_pays) => (<option key={_pays!.id} value={_pays!.id}>{_pays!.nom}</option>))}
                    </Form.Select>

                </div>

                <div className='w-50 ms-1'>
                    <Form.Label>Ville</Form.Label>
                    <Form.Select onChange={handleCityChange} value={conference.ville!.id}>
                        {cities.filter((_ville) => _ville!.pays!.id === selectedcountry!.id).map((_ville) => (<option key={_ville.id} value={_ville.id}>{_ville.nom}</option>))}
                    </Form.Select>
                </div>
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
            {/* <Button variant="primary" onClick={handletest}>Test</Button> */}
            <hr className="dashed"></hr>
            {/* <h2 >Sessions</h2> */}

            {conference.sessions!.map((session, index) => sessionForm(index))}
            <Button variant="primary" onClick={handleAddSession}><FaCirclePlus className='me-3' /> Ajouter une session</Button>

        </Container>
    );


}

export default SubmitConferenceView;