import React from 'react'
import { Link } from 'react-router-dom'

export default function Home() {
    return (
        <div className='d-flex vh-100 justify-content-center align-items-center bg-primary'>
            <form>
                <h2>Home page</h2>
                <div>
                    <Link to='/Login' className='btn btn-default border w-60 bg-light'>Back to login</Link>
                    <Link to='/SignUp' className='btn btn-default border w-60 bg-light'>Back to registration</Link>
                </div>
            </form>
        </div>
    )
}