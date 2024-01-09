import React, { useEffect } from 'react';
import { AppAvatar } from '../utils/Avatar';
import { User } from '../models/Person';
import '../styles/Profile.css';
import { privateQuery } from '../services';
import { useState } from 'react';
import { API } from '../api/api';
import { CustomTag } from '../utils/CustomTag';
import { Theme } from '../models/Session';
import { Button } from 'react-bootstrap';
import { FaCirclePlus, FaFloppyDisk, FaPenToSquare, FaXmark } from 'react-icons/fa6';
import Select from 'react-select';
import { Conference } from '../models/Conference';
import ConferenceCard from '../utils/ConferenceCard';


function ProfileView() {

    const [user, setUser] = useState<User | undefined>(undefined);
    const [themes, setThemes] = useState<Theme[]>([]);
    const [selectedThemes, setSelectedThemes] = useState<Theme[]>([]);
    const [showAddThemeForm, setShowAddThemeForm] = useState(false);
    const [conferences, setConferences] = useState<Conference[]>([]);
    // TODO: affichage des conférences filtrées par thème dans le profil (centres d'intérêts)

    const fetchData = async () => {
        var user = await API.getUserData();
        var conferences = await API.getConferences({ id_theme_list: user?.profil?.map((theme) => theme.id) });
        setUser(user);
        console.log(conferences);
        setConferences(conferences);
    }

    useEffect(() => {
        fetchData();
        API.getThemes(setThemes);
    }
        , []);

    function handleAddOrEditThemes() {
        setSelectedThemes(user?.profil ?? []);
        setShowAddThemeForm(true);
    }

    async function saveEditedThemes() {
        await API.updateUserThemes2(selectedThemes);
        await fetchData();
        setShowAddThemeForm(false);
    }

    function handleSelectChange(e: any) {
        setSelectedThemes(themes.filter((theme) => {
            return e.map((theme: any) => theme.value).includes(theme.id);
        }));

    }

    function cancelEditThemes() {
        setShowAddThemeForm(false);
    }


    const AddThemeForm = () => {
        const openFormButton = user?.profil !== undefined && user?.profil.length > 0 ?
            <Button variant="contained" color="primary" onClick={handleAddOrEditThemes}>
                <FaPenToSquare className='me-3' />Editer
            </Button> : <Button variant="contained" color="primary" onClick={handleAddOrEditThemes}>
                <FaCirclePlus className='me-3' />Ajouter
            </Button>

        return (
            !showAddThemeForm ? openFormButton :
                <div className='add-theme-form'>
                    <div className='d-flex flex-column'>
                        <label htmlFor='theme'>Sélectionnez vos centres d'intérêts</label>
                        <Select
                            isMulti={true}
                            isClearable={true}
                            onChange={handleSelectChange}
                            defaultValue={selectedThemes.map((theme) => {
                                return { value: theme.id, label: theme.nom }
                            })}
                            options={themes.map((theme) => {
                                return { value: theme.id, label: theme.nom }
                            })}
                        />

                    </div>
                    <Button variant="contained" color="secondary" onClick={cancelEditThemes}>
                        <FaXmark className='me-2' />Annuler
                    </Button>
                    <Button variant="contained" color="primary" onClick={saveEditedThemes}>
                        <FaFloppyDisk className='me-2' />Enregistrer
                    </Button>


                </div>
        )
    }

    return (
        <>
            {user !== undefined &&
                <div className='user-container'>
                    <AppAvatar userName={user.prenom!} userImage='https://www.w3schools.com/howto/img_avatar.png' size={200} />
                    <h2>{user.prenom} {user.nom}</h2>
                    <p className='mail'>{user.email}</p>
                    <h1 className='mt-3'>Mes centres d'intérêts</h1>
                    {user.profil !== undefined && user.profil.length > 0 ?
                        <div>
                            {user.profil.map((theme, index) => {
                                return <CustomTag key={index} color={theme.color} text={theme.nom} />
                            })}
                        </div>
                        : <p>Aucun centre d'intérêt renseigné</p>}

                    <AddThemeForm />

                    
                </div>}
                {
                        conferences.length > 0 ?
                            <div>
                                 <h1 className='mt-3'>Conférences susceptibles de vous intéresser</h1>
                                <div className='list-container' >
                                   
                                    {conferences.map((conference, index) => (
                                        <ConferenceCard key={index} conference={conference} />
                                    ))}
                                </div></div> : <p>Aucune conférence pour les centres d'intérêts renseignés</p>

                    }
        </>

    )
}

export default ProfileView;