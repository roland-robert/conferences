import React from 'react';
import { Button, Container, Form } from 'react-bootstrap';
import { useNavigate } from 'react-router-dom';

function LoginView() {
    const navigate = useNavigate();

    function handleLogin() {
        // TODO
        navigate('/');
    }

    return (
        <>
            <h1>Login</h1>
            <Container className = 'w-50'>
                <Form>
                    <Form.Group className="mb-3" controlId="formBasicEmail">
                        <Form.Label>Nom d'utilisateur</Form.Label>
                        <Form.Control type="login" placeholder="Nom d'utilisateur" />
                    </Form.Group>
                    <Form.Group className="mb-3" controlId="formBasicPassword">
                        <Form.Label>Mot de passe</Form.Label>
                        <Form.Control type="password" placeholder="Mot de passe" />
                    </Form.Group>
                    <Button variant="primary" type="submit" onClick={handleLogin}>
                        Se connecter
                    </Button>
                </Form>
            </Container>

        </>
    )
}

export default LoginView;