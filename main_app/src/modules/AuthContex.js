import React, { createContext, useContext, useState, useEffect, useMemo, useCallback } from 'react';
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

    const login = useCallback((token) => {
        Cookies.set('auth_token', token, { expires: 1, secure: true, sameSite: 'Strict' });
        const decodedUser = jwtDecode(token);
        setUser(decodedUser);
    }, []);

    const logout = useCallback(() => {
        Cookies.remove('auth_token');
        setUser(null);
    }, []);

    const contextValue = useMemo(() => ({
        user,
        login,
        logout,
    }), [user, login, logout]);

    return (
        <AuthContext.Provider value={contextValue}>
            {children}
        </AuthContext.Provider>
    );
};

export const useAuth = () => useContext(AuthContext);