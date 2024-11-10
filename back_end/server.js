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

app.post('/reactdb', (req, res) => {
    const { name, email, password } = req.body;
    const sql = "INSERT INTO users (Name, Email, Password) VALUES (?, ?, ?)";

    db.query(sql, [name, email, password], (err, result) => {
        if (err) {
            console.error("Error inserting data: ", err); // Логгирование ошибки
            return res.status(500).json({ message: "Internal Server Error", error: err });
        }
        return res.status(200).json({ message: "User registered successfully", data: result });
    });
});

app.listen(8081, () => {
    console.log("Listening blyatb...")
})