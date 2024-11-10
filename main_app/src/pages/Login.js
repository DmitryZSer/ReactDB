import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import { useNavigate } from 'react-router-dom';
import Validation from '../modules/validation/LoginValidation'
import axios from 'axios';

function Login() {
    const [values, setValues] = useState({
        email: '',
        password: ''
    });

    const [errors, setErrors] = useState({});
    const navigation = useNavigate();

    const handleInput = (event) => {
        setValues(prev => ({ ...prev, [event.target.name]: event.target.value })); 
    };

    const handleSubmit = async (event) => {
        event.preventDefault();
        
        const validationErrors = Validation(values);
        setErrors(validationErrors); 
        
        if (Object.keys(validationErrors).length === 0) {
            try {
                const response = await axios.post("http://localhost:8081/login", values);
                console.log("Response status:", response.status);
                if (response.status === 200) {
                    console.log("Successful login:", response.data);
                    navigation("/");
                } else if (response.status === 201){
                    console.log("Login failed (email):", response);
                } else if (response.status === 202){
                    console.log("Login failed (password):", response);
                }
            } catch (err) {
                console.error("Error with login request:\n", err);
            }
        }
    };

    return (
        <div className='d-flex vh-100 justify-content-center align-items-center bg-primary'>
            <div className='p-5 bg-white rounded shadow-lg' style={{ width: '400px' }}>
                <form action='' onSubmit={handleSubmit}>
                    <h2 className='mb-4 text-center'>Login</h2>

                    <div className='mb-3'>
                        <label htmlFor='email' className='d-block text-start'><strong>Email</strong></label>
                        <input type='email' name='email' placeholder='Enter Email'
                            onChange={handleInput} className='form-control'></input>
                        {errors.email && <span className='text-danger'> {errors.email} </span>}
                    </div>

                    <div className='mb-3'>
                        <label htmlFor='password' className='d-block text-start'><strong>Password</strong></label>
                        <input type='password' name='password' placeholder='Enter Password'
                            onChange={handleInput} className='form-control'></input>
                        {errors.password && <span className='text-danger'> {errors.password} </span>}
                    </div>

                    <div className='d-flex justify-content-between mt-4'>
                        <button type='submit' className="btn btn-success">Login</button>
                        <Link to="/SignUp" className='btn btn-secondary'>Create Account</Link>
                    </div>
                </form>
            </div>
        </div>
    )
}

export default Login