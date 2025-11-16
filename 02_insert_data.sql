-- ====================================================================
-- Скрипт загрузки данных в БД
-- Автор: Кузнецова Полина
-- ====================================================================

-- ВАЖНО: Перед запуском нужно поменять пути к CSV-файлам
-- на те, где они находятся на вашем компьютере!

-- Загружаю locations
\COPY locations(postcode, state, country, location_id) FROM '/home/ubuntu/locations.csv' WITH (FORMAT csv, HEADER true, NULL '');

-- Загружаю products
\COPY products(product_id, brand, product_line, product_class, product_size, list_price, standard_cost) FROM '/home/ubuntu/products.csv' WITH (FORMAT csv, HEADER true, NULL '');

-- Загружаю customers
\COPY customers(customer_id, first_name, last_name, gender, date_of_birth, job_title, job_industry_category, wealth_segment, deceased_indicator, owns_car, address, property_valuation, location_id) FROM '/home/ubuntu/customers_norm.csv' WITH (FORMAT csv, HEADER true, NULL '');

-- Загружаю transactions
\COPY transactions(transaction_id, product_id, customer_id, transaction_date, online_order, order_status) FROM '/home/ubuntu/transactions_norm.csv' WITH (FORMAT csv, HEADER true, NULL '');

-- Проверяю, сколько строк загрузилось
SELECT 'locations' AS table_name, COUNT(*) AS row_count FROM locations
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'customers', COUNT(*) FROM customers
UNION ALL
SELECT 'transactions', COUNT(*) FROM transactions;
