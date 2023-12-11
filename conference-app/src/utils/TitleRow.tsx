import React from 'react';

interface TitleRowProps {
    title: string;
    button?: React.ReactNode;
}

export function TitleRow({ title, button }: TitleRowProps) {
    return (
        <div className='d-flex justify-content-between'>
            <h1>{title}</h1>
            {button}
        </div>
    )
}