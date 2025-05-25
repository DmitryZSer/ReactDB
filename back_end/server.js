/*
 PostgreSQL setup:
 1. CREATE DATABASE "InfoZhur";
 2. CREATE USER postgres WITH PASSWORD '1234';
 3. GRANT ALL PRIVILEGES ON DATABASE "InfoZhur" TO postgres;
*/

const express = require('express');
const { Pool } = require('pg');
const cors = require('cors');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const cookieParser = require('cookie-parser');

const app = express();

app.use(cors({
  origin: 'http://localhost:3000',
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
}));
app.use(express.json());
app.use(cookieParser());

// PostgreSQL pool configuration
const pool = new Pool({
  host: 'localhost',
  user: 'postgres',
  password: '1234',
  database: 'InfoZhur',
  port: 5432,
});

const JWT_SECRET = 'zRKIWr7z2uoKrBtUJ2LFceOB-dslR9ZTzHjNghIo5ZY';

// Helper to run queries
async function query(text, params) {
  const client = await pool.connect();
  try {
    return await client.query(text, params);
  } finally {
    client.release();
  }
}

// User signup
app.post('/signup', async (req, res) => {
  const { name, email, password } = req.body;
  try {
    const { rows: nameExists } = await query(
      'SELECT 1 FROM users WHERE name = $1 LIMIT 1',
      [name]
    );
    if (nameExists.length) return res.status(202).json({ message: 'Invalid name' });

    const { rows: emailExists } = await query(
      'SELECT 1 FROM users WHERE email = $1 LIMIT 1',
      [email]
    );
    if (emailExists.length) return res.status(201).json({ message: 'Invalid email' });

    const hashed = await bcrypt.hash(password, 10);
    const result = await query(
      'INSERT INTO users (name, email, password) VALUES ($1, $2, $3) RETURNING id',
      [name, email, hashed]
    );
    res.status(200).json({ message: 'User registered successfully', data: result.rows[0] });
  } catch (err) {
    console.error('Signup error:', err);
    res.status(500).json({ message: 'Internal Server Error', error: err.message });
  }
});

// User login
app.post('/login', async (req, res) => {
  const { email, password } = req.body;
  try {
    const { rows } = await query('SELECT * FROM users WHERE email = $1', [email]);
    if (!rows.length) return res.status(400).json({ message: 'Invalid email or password' });

    const user = rows[0];
    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) return res.status(204).json({ message: 'Invalid email or password' });

    const token = jwt.sign({ id: user.id, email: user.email, name: user.name }, JWT_SECRET, { expiresIn: '1h' });
    res.status(200).json({ message: 'Login successful', token });
  } catch (err) {
    console.error('Login error:', err);
    res.status(500).json({ message: 'Internal Server Error', error: err.message });
  }
});

// Change password
app.post('/change-password', async (req, res) => {
  const auth = req.headers.authorization;
  const { newPassword } = req.body;
  if (!auth) return res.status(401).json({ message: 'Требуется авторизация' });

  try {
    const token = auth.split(' ')[1];
    const decoded = jwt.verify(token, JWT_SECRET);
    const hashed = await bcrypt.hash(newPassword, 10);
    await query('UPDATE users SET password = $1 WHERE id = $2', [hashed, decoded.id]);
    res.status(200).json({ message: 'Пароль успешно изменен' });
  } catch (err) {
    console.error('Change-password error:', err);
    res.status(401).json({ message: err.name === 'JsonWebTokenError' ? 'Неверный токен' : 'Ошибка сервера' });
  }
});

