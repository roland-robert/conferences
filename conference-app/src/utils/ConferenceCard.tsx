import React, { useEffect } from 'react';
import '../styles/ConferenceCard.css'
import { Conference } from '../models/Conference';
import { Badge, Card, ListGroup, Table } from 'react-bootstrap';
import { useNavigate } from 'react-router-dom';
import { Theme } from '../models/Session';
import { FaCalendarDays, FaLocationDot, FaCircleInfo } from "react-icons/fa6";
import { CustomTag } from './CustomTag';


interface ConferenceCardProps {
  conference: Conference;

}

function ConferenceCard({ conference }: ConferenceCardProps) {
  const navigate = useNavigate();
  const [style, setStyle] = React.useState({ width: '24.5%', margin: '.25%' } as React.CSSProperties);

  const handleClick = () => {
    console.log(`ConferenceCard ${conference.id} clicked`);
    navigate(`/conference`, { state: { conference: conference } });
  }

  const showDate = conference.dateDebut && conference.dateFin;
  const showVille = conference.ville?.nom && conference.ville?.pays?.nom;

  var themes: Theme[] = [];
  for (const session of conference.sessions ?? []) {
    for (const theme of session!.themes ?? []) {
      if (!themes.includes(theme))
        themes.push(theme);
    }
  }

  useEffect(() => {
    const handleResize = () => {
      var screenWidth = window.innerWidth;
      var style;
      if (screenWidth < 600) {
        style = { width: '99%', margin: '.5%' }
      }
      else if (screenWidth < 1000) {
        style = { width: '49%', margin: '.5%' }
      }
      else if (screenWidth < 1400) {
        style = { width: '32.83%', margin: '.25%' }
      }
      else {
        style = { width: '24.5%', margin: '.25%' }
      }
      setStyle(style);
    };
    window.addEventListener('resize', handleResize);
    return () => {
      window.removeEventListener('resize', handleResize);
    };
  }, []);



  return (

    <Card className='conf-card' style={style} onClick={handleClick}>
      <Card.Img variant="top" src={require(`../assets/${conference.image}`)} style={{ objectFit: 'cover', aspectRatio: 3 / 2 }} />
      <Card.Body>
        <Card.Title>{conference.intitule}</Card.Title>
        <Card.Text>{conference.texteIntroductif}</Card.Text>
      </Card.Body>
      <hr className='divider' />
      <div className='additional-info-container' >
        {showDate &&
          <div>
            <FaCalendarDays className='me-2' />
            {conference.dateDebut?.toLocaleDateString()} - {conference.dateFin?.toLocaleDateString()}
          </div>}
        {showVille &&
          <div>
            <FaLocationDot className='me-2' />
            {conference.ville?.nom} - {conference.ville?.pays?.nom}
          </div>}
        <div>
          <FaCircleInfo className='me-2' />
          {conference.isWorkshop ? "Workshop" : "Conférence"}
        </div>
        <div >
          {themes.map((theme) => (
            <CustomTag color={theme.color} text={theme.nom} />
          ))}
        </div>
      </div>
    </Card>
  );
}

export default ConferenceCard;
