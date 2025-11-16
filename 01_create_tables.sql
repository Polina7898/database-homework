
-- Скрипт создания таблиц для нормализованной БД



DROP TABLE IF EXISTS transactions CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS locations CASCADE;

-- ====================================================================
-- Таблица locations 
-- ====================================================================
CREATE TABLE locations (
    location_id INTEGER PRIMARY KEY,
    postcode INTEGER NOT NULL UNIQUE,
    state VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL
);

-- ====================================================================
-- Таблица products 
-- ====================================================================
CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    brand VARCHAR(100),
    product_line VARCHAR(50),
    product_class VARCHAR(20),
    product_size VARCHAR(20),
    list_price DECIMAL(10,2) NOT NULL,
    standard_cost DECIMAL(10,2)
);

-- ====================================================================
-- Таблица customers 
-- ====================================================================
CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    gender VARCHAR(10) NOT NULL,
    date_of_birth DATE,
    job_title VARCHAR(100),
    job_industry_category VARCHAR(100),
    wealth_segment VARCHAR(50) NOT NULL,
    deceased_indicator CHAR(1) NOT NULL,
    owns_car VARCHAR(3) NOT NULL,
    address VARCHAR(255) NOT NULL,
    location_id INTEGER NOT NULL,
    property_valuation INTEGER NOT NULL,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

-- ====================================================================
-- Таблица transactions 
-- ====================================================================
CREATE TABLE transactions (
    transaction_id INTEGER PRIMARY KEY,
    product_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    transaction_date DATE NOT NULL,
    online_order BOOLEAN,
    order_status VARCHAR(20) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE INDEX idx_customer_date ON transactions(customer_id, transaction_date);
CREATE INDEX idx_product ON transactions(product_id);
CREATE INDEX idx_date ON transactions(transaction_date);
CREATE INDEX idx_customer_location ON customers(location_id);
