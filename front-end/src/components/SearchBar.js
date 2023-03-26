import React, { useState } from "react";
import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import Col from 'react-bootstrap/Col';
import Row from 'react-bootstrap/Row';

const SearchBar = (props) => {
    const handleSearchTermChange = (event) => {
        props.setSearchTerm(event.target.value);
    }

    return (
        <Form>
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
                                  value={props.searchTerm}
                                  onChange={handleSearchTermChange} />
                </Col>
                <Button type="submit" size="lg" column="lg" lg={2}>
                    Search
                </Button>
            </Row>


        </Form>
    );
}

export default SearchBar;