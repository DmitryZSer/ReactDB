import React, { useState, useEffect } from 'react';
import { Dropdown, DropdownButton, Form, Card, Button } from 'react-bootstrap';
import axios from 'axios';

export default function ArticlesList() {
    const [tags, setTags] = useState([]);
    const [selectedTag, setSelectedTag] = useState(null);
    const [articles, setArticles] = useState([]);
    const [searchTerm, setSearchTerm] = useState('');

    // Fetch tags and all articles initially
    useEffect(() => {
        const fetchTagsWithArticles = async () => {
            try {
                const response = await axios.get('http://localhost:8081/tags');
                setTags([{ id: null, name: "Все темы" }, ...response.data]); // Adding "All Topics" option
            } catch (error) {
                console.error("Error fetching tags:", error);
            }
        };
        fetchTagsWithArticles();
    }, []);

    // Function to fetch articles based on search and selected tag
    const fetchArticles = async () => {
        try {
            const response = await axios.get('http://localhost:8081/articles', {
                params: {
                    searchTerm,
                    tagId: selectedTag ? selectedTag.id : null
                }
            });
            setArticles(response.data);
        } catch (error) {
            console.error("Error fetching filtered articles:", error);
        }
    };

    // Automatically search when the search term or selected tag changes
    useEffect(() => {
        fetchArticles();
    }, [searchTerm, selectedTag]);

    return (
        <div className="d-flex flex-column min-vh-100 bg-primary">
            <div className="container p-5 bg-white rounded shadow-lg min-vh-100" style={{ width: '100%', maxWidth: '1200px' }}>
                <h2 className="mb-4">Все статьи</h2>
                <div className="d-flex mb-3">
                    {/* Search Input */}
                    <Form.Control
                        type="text"
                        placeholder="Поиск по статьям..."
                        value={searchTerm}
                        onChange={(e) => setSearchTerm(e.target.value)}  // Update search term
                        className="me-2"
                    />

                    {/* Tag Dropdown */}
                    <DropdownButton
                        id="dropdown-tags"
                        title={selectedTag ? selectedTag.name : "Выберите тему"}
                        onSelect={(eventKey) => setSelectedTag(tags.find(tag => tag.id === parseInt(eventKey)) || null)}  // Update selected tag
                        className="ms-2"
                    >
                        {tags.map(tag => (
                            <Dropdown.Item key={tag.id} eventKey={tag.id}>
                                {tag.name}
                            </Dropdown.Item>
                        ))}
                    </DropdownButton>
                </div>

                {/* Articles List */}
                <div className="row">
                    {articles.length === 0 ? (
                        <p>Статьи не найдены</p>
                    ) : (
                        articles.map(article => (
                            <div key={article.id} className="col-md-4 mb-3">
                                <Card>
                                    <Card.Body>
                                        <Card.Title>{article.title}</Card.Title>
                                        <Card.Text>{article.summary}</Card.Text>
                                        <Button variant="primary" href={`/article/${article.id}`}>
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
