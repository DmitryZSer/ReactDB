const express = require('express');
const mysql = require('mysql');
const cors = require('cors');

const app = express();

app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "reactdb"
});

const bcrypt = require('bcrypt');

app.post('/signup', (req, res) => {
    const { name, email, password } = req.body;

    // Проверяем, существует ли пользователь с таким email
    const sqlCheckEmail = "SELECT * FROM users WHERE email = ?";
    db.query(sqlCheckEmail, [email], (err, result) => {
        if (err) {
            console.error("Error querying data: ", err);
            return res.status(500).json({ message: "Internal Server Error (search user by email)", error: err });
        }

        // Если пользователь найден
        if (result.length > 0) {
            return res.status(201).json({ message: "Invalid email" });
        }

        // Если email уникальный, хешируем пароль и добавляем нового пользователя
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


app.post('/login', (req, res) => {
    const { email, password } = req.body;

    // Проверяем, существует ли пользователь с таким email
    const sql = "SELECT * FROM users WHERE email = ?";

    db.query(sql, [email], (err, result) => {
        if (err) {
            console.error("Error querying data: ", err);
            return res.status(500).json({ message: "Internal Server Error", error: err });
        }

        // Если пользователь не найден
        if (result.length === 0) {
            return res.status(201).json({ message: "Invalid email or password" });
        }

        // Пользователь найден, проверяем пароль
        const user = result[0];

        // Сравниваем введенный пароль с сохраненным в базе данных (хэшированным)
        bcrypt.compare(password, user.password, (err, isMatch) => {
            if (err) {
                console.error("Error comparing passwords: ", err);
                return res.status(500).json({ message: "Internal Server Error", error: err });
            }

            if (isMatch) {
                // Пароль совпадает, авторизация успешна
                return res.status(200).json({ message: "Login successful", userId: user.ID });
            } else {
                // Пароль неверный
                return res.status(202).json({ message: "Invalid email or password" });
            }
        });
    });
});

// Fetch all tags with their associated articles
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

        // Organize results into tags with associated articles
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

    // Add search term condition
    if (searchTerm) {
        sql += ` AND (a.title LIKE ? OR a.summary LIKE ? OR a.content LIKE ?)`;
        const likeTerm = `%${searchTerm}%`;
        params.push(likeTerm, likeTerm, likeTerm);
    }

    // Add tag filter if a tag is selected
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

// Get a single article by its ID
app.get('/article/:id', (req, res) => {
    const { id } = req.params;

    // SQL query to get the article by ID and its associated tags
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

        // Prepare article data to return
        const article = result[0];
        article.tags = article.tags ? article.tags.split(',') : [];  // Split tags into an array

        res.status(200).json(article);
    });
});



app.listen(8081, () => {
    console.log("Listening slyshayu...")
})