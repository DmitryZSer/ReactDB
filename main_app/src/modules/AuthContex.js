import React, { createContext, useContext, useState, useEffect } from 'react';
import Cookies from 'js-cookie';
import {jwtDecode} from 'jwt-decode';

const AuthContext = createContext();

export const AuthProvider = ({ children }) => {
    const [user, setUser] = useState(null);

    useEffect(() => {
        const token = Cookies.get('auth_token');
        if (token) {
            const decodedUser = jwtDecode(token);
            setUser(decodedUser);
        }
    }, []);

    const login = (token) => {
        Cookies.set('auth_token', token, { expires: 1, secure: true, sameSite: 'Strict' });
        const decodedUser = jwtDecode(token);
        setUser(decodedUser);
    };

    const logout = () => {
        Cookies.remove('auth_token');
        setUser(null);
    };

    return (
        <AuthContext.Provider value={{ user, login, logout }}>
            {children}
        </AuthContext.Provider>
    );
};

export const useAuth = () => useContext(AuthContext);
