CREATE OR REPLACE FUNCTION get_product_name(p_id INT)
RETURNS SETOF TEXT
LANGUAGE plpgsql
AS 
$$
BEGIN
 --return the product name based on the product_id
 RETURN QUERY
 SELECT name
 FROM products
 WHERE product_id=p_id;
END;
$$;