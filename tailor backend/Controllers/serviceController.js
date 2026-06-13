const db = require('../db');

// GET all services
const getAllServices = (req, res) => {
    db.query('SELECT * FROM tailor_services', (err, results) => {
        if (err) return res.status(500).json({ error: err.message });
        res.json(results);
    });
};

// GET single service
const getServiceById = (req, res) => {
    db.query('SELECT * FROM tailor_services WHERE id = ?',
        [req.params.id], (err, results) => {
            if (err) return res.status(500).json({ error: err.message });
            if (results.length === 0) return res.status(404).json({ message: 'Service not found' });
            res.json(results[0]);
        });
};

// POST create service
const createService = (req, res) => {
    const { title, description, price, category } = req.body;
    if (!title || !price) {
        return res.status(400).json({ message: 'Title and price required!' });
    }
    db.query(
        'INSERT INTO tailor_services (title, description, price, category) VALUES (?, ?, ?, ?)',
        [title, description, price, category],
        (err, results) => {
            if (err) return res.status(500).json({ error: err.message });
            res.json({ message: 'Service added successfully!', id: results.insertId });
        }
    );
};

// PUT update service
const updateService = (req, res) => {
    const { title, description, price, category } = req.body;
    db.query(
        'UPDATE tailor_services SET title=?, description=?, price=?, category=? WHERE id=?',
        [title, description, price, category, req.params.id],
        (err, results) => {
            if (err) return res.status(500).json({ error: err.message });
            res.json({ message: 'Service updated successfully!' });
        }
    );
};

// DELETE service
const deleteService = (req, res) => {
    db.query('DELETE FROM tailor_services WHERE id = ?',
        [req.params.id], (err, results) => {
            if (err) return res.status(500).json({ error: err.message });
            res.json({ message: 'Service deleted successfully!' });
        });
};

module.exports = {
    getAllServices,
    getServiceById,
    createService,
    updateService,
    deleteService
};