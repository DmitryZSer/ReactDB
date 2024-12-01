import React, { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import axios from "axios";

import ReactQuill from "react-quill";
import "react-quill/dist/quill.snow.css";
import "katex/dist/katex.min.css";
import hljs from "highlight.js";
import "highlight.js/lib/common"; // Импорт базовых языков

const ArticleEdit = () => {
  const { id } = useParams(); // Получаем ID из URL (если есть)
  const navigate = useNavigate();

  // Состояния для формы
  const [title, setTitle] = useState("");
  const [summary, setSummary] = useState("");
  const [content, setContent] = useState("");
  const [tags, setTags] = useState([]);
  const [allTags, setAllTags] = useState([]); // Все доступные теги
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  // Загрузка всех доступных тегов
  useEffect(() => {
    axios.get("http://localhost:8081/tags")
      .then(response => {
        setAllTags(response.data);
      })
      .catch(error => {
        console.error("Error fetching tags:", error);
      });
  }, []);

  // Загрузка статьи для редактирования
  useEffect(() => {
    if (id) {
      setLoading(true);
      axios.get(`http://localhost:8081/articles/${id}`)
        .then(response => {
          const article = response.data;
          setTitle(article.title);
          setSummary(article.summary);
          setContent(article.content);
          setTags(article.tags || []); // Загружаем теги
        })
        .catch(err => setError(err.message))
        .finally(() => setLoading(false));
    }
  }, [id]);

  // Обработка сохранения статьи
  const handleSave = async () => {
    const articleData = { title, summary, content, tags };

    try {
      setLoading(true);
      if (id) {
        // Если редактируем статью
        await axios.put(`http://localhost:8081/articles/${id}`, articleData);
      } else {
        // Если создаем новую статью
        await axios.post("http://localhost:8081/articles", articleData);
      }
      navigate("/"); // Перенаправление на главную страницу после сохранения
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  const handleTagChange = (e) => {
    const selectedTags = Array.from(e.target.selectedOptions, option => option.value);
    setTags(selectedTags);
  };

  // Модули Quill
  const modules = {
    syntax: true,
    toolbar: {
      container: [
        [{ font: [] }],
        [{ size: ["small", false, "large", "huge"] }],
        [{header: 1}, {header: 2},], // {header: [1, 2, 6, false]}, 
        ["bold", "italic", "underline", "strike"],
        [{ color: [] }, { background: [] }],
        ["blockquote", "code-block"],
        [{ list: "ordered" }, { list: "bullet" }],
        [{ indent: "-1" }, { indent: "+1" }],
        [{ align: [] }], // , { direction: "rtl" }
        ["link", "image", "video", "formula"],
        [{ script: "sub" }, { script: "super" }],
        ["clean"],
      ],
    },
  };

  return (
    <div className="article-edit-container">
      <h1 className="article-edit-title">{id ? "Edit Article" : "Create New Article"}</h1>
      {error && <p className="error-message">{error}</p>}
      {loading ? (
        <p className="loading-message">Loading...</p>
      ) : (
        <form onSubmit={(e) => e.preventDefault()} className="article-edit-form">
          <div className="form-group">
            <label className="form-label">Title:</label>
            <input
              type="text"
              value={title}
              onChange={(e) => setTitle(e.target.value)}
              placeholder="Enter article title"
              className="form-input"
              required
            />
          </div>
          <div className="form-group">
            <label className="form-label">Summary:</label>
            <textarea
              value={summary}
              onChange={(e) => setSummary(e.target.value)}
              placeholder="Enter article summary"
              className="form-input"
              required
            />
          </div>
          <div className="form-group">
            <label className="form-label">Content:</label>
            <ReactQuill
              theme="snow"
              modules={modules}
              value={content}
              onChange={setContent}
              placeholder="Write something amazing..."
              style={{ height: "600px" }}
            />
          </div>
          <div className="form-group">
            <label className="form-label">Tags:</label>
            <select
              multiple
              value={tags}
              onChange={handleTagChange}
              className="form-input"
            >
              {allTags.map(tag => (
                <option key={tag.id} value={tag.name}>{tag.name}</option>
              ))}
            </select>
          </div>
          <div className="form-group">
            <button 
              onClick={handleSave} 
              disabled={loading} 
              className="save-button"
            >
              {id ? "Save Changes" : "Create Article"}
            </button>
          </div>
        </form>
      )}
    </div>
  );
};

export default ArticleEdit;
