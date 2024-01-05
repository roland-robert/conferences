import React, { useEffect, useState } from 'react';

import { Filters } from '../models/Filters';
import { Button, Modal, Offcanvas } from 'react-bootstrap';
import { FaLocationDot, FaList, FaUser, FaPalette, FaCircleInfo, FaCalendarDays  } from "react-icons/fa6";
import Select from 'react-select';
import { Pays } from '../models/Localisation';
import { ConferenceType, Serie } from '../models/Conference';
import { Theme } from '../models/Session';
import { API } from '../api/api';





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
    const [currentFilters, setCurrentFilters] = useState<Filters>(filters);

    useEffect(() => {
        //TODO: redux?
        if (!show) return;
        API.getCountries(setCountries);
        API.getSeries(setSeries);
        API.getThemes(setThemes);
    }, [show]);


    function onApply() {
        setFilters(currentFilters);
        onHide();
    }


    return <Offcanvas
        show={show}
        placement='end'
        onHide={onHide}
        size="lg"
        aria-labelledby="contained-modal-title-vcenter"
        centered
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

            <FilterDateWithLabel
                label="Date Min"
                value={new Date('2021-01-01')}
                onChange={()=>{}}
            />

            <FilterDateWithLabel
                label="Date Max"
                value={new Date()}
                onChange={()=>{}}
            />


            {/* <FilterSelectWithLabel
                label="Editeur"
                icon={<FaUser />}
                value={currentFilters.conferenceType}
                onChange={(value) => setCurrentFilters(new Filters({ ...currentFilters, conferenceType: value }))}
                options={mockTypes.map(
                    (item) => ({ value: item.id!.toString(), label: item.nom! })
                )}
            /> */}
            <Button variant="primary" onClick={onApply}>Appliquer</Button>

        </Offcanvas.Body>
    </Offcanvas>

}

interface FilterSelectWithLabelProps {
    label: string;
    icon?: any;
    options: any[];
    optionMapper: (item: any) => { value: string, label: string } | undefined;
    isMulti?: boolean;
    isSearchable?: boolean;
    value?: any;
    onChange: (value: any) => void;
}

function FilterSelectWithLabel({ label, icon, options, optionMapper, isMulti, onChange, value }: FilterSelectWithLabelProps) {

    function handleChange(e: any) {
        if (e == null || e == undefined) {
            onChange(undefined);
            return;
        }
        if (isMulti) {
            var selectedOptions = e.map((e: any) => options.find((option) => optionMapper(option)?.value == e.value)!);
            onChange(selectedOptions);
            return;
        } else {
            var option = options.find((option) => optionMapper(option)?.value == e.value)!;
            onChange(option);
            return;
        }
    }
    return (
        <>
            <div className="mb-3">
                <div className='d-flex mb-1'>
                    {icon && <div className='me-2'>{icon}</div>}
                    <label>{label}</label>
                </div>

                <Select
                    isMulti={isMulti}
                    isClearable={true}
                    onChange={handleChange}
                    defaultValue={isMulti ? value?.map((item: any) => optionMapper(item)) : optionMapper(value)}
                    options={options.map(optionMapper)}
                />
            </div>
        </>
    )
}

interface FilterDateWithLabelProps {
    label: string;
    value?: Date;
    onChange: (value: Date | Date[]) => void;
}

function FilterDateWithLabel({ label, onChange, value }: FilterDateWithLabelProps) {
    return (
        <>
            <div className="mb-3">
                <div className='d-flex mb-1'>
                    <div className='me-2'>{<FaCalendarDays /> }</div>
                    <label>{label}</label>
                </div>

                <input aria-label="Date" type="date" value={value?.toISOString().substring(0,10)}/>

            </div>
        </>
    )
}