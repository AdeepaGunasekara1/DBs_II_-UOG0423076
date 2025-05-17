-- Activity 8: Calculate total stock value
CREATE OR REPLACE PROCEDURE calculate_total_stock_value_of_product(p_id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    p_name TEXT;
    p_price NUMERIC;
    p_stock INT;
    total_value NUMERIC;
BEGIN
    SELECT name, price, stock_quantity
    INTO p_name, p_price, p_stock
    FROM products
    WHERE product_id = p_id;

    IF NOT FOUND THEN
        RAISE NOTICE 'No product found with ID: %', p_id;
        RETURN;
    END IF;

    total_value := p_price * p_stock;

    RAISE NOTICE 'Product: %, Price: %, Stock: %, Total Stock Value: %',
                 p_name, p_price, p_stock, total_value;
END;
$$;

-- Example Call
CALL calculate_total_stock_value_of_product(1);
