import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import Validation from '../modules/InputValidation'

function Login() {
    const [values, setValues] = useState({
        email: '',
        password: ''
    })

    const [errors, setErrors] = useState({})
    const handleInput = (event) => {
        setValues(prev => ({ ...prev, [event.target.name]: [event.target.value] }))
    }

    const handleSubmit = (event) => {
        event.preventDefault();
        setErrors(Validation(values));
    }

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