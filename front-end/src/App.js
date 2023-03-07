import logo from './logo.svg';
import './App.css';
import SearchBar from "./components/SearchBar";
import Filter from "./components/Filter";
import Layout from "./components/Layout";
import axios from "axios";
import {useEffect, useState} from "react";
function App() {
    const [data, setData] = useState([]);
    const handleFormSubmit = async (event, input) => {
        event.preventDefault();
        await axios.post('http://localhost:5000', {data: input}).then(
            res => {
                setData(res.data)
            }
        )
        //onSearch(searchTerm);
    };
    const fetchData = async (url) => {
        await axios.get(url).then(
            res => {
                setData(res.data);
            }
        )
    };

    useEffect(() => {
        fetchData('http://localhost:5000');
    }, [])

  return (
    <div className="App">
        <SearchBar handleFormSubmit={handleFormSubmit}/>
        <Filter />
        <Layout data={data}/>
    </div>

  );
}

export default App;
