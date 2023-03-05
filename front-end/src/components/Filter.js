import { React, useState } from "react";
import { Navbar, Nav, NavDropdown } from "react-bootstrap";

const Filter = () => {
    /*const [genreShow, setGenreShow] = useState(false);

    const showGenreDropdown = ()=>{
        setGenreShow(!genreShow);
    }

    const hideGenreDropdown = () => {
        setGenreShow(false);
    }
    */
    const genre = ['Action', 'Science Fiction', 'Adventure','Drama', ' Romance'];
    const year = ['Before 1970', '1970-1990', '1990-2000','2000-2010', '2022'];
    const rating = ['below 6.0', '6.0-7.0', '7.0-8.0', '8.0-9.0', 'above 9.0'];


    return (
        <Navbar bg="light" expand="lg">
            <Navbar.Brand href="#home">Filters</Navbar.Brand>
            <Navbar.Toggle aria-controls="basic-navbar-nav" />
            <Navbar.Collapse id="basic-navbar-nav">
                <Nav className="mr-auto">
                    <NavDropdown title="Genre" id="genre-dropdown"
                                /* show={genreShow}
                                 onMouseEnter={showGenreDropdown}
                                 onMouseLeave={hideGenreDropdown}*/
                    >
                        {genre.map((item, index) =>
                            <NavDropdown.Item key={index}>{item}</NavDropdown.Item>
                        )}
                    </NavDropdown>
                    <NavDropdown title="Year" id="year-dropdown"
                                 //show={show}
                                 //onMouseEnter={showDropdown}
                                 //onMouseLeave={hideDropdown}>
                        >
                        {year.map((item, index) =>
                        <NavDropdown.Item key={index}>{item}</NavDropdown.Item>
                    )}
                    </NavDropdown>
                    <NavDropdown title="Rating" id="rating-dropdown"
                                     //show={show}
                                     //onMouseEnter={showDropdown}
                                     //onMouseLeave={hideDropdown}>
                    >{rating.map((item, index) =>
                        <NavDropdown.Item key={index}>{item}</NavDropdown.Item>
                    )}
                    </NavDropdown>

                </Nav>
            </Navbar.Collapse>

        </Navbar>

    );
};

export default Filter;