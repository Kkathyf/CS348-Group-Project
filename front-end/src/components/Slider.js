import React, { useState } from "react";

const Slider = (props) => {
    const handleOnChange = (e) => {
        props.setValue(e.target.value);
    };

    return (
        <div>
            <input type="range" min="0" max="10" value={props.value} onChange={handleOnChange} />
            <p>Rating &ge; {props.value}</p>
        </div>
    );
};

export default Slider;