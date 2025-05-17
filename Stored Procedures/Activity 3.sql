-- Activity 3: Procedure to double salary using INOUT and a DO block
CREATE OR REPLACE PROCEDURE double_value(INOUT salary NUMERIC)
LANGUAGE plpgsql
AS $$
BEGIN
    salary := salary * 2;
END;
$$;

-- DO block to test double_value procedure
DO $$
DECLARE
    my_salary NUMERIC := 25000;
BEGIN
    CALL double_value(my_salary);
    RAISE NOTICE 'Doubled salary is: %', my_salary;
END;
$$;