-- Tests for C1 against the sample data
SET SERVEROUTPUT ON
BEGIN
  FOR r IN (SELECT emp_id, first_name FROM employees ORDER BY emp_id) LOOP
    DBMS_OUTPUT.PUT_LINE(RPAD(r.first_name, 10) || ' -> ' || fn_validate_payroll(r.emp_id));
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(RPAD('emp 999', 10) || ' -> ' || fn_validate_payroll(999));
END;
/
-- Expected: 1,2,3,7 VALID | 4 not active | 5 dept 99 missing | 6 salary | 999 not found
