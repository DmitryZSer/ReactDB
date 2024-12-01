import React, { useState, useEffect } from 'react';
import axios from 'axios';
import Cookies from 'js-cookie';
import {jwtDecode} from 'jwt-decode';
import { changePassword } from '../modules/Api';

export default function Profile() {
    const [user, setUser] = useState({ name: '', email: '' });
    const [newPassword, setNewPassword] = useState('');
    const [confirmPassword, setConfirmPassword] = useState('');
    const [message, setMessage] = useState('');

    useEffect(() => {
        const token = Cookies.get('auth_token');
        if (token) {
            const decoded = jwtDecode(token);
            setUser({ name: decoded.name, email: decoded.email });
        }
    }, []);

    const handlePasswordChange = async () => {
        if (newPassword !== confirmPassword) {
            setMessage("Пароли не совпадают");
            return;
        }

        try {
            const token = Cookies.get('auth_token');
            await changePassword(newPassword, token)
            setMessage("Пароль успешно изменен");
            console.log("Password changed.")
        } catch (error) {
            setMessage("Ошибка при изменении пароля");
            console.log("Error change password: ", error)
        }
    };

    return (
        <div className="d-flex flex-column min-vh-100 align-items-center justify-content-center bg-primary">
            <div className="container p-5 bg-white rounded shadow-lg" style={{ maxWidth: '500px' }}>
                <h2 className="mb-4">Профиль</h2>
                <p><strong>Имя:</strong> {user.name}</p>
                <p><strong>Почта:</strong> {user.email}</p>
                <hr />
                <h4>Изменение пароля</h4>
                <div className="mb-3">
                    <label>Новый пароль</label>
                    <input
                        type="password"
                        className="form-control"
                        value={newPassword}
                        onChange={(e) => setNewPassword(e.target.value)}
                    />
                </div>
                <div className="mb-3">
                    <label>Подтвердите новый пароль</label>
                    <input
                        type="password"
                        className="form-control"
                        value={confirmPassword}
                        onChange={(e) => setConfirmPassword(e.target.value)}
                    />
                </div>
                {message && <p className="text-danger mt-3">{message}</p>}
                <button className="btn btn-primary" onClick={handlePasswordChange}>Сменить пароль</button>
            </div>
        </div>
    );
}
