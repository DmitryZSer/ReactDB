import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { useParams } from 'react-router-dom';
import { Link } from 'react-router-dom';

import Comments from './components/Comments';

function ArticleView() {
    const { id } = useParams();
    const [article, setArticle] = useState(null);

    useEffect(() => {
        const fetchArticle = async () => {
            try {
                const response = await axios.get(`http://10.66.66.6:8081/article/${id}`);
                setArticle(response.data); 
            } catch (error) {
                console.error("Error fetching the article:", error);
            }
        };
        fetchArticle();
    }, [id]);

    if (!article) return <div>Загружка страницы...</div>;
    
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
                <Link to='/ArticlesList' className='btn btn-primary'>
                    Назад к статьям
                </Link>
                <Comments articleId={id} />
            </div>
        </div>
        
    );

    
}

export default ArticleView;
