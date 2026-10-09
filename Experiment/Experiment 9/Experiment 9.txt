CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    per_hour_salary NUMERIC(10, 2),
    working_hours NUMERIC(10, 2),
    payable_amount NUMERIC(10, 2)
);

CREATE OR REPLACE FUNCTION calculate_and_validate_payable()
RETURNS TRIGGER AS $$
BEGIN
    NEW.payable_amount := NEW.per_hour_salary * NEW.working_hours;
    
    IF NEW.payable_amount > 25000 THEN
        RAISE EXCEPTION 'Operation rejected: Payable amount (%) exceeds the maximum limit of 25,000.', NEW.payable_amount;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_row_employee_payable
BEFORE INSERT OR UPDATE ON employee
FOR EACH ROW
EXECUTE FUNCTION calculate_and_validate_payable();

CREATE OR REPLACE FUNCTION notify_rows_updated()
RETURNS TRIGGER AS $$
BEGIN
    RAISE NOTICE 'Rows Updated Successfully';
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_statement_employee_success
AFTER INSERT OR UPDATE ON employee
FOR EACH STATEMENT
EXECUTE FUNCTION notify_rows_updated();

INSERT INTO employee (emp_id, emp_name, per_hour_salary, working_hours) 
VALUES (1, 'Alice Smith', 150.00, 100);

INSERT INTO employee (emp_id, emp_name, per_hour_salary, working_hours) 
VALUES (2, 'Bob Jones', 200.00, 150);

UPDATE employee 
SET working_hours = 120 
WHERE emp_id = 1;