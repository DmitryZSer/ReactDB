-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 16 2024 г., 21:25
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `reactdb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `summary` text DEFAULT NULL,
  `content` text NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `articles`
--

INSERT INTO `articles` (`id`, `title`, `summary`, `content`, `author_id`, `created_at`, `updated_at`) VALUES
(1, 'Основы JavaScript', 'Краткий гайд по основам JavaScript', 'Полное руководство по основам JavaScript, включая синтаксис, типы данных и функции.', 43, '2024-11-11 18:28:32', NULL),
(2, 'Создание веб-приложения с React', 'Пошаговый гайд по созданию веб-приложения на React', 'Детальный разбор процесса создания SPA с использованием React и современных библиотек.', 44, '2024-11-11 18:28:32', NULL),
(3, 'Настройка Git и GitHub', 'Учимся работать с Git и GitHub', 'Практическое руководство по установке, настройке и основам работы с Git и GitHub.', 45, '2024-11-11 18:28:32', NULL),
(4, 'Работа с MySQL', 'Основы работы с реляционными базами данных на примере MySQL', 'Операции CRUD, работа с индексами и оптимизация запросов в MySQL.', 43, '2024-11-11 18:28:32', NULL),
(5, 'Основы Python для начинающих', 'Краткий гайд по Python для новичков', 'Основы Python, включая типы данных, циклы и функции.', 44, '2024-11-11 18:28:32', NULL),
(6, 'Алгоритмы и структуры данных', 'Гид по алгоритмам и структурам данных', 'Разбираем основные алгоритмы: сортировки, поиска и структуры данных.', 45, '2024-11-11 18:28:32', NULL),
(7, 'DevOps: Введение в Docker', 'Основы Docker для начинающих DevOps инженеров', 'Объяснение работы Docker, создание контейнеров и управление ими.', 43, '2024-11-11 18:28:32', NULL),
(8, 'Пишем SQL-запросы', 'Гайд по написанию SQL-запросов для начинающих', 'Полное руководство по созданию запросов в SQL: SELECT, JOIN, GROUP BY.', 44, '2024-11-11 18:28:32', NULL),
(9, 'Создание REST API на Node.js', 'Создаем API с помощью Express и Node.js', 'Подробное руководство по созданию RESTful API с использованием Node.js и Express.', 45, '2024-11-11 18:28:32', NULL),
(10, 'Тестирование кода на JavaScript', 'Гид по тестированию кода на JavaScript', 'Пошаговое руководство по написанию и запуску тестов для JavaScript кода.', 43, '2024-11-11 18:28:32', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `article_tags`
--

CREATE TABLE `article_tags` (
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `article_tags`
--

INSERT INTO `article_tags` (`article_id`, `tag_id`) VALUES
(1, 1),
(1, 6),
(2, 2),
(2, 8),
(3, 2),
(3, 10),
(4, 3),
(4, 9),
(5, 1),
(5, 7),
(6, 1),
(6, 5),
(7, 2),
(7, 4),
(8, 3),
(8, 9),
(9, 2),
(9, 6),
(10, 2),
(10, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `parent_comment_id` int(11) DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `article_id`, `user_id`, `parent_comment_id`, `content`, `created_at`) VALUES
(1, 2, 1, NULL, 'cerf', '2024-11-16 19:50:50'),
(2, 2, 1, 1, 'сука', '2024-11-16 19:50:53'),
(3, 2, 1, 2, 'сука', '2024-11-16 19:50:56'),
(4, 2, 1, 3, 'суа', '2024-11-16 19:51:09'),
(5, 2, 1, 4, 'суа', '2024-11-16 19:51:12'),
(6, 2, 1, 5, 'а', '2024-11-16 19:51:15'),
(7, 2, 1, 6, 'а', '2024-11-16 19:51:17'),
(8, 2, 1, 7, 'а', '2024-11-16 19:51:19'),
(9, 2, 1, 8, 'а', '2024-11-16 19:51:20'),
(10, 2, 1, 9, 'а', '2024-11-16 19:51:22'),
(11, 2, 1, 10, 'а', '2024-11-16 19:51:24'),
(12, 2, 1, 11, 'Для добавления раздела комментариев с поддержкой дерева ответов под каждой статьей, давай реализуем следующие шаги:\n\n---\n\n### Шаг 1: Добавление таблиц для комментариев в базе данных\n\nДобавим таблицы для комментариев в базу данных:\n\n```sql\n-- Table for storing comments\nCREATE TABLE comments (\n    id INT PRIMARY KEY AUTO_INCREMENT,\n    article_id INT NOT NULL,\n    user_id INT NOT NULL,\n    parent_comment_id INT DEFAULT NULL, -- For replies to other comments\n    content TEXT NOT NULL,\n    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,\n    FOREIGN KEY (article_id) REFERENCES articles(id) ON DELETE CASCADE,\n    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,\n    FOREIGN KEY (parent_comment_id) REFERENCES comments(id) ON DELETE CASCADE\n);\n```\n\n---\n\n### Шаг 2: Серверная часть для работы с комментариями\n\nДобавим маршруты в `server.js` для получения, добавления и удаления комментариев.\n\n#### 2.1 Получение комментариев для статьи:\n\n```javascript\napp.get(\'/comments/:articleId\', (req, res) => {\n    const articleId = req.params.articleId;\n\n    const sql = `\n        SELECT c.id, c.content, c.created_at, c.parent_comment_id, u.name AS author\n        FROM comments c\n        JOIN users u ON c.user_id = u.id\n        WHERE c.article_id = ?\n        ORDER BY c.created_at ASC\n    `;\n\n    db.query(sql, [articleId], (err, results) => {\n        if (err) {\n            console.error(\"Error fetching comments:\", err);\n            return res.status(500).json({ message: \"Internal Server Error\" });\n        }\n        res.json(results);\n    });\n});\n```\n\n#### 2.2 Добавление комментария:\n\n```javascript\napp.post(\'/comments\', (req, res) => {\n    const { articleId, userId, parentCommentId, content } = req.body;\n\n    const sql = `\n        INSERT INTO comments (article_id, user_id, parent_comment_id, content)\n        VALUES (?, ?, ?, ?)\n    `;\n\n    db.query(sql, [articleId, userId, parentCommentId || null, content], (err, result) => {\n        if (err) {\n            console.error(\"Error adding comment:\", err);\n            return res.status(500).json({ message: \"Internal Server Error\" });\n        }\n        res.status(201).json({ message: \"Comment added successfully\", commentId: result.insertId });\n    });\n});\n```\n\n---\n\n### Шаг 3: Создание интерфейса для комментариев\n\nДобавим компонент `Comments.js` для отображения, добавления и ответа на комментарии.\n\n#### Компонент `Comments.js`:\n\n```javascript\nimport React, { useState, useEffect } from \'react\';\nimport axios from \'axios\';\nimport Cookies from \'js-cookie\';\nimport jwt_decode from \'jwt-decode\';\n\nexport default function Comments({ articleId }) {\n    const [comments, setComments] = useState([]);\n    const [newComment, setNewComment] = useState(\'\');\n    const [replyTo, setReplyTo] = useState(null);\n\n    useEffect(() => {\n        fetchComments();\n    }, []);\n\n    const fetchComments = async () => {\n        try {\n            const response = await axios.get(`http://localhost:8081/comments/${articleId}`);\n            setComments(response.data);\n        } catch (error) {\n            console.error(\"Error fetching comments:\", error);\n        }\n    };\n\n    const handleAddComment = async () => {\n        const token = Cookies.get(\'auth_token\');\n        if (!token) return;\n\n        const decoded = jwt_decode(token);\n\n        try {\n            await axios.post(\'http://localhost:8081/comments\', {\n                articleId,\n                userId: decoded.id,\n                parentCommentId: replyTo,\n                content: newComment\n            });\n            setNewComment(\'\');\n            setReplyTo(null);\n            fetchComments();\n        } catch (error) {\n            console.error(\"Error adding comment:\", error);\n        }\n    };\n\n    const renderComments = (parentId = null) => {\n        return comments\n            .filter(comment => comment.parent_comment_id === parentId)\n            .map(comment => (\n                <div key={comment.id} className=\"mb-3\" style={{ marginLeft: parentId ? \'20px\' : \'0\' }}>\n                    <p><strong>{comment.author}</strong> ({new Date(comment.created_at).toLocaleString()}):</p>\n                    <p>{comment.content}</p>\n                    <button\n                        className=\"btn btn-sm btn-link\"\n                        onClick={() => setReplyTo(comment.id)}\n                    >\n                        Ответить\n                    </button>\n                    {renderComments(comment.id)}\n                </div>\n            ));\n    };\n\n    return (\n        <div className=\"mt-5\">\n            <h3>Комментарии</h3>\n            {renderComments()}\n            <div className=\"mt-4\">\n                <textarea\n                    className=\"form-control\"\n                    rows=\"3\"\n                    placeholder={replyTo ? \"Ответить на комментарий...\" : \"Добавить комментарий...\"}\n                    value={newComment}\n                    onChange={(e) => setNewComment(e.target.value)}\n                />\n                <button\n                    className=\"btn btn-primary mt-2\"\n                    onClick={handleAddComment}\n                    disabled={!newComment.trim()}\n                >\n                    Отправить\n                </button>\n                {replyTo && (\n                    <button\n                        className=\"btn btn-secondary mt-2 ms-2\"\n                        onClick={() => setReplyTo(null)}\n                    >\n                        Отменить ответ\n                    </button>\n                )}\n            </div>\n        </div>\n    );\n}\n```\n\n---\n\n### Шаг 4: Интеграция комментариев с просмотром статьи\n\nДобавьте компонент `Comments` в `ArticleView.js`:\n\n```javascript\nimport Comments from \'./Comments\';\n\n// Внутри компонента ArticleView:\n<Comments articleId={id} />\n```\n\n---\n\n### Результат\n\n1. **Отображение дерева комментариев**: Комментарии будут отображаться в виде вложенной структуры, правее родительских.\n2. **Добавление комментариев и ответов**: Пользователи могут добавлять новые комментарии и отвечать на существующие.\n3. **Отображение имени пользователя**: Имя, дата и время отображаются для каждого комментария.', '2024-11-16 19:51:32'),
(13, 2, 1, 12, 'Для добавления раздела комментариев с поддержкой дерева ответов под каждой статьей, давай реализуем следующие шаги:\n\n---\n\n### Шаг 1: Добавление таблиц для комментариев в базе данных\n\nДобавим таблицы для комментариев в базу данных:\n\n```sql\n-- Table for storing comments\nCREATE TABLE comments (\n    id INT PRIMARY KEY AUTO_INCREMENT,\n    article_id INT NOT NULL,\n    user_id INT NOT NULL,\n    parent_comment_id INT DEFAULT NULL, -- For replies to other comments\n    content TEXT NOT NULL,\n    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,\n    FOREIGN KEY (article_id) REFERENCES articles(id) ON DELETE CASCADE,\n    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,\n    FOREIGN KEY (parent_comment_id) REFERENCES comments(id) ON DELETE CASCADE\n);\n```\n\n---\n\n### Шаг 2: Серверная часть для работы с комментариями\n\nДобавим маршруты в `server.js` для получения, добавления и удаления комментариев.\n\n#### 2.1 Получение комментариев для статьи:\n\n```javascript\napp.get(\'/comments/:articleId\', (req, res) => {\n    const articleId = req.params.articleId;\n\n    const sql = `\n        SELECT c.id, c.content, c.created_at, c.parent_comment_id, u.name AS author\n        FROM comments c\n        JOIN users u ON c.user_id = u.id\n        WHERE c.article_id = ?\n        ORDER BY c.created_at ASC\n    `;\n\n    db.query(sql, [articleId], (err, results) => {\n        if (err) {\n            console.error(\"Error fetching comments:\", err);\n            return res.status(500).json({ message: \"Internal Server Error\" });\n        }\n        res.json(results);\n    });\n});\n```\n\n#### 2.2 Добавление комментария:\n\n```javascript\napp.post(\'/comments\', (req, res) => {\n    const { articleId, userId, parentCommentId, content } = req.body;\n\n    const sql = `\n        INSERT INTO comments (article_id, user_id, parent_comment_id, content)\n        VALUES (?, ?, ?, ?)\n    `;\n\n    db.query(sql, [articleId, userId, parentCommentId || null, content], (err, result) => {\n        if (err) {\n            console.error(\"Error adding comment:\", err);\n            return res.status(500).json({ message: \"Internal Server Error\" });\n        }\n        res.status(201).json({ message: \"Comment added successfully\", commentId: result.insertId });\n    });\n});\n```\n\n---\n\n### Шаг 3: Создание интерфейса для комментариев\n\nДобавим компонент `Comments.js` для отображения, добавления и ответа на комментарии.\n\n#### Компонент `Comments.js`:\n\n```javascript\nimport React, { useState, useEffect } from \'react\';\nimport axios from \'axios\';\nimport Cookies from \'js-cookie\';\nimport jwt_decode from \'jwt-decode\';\n\nexport default function Comments({ articleId }) {\n    const [comments, setComments] = useState([]);\n    const [newComment, setNewComment] = useState(\'\');\n    const [replyTo, setReplyTo] = useState(null);\n\n    useEffect(() => {\n        fetchComments();\n    }, []);\n\n    const fetchComments = async () => {\n        try {\n            const response = await axios.get(`http://localhost:8081/comments/${articleId}`);\n            setComments(response.data);\n        } catch (error) {\n            console.error(\"Error fetching comments:\", error);\n        }\n    };\n\n    const handleAddComment = async () => {\n        const token = Cookies.get(\'auth_token\');\n        if (!token) return;\n\n        const decoded = jwt_decode(token);\n\n        try {\n            await axios.post(\'http://localhost:8081/comments\', {\n                articleId,\n                userId: decoded.id,\n                parentCommentId: replyTo,\n                content: newComment\n            });\n            setNewComment(\'\');\n            setReplyTo(null);\n            fetchComments();\n        } catch (error) {\n            console.error(\"Error adding comment:\", error);\n        }\n    };\n\n    const renderComments = (parentId = null) => {\n        return comments\n            .filter(comment => comment.parent_comment_id === parentId)\n            .map(comment => (\n                <div key={comment.id} className=\"mb-3\" style={{ marginLeft: parentId ? \'20px\' : \'0\' }}>\n                    <p><strong>{comment.author}</strong> ({new Date(comment.created_at).toLocaleString()}):</p>\n                    <p>{comment.content}</p>\n                    <button\n                        className=\"btn btn-sm btn-link\"\n                        onClick={() => setReplyTo(comment.id)}\n                    >\n                        Ответить\n                    </button>\n                    {renderComments(comment.id)}\n                </div>\n            ));\n    };\n\n    return (\n        <div className=\"mt-5\">\n            <h3>Комментарии</h3>\n            {renderComments()}\n            <div className=\"mt-4\">\n                <textarea\n                    className=\"form-control\"\n                    rows=\"3\"\n                    placeholder={replyTo ? \"Ответить на комментарий...\" : \"Добавить комментарий...\"}\n                    value={newComment}\n                    onChange={(e) => setNewComment(e.target.value)}\n                />\n                <button\n                    className=\"btn btn-primary mt-2\"\n                    onClick={handleAddComment}\n                    disabled={!newComment.trim()}\n                >\n                    Отправить\n                </button>\n                {replyTo && (\n                    <button\n                        className=\"btn btn-secondary mt-2 ms-2\"\n                        onClick={() => setReplyTo(null)}\n                    >\n                        Отменить ответ\n                    </button>\n                )}\n            </div>\n        </div>\n    );\n}\n```\n\n---\n\n### Шаг 4: Интеграция комментариев с просмотром статьи\n\nДобавьте компонент `Comments` в `ArticleView.js`:\n\n```javascript\nimport Comments from \'./Comments\';\n\n// Внутри компонента ArticleView:\n<Comments articleId={id} />\n```\n\n---\n\n### Результат\n\n1. **Отображение дерева комментариев**: Комментарии будут отображаться в виде вложенной структуры, правее родительских.\n2. **Добавление комментариев и ответов**: Пользователи могут добавлять новые комментарии и отвечать на существующие.\n3. **Отображение имени пользователя**: Имя, дата и время отображаются для каждого комментария.', '2024-11-16 19:51:35'),
(14, 2, 1, 13, 'Для добавления раздела комментариев с поддержкой дерева ответов под каждой статьей, давай реализуем следующие шаги:\n\n---\n\n### Шаг 1: Добавление таблиц для комментариев в базе данных\n\nДобавим таблицы для комментариев в базу данных:\n\n```sql\n-- Table for storing comments\nCREATE TABLE comments (\n    id INT PRIMARY KEY AUTO_INCREMENT,\n    article_id INT NOT NULL,\n    user_id INT NOT NULL,\n    parent_comment_id INT DEFAULT NULL, -- For replies to other comments\n    content TEXT NOT NULL,\n    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,\n    FOREIGN KEY (article_id) REFERENCES articles(id) ON DELETE CASCADE,\n    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,\n    FOREIGN KEY (parent_comment_id) REFERENCES comments(id) ON DELETE CASCADE\n);\n```\n\n---\n\n### Шаг 2: Серверная часть для работы с комментариями\n\nДобавим маршруты в `server.js` для получения, добавления и удаления комментариев.\n\n#### 2.1 Получение комментариев для статьи:\n\n```javascript\napp.get(\'/comments/:articleId\', (req, res) => {\n    const articleId = req.params.articleId;\n\n    const sql = `\n        SELECT c.id, c.content, c.created_at, c.parent_comment_id, u.name AS author\n        FROM comments c\n        JOIN users u ON c.user_id = u.id\n        WHERE c.article_id = ?\n        ORDER BY c.created_at ASC\n    `;\n\n    db.query(sql, [articleId], (err, results) => {\n        if (err) {\n            console.error(\"Error fetching comments:\", err);\n            return res.status(500).json({ message: \"Internal Server Error\" });\n        }\n        res.json(results);\n    });\n});\n```\n\n#### 2.2 Добавление комментария:\n\n```javascript\napp.post(\'/comments\', (req, res) => {\n    const { articleId, userId, parentCommentId, content } = req.body;\n\n    const sql = `\n        INSERT INTO comments (article_id, user_id, parent_comment_id, content)\n        VALUES (?, ?, ?, ?)\n    `;\n\n    db.query(sql, [articleId, userId, parentCommentId || null, content], (err, result) => {\n        if (err) {\n            console.error(\"Error adding comment:\", err);\n            return res.status(500).json({ message: \"Internal Server Error\" });\n        }\n        res.status(201).json({ message: \"Comment added successfully\", commentId: result.insertId });\n    });\n});\n```\n\n---\n\n### Шаг 3: Создание интерфейса для комментариев\n\nДобавим компонент `Comments.js` для отображения, добавления и ответа на комментарии.\n\n#### Компонент `Comments.js`:\n\n```javascript\nimport React, { useState, useEffect } from \'react\';\nimport axios from \'axios\';\nimport Cookies from \'js-cookie\';\nimport jwt_decode from \'jwt-decode\';\n\nexport default function Comments({ articleId }) {\n    const [comments, setComments] = useState([]);\n    const [newComment, setNewComment] = useState(\'\');\n    const [replyTo, setReplyTo] = useState(null);\n\n    useEffect(() => {\n        fetchComments();\n    }, []);\n\n    const fetchComments = async () => {\n        try {\n            const response = await axios.get(`http://localhost:8081/comments/${articleId}`);\n            setComments(response.data);\n        } catch (error) {\n            console.error(\"Error fetching comments:\", error);\n        }\n    };\n\n    const handleAddComment = async () => {\n        const token = Cookies.get(\'auth_token\');\n        if (!token) return;\n\n        const decoded = jwt_decode(token);\n\n        try {\n            await axios.post(\'http://localhost:8081/comments\', {\n                articleId,\n                userId: decoded.id,\n                parentCommentId: replyTo,\n                content: newComment\n            });\n            setNewComment(\'\');\n            setReplyTo(null);\n            fetchComments();\n        } catch (error) {\n            console.error(\"Error adding comment:\", error);\n        }\n    };\n\n    const renderComments = (parentId = null) => {\n        return comments\n            .filter(comment => comment.parent_comment_id === parentId)\n            .map(comment => (\n                <div key={comment.id} className=\"mb-3\" style={{ marginLeft: parentId ? \'20px\' : \'0\' }}>\n                    <p><strong>{comment.author}</strong> ({new Date(comment.created_at).toLocaleString()}):</p>\n                    <p>{comment.content}</p>\n                    <button\n                        className=\"btn btn-sm btn-link\"\n                        onClick={() => setReplyTo(comment.id)}\n                    >\n                        Ответить\n                    </button>\n                    {renderComments(comment.id)}\n                </div>\n            ));\n    };\n\n    return (\n        <div className=\"mt-5\">\n            <h3>Комментарии</h3>\n            {renderComments()}\n            <div className=\"mt-4\">\n                <textarea\n                    className=\"form-control\"\n                    rows=\"3\"\n                    placeholder={replyTo ? \"Ответить на комментарий...\" : \"Добавить комментарий...\"}\n                    value={newComment}\n                    onChange={(e) => setNewComment(e.target.value)}\n                />\n                <button\n                    className=\"btn btn-primary mt-2\"\n                    onClick={handleAddComment}\n                    disabled={!newComment.trim()}\n                >\n                    Отправить\n                </button>\n                {replyTo && (\n                    <button\n                        className=\"btn btn-secondary mt-2 ms-2\"\n                        onClick={() => setReplyTo(null)}\n                    >\n                        Отменить ответ\n                    </button>\n                )}\n            </div>\n        </div>\n    );\n}\n```\n\n---\n\n### Шаг 4: Интеграция комментариев с просмотром статьи\n\nДобавьте компонент `Comments` в `ArticleView.js`:\n\n```javascript\nimport Comments from \'./Comments\';\n\n// Внутри компонента ArticleView:\n<Comments articleId={id} />\n```\n\n---\n\n### Результат\n\n1. **Отображение дерева комментариев**: Комментарии будут отображаться в виде вложенной структуры, правее родительских.\n2. **Добавление комментариев и ответов**: Пользователи могут добавлять новые комментарии и отвечать на существующие.\n3. **Отображение имени пользователя**: Имя, дата и время отображаются для каждого комментария.', '2024-11-16 19:51:38'),
(15, 2, 1, 14, 'Для добавления раздела комментариев с поддержкой дерева ответов под каждой статьей, давай реализуем следующие шаги:\n\n---\n\n### Шаг 1: Добавление таблиц для комментариев в базе данных\n\nДобавим таблицы для комментариев в базу данных:\n\n```sql\n-- Table for storing comments\nCREATE TABLE comments (\n    id INT PRIMARY KEY AUTO_INCREMENT,\n    article_id INT NOT NULL,\n    user_id INT NOT NULL,\n    parent_comment_id INT DEFAULT NULL, -- For replies to other comments\n    content TEXT NOT NULL,\n    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,\n    FOREIGN KEY (article_id) REFERENCES articles(id) ON DELETE CASCADE,\n    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,\n    FOREIGN KEY (parent_comment_id) REFERENCES comments(id) ON DELETE CASCADE\n);\n```\n\n---\n\n### Шаг 2: Серверная часть для работы с комментариями\n\nДобавим маршруты в `server.js` для получения, добавления и удаления комментариев.\n\n#### 2.1 Получение комментариев для статьи:\n\n```javascript\napp.get(\'/comments/:articleId\', (req, res) => {\n    const articleId = req.params.articleId;\n\n    const sql = `\n        SELECT c.id, c.content, c.created_at, c.parent_comment_id, u.name AS author\n        FROM comments c\n        JOIN users u ON c.user_id = u.id\n        WHERE c.article_id = ?\n        ORDER BY c.created_at ASC\n    `;\n\n    db.query(sql, [articleId], (err, results) => {\n        if (err) {\n            console.error(\"Error fetching comments:\", err);\n            return res.status(500).json({ message: \"Internal Server Error\" });\n        }\n        res.json(results);\n    });\n});\n```\n\n#### 2.2 Добавление комментария:\n\n```javascript\napp.post(\'/comments\', (req, res) => {\n    const { articleId, userId, parentCommentId, content } = req.body;\n\n    const sql = `\n        INSERT INTO comments (article_id, user_id, parent_comment_id, content)\n        VALUES (?, ?, ?, ?)\n    `;\n\n    db.query(sql, [articleId, userId, parentCommentId || null, content], (err, result) => {\n        if (err) {\n            console.error(\"Error adding comment:\", err);\n            return res.status(500).json({ message: \"Internal Server Error\" });\n        }\n        res.status(201).json({ message: \"Comment added successfully\", commentId: result.insertId });\n    });\n});\n```\n\n---\n\n### Шаг 3: Создание интерфейса для комментариев\n\nДобавим компонент `Comments.js` для отображения, добавления и ответа на комментарии.\n\n#### Компонент `Comments.js`:\n\n```javascript\nimport React, { useState, useEffect } from \'react\';\nimport axios from \'axios\';\nimport Cookies from \'js-cookie\';\nimport jwt_decode from \'jwt-decode\';\n\nexport default function Comments({ articleId }) {\n    const [comments, setComments] = useState([]);\n    const [newComment, setNewComment] = useState(\'\');\n    const [replyTo, setReplyTo] = useState(null);\n\n    useEffect(() => {\n        fetchComments();\n    }, []);\n\n    const fetchComments = async () => {\n        try {\n            const response = await axios.get(`http://localhost:8081/comments/${articleId}`);\n            setComments(response.data);\n        } catch (error) {\n            console.error(\"Error fetching comments:\", error);\n        }\n    };\n\n    const handleAddComment = async () => {\n        const token = Cookies.get(\'auth_token\');\n        if (!token) return;\n\n        const decoded = jwt_decode(token);\n\n        try {\n            await axios.post(\'http://localhost:8081/comments\', {\n                articleId,\n                userId: decoded.id,\n                parentCommentId: replyTo,\n                content: newComment\n            });\n            setNewComment(\'\');\n            setReplyTo(null);\n            fetchComments();\n        } catch (error) {\n            console.error(\"Error adding comment:\", error);\n        }\n    };\n\n    const renderComments = (parentId = null) => {\n        return comments\n            .filter(comment => comment.parent_comment_id === parentId)\n            .map(comment => (\n                <div key={comment.id} className=\"mb-3\" style={{ marginLeft: parentId ? \'20px\' : \'0\' }}>\n                    <p><strong>{comment.author}</strong> ({new Date(comment.created_at).toLocaleString()}):</p>\n                    <p>{comment.content}</p>\n                    <button\n                        className=\"btn btn-sm btn-link\"\n                        onClick={() => setReplyTo(comment.id)}\n                    >\n                        Ответить\n                    </button>\n                    {renderComments(comment.id)}\n                </div>\n            ));\n    };\n\n    return (\n        <div className=\"mt-5\">\n            <h3>Комментарии</h3>\n            {renderComments()}\n            <div className=\"mt-4\">\n                <textarea\n                    className=\"form-control\"\n                    rows=\"3\"\n                    placeholder={replyTo ? \"Ответить на комментарий...\" : \"Добавить комментарий...\"}\n                    value={newComment}\n                    onChange={(e) => setNewComment(e.target.value)}\n                />\n                <button\n                    className=\"btn btn-primary mt-2\"\n                    onClick={handleAddComment}\n                    disabled={!newComment.trim()}\n                >\n                    Отправить\n                </button>\n                {replyTo && (\n                    <button\n                        className=\"btn btn-secondary mt-2 ms-2\"\n                        onClick={() => setReplyTo(null)}\n                    >\n                        Отменить ответ\n                    </button>\n                )}\n            </div>\n        </div>\n    );\n}\n```\n\n---\n\n### Шаг 4: Интеграция комментариев с просмотром статьи\n\nДобавьте компонент `Comments` в `ArticleView.js`:\n\n```javascript\nimport Comments from \'./Comments\';\n\n// Внутри компонента ArticleView:\n<Comments articleId={id} />\n```\n\n---\n\n### Результат\n\n1. **Отображение дерева комментариев**: Комментарии будут отображаться в виде вложенной структуры, правее родительских.\n2. **Добавление комментариев и ответов**: Пользователи могут добавлять новые комментарии и отвечать на существующие.\n3. **Отображение имени пользователя**: Имя, дата и время отображаются для каждого комментария.', '2024-11-16 19:51:40'),
(16, 2, 1, 15, 'Для добавления раздела комментариев с поддержкой дерева ответов под каждой статьей, давай реализуем следующие шаги:\n\n---\n\n### Шаг 1: Добавление таблиц для комментариев в базе данных\n\nДобавим таблицы для комментариев в базу данных:\n\n```sql\n-- Table for storing comments\nCREATE TABLE comments (\n    id INT PRIMARY KEY AUTO_INCREMENT,\n    article_id INT NOT NULL,\n    user_id INT NOT NULL,\n    parent_comment_id INT DEFAULT NULL, -- For replies to other comments\n    content TEXT NOT NULL,\n    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,\n    FOREIGN KEY (article_id) REFERENCES articles(id) ON DELETE CASCADE,\n    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,\n    FOREIGN KEY (parent_comment_id) REFERENCES comments(id) ON DELETE CASCADE\n);\n```\n\n---\n\n### Шаг 2: Серверная часть для работы с комментариями\n\nДобавим маршруты в `server.js` для получения, добавления и удаления комментариев.\n\n#### 2.1 Получение комментариев для статьи:\n\n```javascript\napp.get(\'/comments/:articleId\', (req, res) => {\n    const articleId = req.params.articleId;\n\n    const sql = `\n        SELECT c.id, c.content, c.created_at, c.parent_comment_id, u.name AS author\n        FROM comments c\n        JOIN users u ON c.user_id = u.id\n        WHERE c.article_id = ?\n        ORDER BY c.created_at ASC\n    `;\n\n    db.query(sql, [articleId], (err, results) => {\n        if (err) {\n            console.error(\"Error fetching comments:\", err);\n            return res.status(500).json({ message: \"Internal Server Error\" });\n        }\n        res.json(results);\n    });\n});\n```\n\n#### 2.2 Добавление комментария:\n\n```javascript\napp.post(\'/comments\', (req, res) => {\n    const { articleId, userId, parentCommentId, content } = req.body;\n\n    const sql = `\n        INSERT INTO comments (article_id, user_id, parent_comment_id, content)\n        VALUES (?, ?, ?, ?)\n    `;\n\n    db.query(sql, [articleId, userId, parentCommentId || null, content], (err, result) => {\n        if (err) {\n            console.error(\"Error adding comment:\", err);\n            return res.status(500).json({ message: \"Internal Server Error\" });\n        }\n        res.status(201).json({ message: \"Comment added successfully\", commentId: result.insertId });\n    });\n});\n```\n\n---\n\n### Шаг 3: Создание интерфейса для комментариев\n\nДобавим компонент `Comments.js` для отображения, добавления и ответа на комментарии.\n\n#### Компонент `Comments.js`:\n\n```javascript\nimport React, { useState, useEffect } from \'react\';\nimport axios from \'axios\';\nimport Cookies from \'js-cookie\';\nimport jwt_decode from \'jwt-decode\';\n\nexport default function Comments({ articleId }) {\n    const [comments, setComments] = useState([]);\n    const [newComment, setNewComment] = useState(\'\');\n    const [replyTo, setReplyTo] = useState(null);\n\n    useEffect(() => {\n        fetchComments();\n    }, []);\n\n    const fetchComments = async () => {\n        try {\n            const response = await axios.get(`http://localhost:8081/comments/${articleId}`);\n            setComments(response.data);\n        } catch (error) {\n            console.error(\"Error fetching comments:\", error);\n        }\n    };\n\n    const handleAddComment = async () => {\n        const token = Cookies.get(\'auth_token\');\n        if (!token) return;\n\n        const decoded = jwt_decode(token);\n\n        try {\n            await axios.post(\'http://localhost:8081/comments\', {\n                articleId,\n                userId: decoded.id,\n                parentCommentId: replyTo,\n                content: newComment\n            });\n            setNewComment(\'\');\n            setReplyTo(null);\n            fetchComments();\n        } catch (error) {\n            console.error(\"Error adding comment:\", error);\n        }\n    };\n\n    const renderComments = (parentId = null) => {\n        return comments\n            .filter(comment => comment.parent_comment_id === parentId)\n            .map(comment => (\n                <div key={comment.id} className=\"mb-3\" style={{ marginLeft: parentId ? \'20px\' : \'0\' }}>\n                    <p><strong>{comment.author}</strong> ({new Date(comment.created_at).toLocaleString()}):</p>\n                    <p>{comment.content}</p>\n                    <button\n                        className=\"btn btn-sm btn-link\"\n                        onClick={() => setReplyTo(comment.id)}\n                    >\n                        Ответить\n                    </button>\n                    {renderComments(comment.id)}\n                </div>\n            ));\n    };\n\n    return (\n        <div className=\"mt-5\">\n            <h3>Комментарии</h3>\n            {renderComments()}\n            <div className=\"mt-4\">\n                <textarea\n                    className=\"form-control\"\n                    rows=\"3\"\n                    placeholder={replyTo ? \"Ответить на комментарий...\" : \"Добавить комментарий...\"}\n                    value={newComment}\n                    onChange={(e) => setNewComment(e.target.value)}\n                />\n                <button\n                    className=\"btn btn-primary mt-2\"\n                    onClick={handleAddComment}\n                    disabled={!newComment.trim()}\n                >\n                    Отправить\n                </button>\n                {replyTo && (\n                    <button\n                        className=\"btn btn-secondary mt-2 ms-2\"\n                        onClick={() => setReplyTo(null)}\n                    >\n                        Отменить ответ\n                    </button>\n                )}\n            </div>\n        </div>\n    );\n}\n```\n\n---\n\n### Шаг 4: Интеграция комментариев с просмотром статьи\n\nДобавьте компонент `Comments` в `ArticleView.js`:\n\n```javascript\nimport Comments from \'./Comments\';\n\n// Внутри компонента ArticleView:\n<Comments articleId={id} />\n```\n\n---\n\n### Результат\n\n1. **Отображение дерева комментариев**: Комментарии будут отображаться в виде вложенной структуры, правее родительских.\n2. **Добавление комментариев и ответов**: Пользователи могут добавлять новые комментарии и отвечать на существующие.\n3. **Отображение имени пользователя**: Имя, дата и время отображаются для каждого комментария.', '2024-11-16 19:51:43'),
(17, 2, 1, 16, 'Для добавления раздела комментариев с поддержкой дерева ответов под каждой статьей, давай реализуем следующие шаги:\n\n---\n\n### Шаг 1: Добавление таблиц для комментариев в базе данных\n\nДобавим таблицы для комментариев в базу данных:\n\n```sql\n-- Table for storing comments\nCREATE TABLE comments (\n    id INT PRIMARY KEY AUTO_INCREMENT,\n    article_id INT NOT NULL,\n    user_id INT NOT NULL,\n    parent_comment_id INT DEFAULT NULL, -- For replies to other comments\n    content TEXT NOT NULL,\n    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,\n    FOREIGN KEY (article_id) REFERENCES articles(id) ON DELETE CASCADE,\n    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,\n    FOREIGN KEY (parent_comment_id) REFERENCES comments(id) ON DELETE CASCADE\n);\n```\n\n---\n\n### Шаг 2: Серверная часть для работы с комментариями\n\nДобавим маршруты в `server.js` для получения, добавления и удаления комментариев.\n\n#### 2.1 Получение комментариев для статьи:\n\n```javascript\napp.get(\'/comments/:articleId\', (req, res) => {\n    const articleId = req.params.articleId;\n\n    const sql = `\n        SELECT c.id, c.content, c.created_at, c.parent_comment_id, u.name AS author\n        FROM comments c\n        JOIN users u ON c.user_id = u.id\n        WHERE c.article_id = ?\n        ORDER BY c.created_at ASC\n    `;\n\n    db.query(sql, [articleId], (err, results) => {\n        if (err) {\n            console.error(\"Error fetching comments:\", err);\n            return res.status(500).json({ message: \"Internal Server Error\" });\n        }\n        res.json(results);\n    });\n});\n```\n\n#### 2.2 Добавление комментария:\n\n```javascript\napp.post(\'/comments\', (req, res) => {\n    const { articleId, userId, parentCommentId, content } = req.body;\n\n    const sql = `\n        INSERT INTO comments (article_id, user_id, parent_comment_id, content)\n        VALUES (?, ?, ?, ?)\n    `;\n\n    db.query(sql, [articleId, userId, parentCommentId || null, content], (err, result) => {\n        if (err) {\n            console.error(\"Error adding comment:\", err);\n            return res.status(500).json({ message: \"Internal Server Error\" });\n        }\n        res.status(201).json({ message: \"Comment added successfully\", commentId: result.insertId });\n    });\n});\n```\n\n---\n\n### Шаг 3: Создание интерфейса для комментариев\n\nДобавим компонент `Comments.js` для отображения, добавления и ответа на комментарии.\n\n#### Компонент `Comments.js`:\n\n```javascript\nimport React, { useState, useEffect } from \'react\';\nimport axios from \'axios\';\nimport Cookies from \'js-cookie\';\nimport jwt_decode from \'jwt-decode\';\n\nexport default function Comments({ articleId }) {\n    const [comments, setComments] = useState([]);\n    const [newComment, setNewComment] = useState(\'\');\n    const [replyTo, setReplyTo] = useState(null);\n\n    useEffect(() => {\n        fetchComments();\n    }, []);\n\n    const fetchComments = async () => {\n        try {\n            const response = await axios.get(`http://localhost:8081/comments/${articleId}`);\n            setComments(response.data);\n        } catch (error) {\n            console.error(\"Error fetching comments:\", error);\n        }\n    };\n\n    const handleAddComment = async () => {\n        const token = Cookies.get(\'auth_token\');\n        if (!token) return;\n\n        const decoded = jwt_decode(token);\n\n        try {\n            await axios.post(\'http://localhost:8081/comments\', {\n                articleId,\n                userId: decoded.id,\n                parentCommentId: replyTo,\n                content: newComment\n            });\n            setNewComment(\'\');\n            setReplyTo(null);\n            fetchComments();\n        } catch (error) {\n            console.error(\"Error adding comment:\", error);\n        }\n    };\n\n    const renderComments = (parentId = null) => {\n        return comments\n            .filter(comment => comment.parent_comment_id === parentId)\n            .map(comment => (\n                <div key={comment.id} className=\"mb-3\" style={{ marginLeft: parentId ? \'20px\' : \'0\' }}>\n                    <p><strong>{comment.author}</strong> ({new Date(comment.created_at).toLocaleString()}):</p>\n                    <p>{comment.content}</p>\n                    <button\n                        className=\"btn btn-sm btn-link\"\n                        onClick={() => setReplyTo(comment.id)}\n                    >\n                        Ответить\n                    </button>\n                    {renderComments(comment.id)}\n                </div>\n            ));\n    };\n\n    return (\n        <div className=\"mt-5\">\n            <h3>Комментарии</h3>\n            {renderComments()}\n            <div className=\"mt-4\">\n                <textarea\n                    className=\"form-control\"\n                    rows=\"3\"\n                    placeholder={replyTo ? \"Ответить на комментарий...\" : \"Добавить комментарий...\"}\n                    value={newComment}\n                    onChange={(e) => setNewComment(e.target.value)}\n                />\n                <button\n                    className=\"btn btn-primary mt-2\"\n                    onClick={handleAddComment}\n                    disabled={!newComment.trim()}\n                >\n                    Отправить\n                </button>\n                {replyTo && (\n                    <button\n                        className=\"btn btn-secondary mt-2 ms-2\"\n                        onClick={() => setReplyTo(null)}\n                    >\n                        Отменить ответ\n                    </button>\n                )}\n            </div>\n        </div>\n    );\n}\n```\n\n---\n\n### Шаг 4: Интеграция комментариев с просмотром статьи\n\nДобавьте компонент `Comments` в `ArticleView.js`:\n\n```javascript\nimport Comments from \'./Comments\';\n\n// Внутри компонента ArticleView:\n<Comments articleId={id} />\n```\n\n---\n\n### Результат\n\n1. **Отображение дерева комментариев**: Комментарии будут отображаться в виде вложенной структуры, правее родительских.\n2. **Добавление комментариев и ответов**: Пользователи могут добавлять новые комментарии и отвечать на существующие.\n3. **Отображение имени пользователя**: Имя, дата и время отображаются для каждого комментария.', '2024-11-16 19:51:45'),
(18, 2, 1, NULL, 'ваы', '2024-11-16 19:51:56'),
(19, 2, 1, 17, 'ыфв', '2024-11-16 20:12:45'),
(20, 2, 1, 6, 'ыфв', '2024-11-16 20:12:51');

