-- Activity 2: Combine first name and last name and print full name
CREATE PROCEDURE name(first_name TEXT, last_name TEXT)
LANGUAGE plpgsql
AS $$
DECLARE
    name TEXT;
BEGIN
    name := first_name || ' ' || last_name;
    RAISE NOTICE 'The full name is: %', name;
END;
$$;

-- Calling the name procedure
CALL name('Adeepa','Gunasekara');
