-- Create employee table
CREATE TABLE employee (
    employee_id      SERIAL PRIMARY KEY,
    employee_name    VARCHAR(100) NOT NULL,
    per_hour_salary  NUMERIC(12, 2) NOT NULL DEFAULT 0,
    working_hours    NUMERIC(12, 2) NOT NULL DEFAULT 0,
    payable_amount   NUMERIC(12, 2) DEFAULT 0,

    CONSTRAINT chk_per_hour_salary CHECK (per_hour_salary >= 0),
    CONSTRAINT chk_working_hours   CHECK (working_hours >= 0)
);

create or replace function calculate_payable()
returns trigger
language plpgsql
as $$
begin
	new.payable_amount := new.per_hour_salary * new.working_hours;
	if new.payable_amount>25000 then
	raise exception 'Amount greater than 25000 not allowed';
	end if;

	return new;
end;
$$;

create trigger trg_calculate_payable
before insert or update on employee
for each row
execute function calculate_payable();
INSERT INTO employee (employee_name, per_hour_salary, working_hours)
VALUES ('Jane Smith', 1000, 30);