import React from 'react';
import '../styles/ConferenceListView.css';
import ConferenceCard from '../utils/ConferenceCard';
import { mockConferences } from '../models/mockData';
import { Button } from 'react-bootstrap';
import { FaFilter } from 'react-icons/fa6';
import { TitleRow } from '../utils/TitleRow';


interface ConferenceViewProps {
    openFilters: () => void;
}


function ConferenceListView({ openFilters }: ConferenceViewProps) {

    return (
        <>
            <TitleRow
                title='Appels à communication'
                button={<Button variant="contained" color="primary" onClick={openFilters}>
                    <FaFilter className='me-3' />Filtrer
                </Button>} />

            <div className='list-container' >
                {mockConferences.map((conference) => (
                    <ConferenceCard conference={conference} />
                ))}
            </div>
        </>

    )

}

export default ConferenceListView;