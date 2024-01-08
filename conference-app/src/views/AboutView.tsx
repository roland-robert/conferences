import React from 'react';
import { Button } from 'react-bootstrap';
import { useToken } from '../services';
import { Buffer } from 'buffer';

function AboutView() {

    const {token} = useToken();


    return (
        <>
            <h1>A propos</h1>
            <p>TODO</p>
            <Button variant="primary" onClick={()=>{}}>Test</Button>
        </>
    )
}

export default AboutView;