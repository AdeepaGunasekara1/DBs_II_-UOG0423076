CREATE OR REPLACE FUNCTION double_inout(INOUT num INT)
LANGUAGE plpgsql
AS $$
BEGIN 
  num := num*2;
END;
$$;

SELECT double_inout(10);