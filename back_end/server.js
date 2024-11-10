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
    const sqlCheckEmail = "SELECT * FROM users WHERE Email = ?";
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

            const sqlInsertUser = "INSERT INTO users (Name, Email, Password) VALUES (?, ?, ?)";
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
    const sql = "SELECT * FROM users WHERE Email = ?";

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
        bcrypt.compare(password, user.Password, (err, isMatch) => {
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



app.listen(8081, () => {
    console.log("Listening slyshayu...")
})