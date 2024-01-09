import React from "react";
import { CategorieSoumission, Conference } from "../models/Conference";
import { Card, Tab, Tabs } from "react-bootstrap";
import { FaCalendarDays, FaCircleInfo, FaLocationDot, FaUser, FaAt, FaFont, FaComputer, FaCalendarCheck, FaRegFileLines, FaBookOpen } from "react-icons/fa6";

interface ConferenceInformationProps {
    conference: Conference;
}

export default function ConferenceInformation({ conference }: ConferenceInformationProps) {
    const showDate = conference.dateDebut && conference.dateFin;
    const showVille = conference.ville?.nom && conference.ville?.pays?.nom;

    const Informations = () => {
        return (
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
                            <span className="conf-info-label">Localisation:</span>{conference.ville?.nom} - {conference.ville?.pays?.nom}
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
                        <FaAt className='me-2' />
                        <span className="conf-info-label">Mail:</span>{conference.organisateur?.email}
                    </div>
                    <div>
                        <FaLocationDot className='me-2' />
                        <span className="conf-info-label">Adresse:</span>{conference.organisateur?.adresse}
                    </div>
                </div>

            </Card.Body>
        )
    }


    const CategorieSoumissions = () => {
        const CategorieSoumission = ({ categorieSoumission, isLast }: { categorieSoumission: CategorieSoumission, isLast: boolean }) => {
            return (
                <>
                    <div className='conf-info-section'>
                        <Card.Title>
                            {categorieSoumission.nom}
                        </Card.Title>

                        {categorieSoumission.typeLogiciel && <div>
                            <FaRegFileLines className='me-2' />
                            <span className="conf-info-label">Type:</span>{categorieSoumission.typeLogiciel}
                        </div>}

                        {categorieSoumission.nombreMaxiPages && <div>
                            <FaBookOpen className='me-2' />
                            <span className="conf-info-label">Nombre maximum de pages:</span>{categorieSoumission.nombreMaxiPages}
                        </div>}
                        {categorieSoumission.font && <div>
                            <FaFont className='me-2' />
                            <span className="conf-info-label">Police:</span>{categorieSoumission.font} {categorieSoumission.fontSize}
                        </div>}

                        {categorieSoumission.dateSoumission && <div>
                            <FaCalendarDays className='me-2' />
                            <span className="conf-info-label">Date limite de soumission:</span>{categorieSoumission.dateSoumission?.toLocaleDateString()}
                        </div>}
                        {categorieSoumission.dateNotificationAcceptation && <div>
                            <FaCalendarCheck className='me-2' />
                            <span className="conf-info-label">Date de notification d'acceptation:</span>{categorieSoumission.dateNotificationAcceptation?.toLocaleDateString()}
                        </div>}
                        {categorieSoumission.dateLimiteEnvoiSersionCorrigee && <div>
                            <FaCalendarDays className='me-2' />
                            <span className="conf-info-label">Date limite d'envoi de version corrigée:</span>{categorieSoumission.dateLimiteEnvoiSersionCorrigee?.toLocaleDateString()}
                        </div>}


                    </div>
                    {!isLast && <hr className='divider' />}
                </>
            )
        }
        return (
            <Card.Body className='px-2 py-0'>
                <div className='conf-info-section'>
                    {conference.categoriesSoumission?.length == 0 && <div className='d-flex justify-content-center'>Aucune catégorie de soumission spécifiée</div>}
                    {conference.categoriesSoumission?.map((categorie: CategorieSoumission, index) => (
                        <CategorieSoumission key={index} categorieSoumission={categorie} isLast={index == conference.categoriesSoumission!.length - 1} />
                    ))}
                </div>
            </Card.Body>
        )
    }



    return (
        <Card >
            <div className='conf-info-container'>

                <Tabs
                    defaultActiveKey="info"
                    id="uncontrolled-tab-example"
                    fill
                    className="mb-3"
                >
                    <Tab eventKey="info" title="Informations">
                        <Informations />
                    </Tab>
                    <Tab eventKey="categories" title="Catégories soumissions">
                        <CategorieSoumissions />
                    </Tab>

                </Tabs>
            </div>

        </Card>
    )


}