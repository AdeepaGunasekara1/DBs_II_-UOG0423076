-- Activity 10: Check_stock_category procedure
CREATE OR REPLACE PROCEDURE check_stock_category(p_id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    p_stock INT;
    stock_status TEXT;
BEGIN
    -- Retrieve the stock quantity of the given product_id
    SELECT stock_quantity
    INTO p_stock
    FROM products
    WHERE product_id = p_id;

    -- Check if product was found
    IF NOT FOUND THEN
        RAISE NOTICE 'No product found with ID: %', p_id;
        RETURN;
    END IF;

    -- Use CASE to determine stock category
    stock_status := CASE
        WHEN p_stock < 10 THEN 'Low Stock'
        WHEN p_stock BETWEEN 10 AND 50 THEN 'Moderate Stock'
        ELSE 'High Stock'
    END;

    -- Raise notice with category
    RAISE NOTICE 'Product ID % has % (Stock Quantity: %)', p_id, stock_status, p_stock;
END;
$$;

-- Example Call
CALL check_stock_category(1);
