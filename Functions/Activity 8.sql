CREATE OR REPLACE FUNCTION get_stock_value(product_id INT)
RETURNS DECIMAL
LANGUAGE plpgsql
AS $$
DECLARE
    stock_value DECIMAL;
BEGIN
    SELECT price * stock_quantity INTO stock_value
    FROM products
    WHERE products.product_id = product_id;

    RETURN stock_value;
END;
$$;