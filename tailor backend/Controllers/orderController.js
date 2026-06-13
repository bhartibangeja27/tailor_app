const db = require('../db');

// GET all orders
const getAllOrders = (req, res) => {
    db.query('SELECT * FROM customer_orders', (err, results) => {
        if (err) return res.status(500).json({ error: err.message });
        res.json(results);
    });
};

// GET single order
const getOrderById = (req, res) => {
    db.query('SELECT * FROM customer_orders WHERE id = ?',
        [req.params.id], (err, results) => {
            if (err) return res.status(500).json({ error: err.message });
            if (results.length === 0) return res.status(404).json({ message: 'Order not found' });
            res.json(results[0]);
        });
};

// POST create order
const createOrder = (req, res) => {
    const { customer_name, dress_type, measurement, price, status } = req.body;
    if (!customer_name || !price) {
        return res.status(400).json({ message: 'Name and price required!' });
    }
    db.query(
        'INSERT INTO customer_orders (customer_name, dress_type, measurement, price, status) VALUES (?, ?, ?, ?, ?)',
        [customer_name, dress_type, measurement, price, status || 'Pending'],
        (err, results) => {
            if (err) return res.status(500).json({ error: err.message });
            res.json({ message: 'Order placed successfully!', id: results.insertId });
        }
    );
};

// PUT update order
const updateOrder = (req, res) => {
    const { customer_name, dress_type, measurement, price, status } = req.body;
    db.query(
        'UPDATE customer_orders SET customer_name=?, dress_type=?, measurement=?, price=?, status=? WHERE id=?',
        [customer_name, dress_type, measurement, price, status, req.params.id],
        (err, results) => {
            if (err) return res.status(500).json({ error: err.message });
            res.json({ message: 'Order updated successfully!' });
        }
    );
};

// DELETE order
const deleteOrder = (req, res) => {
    db.query('DELETE FROM customer_orders WHERE id = ?',
        [req.params.id], (err, results) => {
            if (err) return res.status(500).json({ error: err.message });
            res.json({ message: 'Order deleted successfully!' });
        });
};

module.exports = {
    getAllOrders,
    getOrderById,
    createOrder,
    updateOrder,
    deleteOrder
};