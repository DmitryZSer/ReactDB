import React, { useState, useEffect } from "react";
import { Dropdown, DropdownButton, Form, Card, Button } from "react-bootstrap";
import { getArticlesParameters, getTagsWithArticles } from "../modules/Api";
import { Link } from 'react-router-dom';

export default function ArticlesList() {
  const [tags, setTags] = useState([]);
  const [selectedTag, setSelectedTag] = useState(null);
  const [articles, setArticles] = useState([]);
  const [searchTerm, setSearchTerm] = useState("");

  useEffect(() => {
    const fetchTagsWithArticles = async () => {
      try {
        const response = await getTagsWithArticles();
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
          tagId: selectedTag ? selectedTag.id : null,
        },
      });
      setArticles(response);
    } catch (error) {
      console.error("Error fetching filtered articles:", error);
    }
  };

  useEffect(() => {
    fetchArticles();
  }, [searchTerm, selectedTag]);

  if (!articles)
    return (
      <div className="d-flex flex-column min-vh-100 bg-light">
        <p className="container p-5 bg-white rounded shadow-lg text-center">
          Какая-то проблема с базой данных ಥ_ಥ
        </p>
      </div>
    );

  return (
    <div className="articles-list-container d-flex flex-column bg-primary">
      <div className="page-container container p-5 bg-white rounded shadow-lg" style={{ width: "100%", maxWidth: "1200px" }}>
        {/* <h2 className="mb-4 text-center text-primary">Все статьи</h2> */}
        <Link to={`/articles/new`} className="btn btn-success mb-4">
          Создать новую статью
        </Link>
        <div className="d-flex align-items-center mb-4">
          <Form.Control
            name="main-search"
            type="text"
            placeholder="Поиск по статьям..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            className="me-2"
          />
          <DropdownButton
            id="dropdown-tags"
            title={selectedTag ? selectedTag.name : "Выберите тему"}
            onSelect={(eventKey) =>
              setSelectedTag(tags.find((tag) => tag.id === parseInt(eventKey)) || null)
            }
            className="ms-2"
          >
            {tags.map((tag) => (
              <Dropdown.Item key={tag.id} eventKey={tag.id}>
                {tag.name}
              </Dropdown.Item>
            ))}
          </DropdownButton>
        </div>

        <div className="row">
          {articles.length === 0 ? (
            <p className="text-center text-muted">
              Статьи не найдены... <br />
              (⊙﹏⊙∥) (＠_＠;) (´。＿。｀)
            </p>
          ) : (
              articles.map((article) => (
                <div key={article.id} className="col-lg-4 col-md-6 mb-4">
                  <Link to={`/articles/${article.id}`} className="text-decoration-none">
                    <Card className="shadow border-0 h-100">
                      <Card.Img
                        variant="top"
                        src={article.image || "https://i.ytimg.com/vi/NTCZobABtmo/maxresdefault.jpg"}
                        alt="Article Thumbnail"
                      />
                      <Card.Body>
                        <Card.Title className="text-truncate">{article.title}</Card.Title>
                        <Card.Text className="text-muted">{article.summary}</Card.Text>
                      </Card.Body>
                    </Card>
                  </Link>
                </div>
              ))
          )}
        </div>
      </div>
    </div>
  );
}
