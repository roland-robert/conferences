import React, { useEffect } from 'react';
import { Conference } from '../models/Conference';
import ConferenceCard from '../utils/ConferenceCard';
import { Button, Container } from 'react-bootstrap';
import { FaCirclePlus } from "react-icons/fa6";
import { TitleRow } from '../utils/TitleRow';
import { useNavigate } from 'react-router-dom';
import { API } from '../api/api';
import { User } from '../models/Person';


function SubmissionsView() {
    const navigate = useNavigate();
    const [submissions, setSubmissions] = React.useState<Conference[]>([]);
    const [user, setUser] = React.useState<User|undefined>(undefined);

    const fetchData = async () => {
        var user = await API.getUserData();
        setUser(user);
        var conferences = await API.getConferences({ id_utilisateur: user?.id });
        setSubmissions(conferences)
    }

    useEffect(() => {
        fetchData();
    }, []);



    return (
        <>
            <h1>Mes contributions</h1>

            {submissions.length == 0 ?
                <p>Vous n'avez pas encore soumis de contribution</p> :
                <div className='list-container' >
                    {submissions.map((conference, index) => (
                        <ConferenceCard key={index} conference={conference} />
                    ))}
                </div>
            }
        </>
    )
}

export default SubmissionsView;