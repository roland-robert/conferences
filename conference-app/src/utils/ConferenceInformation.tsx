import React from "react";
import { Conference } from "../models/Conference";
import { Card } from "react-bootstrap";
import { FaCalendarDays, FaCircleInfo, FaLocationDot, FaUser, FaAt  } from "react-icons/fa6";

interface ConferenceInformationProps {
    conference: Conference;
}

export default function ConferenceInformation({ conference }: ConferenceInformationProps) {
    const showDate = conference.dateDebut && conference.dateFin;
    const showVille = conference.ville?.nom && conference.ville?.pays?.nom;
    return (
        <Card>
            <Card.Header>
                Informations
            </Card.Header>
            <Card.Body className='px-2 py-0'>
                <div className='conf-info-section'>
                    <Card.Title>
                        Général
                    </Card.Title>
                    {showDate &&
                        <div>
                            <FaCalendarDays className='me-2' />
                            <span className="conf-info-label">Dates:</span>{conference.dateDebut?.toLocaleDateString()} - {conference.dateFin?.toLocaleDateString()}
                        </div>}
                    {showVille &&
                        <div>
                            <FaLocationDot className='me-2' />
                            <span className="conf-info-label">Localisations:</span>{conference.ville?.nom} - {conference.ville?.pays?.nom}
                        </div>}
                    <div>
                        <FaCircleInfo className='me-2' />
                        <span className="conf-info-label">Type:</span>{conference.isWorkshop ? "Workshop" : "Conférence"}
                    </div>
                    <div>
                        <FaUser className='me-2' />
                        <span className="conf-info-label">Editeur:</span>{conference.editeur?.nom}
                    </div>
                </div>
                <hr className='divider' />
                <div className='conf-info-section' >
                    <Card.Title>
                        Organisateur
                    </Card.Title>
                    <div>
                        <FaUser className='me-2' />
                        <span className="conf-info-label">Nom:</span>{conference.organisateur?.nom}
                    </div>
                    <div>
                        <FaAt  className='me-2' />
                        <span className="conf-info-label">Mail:</span>{conference.organisateur?.email}
                    </div>
                    <div>
                        <FaLocationDot  className='me-2' />
                        <span className="conf-info-label">Adresse:</span>{conference.organisateur?.adresse}
                    </div>
                </div>
            </Card.Body>
        </Card>
    )


}