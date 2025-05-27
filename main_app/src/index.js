import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import './indexAdaptive.css';
import App from './App';
import {KeycloakProvider} from "./modules/KeycloakContext";

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
    <KeycloakProvider>
        <App />
    </KeycloakProvider>
);
