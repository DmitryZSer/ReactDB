import React, { useState, useEffect } from 'react';
import { Dropdown, DropdownButton, Form, Card, Button } from 'react-bootstrap';
import { getArticlesParameters, getTagsWithArticles } from '../modules/Api';

export default function ArticlesList() {
    const [tags, setTags] = useState([]);
    const [selectedTag, setSelectedTag] = useState(null);
    const [articles, setArticles] = useState([]);
    const [searchTerm, setSearchTerm] = useState('');

    useEffect(() => {
        const fetchTagsWithArticles = async () => {
            try {
                 const response = await getTagsWithArticles();
                //const response = await axios.get('http://localhost:8081/tags');
                setTags([{ id: null, name: "Все темы" }, ...response]);
            } catch (error) {
                console.error("Error fetching tags:", error);
            }
        };
        fetchTagsWithArticles();
    }, []);

    const fetchArticles = async () => {
        try {
           const response = await getArticlesParameters({
                params: {
                    searchTerm,
                    tagId: selectedTag ? selectedTag.id : null
                }
            });
            setArticles(response);
        } catch (error) {
            console.error("Error fetching filtered articles:", error);
        }
    };

    useEffect(() => {
        fetchArticles();
    // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [searchTerm, selectedTag]);

    if (!articles)  return <div className="d-flex flex-column min-vh-100 bg-primary"><p className="container p-5 bg-white rounded shadow-lg min-vh-100"><br/>Какая-то проблема с базой данных ಥ_ಥ</p></div>;
    
    return (
        <div className="d-flex flex-column min-vh-100 bg-primary">
            <div className="container p-5 bg-white rounded shadow-lg min-vh-100" style={{ width: '100%', maxWidth: '1200px' }}>
                <h2 className="mb-4">Все статьи</h2>
                <div className="d-flex mb-3">
                    <Form.Control
                        type="text"
                        placeholder="Поиск по статьям..."
                        value={searchTerm}
                        onChange={(e) => setSearchTerm(e.target.value)}
                        className="me-2"
                    />

                    <DropdownButton
                        id="dropdown-tags"
                        title={selectedTag ? selectedTag.name : "Выберите тему"}
                        onSelect={(eventKey) => setSelectedTag(tags.find(tag => tag.id === parseInt(eventKey)) || null)} 
                        className="ms-2"
                    >
                        {tags.map(tag => (
                            <Dropdown.Item key={tag.id} eventKey={tag.id}>
                                {tag.name}
                            </Dropdown.Item>
                        ))}
                    </DropdownButton>
                </div>

                <div className="row">
                    {articles.length === 0 ? (
                        <p>Идет загрузка...<br/>Или проблема с базой данных ಥ_ಥ</p>
                    ) : (
                        articles.map(article => (
                            <div key={article.id} className="col-md-4 mb-3">
                                <Card>
                                    <Card.Body>
                                        <Card.Title>{article.title}</Card.Title>
                                        <Card.Text>{article.summary}</Card.Text>
                                        <Button variant="primary" href={`/articles/${article.id}`}>
                                            Читать статью
                                        </Button>
                                    </Card.Body>
                                </Card>
                            </div>
                        ))
                    )}
                </div>
            </div>
        </div>
    );
}
