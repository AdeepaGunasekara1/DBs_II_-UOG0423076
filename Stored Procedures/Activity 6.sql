-- Activity 6: Create update_product_stock procedure
CREATE OR REPLACE PROCEDURE update_product_stock(p_id INT, new_stock INT)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE products
    SET stock_quantity = new_stock
    WHERE product_id = p_id;

    IF FOUND THEN
        RAISE NOTICE 'Stock updated for Product ID %: New stock is %', p_id, new_stock;
    ELSE
        RAISE NOTICE 'No product found with ID: %', p_id;
    END IF;
END;
$$;

-- Example call
CALL update_product_stock(1, 75);
