import { React, useState } from "react";
import { Navbar, Nav, NavDropdown } from "react-bootstrap";

const Filter = () => {
    const [show, setShow] = useState(false);
    const showDropdown = ()=>{
        setShow(!show);
    }
    const hideDropdown = () => {
        setShow(false);
    }

    const data = ['a', 'b', 'c', 'd'];

    return (
        <Navbar bg="light" expand="lg">
            <Navbar.Brand href="#home">Filters</Navbar.Brand>
            <Navbar.Toggle aria-controls="basic-navbar-nav" />
            <Navbar.Collapse id="basic-navbar-nav">
                <Nav className="mr-auto">
                    <NavDropdown title="Genre" id="basic-nav-dropdown"
                                 show={show}
                                 onMouseEnter={showDropdown}
                                 onMouseLeave={hideDropdown}>
                        <NavDropdown.Item href="#action/3.1">Action</NavDropdown.Item>
                        <NavDropdown.Item href="#action/3.2">Another action</NavDropdown.Item>
                        <NavDropdown.Item href="#action/3.3">Something</NavDropdown.Item>
                        <NavDropdown.Divider />
                        <NavDropdown.Item href="#action/3.4">Separated link</NavDropdown.Item>
                        {data.map((item, index) =>
                            <NavDropdown.Item key={index}>{item}</NavDropdown.Item>
                        )}
                    </NavDropdown>
                    <Nav.Link href="#about">Country</Nav.Link>
                    <Nav.Link href="#contact">Language</Nav.Link>
                    <Nav.Link href="#Year">Year</Nav.Link>
                    <Nav.Link href="#Rating">Rating</Nav.Link>

                </Nav>
            </Navbar.Collapse>

        </Navbar>

    );
};

export default Filter;