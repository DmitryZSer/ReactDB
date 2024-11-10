import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import Validation from '../modules/InputValidation'

function Login() {
    const [values, setValues] = useState ({
        email: '',
        password: ''
    })

    const[errors, setErrors] = useState({})
    const handleInput = (event) => {
        setValues(prev => ({...prev, [event.target.name]: [event.target.value]}))
    }

    const handleSubmit = (event) => {
        event.preventDefault();
        setErrors(Validation(values));
    }

    return (
    <div className='d-flex vh-100 justify-content-center align-items-center bg-primary'>
        <div className='p-3 bg-white w-25'>
            <form action='' on onSubmit={handleSubmit}>
                <h2>Login</h2>

                <div className='mb-3'>
                    <label htmlFor='email'><strong>Email</strong></label>
                    <input type='email' name='email' placeholder='Enter Email' 
                    onChange={handleInput}    className='form-control'></input>
                   {errors.email && <span className='text-danger'> {errors.email} </span>}
                </div>

                <div className='mb-3'>
                    <label label htmlFor='password'><strong>Password</strong></label>
                    <input type='password' name='password' placeholder='Enter Password'
                    onChange={handleInput} className='form-control'></input>     
                    {errors.password && <span className='text-danger'> {errors.password} </span>}           
                </div>

                <div className='mb-2'>
                    <button type='submit' className="btn m-2 btn-success">Login</button>           
                    <Link to="/SignUp" className='btn btn-default border w-60 bg-light'>Create Account</Link>
                </div>
            </form>
        </div>
    </div>
  )
}

export default Login