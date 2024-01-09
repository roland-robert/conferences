import React, { useEffect, useState } from 'react';

import { Filters } from '../models/Filters';
import { Button, Form, Modal, Offcanvas } from 'react-bootstrap';
import { FaLocationDot, FaList, FaUser, FaPalette, FaCircleInfo, FaCalendarDays, FaPencil } from "react-icons/fa6";
import Select from 'react-select';
import { Pays } from '../models/Localisation';
import { ConferenceType, EditeurConference, Serie } from '../models/Conference';
import { Theme } from '../models/Session';
import { API } from '../api/api';
import '../styles/FiltersModal.css';
import { FilterDateWithLabel, FilterSelectWithLabel } from './FiltersInputs';





interface FiltersModalProps {
    filters: Filters;
    setFilters: (filters: Filters) => void;
    show: boolean;
    onHide: () => void;
}

export function FiltersModal({ filters, setFilters, show, onHide }: FiltersModalProps) {

    const [countries, setCountries] = useState<Pays[]>([]);
    const [series, setSeries] = useState<Serie[]>([]);
    const [themes, setThemes] = useState<Theme[]>([]);
    const [editeurs, setEditeurs] = useState<EditeurConference[]>([]);
    const [currentFilters, setCurrentFilters] = useState<Filters>(filters);

    const fetchData = async () => {
        var editeurs = await API.getEditeurs();
        setEditeurs(editeurs);
    }

    useEffect(() => {
        if (!show) return;
        API.getCountries(setCountries);
        API.getSeries(setSeries);
        API.getThemes(setThemes);
        fetchData();

    }, [show]);


    function onApply() {
        setFilters(currentFilters);
        onHide();
    }

    function handleReset() {
        setFilters(new Filters({}));
        setCurrentFilters(new Filters({}));
        onHide();

    }

    // useEffect(() => {
    //     console.log(currentFilters);
    // }, [currentFilters]);


    return <Offcanvas
        show={show}
        placement='end'
        onHide={onHide}
        size="lg"
        aria-labelledby="contained-modal-title-vcenter"
    // centered
    >
        <Offcanvas.Header closeButton>
            <Offcanvas.Title id="contained-modal-title-vcenter">Filtres</Offcanvas.Title>
        </Offcanvas.Header>
        <Offcanvas.Body>
            <FilterSelectWithLabel
                label="Pays"
                icon={<FaLocationDot />}
                value={currentFilters.pays}
                onChange={(value) => setCurrentFilters(new Filters({ ...currentFilters, pays: value }))}
                options={countries}
                optionMapper={(item) => (item === undefined ? undefined : { value: item!.id!.toString(), label: item!.nom! })}
            />

            <FilterSelectWithLabel
                label="Série"
                icon={<FaList />}
                value={currentFilters.serie}
                onChange={(value) => setCurrentFilters(new Filters({ ...currentFilters, serie: value }))}
                options={series}
                optionMapper={(item) => (item === undefined ? undefined : { value: item!.id!.toString(), label: item!.nom! })}
            />

            <FilterSelectWithLabel
                label="Thème"
                icon={<FaPalette />}
                isMulti={true}
                value={currentFilters.themes}
                onChange={(value) => setCurrentFilters(new Filters({ ...currentFilters, themes: value }))}
                options={themes}
                optionMapper={(item) => (item === undefined ? undefined : { value: item!.id!.toString(), label: item!.nom! })}
            />

            <FilterSelectWithLabel
                label="Type"
                icon={<FaCircleInfo />}
                value={currentFilters.conferenceType}
                onChange={(value) => setCurrentFilters(new Filters({ ...currentFilters, conferenceType: value }))}
                options={[ConferenceType.CONFERENCE, ConferenceType.WORKSHOP]}
                optionMapper={(item) => (item === undefined ? undefined : { value: item!.toString(), label: item === ConferenceType.CONFERENCE ? 'Conférence' : 'Workshop' })}
            />

            <FilterSelectWithLabel
                label="Editeur"
                icon={<FaPencil />}
                value={currentFilters.editeur}
                onChange={(value) => setCurrentFilters(new Filters({ ...currentFilters, editeur: value }))}
                options={editeurs}
                optionMapper={(item) => (item === undefined ? undefined : { value: item!.id!.toString(), label: item!.nom! })}
            />
            <Form.Group className="mb-3 me-2 w-100" defaultValue={currentFilters.responsable??""} >
                <Form.Label> <FaUser className='me-2'/>Responsable</Form.Label>
                <Form.Control placeholder='Professeur X' value={currentFilters.responsable??""} onChange={(e:any) => setCurrentFilters(new Filters({ ...currentFilters, responsable: e.target.value }))}/>
            </Form.Group>

            <div className='d-flex justify-content-between'>
                <FilterDateWithLabel
                    label="Date Mini"
                    value={currentFilters.minDate}
                    onChange={(value) => setCurrentFilters(new Filters({ ...currentFilters, minDate: value }))}
                />
                <FilterDateWithLabel
                    label="Date Maxi"
                    value={currentFilters.maxDate}
                    onChange={(value) => setCurrentFilters(new Filters({ ...currentFilters, maxDate: value }))}
                />
            </div>





            {/* <FilterSelectWithLabel
                label="Editeur"
                icon={<FaUser />}
                value={currentFilters.conferenceType}
                onChange={(value) => setCurrentFilters(new Filters({ ...currentFilters, conferenceType: value }))}
                options={mockTypes.map(
                    (item) => ({ value: item.id!.toString(), label: item.nom! })
                )}
            /> */}
            <Button className='me-2' variant="secondary" onClick={handleReset}>Réinitialiser</Button>
            <Button variant="primary" onClick={onApply}>Appliquer</Button>

        </Offcanvas.Body>
    </Offcanvas>

}
