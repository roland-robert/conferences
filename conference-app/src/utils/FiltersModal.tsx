import React from 'react';

import { Filters } from '../models/Filters';
import { Button, Modal, Offcanvas } from 'react-bootstrap';
import { allCountries, mockSeries, mockThemes, mockTypes } from '../models/mockData';
import { FaLocationDot, FaList, FaUser, FaPalette, FaCircleInfo  } from "react-icons/fa6";
import Select from 'react-select';


interface FiltersModalProps {
    filters: Filters;
    setFilters: (filters: Filters) => void;
    show: boolean;
    onHide: () => void;
}

export function FiltersModal({ filters, setFilters, show, onHide }: FiltersModalProps) {
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
                value={filters.pays}
                onChange={(value) => setFilters(new Filters({ ...filters, pays: value }))}
                options={allCountries.map(
                    (item) => ({ value: item!.id!.toString(), label: item!.nom! })
                )}
            />

            <FilterSelectWithLabel
                label="Série"
                icon={<FaList />}
                value={filters.serie}
                onChange={(value) => setFilters(new Filters({ ...filters, serie: value }))}
                options={mockSeries.map(
                    (item) => ({ value: item.id!.toString(), label: item.nom! })
                )}
            />

            <FilterSelectWithLabel
                label="Thème"
                icon = {<FaPalette />}
                isMulti={true}
                value={filters.themes}
                onChange={(value) => setFilters(new Filters({ ...filters, themes: value }))}
                options={mockThemes.map(
                    (item) => ({ value: item.id!.toString(), label: item.nom! })
                )}
            />

            <FilterSelectWithLabel
                label="Type"
                icon = {<FaCircleInfo  />}
                value={filters.conferenceType}
                onChange={(value) => setFilters(new Filters({ ...filters, conferenceType: value }))}
                options={mockTypes.map(
                    (item) => ({ value: item.id!.toString(), label: item.nom! })
                )}
            />

            <FilterSelectWithLabel
                label="Editeur"
                icon= {<FaUser /> }
                value={filters.conferenceType}
                onChange={(value) => setFilters(new Filters({ ...filters, conferenceType: value }))}
                options={mockTypes.map(
                    (item) => ({ value: item.id!.toString(), label: item.nom! })
                )}
            />
            <Button variant="primary">Appliquer</Button>

        </Offcanvas.Body>
    </Offcanvas>

}

interface FilterSelectWithLabelProps {
    label: string;
    icon?: any;
    options: { value: string, label: string }[];
    isMulti?: boolean;
    isSearchable?: boolean;
    value?: { value: string, label: string } | { value: string, label: string }[];
    onChange?: (value: any) => void;
}

function FilterSelectWithLabel({ label, icon, options, isMulti, onChange, value }: FilterSelectWithLabelProps) {
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
                    onChange={onChange}
                    defaultValue={value}
                    options={options}
                />
            </div>
        </>
    )
}