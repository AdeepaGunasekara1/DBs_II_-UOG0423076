-- Activity 5: Create get_product_by_id procedure
CREATE OR REPLACE PROCEDURE get_product_by_id(p_id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    p_name TEXT;
    p_price NUMERIC;
    p_stock INT;
BEGIN
    SELECT name, price, stock_quantity
    INTO p_name, p_price, p_stock
    FROM products
    WHERE product_id = p_id;

    IF NOT FOUND THEN
        RAISE NOTICE 'No product found with ID: %', p_id;
    ELSE
        RAISE NOTICE 'Product ID: %, Name: %, Price: %, Stock: %',
            p_id, p_name, p_price, p_stock;
    END IF;
END;
$$;

-- Call to get_product_by_id
CALL get_product_by_id(1);









