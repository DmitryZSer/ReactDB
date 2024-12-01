import React, { useEffect, useState } from 'react';
import { Image } from 'react-bootstrap';
import { useParams } from 'react-router-dom';
import { Link } from 'react-router-dom';

import { getArticleById } from '../modules/Api';
import Comments from './components/Comments';

function ArticleView() {
    const { id } = useParams();
    const [article, setArticle] = useState(null);

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
    }, [id]);

    const [isPressed, setIsPressed] = useState(false);

    const handleClick = () => {
        setIsPressed(!isPressed);
    };

    if (!article) return <div className="d-flex flex-column min-vh-100 bg-primary"><p className="container p-5 bg-white rounded shadow-lg min-vh-100">Идет загрузка...<br/>Или проблема с базой данных ಥ_ಥ</p></div>;

    return (
        <div className="d-flex flex-column min-vh-100 bg-primary">
            <div className="container p-5 bg-white rounded shadow-lg min-vh-100" style={{ width: '100%', maxWidth: '1200px' }}>
                <h1 className="mb-4">{article.title}</h1>
                <p><strong>Автор: {article.authorName}</strong></p>
                <p><strong>Создано:</strong> {new Date(article.created_at).toLocaleDateString()}</p>
                <p><strong></strong> {article.summary}</p>
                <div className="mb-4">
                    <strong>Тэги: </strong>
                    {article.tags.length > 0 ? article.tags.map(tag => (
                        <span key={tag} className="badge bg-secondary me-2">{tag}</span>
                    )) : "Нет отмеченных тегов."}
                </div>
                <div className="mt-4">
                    <p>{article.content}</p>
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
                </div>
                <Comments articleId={id} />
            </div>
        </div>

    );


}

export default ArticleView;
