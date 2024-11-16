import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from '../../modules/AuthContex';

export default function Header() {
    const { user, logout } = useAuth();
    const navigate = useNavigate();

    const handleLogout = () => {
        logout();
        navigate('/');
    };

    function HeaderOnClick () {
        navigate('/');
    }

    return (
        <div className="d-flex justify-content-between align-items-center p-2">
            <button className="btn btn-primary me-2 bg-light text-black" onClick={HeaderOnClick}>Блог, гайды... название!</button>
            <div>
                {user ? (
                    <div className="d-flex align-items-center">
                        <span className="me-3">Пользователь: {user.name}</span>
                        <Link to="/Profile" className="btn btn-primary me-2">Профиль</Link>
                        <button onClick={handleLogout} className="btn btn-secondary">Выйти</button>
                    </div>
                ) : (
                    <div>
                        <Link to="/Login" className="btn btn-primary me-2">Войти</Link>
                        <Link to="/SignUp" className="btn btn-success">Регистрация</Link>
                    </div>
                )}
            </div>
        </div>
    );
}
