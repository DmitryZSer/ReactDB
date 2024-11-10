import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import { useNavigate } from 'react-router-dom';
import Validation from '../modules/InputValidation';
import axios from 'axios';

function SignUp() {
    const [values, setValues] = useState({
        name: '',
        email: '',
        password: ''
    });

    const [errors, setErrors] = useState({});
    
    const handleInput = (event) => {
        setValues(prev => ({ ...prev, [event.target.name]: event.target.value }));
    };
    
    const navigation = useNavigate();
    const handleSubmit = async (event) => {
        event.preventDefault();
        
        const validationErrors = Validation(values);
        setErrors(validationErrors); 
        
        // Если ошибок нет, отправляем запрос
        if (Object.keys(validationErrors).length === 0) {
            try {
                const response = await axios.post("http://localhost:8081/reactdb",  values);
                console.log("Success registration:\n" ,response);
                navigation("/")
            } catch (err) {
                console.log("Error with registration:\n" ,err);
            }
        }
    };

    return (
        <div className='d-flex vh-100 justify-content-center align-items-center bg-primary'>
            <div className='p-3 bg-white w-25'>
                <h2>Registration</h2>
                <form onSubmit={handleSubmit}>
                    <div className='mb-3'>
                        <label htmlFor='name'><strong>Name</strong></label>
                        <input type='text' name='name' placeholder='Enter Name'
                            onChange={handleInput} className='form-control'></input>
                        {errors.name && <span className='text-danger'> {errors.name} </span>}
                    </div>

                    <div className='mb-3'>
                        <label htmlFor='email'><strong>Email</strong></label>
                        <input type='email' name='email' placeholder='Enter Email'
                            onChange={handleInput} className='form-control'></input>
                        {errors.email && <span className='text-danger'> {errors.email} </span>}
                    </div>

                    <div className='mb-3'>
                        <label htmlFor='password'><strong>Password</strong></label>
                        <input type='password' name='password' placeholder='Enter Password'
                            onChange={handleInput} className='form-control'></input>
                        {errors.password && <span className='text-danger'> {errors.password} </span>}
                    </div>

                    <div className='mb-2'>
                        <button type='submit' className="btn m-2 btn-success">Sign up</button>
                        <Link to='/Login' className='btn btn-default border w-60 bg-light'>Back to login</Link>
                    </div>
                </form>
            </div>
        </div>
    )
}

export default SignUp;