-- --------------------------------------------------------

--
-- Структура таблицы `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `tags`
--

INSERT INTO `tags` (`id`, `name`) VALUES
(4, 'DevOps'),
(10, 'Git'),
(6, 'JavaScript'),
(7, 'Python'),
(8, 'React'),
(9, 'SQL'),
(5, 'Алгоритмы'),
(3, 'Базы данных'),
(2, 'Веб-разработка'),
(1, 'Программирование');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `isAdmin` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `admin`) VALUES
(1, 'Admin', 'cebotarenkodima@gmail.com', '$2b$10$WWA25AmSE9TOgjd3accXAuI7FsKLcXHNKfVl5IsbCs4kZ5bO8vwbi', 1),
(43, 'Иван Петров', 'ivan.petrov@example.com', '$2b$10$rw8H6ii7Zl6PoVoyEYSe/OLlgJPlVq267DNfT5arJO8EpbIRb2FIC', NULL),
(44, 'Мария Сидорова', 'maria.sidorova@example.com', '$2b$10$j5NhqfRzKQWNXKkX5/HWE.h18kYq1atOVgINxZCtqswzGz4gi7e8G', NULL),
(45, 'Алексей Смирнов', 'alexey.smirnov@example.com', '$2b$10$r84oDvB5mwF2JDoUU/r3CuDyInQ39BRLautCnH6DfTmLEbajS0abC', NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`);

--
-- Индексы таблицы `article_tags`
--
ALTER TABLE `article_tags`
  ADD PRIMARY KEY (`article_id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_id` (`article_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `parent_comment_id` (`parent_comment_id`);

--
-- Индексы таблицы `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`ID`) ON DELETE SET NULL;

--
-- Ограничения внешнего ключа таблицы `article_tags`
--
ALTER TABLE `article_tags`
  ADD CONSTRAINT `article_tags_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `article_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`parent_comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
