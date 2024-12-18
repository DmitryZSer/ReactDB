import React, { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import axios from "axios";

import ReactQuill from "react-quill";
import "react-quill/dist/quill.snow.css";
import "katex/dist/katex.min.css";
import "highlight.js/lib/common";
import { getArticleById, postArticle, putArticleById } from "../modules/Api";

const ArticleEdit = () => {
  const { id } = useParams();
  const navigate = useNavigate();

  const [title, setTitle] = useState("");
  const [summary, setSummary] = useState("");
  const [content, setContent] = useState("");
  const [tags, setTags] = useState([]);
  const [allTags, setAllTags] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  useEffect(() => {
    axios.get("http://localhost:8081/tags")
      .then(response => setAllTags(response.data))
      .catch(error => console.error("Error fetching tags:", error));
  }, []);

  useEffect(() => {
    const handleKeyDown = (event) => {
      if (event.ctrlKey && (event.key === 's' || event.key === "S" || event.key === "ы" || event.key === "Ы")) {
        event.preventDefault(); // Предотвращаем стандартное поведение браузера
        if (id) {
          handleSave();
        }
      }
    };
    window.addEventListener('keydown', handleKeyDown);

    return () => {
      window.removeEventListener('keydown', handleKeyDown);
    };
  },);

  function Exit() {
    if(id) navigate(`/articles/${id}`);
    else navigate('/');
  }

  useEffect(() => {
    if (id) {
      setLoading(true);
      getArticleById(id)
        .then(article => {
          setTitle(article.title);
          setSummary(article.summary);
          setContent(article.content);
          setTags(article.tags || []);
        })
        .catch(err => setError(err.message))
        .finally(() => setLoading(false));
    }
  }, [id]);

  const handleSave = async () => {
    const articleData = { title, summary, content, tags };
    try {
      setLoading(true);
      id ? await putArticleById(id, articleData) : await postArticle(articleData);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  const handleRemoveTag = (tagToRemove) => {
    setTags(tags.filter(tag => tag !== tagToRemove));
  };

  const handleAddTag = (e) => {
    const tagToAdd = e.target.value;
    if (!tags.includes(tagToAdd)) {
      setTags([...tags, tagToAdd]);
    }
  };

  const modules = {
    syntax: true,
    toolbar: {
      container: [
        [{ font: [] }],
        [{ size: ["small", false, "large", "huge"] }],
        [{ header: 1 }, { header: 2 },], // {header: [1, 2, 6, false]}, 
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
    <div className="page-container article-edit-page">
      <div className="sidebar">
        <h2 className="article-edit-title">{id ? "Изменение статьи" : "Создание новой статьи"}</h2>
        {error && <p className="error-message">{error}</p>}
        <div className="form-group">
          <label className="form-label">Заголовок:</label>
          <input
            className="form-input"
            type="text"
            value={title}
            onChange={(e) => setTitle(e.target.value)}
            placeholder="Enter article title"
            required
          />
        </div>
        <div className="form-group">
          <label className="form-label">Краткое содержание:</label>
          <textarea
            className="form-input"
            value={summary}
            onChange={(e) => setSummary(e.target.value)}
            placeholder="Enter article summary"
            required
          />
        </div>
        <div className="form-group">
          <label className="form-label">Тэги:</label>
          <div className="tags-container">
            {tags.map((tag) => (
              <span key={tag} className="badge bg-secondary me-2 mb-2">
                {tag}
                <button
                  className="btn btn-sm btn-danger ms-2"
                  onClick={() => handleRemoveTag(tag)}
                >
                  ×
                </button>
              </span>
            ))}
          </div>
          <select name="tag-theme" onChange={handleAddTag} value="">
            <option value="" disabled>Add a tag</option>
            {allTags.map(tag => (
              <option key={tag.id} value={tag.name}>
                {tag.name}
              </option>
            ))}
          </select>
        </div>

        <div className="d-flex flex-column justify-content-center align-items-center">
          <button name="save-btn"  onClick={handleSave} disabled={loading} className="save-button mb-2">
            {id ? "Сохранить изменения" : "Создать статью"}
          </button>
          <button className="btn btn-primary me-2 bg-light text-black" onClick={Exit}>
            {id ? "Назад к статье" : "Ко всем статьям"}
          </button>
        </div>

      </div>
      <div className="editor">
        <ReactQuill
          className="max-height-container"
          theme="snow"
          modules={modules}
          value={content}
          onChange={setContent}
          placeholder="Write something amazing..."
        //style={{ height: "89vh" }}
        />
      </div>
    </div>
  );
};

export default ArticleEdit;
