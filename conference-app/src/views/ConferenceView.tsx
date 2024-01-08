import React, { useEffect } from 'react';
import { Conference } from '../models/Conference';
import { useLocation } from 'react-router-dom';
import { Row, Col, Image, Carousel, Card, Container } from 'react-bootstrap';
import { useState } from 'react';
import ConferenceInformation from '../utils/ConferenceInformation';
import '../styles/ConferenceView.css';
import { privateQuery } from '../services';
import { Session } from '../models/Session';
import { CustomTag } from '../utils/CustomTag';
import { AppAvatar } from '../utils/Avatar';


function ConferenceView(props: any) {
    const location = useLocation();
    const [conference, setConference] = useState<Conference>(location.state.conference);
    const [index, setIndex] = useState(0);

    const getConference = () => {
        privateQuery("GET", `/conference/${conference.id}`)
            .then((events: any) => {
                var conference = Conference.fromJSON(events);
                setConference(conference);
            })
            .catch((err: any) => {
                console.log(err);
            });
    };

    useEffect(() => {
        getConference();
    }, []);

    const handleSelect = (selectedIndex: any) => {
        setIndex(selectedIndex);
    };


    const SessionCarouselItem = React.forwardRef((props: { session: Session }, ref: any) => {
        const session = props.session;
        return (
            <Carousel.Item ref={ref} {...props} >
                <div className='session-carousel-item'>
                    <h3>{session.intitule}</h3>
                    <div>
                        {session.responsables!.map((responsable, index) => (
                            <div key={index} className='d-flex'>
                                <span className='conf-info-label'>{responsable.typeResponsabilite?.nom}:</span>
                                <span > {responsable.utilisateur?.nom} {responsable.utilisateur?.prenom} </span>
                            </div>
                        ))}
                    </div>

                    <Carousel.Caption>
                        <div>
                            {session.themes?.map((theme, index) => (
                                <CustomTag key={index} color={theme.color} text={theme.nom} />
                            ))}
                        </div>

                    </Carousel.Caption>

                </div>

            </Carousel.Item>
        )
    });



    return (
        <Container>
            <Row>
                <h2>{conference.intitule}</h2>
                <Col xs={6} md={8}>
                    <img src={conference.image_url} alt="conference" className='illustration' />
                    <div>
                        {conference.texteIntroductif}
                    </div>
                </Col>
                <Col>
                    <ConferenceInformation conference={conference} />
                </Col>
            </Row>
            <h2>Sessions</h2>
            <div>
                <Carousel activeIndex={index} onSelect={handleSelect} variant='dark'>
                    {conference?.sessions?.map((session: any, index: any) => {
                        return (
                            <SessionCarouselItem key={index} session={session} />
                        )
                    })}
                </Carousel>
            </div>
        </Container>
    )
}

export default ConferenceView;