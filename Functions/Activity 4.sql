CREATE OR REPLACE FUNCTION reduce_price(price INT)
RETURNS VOID
LANGUAGE plpgsql
AS $$
BEGIN 
  UPDATE product
  SET price = price * 0.75
  WHERE stock_quantity>20;
END;
$$;

SELECT reduce_price(5);