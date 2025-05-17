-- Activity 9:check_stock_level procedure
CREATE OR REPLACE PROCEDURE check_stock_level(p_id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    p_stock INT;
BEGIN
    -- Retrieve the stock quantity for the specified product
    SELECT stock_quantity
    INTO p_stock
    FROM products
    WHERE product_id = p_id;

    -- Check if product exists
    IF NOT FOUND THEN
        RAISE NOTICE 'No product found with ID: %', p_id;
        RETURN;
    END IF;

    -- Raise notification based on stock level
    IF p_stock <= 10 THEN
        RAISE NOTICE 'Product ID %: Low stock (Stock: %)', p_id, p_stock;
    ELSIF p_stock BETWEEN 11 AND 55 THEN
        RAISE NOTICE 'Product ID %: Sufficient stock (Stock: %)', p_id, p_stock;
    ELSE
        RAISE NOTICE 'Product ID %: High stock (Stock: %)', p_id, p_stock;
    END IF;
END;
$$;

-- Example Call
CALL check_stock_level(1);

