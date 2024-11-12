import React, { useEffect, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import Cookies from 'js-cookie';
import {jwtDecode} from 'jwt-decode';
import axios from 'axios';

export default function Header() {
    const [user, setUser] = useState(null);
    const navigate = useNavigate();

    useEffect(() => {
        // Check for the token and decode user information on mount
        const token = Cookies.get('auth_token');
        if (token) {
            const decodedUser = jwtDecode(token);
            setUser(decodedUser);
        }
    }, []);

    const handleLogout = () => {
        Cookies.remove('auth_token');
        setUser(null);
        navigate('/');
    };

    return (
        <div className="d-flex justify-content-between align-items-center p-2">
            <h2 className="">Блог начинающего разраба</h2>
            <div>
                {user ? (
                    <div className="d-flex align-items-center">
                        <span className="me-3">Привет, {user.name}!</span>
                        <button onClick={handleLogout} className="btn btn-secondary">Выйти</button>
                    </div>
                ) : (
                    <div>
                        <Link to="/Login" className="btn btn-primary me-2">Войти</Link>
                        <Link to="/SignUp" className="btn btn-success">Регистрация</Link>
                    </div>
                )}
            </div>
        </div>
    );
}
