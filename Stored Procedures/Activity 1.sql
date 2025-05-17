-- Activity 1: Procedure to add two numbers and print their sum
CREATE PROCEDURE add_numbers(num1 NUMERIC, num2 NUMERIC)
LANGUAGE plpgsql
AS $$
DECLARE
    total NUMERIC;
BEGIN
    total := num1 + num2;
    RAISE NOTICE 'The sum is: %', total;
END;
$$;

-- Calling the add_numbers procedure
CALL add_numbers(10, 20);
