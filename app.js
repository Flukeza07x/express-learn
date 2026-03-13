const express = require('express');
const chalk = require('chalk')
const debug = require('debug')('app');
const morgan = require('morgan');
const path = require('path');
const app = express();
const PORT = process.env.PORT;
const productsRouter = require("./src/router/productsRouter");



app.use(morgan('combined'))
app.use(express.static(path.join(__dirname,"/public/")))

app.set("views", "./src/views");
app.set("view engine", "ejs")



app.use("/products", productsRouter)

app.get("/", (req,res) => {

    res.render('index',{username: 'Flukeza07x', customer: ["test","test2","test3"]});


})

// เพิ่มการเรียกใช้งานไฟล์ db
const db = require('./src/config/db');

app.get("/check-db", async (req, res) => {
    try {
        // ลอง query  เพื่อเช็คการเชื่อมต่อ
        await db.query('SELECT 1'); 
        res.render('checkconnect', { 
            status: 'success', 
            message: 'เชื่อมต่อสำเร็จแล้วจ้า! (Port 9906)' 
        });
    } catch (error) {
        res.render('checkconnect', { 
            status: 'error', 
            message: 'เชื่อมต่อไม่สำเร็จ: ' + error.message 
        });
    }
});


// 1. หน้าแสดงรายการเพื่อแก้ไข
app.get("/productsedit", async (req, res) => {
    try {
        const [rows] = await db.query("SELECT * FROM stock");
        res.render("productsedit", { items: rows });
    } catch (error) {
        res.status(500).send("Error: " + error.message);
    }
});

// 2. รับค่าจาก Form เพื่อ Update ราคา
app.post("/productsedit/update", express.urlencoded({ extended: true }), async (req, res) => {
    try {
        const { id, price } = req.body;
        await db.query("UPDATE stock SET price = ? WHERE id = ?", [price, id]);
        res.redirect("/productsedit"); // อัปเดตเสร็จให้กลับไปหน้าเดิม
    } catch (error) {
        res.status(500).send("Update Error: " + error.message);
    }
});

app.listen(PORT,() => {

   debug("ฟังๆ on port %s", chalk.red(PORT));
})