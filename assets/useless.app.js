/*
 * Welcome to your app's main JavaScript file!
 *
 * We recommend including the built version of this JavaScript file
 * (and its CSS file) in your base layout (base.html.twig).
 */

// any CSS you import will output into a single css file (app.css in this case)
// assets/js/app.js

// assets/js/app.js
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min';

// Si vous utilisez jQuery avec Bootstrap
import $ from 'jquery';
import 'bootstrap';

import './styles/app.css';
import React from 'react';
import ReactDOM from 'react-dom';

function App() {
    return <h1>Hello, React with Symfony! From app.js</h1>;
}

ReactDOM.render(<App />, document.getElementById('root'));

