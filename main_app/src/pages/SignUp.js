import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import { useNavigate } from 'react-router-dom';
import Validation from '../modules/validation/SignUpValidation';
import axios from 'axios';

export default function SignUp() {
    const [values, setValues] = useState({
        name: '',
        email: '',
        password: '',
        password2: ''
    });

    const [errors, setErrors] = useState({});
    const [serverError, setServerError] = useState(''); 
    const navigation = useNavigate();

    const handleInput = (event) => {
        setValues(prev => ({ ...prev, [event.target.name]: event.target.value }));
        setServerError('');
    };

    const handleSubmit = async (event) => {
        event.preventDefault();

        const validationErrors = Validation(values);
        setErrors(validationErrors);

        if (Object.keys(validationErrors).length === 0) {
            try {
                const { password2, ...dataToSend } = values;
                const response = await axios.post("http://localhost:8081/signup", dataToSend);

                if (response.status === 200) {
                    console.log("Successful registration:", response.data);
                    navigation("/");
                } else if (response.status === 201) {
                    console.log("Registration failed (email):", response);
                    setServerError("Incorrect email.");
                }
            } catch (err) {
                console.error("Error with registration request:\n", err);
            }
        }
    };

    return (
        <div className='d-flex vh-100 justify-content-center align-items-center bg-primary'>
            <div className='p-5 bg-white rounded shadow-lg' style={{ width: '500px' }}>
                <form action='' onSubmit={handleSubmit}>
                    <h2 className='mb-4 text-center'>Регистрация</h2>

                    <div className='mb-3'>
                        <label htmlFor='name' className='d-block text-start'><strong>Имя</strong></label>
                        <input type='text' name='name' placeholder='Enter Name'
                            onChange={handleInput} className='form-control'></input>
                        {errors.name && <span className='text-danger'> {errors.name} </span>}
                    </div>

                    <div className='mb-3'>
                        <label htmlFor='email' className='d-block text-start'><strong>Почта</strong></label>
                        <input type='email' name='email' placeholder='Enter Email'
                            onChange={handleInput} className='form-control'></input>
                        {errors.email && <span className='text-danger'> {errors.email} </span>}
                        {serverError && <span className='text-danger'> {serverError} </span>}
                    </div>

                    <div className='mb-3'>
                        <label htmlFor='password' className='d-block text-start'><strong>Пароль</strong></label>
                        <input type='password' name='password' placeholder='Enter Password'
                            onChange={handleInput} className='form-control'></input>
                        {errors.password && <span className='text-danger'> {errors.password} </span>}
                    </div>

                    <div className='mb-3'>
                        <label htmlFor='password' className='d-block text-start'><strong>Повторите пароль</strong></label>
                        <input type='password' name='password2' placeholder='Enter Password'
                            onChange={handleInput} className='form-control'></input>
                        {errors.password2 && <span className='text-danger'> {errors.password2} </span>}
                    </div>

                    <div className='d-flex justify-content-between mt-4'>
                        <button type='submit' className="btn btn-success">Зарегестрироваться</button>
                        <Link to='/Login' className='btn btn-secondary'>Вернуться к авторизации</Link>
                    </div>
                </form>
            </div>
        </div>
    )
}