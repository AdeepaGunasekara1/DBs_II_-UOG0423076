CREATE OR REPLACE FUNCTION get_product_details(p_id INT)
RETURNS TABLE(product_name TEXT,product_price DECIMAL)
LANGUAGE plpgsql
AS
$$
BEGIN
 -- return the product name and price for the given product_id
 RETURN QUERY
 SELECT name,price
 FROM product
 WHERE product_id=p_id;
END;
$$;