import React, { useState } from "react";

const DropDownMenu = () => {

    const handleOnChange = (e) => {
        setSelectedOption(e.target.value);
    };

    return (
        <div>
            <select value={selectedOption} onChange={handleOnChange}>
                <option value=""></option>
                <option value="Rating High to Low'">Rating Low to High</option>
                <option value="option2">Rating Low to High</option>
            </select>
            <p>You selected: {selectedOption}</p>
        </div>
    );
};

export default DropDownMenu;



