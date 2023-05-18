const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
const app = express();
const port = 8080;

app.use(cors());

const db = mysql.createConnection({
  host: 'news-db-container',
  user: 'root',
  password: 'root',
  database: 'newsdb'
});

db.connect((err) => {
  if(err) throw err;
  console.log('Connected to the database');
});

app.get('/getUrgentNews', (req, res) => {
  let sql = 'SELECT * FROM News ORDER BY created_at DESC LIMIT 10';
  db.query(sql, (err, results) => {
    if(err) throw err;
    res.send(results);
  });
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
