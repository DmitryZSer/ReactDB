// gui_elements/components/Header.js
import { useNavigate } from 'react-router-dom';
import { KeycloakContext } from '../../components/auth/KeycloakContext';
import React, { useContext } from 'react';

export default function Header() {
    const { keycloak } = useContext(KeycloakContext);
    const navigate = useNavigate();

    const handleLogout = () => {
        keycloak.logout(); // Выход через Keycloak
        navigate('/');
    };

    const handleLogin = () => {
        keycloak.login(); // Вход через Keycloak
    };

    const handleRegister = () => {
        keycloak.register(); // Регистрация через Keycloak
    };

    const handleProfile = () => {
        keycloak.accountManagement(); // Переход к управлению аккаунтом через Keycloak
    };

    function HeaderOnClick() {
        navigate('/');
    }

    return (
        <header id="header">
            <div className="d-flex justify-content-between align-items-center p-2">
                <button className="btn btn-primary me-2 bg-light text-black" onClick={HeaderOnClick}>
                    InfoZhur
                </button>
                <div>
                    {keycloak?.authenticated ? (
                        <div className="d-flex align-items-center">
                            {/* Отображение имени пользователя из токена */}
                            <span id="user-profile-name" className="me-3">
                                Пользователь: {keycloak.tokenParsed?.preferred_username || 'User'}
                            </span>
                            <button onClick={handleProfile} className="btn btn-primary me-2">Профиль</button>
                            <button onClick={handleLogout} className="btn btn-secondary">Выйти</button>
                        </div>
                    ) : (
                        <div>
                            <button onClick={handleLogin} className="btn btn-primary me-2">Войти</button>
                            <button onClick={handleRegister} className="btn btn-success">Регистрация</button>
                        </div>
                    )}
                </div>
            </div>
        </header>
    );
}