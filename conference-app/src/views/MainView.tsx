import React, { useEffect, useState } from 'react';
import '../styles/MainView.css';
import ConferenceCard from '../utils/ConferenceCard';
import { Button } from 'react-bootstrap';
import { FaFilter } from 'react-icons/fa6';
import { TitleRow } from '../utils/TitleRow';
import { privateQuery } from '../services';
import { Conference, ConferenceType } from '../models/Conference';
import { Filters } from '../models/Filters';
import { API } from '../api/api';
import { Theme } from '../models/Session';


interface ConferenceViewProps {
    openFilters: () => void;
    filters: Filters;
}

function MainView({ openFilters, filters }: ConferenceViewProps) {

    const [conferences, setConferences] = useState<Conference[]>([]);

    const fetchConferences = async (params: any) => {
        var conferences = await API.getConferences(params);
        setConferences(conferences);
    }


    useEffect(() => {
        var isWorkshop = null;
        if (filters.conferenceType === ConferenceType.CONFERENCE) isWorkshop = false;
        if (filters.conferenceType === ConferenceType.WORKSHOP) isWorkshop = true;
        var params = {
            id_pays: filters.pays?.id,
            id_serie: filters.serie?.id,
            is_workshop: isWorkshop,
            // TODO: filtres thèmes
            id_theme_list : filters.themes?.map((theme) => theme.id),
            min_date: filters.minDate ? new Date(filters.minDate).toISOString() : null,
            max_date: filters.maxDate ? new Date(filters.maxDate).toISOString() : null,
            id_editeur: filters.editeur?.id,
            responsable: filters.responsable != '' ? filters.responsable : null,
        }
        console.log(params);
        fetchConferences(params);
    }, [filters]);


    return (
        <>
            <TitleRow
                title='Appels à communication'
                button={<Button variant="contained" color="primary" onClick={openFilters}>
                    <FaFilter className='me-3' />Filtrer
                </Button>} />

            {conferences.length > 0 ? <div className='list-container' >
                {conferences.map((conference, index) => (
                    <ConferenceCard key={index} conference={conference} />
                ))}
            </div> : <p>Aucun appel à communication pour les filtres sélectionnés</p>}
        </>
    )
}

export default MainView;