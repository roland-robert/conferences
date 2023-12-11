import React from 'react';
import { Conference } from '../models/Conference';
import { useLocation } from 'react-router-dom';
import { Row, Col, Image, Carousel, Card } from 'react-bootstrap';
import { useState } from 'react';
import ConferenceInformation from '../utils/ConferenceInformation';
import '../styles/ConferenceView.css';


function ConferenceView(props: any) {
    const location = useLocation();
    const conference = location.state.conference as Conference;

    const [index, setIndex] = useState(0);

    const handleSelect = (selectedIndex: any) => {
        setIndex(selectedIndex);
    };

    function ExampleCarouselImage(props: any) {
        return (
            <img
                className="d-block align-self-center mx-auto justify-content-center"
                src="https://placehold.co/600x200"
                alt={props.text}
            />
        );
    }

    console.log(props);

    
    return (
        <div>
            <Row>
                <Col xs={6} md={8}>
                    <h1>ConferenceView</h1>
                    <img src={require(`../assets/${conference.image}`)} alt="conference" width='50%' />
                    <h2>{conference.intitule}</h2>
                    <div>
                        {conference.texteIntroductif}
                    </div>
                </Col>
                <Col>
                    <ConferenceInformation conference={conference} />
                </Col>
            </Row>
            <div>
                <Carousel activeIndex={index} onSelect={handleSelect} variant='dark'>
                    <Carousel.Item >
                        <ExampleCarouselImage text="First slide" />
                        <Carousel.Caption>
                            <h3>First slide label</h3>
                            <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
                        </Carousel.Caption>

                    </Carousel.Item>
                    <Carousel.Item>
                        <ExampleCarouselImage text="Second slide" />
                        <Carousel.Caption>
                            <h3>Second slide label</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </Carousel.Caption>
                    </Carousel.Item>
                    <Carousel.Item>
                        <ExampleCarouselImage text="Third slide" />
                        <Carousel.Caption>
                            <h3>Third slide label</h3>
                            <p>
                                Praesent commodo cursus magna, vel scelerisque nisl consectetur.
                            </p>
                        </Carousel.Caption>
                    </Carousel.Item>
                </Carousel>
            </div>
        </div>
    )
}

export default ConferenceView;