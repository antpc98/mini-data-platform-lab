CREATE TABLE IF NOT EXISTS raw_orders (
    id SERIAL PRIMARY KEY,
    order_id TEXT,
    order_date TEXT,
    customer_id TEXT,
    city TEXT,
    product TEXT,
    category TEXT,
    quantity INTEGER,
    unit_price FLOAT,
    payment_method TEXT,
    status TEXT,
    ingest_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);