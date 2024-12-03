import React, { useEffect, useState } from 'react';
import { Image } from 'react-bootstrap';
import { useParams, useNavigate } from 'react-router-dom';
import { Link } from 'react-router-dom';

import { jwtDecode } from "jwt-decode";
import Cookies from "js-cookie";

import { deleteArticleById, getArticleById } from '../modules/Api';
import Comments from './components/Comments';

import ReactQuill from 'react-quill';
import "react-quill/dist/quill.bubble.css";
import "katex/dist/katex.min.css";
import "highlight.js/lib/common"; // Импорт базовых языков

function ArticleView() {
    const { id } = useParams();
    const [article, setArticle] = useState(null);
    const [isAdmin, setIsAdmin] = useState(false);

    const navigate = useNavigate()

    useEffect(() => {
        const fetchArticle = async () => {
            try {
                //const response = await axios.get(`http://localhost:8081/article/${id}`);
                //setArticle(response.data);
                const response = await getArticleById(id);
                setArticle(response)
            } catch (error) {
                console.error("Error fetching the article:", error);
            }
        };
        fetchArticle();
        checkAdminStatus();
    }, [id]);

    const [isPressed, setIsPressed] = useState(false);

    const handleClick = () => {
        setIsPressed(!isPressed);
    };

    const checkAdminStatus = () => {
        const token = Cookies.get("auth_token");
        if (!token) return;

        const decoded = jwtDecode(token);
        setIsAdmin(decoded.id === 1); // Проверка прав администратора
    };

    const handleDeleteArticle = async () => {
        if (!window.confirm("Вы уверены, что хотите удалить статью?")) return;

        try {
            await deleteArticleById(id);
            navigate("/");
        } catch (error) {
            console.error("Error deleting comment:", error);
        }
    }

    const modules = {
        syntax: true,
        toolbar: {
            container: [
            ],
        },
    };
    if (!article) return <div className="d-flex flex-column page-container bg-primary"><p className="container p-5 bg-white rounded shadow-lg page-container">Идет загрузка...<br />Или проблема с базой данных ಥ_ಥ</p></div>;

    return (
        <div className="d-flex flex-column bg-primary">
            <div className="page-container container p-4 bg-white rounded shadow-lg" style={{ width: '100%', maxWidth: '1200px' }}>
                <h2 className="mb-4">{article.title}</h2>
                <p><strong>Автор: {article.authorName}</strong></p>
                <p><strong>Создано:</strong> {new Date(article.created_at).toLocaleDateString()}</p>
                <p><strong>Изменено:</strong> {new Date(article.updated_at).toLocaleDateString()}</p>
                <p><strong></strong> {article.summary}</p>
                <div className="mb-2">
                    <strong>Тэги: </strong>
                    {article.tags.length > 0 ? article.tags.map(tag => (
                        <span key={tag} className="badge bg-secondary me-2">{tag}</span>
                    )) : "Нет отмеченных тегов."}
                </div>
                <div className="mt-4">
                    {/* <p>{article.content}</p> */}
                    <ReactQuill
                        theme="bubble"
                        modules={modules}
                        readOnly={true}
                        value={article.content}
                    />
                </div>
                <div>
                    <Link to='/' className='btn btn-primary'>
                        Назад к статьям
                    </Link>

                    <button
                        className='ms-2'
                        style={{ background: 'none', border: 'none', padding: 0, cursor: 'pointer' }}
                        onClick={handleClick}
                    >
                        <Image
                            src={process.env.PUBLIC_URL + '/static/bookmarks.ico'}
                            alt="Bookmark"
                            style={{
                                width: '24px',
                                height: '24px',
                                filter: isPressed ? 'invert(50%) sepia(100%) saturate(5000%) hue-rotate(30deg)' : 'none',
                            }}
                        />
                    </button>
                    {isAdmin && (
                        <>
                            <Link to={`/articles/${id}/edit`} className="btn btn-secondary btn-sm ms-2">
                                Редактировать
                            </Link>
                            <button
                                className="btn btn-sm btn-danger ms-2"
                                onClick={() => handleDeleteArticle()}>
                                Удалить
                            </button>
                        </>
                    )}
                </div>
                <Comments articleId={id} />
            </div>
        </div>

    );


}

export default ArticleView;
