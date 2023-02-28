import React, { useState } from "react";
import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import Col from 'react-bootstrap/Col';
import Row from 'react-bootstrap/Row';

const SearchBar = () => {
    const [searchTerm, setSearchTerm] = useState("");
    const handleSearchTermChange = (event) => {
        setSearchTerm(event.target.value);
    }
    const handleFormSubmit = (event) => {
        event.preventDefault();
        //onSearch(searchTerm);
    }

    return (
        <Form onSubmit={handleFormSubmit}>
            <Row style={{textAlign: 'center', display:'block'}}>
                <h3>
                    App name
                </h3>
            </Row>
            <br />
            <Row>
                <Col>
                    <Form.Control size="lg"
                                  type="text"
                                  placeholder="Search..."
                                  value={searchTerm}
                                  onChange={handleSearchTermChange} />
                </Col>
                <Button size="lg" column="lg" lg={2}>
                    Search
                </Button>
            </Row>


        </Form>
    );
}

export default SearchBar;