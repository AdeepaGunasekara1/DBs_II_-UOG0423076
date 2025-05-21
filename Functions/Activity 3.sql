CREATE OR REPLACE FUNCTION calculate_square(num INT,OUT result INT)
LANGUAGE plpgsql
AS $$ 
BEGIN 
  result := num * num;
END;
$$;

SELECT calculate_square(5);