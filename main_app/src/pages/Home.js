import React from 'react';
import { Link } from 'react-router-dom';

export default function Home() {
    return (
        <div className='d-flex vh-100 justify-content-center align-items-center bg-primary'>
            <div className='p-5 bg-white rounded shadow-lg text-center' style={{ width: '300px' }}>
                <h2 className='mb-4'>Главная страница</h2>
                <div className='d-flex flex-column'>
                    <Link to='/Login' className='btn btn-primary mb-3 rounded-pill'>
                        Войти
                    </Link>

                    <Link to='/SignUp' className='btn btn-success mb-3 rounded-pill'>
                        Регистрация
                    </Link>

                    <Link to='/ArticlesList' className='btn btn-secondary rounded-pill'>
                        Перейти к статьям
                    </Link>
                </div>
            </div>
        </div>
    );
}
