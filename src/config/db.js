const mysql = require('mysql2');

// สร้าง connection pool
const pool = mysql.createPool({
    host: '127.0.0.1',
    user: 'admin',      
    password: '1234',  
    database: 'express',
    port: 9906
});

// แปลงเป็นรูปแบบ promise เพื่อให้ใช้ async/await ได้ง่าย
const promisePool = pool.promise();

module.exports = promisePool;