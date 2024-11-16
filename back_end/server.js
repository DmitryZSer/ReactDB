const express = require('express');
const mysql = require('mysql');
const cors = require('cors');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const cookieParser = require('cookie-parser');

const app = express();

app.use(cors());
app.use(express.json());
app.use(cookieParser());

const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "reactdb"
});

const JWT_SECRET = 'zRKIWr7z2uoKrBtUJ2LFceOB-dslR9ZTzHjNghIo5ZY';

// Регистрация пользователя
app.post('/signup', (req, res) => {
    const { name, email, password } = req.body;

    const sqlCheckName = "SELECT * FROM users WHERE name = ?";
    db.query(sqlCheckName, [name], (err, result) => {
        if (err) {
            console.error("Error querying data: ", err);
            return res.status(500).json({ message: "Internal Server Error (search user by name)", error: err });
        }

        if (result.length > 0) {
            return res.status(202).json({ message: "Invalid name" });
        }

        const sqlCheckEmail = "SELECT * FROM users WHERE email = ?";
        db.query(sqlCheckEmail, [email], (err, result) => {
            if (err) {
                console.error("Error querying data: ", err);
                return res.status(500).json({ message: "Internal Server Error (search user by email)", error: err });
            }

            if (result.length > 0) {
                return res.status(201).json({ message: "Invalid email" });
            }

            bcrypt.hash(password, 10, (err, hashedPassword) => {
                if (err) {
                    console.error("Error hashing password: ", err);
                    return res.status(500).json({ message: "Internal Server Error (Error hashing password)", error: err });
                }

                const sqlInsertUser = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
                db.query(sqlInsertUser, [name, email, hashedPassword], (err, result) => {
                    if (err) {
                        console.error("Error inserting data: ", err);
                        return res.status(500).json({ message: "Internal Server Error (Error inserting data)", error: err });
                    }
                    return res.status(200).json({ message: "User registered successfully", data: result });
                });
            });
        });
    });
});



// Логин пользователя
app.post('/login', (req, res) => {
    const { email, password } = req.body;

    const sql = "SELECT * FROM users WHERE email = ?";
    db.query(sql, [email], (err, result) => {
        if (err) {
            console.error("Error querying data: ", err);
            return res.status(500).json({ message: "Internal Server Error", error: err });
        }

        if (result.length === 0) {
            return res.status(400).json({ message: "Invalid email or password" });
        }

        const user = result[0];

        bcrypt.compare(password, user.password, (err, isMatch) => {
            if (err) {
                console.error("Error comparing passwords: ", err);
                return res.status(500).json({ message: "Internal Server Error", error: err });
            }

            if (isMatch) {
                const token = jwt.sign({ id: user.id, email: user.email, name: user.name }, JWT_SECRET, { expiresIn: '1h' });

                //res.cookie('auth_token', token, { httpOnly: true, secure: process.env.NODE_ENV === 'production', maxAge: 3600000 });

                return res.status(200).json({
                    message: "Login successful",
                    token: token
                });
            } else {
                return res.status(400).json({ message: "Invalid email or password" });
            }
        });
    });
});

// Изменение пароля пользователя
app.post('/change-password', (req, res) => {
    const token = req.headers.authorization?.split(' ')[1];
    const { newPassword } = req.body;

    if (!token) {
        return res.status(401).json({ message: "Требуется авторизация" });
    }

    try {
        const decoded = jwt.verify(token, JWT_SECRET);
        const userId = decoded.id;

        bcrypt.hash(newPassword, 10, (err, hashedPassword) => {
            if (err) {
                return res.status(500).json({ message: "Ошибка хеширования пароля" });
            }

            const sql = "UPDATE users SET password = ? WHERE id = ?";
            db.query(sql, [hashedPassword, userId], (err, result) => {
                if (err) {
                    return res.status(500).json({ message: "Ошибка при изменении пароля" });
                }
                return res.status(200).json({ message: "Пароль успешно изменен" });
            });
        });
    } catch (err) {
        return res.status(401).json({ message: "Неверный токен" });
    }
});


// Получение всех тегов
app.get('/tags', (req, res) => {
    const sqlTags = `
        SELECT t.id, t.name, a.id AS article_id, a.title, a.summary
        FROM tags t
        LEFT JOIN article_tags at ON t.id = at.tag_id
        LEFT JOIN articles a ON at.article_id = a.id
        ORDER BY t.name, a.title;
    `;

    db.query(sqlTags, (err, result) => {
        if (err) {
            console.error("Error fetching tags and articles: ", err);
            return res.status(500).json({ message: "Internal Server Error" });
        }

        const tagsWithArticles = result.reduce((acc, row) => {
            const { id, name, article_id, title, summary } = row;
            if (!acc[id]) acc[id] = { id, name, articles: [] };
            if (article_id) acc[id].articles.push({ id: article_id, title, summary });
            return acc;
        }, {});

        return res.json(Object.values(tagsWithArticles));
    });
});

