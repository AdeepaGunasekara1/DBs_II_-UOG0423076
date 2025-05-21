CREATE OR REPLACE FUNCTION get_stock_quantity(product_id INT)
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE 
    stock_quantity INT;
BEGIN
    SELECT p.stock_quantity INTO stock_quantity
    FROM product p
    WHERE p.product_id = product_id;
    
    RETURN stock_quantity;
END;
$$;


SELECT get_stock_quantity(5);