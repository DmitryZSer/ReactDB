import React from 'react';
import { Link } from 'react-router-dom';

export default function Home() {
    return (
        <div className='d-flex vh-100 justify-content-center align-items-center bg-primary'>
            <div className='p-5 bg-white rounded shadow-lg text-center' style={{ width: '300px' }}>
                <h2 className='mb-4'>Home Page</h2>
                <div className='d-flex flex-column'>
                    <Link to='/Login' className='btn btn-primary mb-3 rounded-pill'>
                        Go to Login
                    </Link>
                    <Link to='/SignUp' className='btn btn-secondary rounded-pill'>
                        Go to Registration
                    </Link>
                </div>
            </div>
        </div>
    );
}