app.get('/articles', (req, res) => {
    const { searchTerm, tagId } = req.query;
    let sql = `
        SELECT DISTINCT a.id, a.title, a.summary, a.content
        FROM articles a
        LEFT JOIN article_tags at ON a.id = at.article_id
        WHERE 1=1
    `;
    const params = [];

    if (searchTerm) {
        sql += ` AND (a.title LIKE ? OR a.summary LIKE ? OR a.content LIKE ?)`;
        const likeTerm = `%${searchTerm}%`;
        params.push(likeTerm, likeTerm, likeTerm);
    }

    if (tagId) {
        sql += ` AND at.tag_id = ?`;
        params.push(tagId);
    }

    db.query(sql, params, (err, results) => {
        if (err) {
            console.error("Error fetching articles:", err);
            return res.status(500).json({ message: "Internal Server Error" });
        }
        res.json(results);
    });
});

app.get('/article/:id', (req, res) => {
    const { id } = req.params;

    const sql = `
        SELECT 
            a.id, 
            a.title, 
            a.summary, 
            a.content, 
            a.created_at, 
            a.updated_at, 
            u.name AS authorName,
            GROUP_CONCAT(t.name) AS tags  -- Use GROUP_CONCAT to get all tag names for the article
        FROM articles a
        LEFT JOIN users u ON a.author_id = u.id
        LEFT JOIN article_tags at ON a.id = at.article_id
        LEFT JOIN tags t ON at.tag_id = t.id
        WHERE a.id = ?
        GROUP BY a.id, u.name;
    `;

    db.query(sql, [id], (err, result) => {
        if (err) {
            console.error("Error executing SQL query:", err);
            return res.status(500).json({ message: "Internal Server Error", error: err });
        }

        if (result.length === 0) {
            console.log(`No article found with ID: ${id}`);
            return res.status(404).json({ message: "Article not found" });
        }

        const article = result[0];
        article.tags = article.tags ? article.tags.split(',') : [];  // Все теги через запятую

        res.status(200).json(article);
    });
});

// Получение комментариев для статьи
app.get('/comments/:articleId', (req, res) => {
    const articleId = req.params.articleId;

    const sql = `
        SELECT c.id, c.content, c.created_at, c.parent_comment_id, u.name AS author
        FROM comments c
        JOIN users u ON c.user_id = u.id
        WHERE c.article_id = ?
        ORDER BY c.created_at ASC
    `;

    db.query(sql, [articleId], (err, results) => {
        if (err) {
            console.error("Error fetching comments:", err);
            return res.status(500).json({ message: "Internal Server Error" });
        }
        res.json(results);
    });
});

// Добавление комментария
app.post('/comments', (req, res) => {
    const { articleId, userId, parentCommentId, content } = req.body;

    const sql = `
        INSERT INTO comments (article_id, user_id, parent_comment_id, content)
        VALUES (?, ?, ?, ?)
    `;

    db.query(sql, [articleId, userId, parentCommentId || null, content], (err, result) => {
        if (err) {
            console.error("Error adding comment:", err);
            return res.status(500).json({ message: "Internal Server Error" });
        }
        res.status(201).json({ message: "Comment added successfully", commentId: result.insertId });
    });
});

function checkAdmin(req, res, next) {
    const token = req.headers.authorization?.split(' ')[1];
    if (!token) {
        return res.status(401).json({ message: "Пользователь не авторизован" });
    }

    try {
        const decoded = jwt.verify(token, JWT_SECRET);
        const userId = decoded.id;

        const sql = "SELECT isAdmin FROM users WHERE id = ?";
        db.query(sql, [userId], (err, result) => {
            if (err) {
                console.error("Ошибка при проверке роли администратора:", err);
                return res.status(500).json({ message: "Ошибка сервера" });
            }

            if (result.length === 0 || !result[0].isAdmin) {
                return res.status(403).json({ message: "Недостаточно прав для выполнения действия" });
            }

            req.user = decoded; // Сохраняем данные пользователя для дальнейшего использования
            next();
        });
    } catch (err) {
        return res.status(401).json({ message: "Недействительный токен" });
    }
}


// Удаление комментария
app.delete('/comments/:id', checkAdmin, (req, res) => {
    const { id } = req.params;

    const sql = "DELETE FROM comments WHERE id = ?";
    db.query(sql, [id], (err, result) => {
        if (err) {
            console.error("Ошибка при удалении комментария:", err);
            return res.status(500).json({ message: "Ошибка сервера" });
        }

        if (result.affectedRows === 0) {
            return res.status(404).json({ message: "Комментарий не найден" });
        }

        res.status(200).json({ message: "Комментарий успешно удален" });
    });
});


// Редактирование комментария
app.put('/comments/:id', checkAdmin, (req, res) => {
    const { id } = req.params;
    const { content } = req.body;

    const sql = "UPDATE comments SET content = ? WHERE id = ?";
    db.query(sql, [content, id], (err, result) => {
        if (err) {
            console.error("Ошибка при редактировании комментария:", err);
            return res.status(500).json({ message: "Ошибка сервера" });
        }

        if (result.affectedRows === 0) {
            return res.status(404).json({ message: "Комментарий не найден" });
        }

        res.status(200).json({ message: "Комментарий успешно обновлен" });
    });
});





app.listen(8081, () => {
    console.log("Listening slyshayu...")
})