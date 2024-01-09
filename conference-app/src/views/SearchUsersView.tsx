import React, { useEffect, useState } from 'react';
import { FilterSelectWithLabel } from '../utils/FiltersInputs';
import { API } from '../api/api';
import { Responsable, TypeResponsabilite, User } from '../models/Person';
import { Container, Table } from 'react-bootstrap';


export default function SearchUsersView() {
    const [users, setUsers] = useState<User[]>([]);
    const [filteredUsers, setFilteredUsers] = useState<User[]>([]);
    const [responsables, setResponsables] = useState<Responsable[]>([]);
    const [selectedTypes, setSelectedTypes] = useState<TypeResponsabilite[]>([]);
    const [typesResponsabilite, setTypesResponsabilite] = useState<TypeResponsabilite[]>([]);


    const fetchData = async () => {
        var users = await API.getUsers();
        var responsables = await API.getResponsables();
        var typesResponsabilite = await API.getTypesResponsabilite();

        setUsers(users);
        setResponsables(responsables);
        setTypesResponsabilite(typesResponsabilite);
    }

    useEffect(() => {
        fetchData();
    }
        , []);

    useEffect(() => {
        if (selectedTypes.length === 0) {
            setFilteredUsers(users);
            return;
        }
        var filteredUsers = responsables.filter((responsable) => selectedTypes.some((type) => type.id === responsable?.typeResponsabilite?.id)).map((responsable) => responsable.utilisateur!);

        setFilteredUsers(filteredUsers);
    }
        , [selectedTypes, users]);

    function handleChange(types: TypeResponsabilite[]) {
        setSelectedTypes(types);
    }

    function optionMapper(item: TypeResponsabilite) {
        return { value: item.id!.toString(), label: item.nom! }
    }

    const UserTable = () => {
        return (<Table striped bordered hover>
            <thead>
                <tr>
                    <th>Prénom</th>
                    <th>Nom</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Responsable de conférence</th>
                </tr>
            </thead>
            <tbody>
                {filteredUsers.map((user, index) => (
                    <tr key={index}>
                        <td>{user.prenom}</td>
                        <td>{user.nom}</td>
                        <td>{user.email}</td>
                        <td>{user.role}</td>
                        <td>{responsables.find((responsable) => responsable.id === user.id) ? 'Oui' : 'Non'}</td>

                    </tr>
                ))}
            </tbody>
        </Table>)
    }

    return (
        <Container>
            <h1>Aperçu des utilisateurs</h1>
            <div className=' mb-4'>
                <FilterSelectWithLabel
                    label='Type de responsabilité'
                    options={typesResponsabilite}
                    optionMapper={optionMapper}
                    isMulti={true}
                    onChange={handleChange}
                    value={selectedTypes}
                />
            </div>
            <UserTable />




        </Container>
    )
}