// Get tags with articles
app.get('/tags-with-articles', async (req, res) => {
  const sql = `
    SELECT t.id, t.name,
           a.id AS article_id, a.title, a.summary
    FROM tags t
    LEFT JOIN article_tags at ON t.id = at.tag_id
    LEFT JOIN articles a ON at.article_id = a.id
    ORDER BY t.name, a.title;
  `;
  try {
    const { rows } = await query(sql);
    const map = {};
    rows.forEach(r => {
      if (!map[r.id]) map[r.id] = { id: r.id, name: r.name, articles: [] };
      if (r.article_id) map[r.id].articles.push({ id: r.article_id, title: r.title, summary: r.summary });
    });
    res.json(Object.values(map));
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

// Get tags
app.get('/tags', async (req, res) => {
  try {
    const { rows } = await query('SELECT id, name FROM tags ORDER BY name');
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

// Get all articles
app.get('/articles', async (req, res) => {
  const { searchTerm, tagId } = req.query;
  let sql = `
    SELECT DISTINCT a.id, a.title, a.summary, a.content
    FROM articles a
    LEFT JOIN article_tags at ON a.id = at.article_id
    WHERE 1=1`;
  const params = [];
  if (searchTerm) {
    sql += ` AND (a.title ILIKE $${params.length+1} OR a.summary ILIKE $${params.length+2} OR a.content ILIKE $${params.length+3})`;
    const term = `%${searchTerm}%`;
    params.push(term, term, term);
  }
  if (tagId) {
    sql += ` AND at.tag_id = $${params.length+1}`;
    params.push(tagId);
  }
  try {
    const { rows } = await query(sql, params);
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

// Get article by id
app.get('/articles/:id', async (req, res) => {
  const { id } = req.params;
  const sql = `
    SELECT a.id, a.title, a.summary, a.content, a.created_at, a.updated_at,
           u.name AS authorname,
           STRING_AGG(t.name, ',') AS tags
    FROM articles a
    LEFT JOIN users u ON a.author_id = u.id
    LEFT JOIN article_tags at ON a.id = at.article_id
    LEFT JOIN tags t ON at.tag_id = t.id
    WHERE a.id = $1
    GROUP BY a.id, u.name;
  `;
  try {
    const { rows } = await query(sql, [id]);
    if (!rows.length) return res.status(404).json({ message: 'Article not found' });
    const art = rows[0];
    art.tags = art.tags ? art.tags.split(',') : [];
    res.json(art);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

// Update article
app.put('/articles/:id', async (req, res) => {
  const { id } = req.params;
  const { title, summary, content, tags } = req.body;
  try {
    await query(
      'UPDATE articles SET title=$1, summary=$2, content=$3, updated_at=NOW() WHERE id=$4',
      [title, summary, content, id]
    );
    await query('DELETE FROM article_tags WHERE article_id=$1', [id]);
    if (tags && tags.length) {
      const vals = tags.map((_, i) => `$${i+2}`).join(',');
      await query(
        `INSERT INTO article_tags(article_id, tag_id)
         SELECT $1, id FROM tags WHERE name IN(${vals})`,
        [id, ...tags]
      );
    }
    res.json({ message: 'Article updated' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

// Delete article
app.delete('/articles/:id', async (req, res) => {
  try {
    const { rowCount } = await query('DELETE FROM articles WHERE id=$1', [req.params.id]);
    if (!rowCount) return res.status(404).json({ message: 'Статья не найдена' });
    res.json({ message: 'Статья успешно удалена' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Ошибка сервера' });
  }
});


// Create article
app.post('/articles', async (req, res) => {
  const { title, summary, content, tags } = req.body;
  try {
    const insert = await query(
      'INSERT INTO articles(title, summary, content) VALUES($1,$2,$3) RETURNING id',
      [title, summary, content]
    );
    const articleId = insert.rows[0].id;
    if (tags && tags.length) {
      const vals = tags.map((_, i) => `$${i+2}`).join(',');
      await query(
        `INSERT INTO article_tags(article_id, tag_id)
         SELECT $1, id FROM tags WHERE name IN(${vals})`,
        [articleId, ...tags]
      );
    }
    res.status(201).json({ message: 'Article created', articleId });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

// Comments
app.get('/comments/:articleId', async (req, res) => {
  try {
    const { rows } = await query(
      `SELECT c.id, c.content, c.created_at, c.parent_comment_id, u.name AS author
       FROM comments c
       JOIN users u ON c.user_id = u.id
       WHERE c.article_id=$1 ORDER BY c.created_at ASC`,
      [req.params.articleId]
    );
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

app.post('/comments', async (req, res) => {
  const { articleId, userId, parentCommentId, content } = req.body;
  try {
    const insert = await query(
      `INSERT INTO comments(article_id, user_id, parent_comment_id, content)
       VALUES($1,$2,$3,$4) RETURNING id`,
      [articleId, userId, parentCommentId || null, content]
    );
    res.status(201).json({ message: 'Comment added successfully', commentId: insert.rows[0].id });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

app.put('/comments/:id', async (req, res) => {
  try {
    const { rowCount } = await query(
      'UPDATE comments SET content=$1 WHERE id=$2',
      [req.body.content, req.params.id]
    );
    if (!rowCount) return res.status(404).json({ message: 'Комментарий не найден' });
    res.json({ message: 'Комментарий успешно обновлен' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Ошибка сервера' });
  }
});

app.delete('/comments/:id', async (req, res) => {
  try {
    const { rowCount } = await query('DELETE FROM comments WHERE id=$1', [req.params.id]);
    if (!rowCount) return res.status(404).json({ message: 'Комментарий не найден' });
    res.json({ message: 'Комментарий успешно удален' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Ошибка сервера' });
  }
});

app.listen(8081, () => console.log('Server running on port 8081'));
