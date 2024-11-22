// assets/js/index.js
import React from 'react';
import ReactDOM from 'react-dom/client'; // Utilisation de la nouvelle API de React 18
import App from './js/components/App';

// Importez app.js 
import './js/components/App.js';

const rootElement = document.getElementById('root');
const root = ReactDOM.createRoot(rootElement);
root.render(<App />);
