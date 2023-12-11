import React from 'react';

export function CustomTag(props: { color?: string, text?: string }) {
    return (
        <div className='custom-tag' style={{ backgroundColor: props.color }}>
            {props.text}
        </div>
    )

}