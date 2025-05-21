CREATE OR REPLACE FUNCTION double_price(price DECIMAL(10,2)) 
RETURNS DECIMAL(10,2) 
LANGUAGE plpgsql
AS $$
BEGIN 
  RETURN price * 2;
END;
$$;

SELECT double_price(100);