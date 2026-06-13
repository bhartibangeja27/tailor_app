const express = require('express');
const cors = require('cors');
const app = express();

app.use(cors());
app.use(express.json());

// Routes
const serviceRoutes = require('./Routes/services');
const orderRoutes = require('./Routes/orders');

app.use('/api/services', serviceRoutes);
app.use('/api/orders', orderRoutes);

app.listen(5000, () => {
    console.log('Server running on port 5000 🚀');
});