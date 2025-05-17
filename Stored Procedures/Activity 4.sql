-- CREATE DATABASE ABXCompany;
 CREATE DATABASE ABXCompany;

-- Connect to ABCompany before running the below:
\c abxcompany

-- Step 1: Create products table
CREATE TABLE products (
    product_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    stock_quantity INT NOT NULL
);

-- Step 2: Create stored procedure
CREATE OR REPLACE PROCEDURE add_product(
    product_name TEXT,
    product_price NUMERIC,
    product_stock INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO products (name, price, stock_quantity)
    VALUES (product_name, product_price, product_stock);

    RAISE NOTICE 'Product added: %, Price: %, Stock: %', product_name, product_price, product_stock;
END;
$$;

-- Step 3: Call the procedure
CALL add_product('Keyboard', 45.99, 50);
CALL add_product('Monitor', 230.00, 20);

-- Step 4: View products
SELECT * FROM products;
