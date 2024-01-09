import { FaCalendarDays } from "react-icons/fa6";
import Select from "react-select";

export interface FilterSelectWithLabelProps {
    label: string;
    icon?: any;
    options: any[];
    optionMapper: (item: any) => { value: string, label: string } | undefined;
    isMulti?: boolean;
    isSearchable?: boolean;
    value?: any;
    onChange: (value: any) => void;
    isClearable?: boolean;
}

export function FilterSelectWithLabel({ label, icon, options, optionMapper, isMulti, onChange, value, isClearable }: FilterSelectWithLabelProps) {

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
                    isClearable={isClearable??true}
                    onChange={handleChange}
                    defaultValue={isMulti ? value?.map((item: any) => optionMapper(item)) : optionMapper(value)}
                    options={options.map(optionMapper)}
                />
            </div>
        </>
    )
}

export interface FilterDateWithLabelProps {
    label: string;
    value?: string;
    onChange: (value: string) => void;
}



export function FilterDateWithLabel({ label, onChange, value }: FilterDateWithLabelProps) {

    function handleChange(e: any) {
        onChange(e.target.value);
    }
    return (
        <>
            <div className="mb-3">
                <div className='d-flex mb-1'>
                    <div className='me-2'>{<FaCalendarDays />}</div>
                    <label>{label}</label>
                </div>
                <input className='date-input' aria-label="Date" type="date" defaultValue={value?.substring(0, 10)} onChange={handleChange} />
            </div>
        </>
    )
}