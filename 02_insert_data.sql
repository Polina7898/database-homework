
-- Скрипт загрузки данных в БД

\COPY locations(postcode, state, country, location_id) FROM '/Users/polina/Desktop/Кузнецова_Полина_ДЗ1/data/locations.csv' WITH (FORMAT csv, HEADER true, NULL '');

\COPY products(product_id, brand, product_line, product_class, product_size, list_price, standard_cost) FROM '/Users/polina/Desktop/Кузнецова_Полина_ДЗ1/data/products.csv' WITH (FORMAT csv, HEADER true, NULL '');

\COPY customers(customer_id, first_name, last_name, gender, date_of_birth, job_title, job_industry_category, wealth_segment, deceased_indicator, owns_car, address, property_valuation, location_id) FROM '/Users/polina/Desktop/Кузнецова_Полина_ДЗ1/data/customers_norm.csv' WITH (FORMAT csv, HEADER true, NULL '');

\COPY transactions(transaction_id, product_id, customer_id, transaction_date, online_order, order_status) FROM '/Users/polina/Desktop/Кузнецова_Полина_ДЗ1/data/transactions_norm.csv' WITH (FORMAT csv, HEADER true, NULL '');

SELECT 'locations' AS table_name, COUNT(*) AS row_count FROM locations
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'customers', COUNT(*) FROM customers
UNION ALL
SELECT 'transactions', COUNT(*) FROM transactions;
