import React, { useEffect, useState } from 'react';
import { Button, Container, Form } from 'react-bootstrap';
import { CategorieSoumission, Conference, EditeurConference, Serie } from '../models/Conference';
import { API } from '../api/api';
import { Pays, Ville } from '../models/Localisation';
import { Session, Theme } from '../models/Session';
import '../styles/SubmitConferenceView.css';
import { Organisateur, Responsable, TypeResponsabilite, User } from '../models/Person';
import { FaCalendarDays, FaCirclePlus, FaXmark } from 'react-icons/fa6';
import { TitleRow } from '../utils/TitleRow';
import Select from 'react-select';
import { useNavigate } from 'react-router-dom';



function SubmitConferenceView() {
    const navigate = useNavigate();

    async function handleCreateConference() {
        console.log(conference);
        API.createConference(conference!).then((response) => {
            console.log(response);
            navigate('/submissions');
        })

    }

    const [countries, setCountries] = useState<Pays[]>([]);
    const [cities, setCities] = useState<Ville[]>([]);
    const [series, setSeries] = useState<Serie[]>([]);
    const [themes, setThemes] = useState<Theme[]>([]);
    const [users, setUsers] = useState<User[]>([]);
    const [user, setUser] = useState<User | undefined>(undefined);
    const [typesResponsabilite, setTypesResponsabilite] = useState<TypeResponsabilite[]>([])


    const [selectedcountry, setSelectedCountry] = useState<Pays | undefined>(undefined);
    const [conference, setConference] = useState<Conference | undefined>(undefined);

    async function initData() {
        await API.getCountries(setCountries);
        await API.getCities(setCities);
        await API.getSeries(setSeries);
        await API.getThemes(setThemes);
        var user = await API.getUserData();
        setUser(user);

        var users = await API.getUsers();
        setUsers(users);
        var typesResponsabilite = await API.getTypesResponsabilite();
        setTypesResponsabilite(typesResponsabilite);
    }

    function initConference() {
        var defaultCity = cities.find((_city) => _city!.nom === 'Paris') ?? cities[0];
        setSelectedCountry(defaultCity!.pays);
        setConference(new Conference({
            userId: user?.id,
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
            categoriesSoumission: [],
            isWorkshop: false,
        }));
    }

    useEffect(() => {
        initData();
    }
        , []);

    useEffect(() => {
        if (conference !== undefined) return;
        if (user === undefined) return;
        if (cities.length == 0 || series.length == 0) return;
        initConference();
    }
        , [cities, series, user]);

    function handleOrganizerChange(organisateur: Organisateur) {
        setConference(new Conference({
            ...conference,
            organisateur: organisateur,
        }));
    }
    function handleOrganizerNameChange(e: any) {
        var organisateur = conference!.organisateur!;
        organisateur.nom = e.target.value;
        handleOrganizerChange(organisateur)
    }

    function handleOrganizerEmailChange(e: any) {
        var organisateur = conference!.organisateur!;
        organisateur.email = e.target.value;
        handleOrganizerChange(organisateur)
    }

    function handleOrganizerAddressChange(e: any) {
        var organisateur = conference!.organisateur!;
        organisateur.adresse = e.target.value;
        handleOrganizerChange(organisateur)
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

    function handleDateMin(e: any) {
        setConference(new Conference({
            ...conference,
            dateDebut: new Date(e.target.value),
        }));
    }

    function handleDateMax(e: any) {
        setConference(new Conference({
            ...conference,
            dateFin: new Date(e.target.value),
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

        //wait for dom to update and scroll down
        setTimeout(() => {
            window.scrollTo(0, document.body.scrollHeight);
        }, 1);


    }

    function handleDeleteSession(index: number) {
        var sessions = conference!.sessions!;
        sessions.splice(index, 1);
        setConference(new Conference({
            ...conference,
            sessions: sessions,
        }));
    }

    function handleSessionChange(session: Session, index: number) {
        var sessions = conference!.sessions!;
        sessions[index] = session;
        setConference(new Conference({
            ...conference,
            sessions: sessions,
        }));
    }

    function handleSessionIntituleChange(e: any, index: number) {
        if (!conference?.sessions || index > conference?.sessions?.length) return;
        var session = conference!.sessions![index];
        session.intitule = e.target.value;
        handleSessionChange(session, index);
    }

    function handleSessionThemeChange(selectedThemes: any, index: number) {
        if (!conference?.sessions || index > conference?.sessions?.length) return;
        var session = conference!.sessions![index];
        session.themes = selectedThemes;
        handleSessionChange(session, index);
    }

    function handleAddResponsable(index: number) {
        if (!conference?.sessions || index > conference?.sessions?.length) return;
        var session = conference!.sessions![index];
        var newResponsable = new Responsable({
            utilisateur: undefined,
            typeResponsabilite: undefined,
        });
        session.responsables?.push(newResponsable);
        handleSessionChange(session, index);
        setTimeout(() => {
            console.log(window.scrollY);
            window.scrollTo(0, window.scrollY + 20);
        }, 1);
    }



    function handleDeleteResponsable(sessionIndex: number, responsableIndex: number) {
        var nbResponsables = conference?.sessions![sessionIndex].responsables?.length;
        if (nbResponsables == undefined || nbResponsables == 0) return;
        var session = conference!.sessions![sessionIndex];
        session?.responsables?.splice(responsableIndex, 1);
        handleSessionChange(session, sessionIndex);
    }

    function handleResponsableChange(responsable: Responsable, sessionIndex: number, responsableIndex: number) {
        if (!conference?.sessions || sessionIndex > conference?.sessions?.length) return;
        if (!conference?.sessions![sessionIndex].responsables || responsableIndex > conference?.sessions![sessionIndex].responsables!.length) return;
        var session = conference!.sessions![sessionIndex];
        session!.responsables![responsableIndex] = responsable;
        handleSessionChange(session, sessionIndex);
    }

    function handleSessionResponsableChange(e: any, sessionIndex: number, responsableIndex: number) {
        var sessions = conference!.sessions!;
        var user = users.find((_user) => _user.id == e.target.value)!;
        var responsable = sessions[sessionIndex].responsables![responsableIndex];
        responsable.utilisateur = user;
        handleResponsableChange(responsable, sessionIndex, responsableIndex)
    }

    function handleSessionTypeResponsabiliteChange(e: any, sessionIndex: number, responsableIndex: number) {
        var sessions = conference!.sessions!;
        var responsable = sessions[sessionIndex].responsables![responsableIndex];
        responsable.typeResponsabilite = typesResponsabilite.find((_typeResponsabilite) => _typeResponsabilite.id == e.target.value)!;
        handleResponsableChange(responsable, sessionIndex, responsableIndex)
    }

    function handleAdresseProChange(e: any, sessionIndex: number, responsableIndex: number) {
        var sessions = conference!.sessions!;
        var responsable = sessions[sessionIndex].responsables![responsableIndex];
        responsable.adressePro = e.target.value;
        handleResponsableChange(responsable, sessionIndex, responsableIndex)
    }

    function handleCategorieSoumissionChange(categorieSoumission: CategorieSoumission, index: number) {
        if (!conference?.categoriesSoumission && index > conference!.categoriesSoumission!.length) return;
        var categoriesSoumission = conference!.categoriesSoumission!;
        categoriesSoumission[index] = categorieSoumission;
        setConference(new Conference({
            ...conference,
            categoriesSoumission: categoriesSoumission,
        }));
    }

    function handlePoliceChange(e: any, index: number) {
        if (!conference?.categoriesSoumission && index > conference!.categoriesSoumission!.length) return;
        var categorieSoumission = conference!.categoriesSoumission![index];
        categorieSoumission.font = e.target.value;
        handleCategorieSoumissionChange(categorieSoumission, index);
    }

    function handleTaillePoliceChange(e: any, index: number) {
        if (!conference?.categoriesSoumission && index > conference!.categoriesSoumission!.length) return;
        var categorieSoumission = conference!.categoriesSoumission![index];
        categorieSoumission.fontSize = e.target.value;
        handleCategorieSoumissionChange(categorieSoumission, index);
    }

    function handleTypeLogicielChange(e: any, index: number) {
        if (!conference?.categoriesSoumission && index > conference!.categoriesSoumission!.length) return;
        var categorieSoumission = conference!.categoriesSoumission![index];
        categorieSoumission.typeLogiciel = e.target.value;
        handleCategorieSoumissionChange(categorieSoumission, index);
    }

    function handleNbPagesMaxChange(e: any, index: number) {
        if (!conference?.categoriesSoumission && index > conference!.categoriesSoumission!.length) return;
        var categorieSoumission = conference!.categoriesSoumission![index];
        categorieSoumission.nombreMaxiPages = e.target.value;
        handleCategorieSoumissionChange(categorieSoumission, index);
    }

    function handleDateLimiteSoumissionChange(e: any, index: number) {
        if (!conference?.categoriesSoumission && index > conference!.categoriesSoumission!.length) return;
        var categorieSoumission = conference!.categoriesSoumission![index];
        categorieSoumission.dateSoumission = new Date(e.target.value);
        handleCategorieSoumissionChange(categorieSoumission, index);
    }

    function handleDateNotificationAcceptationChange(e: any, index: number) {
        if (!conference?.categoriesSoumission && index > conference!.categoriesSoumission!.length) return;
        var categorieSoumission = conference!.categoriesSoumission![index];
        categorieSoumission.dateNotificationAcceptation = new Date(e.target.value);
        handleCategorieSoumissionChange(categorieSoumission, index);
    }

    function handleDateLimiteVersionCorrigeeChange(e: any, index: number) {
        if (!conference?.categoriesSoumission && index > conference!.categoriesSoumission!.length) return;
        var categorieSoumission = conference!.categoriesSoumission![index];
        categorieSoumission.dateLimiteEnvoiVersionCorrigee = new Date(e.target.value);
        handleCategorieSoumissionChange(categorieSoumission, index);
    }

    function handleNomCategorie(e: any, index: number) {
        if (!conference?.categoriesSoumission && index > conference!.categoriesSoumission!.length) return;
        var categorieSoumission = conference!.categoriesSoumission![index];
        categorieSoumission.nom = e.target.value;
        handleCategorieSoumissionChange(categorieSoumission, index);
    }

    function handleDeleteCategorieSoumission(index: number) {
        var nbCategoriesSoumission = conference?.categoriesSoumission?.length;
        if (nbCategoriesSoumission == undefined || nbCategoriesSoumission == 0) return;
        var categoriesSoumission = conference!.categoriesSoumission!;
        categoriesSoumission.splice(index, 1);
        setConference(new Conference({
            ...conference,
            categoriesSoumission: categoriesSoumission,
        }));
    }

    function handleAddCategorieSoumission() {
        var categoriesSoumission = conference!.categoriesSoumission!;
        var newCategorieSoumission = new CategorieSoumission({
            font: 'Arial',
            fontSize: 10,
            nombreMaxiPages: 10,
            typeLogiciel: 'PDF',
            dateSoumission: new Date(),
            dateNotificationAcceptation: new Date(),
            dateLimiteEnvoiVersionCorrigee: new Date(),
        });
        categoriesSoumission.push(newCategorieSoumission);
        setConference(new Conference({
            ...conference,
            categoriesSoumission: categoriesSoumission,
        }));
    }



    if (cities.length == 0 || series.length == 0 || selectedcountry == undefined || conference == undefined) {
        return <></>;
    }

    const sessionResponsableForm = (sessionIndex: number, index: number) => {
        return (
            <div key={index} className='session-responsable-form ms-4'>
                <div className='d-flex'>
                    <Form.Group className="mb-3 me-2 w-100" onChange={(e) => handleSessionResponsableChange(e, sessionIndex, index)}>
                        <Form.Label>Utilisateur</Form.Label>
                        <Form.Select >
                            {users.map((_user) => (<option key={_user.id} value={_user.id}>{`${_user.prenom} ${_user.nom}`}</option>))}
                        </Form.Select>
                    </Form.Group>
                    <Form.Group className="mb-3 me-2 w-100" onChange={(e) => handleSessionTypeResponsabiliteChange(e, sessionIndex, index)}>
                        <Form.Label>Type de responsabilité</Form.Label>
                        <Form.Select>
                            {typesResponsabilite?.map((_type) => (<option key={_type.id} value={_type.id}>{_type.nom}</option>))}
                        </Form.Select>
                    </Form.Group>
                    <Form.Group className="mb-3 w-100" onChange={(e) => handleAdresseProChange(e, sessionIndex, index)}>
                        <Form.Label>Adresse Pro</Form.Label>
                        <Form.Control placeholder='john@doe@pro.fr' />
                    </Form.Group>
                    <Button className='d-flex align-self-center mx-2' variant="secondary" onClick={() => handleDeleteResponsable(sessionIndex, index)}><FaXmark /></Button>
                </div>
            </div>
        )
    }

    const CategorieSoumissionForm = (index: number) => {

        return (<div className='session-form'>
            <div className='d-flex justify-content-between'>
                <h2 className='ms-2'>Catégorie de soumission</h2>
                <Button className='d-flex align-self-center mx-2' variant="secondary" onClick={() => handleDeleteCategorieSoumission(index)}><FaXmark /></Button>

            </div>
            <Form.Group className="mb-3 me-2 w-50" onChange={(e) => handleNomCategorie(e, index)}>
                    <Form.Label>Nom de la catégorie</Form.Label>
                    <Form.Control placeholder="Panel" />
                </Form.Group>
            <div className='d-flex'>
                <Form.Group className="mb-3 me-2 w-50" onChange={(e) => handlePoliceChange(e, index)}>
                    <Form.Label>Police</Form.Label>
                    <Form.Control defaultValue="Arial" />
                </Form.Group>
                <Form.Group className="mb-3 me-2 w-50" onChange={(e) => handleTaillePoliceChange(e, index)}>
                    <Form.Label>Taille de police</Form.Label>
                    <Form.Control type="number" defaultValue={10} />
                </Form.Group>
                <Form.Group className="mb-3 w-100 me-2" onChange={(e) => handleTypeLogicielChange(e, index)}>
                    <Form.Label>Type de logiciel</Form.Label>
                    <Form.Control defaultValue='PDF' />
                </Form.Group>
                <Form.Group className="mb-3  w-50" onChange={(e) => handleNbPagesMaxChange(e, index)}>
                    <Form.Label>Nombre de pages max</Form.Label>
                    <Form.Control type="number" defaultValue={10} />
                </Form.Group>
            </div>
            <div className='mb-3 d-flex '>
                <div className='d-flex-column me-2'>
                    <label>Date limite de soumission</label>
                    <input className='date-input w-100 ' aria-label="Date" type="date" onChange={(e) => handleDateLimiteSoumissionChange(e, index)} />

                </div>

                <div className='d-flex-column me-2'>
                    <label>Date de notification d'acceptation</label>
                    <input className='date-input w-100 me-2' aria-label="Date" type="date" onChange={(e) => handleDateNotificationAcceptationChange(e, index)} />

                </div>

                <div className='d-flex-column me-2'>
                    <label>Date limite d'envoi de version corrigée</label>
                    <input className='date-input w-100 me-2' aria-label="Date" type="date" onChange={(e) => handleDateLimiteVersionCorrigeeChange(e, index)} />

                </div>
            </div>
            <hr className="dotted" ></hr>
        </div>)

    }



    const sessionForm = (index: number) => {
        const optionMapper = (item: any) => {
            return { value: item!.id!.toString(), label: item!.nom! }
        }
        function onThemeChange(e: any) {
            var selectedOptions = e.map((e: any) => themes.find((option) => optionMapper(option)?.value == e.value)!);
            handleSessionThemeChange(selectedOptions, index);
            return;
        }

        return (
            <div key={index} className='session-form'>
                <div className='d-flex justify-content-between'>
                    <h2 className='ms-2'>Session {index + 1}</h2>
                    <Button className='d-flex align-self-center mx-2' variant="secondary" onClick={() => handleDeleteSession(index)}><FaXmark /></Button>
                </div>

                <Form.Group className="mb-3" onChange={(e) => handleSessionIntituleChange(e, index)}>
                    <Form.Label>Intitulé</Form.Label>
                    <Form.Control placeholder="Intitulé" />
                </Form.Group>
                <Form.Label>Thèmes</Form.Label>
                <Select
                    isMulti={true}
                    isClearable={true}
                    onChange={onThemeChange}
                    defaultValue={conference?.sessions![index].themes?.map((theme) => {
                        return { value: theme.id, label: theme.nom }
                    })}
                    options={themes.map(optionMapper)}
                />
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
                <Form.Group onChange={handleOrganizerNameChange} className="mb-3 me-2 w-50">
                    <Form.Label>Nom</Form.Label>
                    <Form.Control placeholder="Ecole Centrale de Lyon" />
                </Form.Group>

                <Form.Group onChange={handleOrganizerEmailChange} className="mb-3 me-2 w-50">
                    <Form.Label>Adresse email</Form.Label>
                    <Form.Control placeholder="ecl@etu.ec-lyon.fr" />
                </Form.Group>

                <Form.Group onChange={handleOrganizerAddressChange} className="mb-3 w-100">
                    <Form.Label>Adresse</Form.Label>
                    <Form.Control placeholder="36 Av. Guy de Collongue, 69134 Écully" />
                </Form.Group>
            </div>

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
            {/* Editeur et série */}
            <div className='d-flex'>
                <Form.Group onChange={handleEditorChange} className="mb-3 me-2 w-100">
                    <Form.Label>Editeur de la conférence</Form.Label>
                    <Form.Control placeholder="Editeur" />
                </Form.Group>
                <Form.Group className="mb-3 w-100">
                    <Form.Label>Série</Form.Label>
                    <Form.Select onChange={handleSerieChange} value={conference.serie!.id}>
                        {series.map((_serie) => (<option key={_serie.id} value={_serie.id}>{_serie.nom}</option>))}
                    </Form.Select>

                </Form.Group>
            </div>
            <div className='mb-3 d-flex '>
                <div className='d-flex-column me-2'>
                    <label>Date limite de soumission</label>
                    <input className='date-input w-100 ' aria-label="Date" type="date" onChange={(e) => handleDateMin(e)} />

                </div>

                <div className='d-flex-column'>
                    <label>Date de notification d'acceptation</label>
                    <input className='date-input w-100 ' aria-label="Date" type="date" onChange={(e) => handleDateMax(e)} />

                </div>
            </div>

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
            <hr className="dashed"></hr>
            {conference.categoriesSoumission!.map((categorieSoumission, index) => CategorieSoumissionForm(index))}
            <Button variant="secondary" onClick={handleAddCategorieSoumission}><FaCirclePlus className='me-3' /> Ajouter une catégorie de soumission</Button>
            <hr className="dashed"></hr>
            {conference.sessions!.map((session, index) => sessionForm(index))}
            <Button variant="secondary" onClick={handleAddSession}><FaCirclePlus className='me-3' /> Ajouter une session</Button>
            <hr className="dashed"></hr>
            <Button variant="primary" onClick={handleCreateConference}>Créer la conférence</Button>
        </Container>
    );


}

export default SubmitConferenceView;