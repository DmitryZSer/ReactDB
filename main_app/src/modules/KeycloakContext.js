// modules/KeycloakContext.js
import React, { createContext, useState, useEffect } from 'react';
import Keycloak from 'keycloak-js';

const KeycloakContext = createContext(undefined);

const KeycloakProvider = ({ children }) => {
    const [keycloak, setKeycloak] = useState(null);
    const [authenticated, setAuthenticated] = useState(false);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const initKeycloak = async () => {
            try {
                const kc = new Keycloak({
                    url: "http://localhost:8080",
                    realm: "infozhur",
                    clientId: "infozhur-react-app"
                });

                // Убираем принудительный вход, используем check-sso для проверки сессии
                const auth = await kc.init({
                    onLoad: 'check-sso', // Не требует обязательного входа
                    silentCheckSsoRedirectUri: `${window.location.origin}/silent-check-sso.html`, // Файл для silent check
                    enableLogging: true
                });

                setKeycloak(kc);
                setAuthenticated(auth);
            } catch (error) {
                console.error('Keycloak initialization failed:', error);
            } finally {
                setLoading(false);
            }
        };

        initKeycloak();
    }, []);

    if (loading) {
        return (
            <div style={{
                backgroundColor: 'black',
                color: 'white',
                height: '100vh',
                width: '100vw',
                display: 'flex',
                justifyContent: 'center',
                alignItems: 'center',
                margin: 0,
                padding: 0
            }}>
                Loading...
            </div>
        );
    }


    return (
        <KeycloakContext.Provider value={{ keycloak, authenticated }}>
            {children}
        </KeycloakContext.Provider>
    );
};

export { KeycloakContext, KeycloakProvider };