import React, { useState } from 'react';
import { Alert, Button, Container, Form } from 'react-bootstrap';
import { useNavigate } from 'react-router-dom';
import { API } from '../api/api';
import { useToken } from '../services';
import { User } from '../models/Person';

function LoginView() {
    const navigate = useNavigate();
    const { token, setToken } = useToken();


    const [username, setUsername] = useState<string>('');
    const [password, setPassword] = useState<string>('');
    const [showCreateAccountForm, setShowCreateAccountForm] = useState<boolean>(false);
    const [alert, setAlert] = useState<string | null>('');

    const [newUser, setNewUser] = useState<User>(new User({
        email: '',
        password: '',
        nom: '',
        prenom: '',
    }));


    async function signIn(username: string, password: string) {
        const response: any = await API.loginUser(username, password);
        // If the login is successful, we store the token in the local storage and reload the page.
        if (response?.data?.access_token) {
            setToken(response.data.access_token);
            window.location.reload();
            navigate("/");
        }
        else if (response?.status === 401) {
            setAlert('Nom d\'utilisateur ou mot de passe incorrect');
        }
        else {
            setAlert('Une erreur est survenue');
        }
    }


    const handleLogin = async (e: any) => {
        e.preventDefault();
        // We send the password to the backend.
        signIn(username, password);
    };

    async function handleCreateAccount() {
        //check if all fields are filled
        if (newUser.email?.trim() === '' || newUser.password!.trim() === '' || newUser.nom!.trim() === '' || newUser.prenom!.trim() === '') {
            setAlert('Veuillez remplir tous les champs');
            return;
        }
        //check if user already exists
        var utilisateurs = await API.getUsers();
        var userAlreadyExists = utilisateurs?.filter((utilisateur) => utilisateur.email === newUser.email).length > 0;
        if (userAlreadyExists) {
            setAlert('Un compte existe déjà avec cet email');
            return;
        }
        else {
            //create user
            try{
                await API.createUser(newUser);
                //log in with new user
                signIn(newUser.email!, newUser.password!);
            }
            catch(err){
                setAlert('Une erreur est survenue');
            }
            
            
        }


    }

    function handleSwitchToSignIn() {
        setUsername('');
        setPassword('');
        setAlert(null);
        setShowCreateAccountForm(false);
    }

    function handleSwitchToCreateAccount() {
        setNewUser(new User({
            email: '',
            password: '',
            nom: '',
            prenom: '',
        }))
        setAlert(null);
        setShowCreateAccountForm(true);
    }


    const signInForm = () => {
        return (
            <Form>
                <h1>Se connecter</h1>
                <Form.Group className="mb-3" controlId="signinmail">
                    <Form.Label>Nom d'utilisateur</Form.Label>
                    <Form.Control type="login" placeholder="Nom d'utilisateur" value={username} onChange={(e) => setUsername(e.target.value)} />
                </Form.Group>
                <Form.Group className="mb-3" controlId="signinpassword">
                    <Form.Label>Mot de passe</Form.Label>
                    <Form.Control type="password" placeholder="Mot de passe" value={password} onChange={(e) => setPassword(e.target.value)} />
                </Form.Group>
                <Button className='me-2' variant="primary" onClick={handleLogin}>
                    Se connecter
                </Button>

                <Button variant="secondary" onClick={handleSwitchToCreateAccount}>
                    Créer un compte
                </Button>

            </Form>
        )
    }

    const createAccountForm = () => {
        return (
            <Form>
                <h1>Créer un compte</h1>
                <Form.Group className="mb-3" controlId="createfirstname">
                    <Form.Label>Prénom</Form.Label>
                    <Form.Control type="login" placeholder="John" value={newUser.prenom} onChange={(e) => setNewUser(
                        {
                            ...newUser,
                            prenom: e.target.value
                        })} />
                </Form.Group>
                <Form.Group className="mb-3" controlId="createlastname">
                    <Form.Label>Nom</Form.Label>
                    <Form.Control type="login" placeholder="Doe" value={newUser.nom} onChange={(e) => setNewUser(
                        {
                            ...newUser,
                            nom: e.target.value
                        })} />

                </Form.Group>

                <Form.Group className="mb-3" controlId="createmail">
                    <Form.Label>Email</Form.Label>
                    <Form.Control type="mail" placeholder="john@doe.com" value={newUser.email} onChange={(e) => setNewUser(
                        {
                            ...newUser,
                            email: e.target.value
                        })} />
                </Form.Group>

                <Form.Group className="mb-3" controlId="createpassword">
                    <Form.Label>Mot de passe</Form.Label>
                    <Form.Control type="password" placeholder="Mot de passe" value={newUser.password} onChange={(e) => setNewUser(
                        {
                            ...newUser,
                            password: e.target.value
                        })} />
                </Form.Group>
                <Button className='me-2' variant="primary" onClick={handleCreateAccount}>
                    Créer un compte
                </Button>

                <Button variant="secondary" onClick={handleSwitchToSignIn}>
                    Déjà un compte? Se connecter
                </Button>

            </Form>
        )
    }




    return (
        <>
            {/* <h1>Login</h1> */}
            <Container className='w-50 my-4'>
                {alert && <Alert variant='danger'>{alert}</Alert>}
                {showCreateAccountForm ? createAccountForm() : signInForm()}
            </Container>

        </>
    )
}

export default LoginView;