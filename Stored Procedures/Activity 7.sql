-- Activity 7: Create delete_product procedure
CREATE OR REPLACE PROCEDURE delete_product(p_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM products
    WHERE product_id = p_id;

    IF FOUND THEN
        RAISE NOTICE 'Product with ID % has been deleted.', p_id;
    ELSE
        RAISE NOTICE 'No product found with ID: %', p_id;
    END IF;
END;
$$;

-- Example call
CALL delete_product(2);