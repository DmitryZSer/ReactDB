import React, { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import Validation from '../modules/validation/LoginValidation';
import axios from 'axios';
import Cookies from 'js-cookie';
import { useAuth } from '../modules/AuthContex';

export default function Login() {
    const [values, setValues] = useState({ email: '', password: '' });
    const [errors, setErrors] = useState({});
    const [serverError, setServerError] = useState('');
    const navigate = useNavigate();
    const { login } = useAuth();

    const handleInput = (event) => {
        setValues({ ...values, [event.target.name]: event.target.value });
        setServerError('');
    };

    const handleSubmit = async (event) => {
        event.preventDefault();
        
        const validationErrors = Validation(values);
        setErrors(validationErrors); 
        
        if (Object.keys(validationErrors).length === 0) {
            try {
                const response = await axios.post("http://localhost:8081/login", values);

                if (response.status === 200) {
                    console.log("Login token:", response.data.token)
                    login(response.data.token);
                    //Cookies.set('auth_token', response.data.token);
                    
                    navigate("/");
                } else {
                    setServerError("Invalid email or password.");
                }
            } catch (err) {
                console.error("Login error:", err);
                setServerError("Server error. Please try again later.");
            }
        }
    };

    return (
        <div className='d-flex vh-100 justify-content-center align-items-center bg-primary'>
            <div className='p-5 bg-white rounded shadow-lg' style={{ width: '400px' }}>
                <form action='' onSubmit={handleSubmit}>
                    <h2 className='mb-4 text-center'>Авторизация</h2>

                    <div className='mb-3'>
                        <label htmlFor='email' className='d-block text-start'><strong>Почта</strong></label>
                        <input type='email' name='email' placeholder='Enter Email'
                            onChange={handleInput} className='form-control'></input>
                        {errors.email && <span className='text-danger'> {errors.email} </span>}
                    </div>

                    <div className='mb-3'>
                        <label htmlFor='password' className='d-block text-start'><strong>Пароль</strong></label>
                        <input type='password' name='password' placeholder='Enter Password'
                            onChange={handleInput} className='form-control'></input>
                        {errors.password && <span className='text-danger'> {errors.password} </span>}
                        {serverError && <span className='text-danger'> {serverError} </span>}
                    </div>

                    <div className='d-flex justify-content-between mt-4'>
                        <button type='submit' className="btn btn-success">Войти</button>
                        <Link to="/SignUp" className='btn btn-secondary'>Зарегестрироваться</Link>
                    </div>
                </form>
            </div>
        </div>
    )
}
