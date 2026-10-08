-- B5: Using the functions in SQL
SET LINESIZE 200
COL first_name FORMAT A12
COL dept FORMAT A16
SELECT emp_id,
       first_name,
       fn_dept_name(dept_id) AS dept,
       salary AS monthly_salary,
       fn_annual_salary(emp_id) AS annual_salary,
       fn_years_of_service(emp_id) AS years_service,
       fn_calculate_tax(salary) AS monthly_tax
FROM   employees
WHERE  status = 'ACTIVE'
ORDER  BY emp_id;

-- Functions also work in WHERE / ORDER BY:
SELECT first_name, fn_annual_salary(emp_id) AS annual
FROM   employees
WHERE  fn_years_of_service(emp_id) >= 5
ORDER  BY annual DESC;
