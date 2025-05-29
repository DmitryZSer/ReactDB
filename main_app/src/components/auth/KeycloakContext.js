// components/KeycloakContext.js
import React, {createContext, useState, useEffect} from 'react';
import Keycloak from 'keycloak-js';

const KeycloakContext = createContext(undefined);

const KeycloakProvider = ({ children }) => {
    const [keycloak, setKeycloak] = useState(null);
    const [authenticated, setAuthenticated] = useState(false);
    const [loading, setLoading] = useState(true);
    const [user_roles, setUser_roles] = useState([]);
    const [user_id, setUser_id] = useState([]);

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

                if (auth) {
                    // Извлекаем роли из токена после успешной аутентификации
                    const realmRoles = kc.tokenParsed?.realm_access?.roles || [];
                    console.log("ROLES:\n", realmRoles);
                    setUser_roles(realmRoles);

                    const user_id = kc.tokenParsed.sub;
                    console.log("User ID:\n", user_id);
                    setUser_id(user_id);
                }

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
                backgroundColor: 'white',
                color: 'black',
                height: '100vh',
                width: '100vw',
                display: 'flex',
                justifyContent: 'center',
                alignItems: 'center',
                margin: 0,
                padding: 0
            }}>
                Keycloak is Loading...
            </div>
        );
    }


    return (
        <KeycloakContext.Provider value={{ keycloak, authenticated, user_roles, user_id }}>
            {children}
        </KeycloakContext.Provider>
    );
};

export { KeycloakContext, KeycloakProvider };