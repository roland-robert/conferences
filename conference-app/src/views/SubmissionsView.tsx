import React, { useEffect } from 'react';
import { Conference } from '../models/Conference';
import { mockSubmissions } from '../models/mockData';
import ConferenceCard from '../utils/ConferenceCard';
import { Button } from 'react-bootstrap';
import { FaCirclePlus } from "react-icons/fa6";
import { TitleRow } from '../utils/TitleRow';


function SubmissionsView() {

    const [submissions, setSubmissions] = React.useState<Conference[]>([]);
    //TODO: get submissions from backend
    useEffect(() => {
        var data = mockSubmissions;
        setSubmissions(data);
    }, []);


    return (
        <>
            <TitleRow
                title='Mes soumissions'
                button={<Button variant="contained" color="primary" onClick={()=>{}}>
                    <FaCirclePlus className='me-3' />Soumettre une contribution
                </Button>} />
            {submissions.length == 0 ?
                <p>Vous n'avez pas encore soumis de contribution</p> :
                <div className='list-container' >
                    {mockSubmissions.map((conference) => (
                        <ConferenceCard conference={conference} />
                    ))}
                </div>
            }
        </>
    )
}

export default SubmissionsView;