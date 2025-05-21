CREATE OR REPLACE FUNCTION is_even (num INT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
BEGIN 
  IF (num %2=0) THEN 
     RETURN true;
  ELSE 
     RETURN false;
  END IF;
END;
$$;

 SELECT is_even(10);