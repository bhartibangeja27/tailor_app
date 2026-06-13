const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

// 🗄️ MySQL Connection Setup (Port: 4306)
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '', 
    port: 4306, 
    database: 'project1'
});

db.connect((err) => {
    if (err) {
        console.error('Database connection failed: ' + err.message);
        return;
    }
    console.log('Connected to MySQL Database (project1) successfully! 🎉');
});

// =======================================================
// 🛠️ MODULE 1: TAILOR SERVICES (COMPLETE CRUD)
// =======================================================
app.post('/api/services', (req, res) => {
    const { title, description, price, category } = req.body;
    const sql = "INSERT INTO tailor_services (title, description, price, category) VALUES (?, ?, ?, ?)";
    db.query(sql, [title, description, price, category], (err, result) => {
        if (err) return res.status(500).json({ error: err.message });
        res.status(201).json({ message: "Service added successfully!", id: result.insertId });
    });
});

app.get('/api/services', (req, res) => {
    const sql = "SELECT * FROM tailor_services";
    db.query(sql, (err, results) => {
        if (err) return res.status(500).json({ error: err.message });
        res.status(200).json(results);
    });
});

app.put('/api/services/:id', (req, res) => {
    const { id } = req.params;
    const { title, description, price, category } = req.body;
    const sql = "UPDATE tailor_services SET title=?, description=?, price=?, category=? WHERE id=?";
    db.query(sql, [title, description, price, category, id], (err, result) => {
        if (err) return res.status(500).json({ error: err.message });
        res.status(200).json({ message: "Service updated successfully!" });
    });
});

app.delete('/api/services/:id', (req, res) => {
    const { id } = req.params;
    const sql = "DELETE FROM tailor_services WHERE id=?";
    db.query(sql, [id], (err, result) => {
        if (err) return res.status(500).json({ error: err.message });
        res.status(200).json({ message: "Service deleted successfully!" });
    });
});

// =======================================================
// 📦 MODULE 2: CUSTOMER ORDERS (COMPLETE CRUD)
// =======================================================
app.post('/api/orders', (req, res) => {
    const { customer_name, dress_type, measurement, price, status } = req.body;
    const sql = "INSERT INTO customer_orders (customer_name, dress_type, measurement, price, status) VALUES (?, ?, ?, ?, ?)";
    db.query(sql, [customer_name, dress_type, measurement, price, status || 'Pending'], (err, result) => {
        if (err) return res.status(500).json({ error: err.message });
        res.status(201).json({ message: "Order placed successfully!", orderId: result.insertId });
    });
});

app.get('/api/orders', (req, res) => {
    const sql = "SELECT * FROM customer_orders";
    db.query(sql, (err, results) => {
        if (err) return res.status(500).json({ error: err.message });
        res.status(200).json(results);
    });
});

app.put('/api/orders/:id', (req, res) => {
    const { id } = req.params;
    const { customer_name, dress_type, measurement, price, status } = req.body;
    const sql = "UPDATE customer_orders SET customer_name=?, dress_type=?, measurement=?, price=?, status=? WHERE id=?";
    db.query(sql, [customer_name, dress_type, measurement, price, status, id], (err, result) => {
        if (err) return res.status(500).json({ error: err.message });
        res.status(200).json({ message: "Order updated successfully!" });
    });
});

app.delete('/api/orders/:id', (req, res) => {
    const { id } = req.params;
    const sql = "DELETE FROM customer_orders WHERE id=?";
    db.query(sql, [id], (err, result) => {
        if (err) return res.status(500).json({ error: err.message });
        res.status(200).json({ message: "Order deleted successfully!" });
    });
});

const PORT = 5000;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT} 🚀`);
});