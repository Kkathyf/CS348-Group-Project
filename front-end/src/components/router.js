import React from 'react';
import { BrowserRouter, Route, Switch } from 'react-router-dom';

import Main from './Layout';
import Comments from './Comment';
import Contact from './Contact';

function Router() {
    return (
        <BrowserRouter>
            <Switch>
                <Route exact path="/" component={Home} />
                <Route path="/about" component={About} />
                <Route path="/contact" component={Contact} />
            </Switch>
        </BrowserRouter>
    );
}

export default Router;