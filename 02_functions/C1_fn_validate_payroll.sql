-- C1: Payroll validator (combines B1-B4, GOTO and exception handling)
-- Returns 'VALID' or a message beginning 'INVALID:' / 'ERROR:'.
-- Run B1-B4 first.
CREATE OR REPLACE FUNCTION fn_validate_payroll (p_emp_id IN NUMBER)
RETURN VARCHAR2
IS
  v_emp  employees%ROWTYPE;
  v_msg  VARCHAR2(200) := 'VALID';
  v_tax  NUMBER;
BEGIN
  SELECT * INTO v_emp FROM employees WHERE emp_id = p_emp_id;

  IF v_emp.status <> 'ACTIVE' THEN
    v_msg := 'INVALID: employee is not active';
    GOTO done;
  END IF;

  IF v_emp.salary IS NULL OR v_emp.salary <= 0 THEN
    v_msg := 'INVALID: salary must be greater than zero';
    GOTO done;
  END IF;

  IF fn_dept_name(v_emp.dept_id) = 'Unknown' THEN
    v_msg := 'INVALID: department ' || v_emp.dept_id || ' does not exist';
    GOTO done;
  END IF;

  v_tax := fn_calculate_tax(v_emp.salary);
  IF v_tax >= v_emp.salary THEN
    v_msg := 'INVALID: tax exceeds salary';
    GOTO done;
  END IF;

  IF fn_years_of_service(p_emp_id) < 0 THEN
    v_msg := 'INVALID: hire date is in the future';
    GOTO done;
  END IF;

  <<done>>
  RETURN v_msg;
EXCEPTION
  WHEN NO_DATA_FOUND THEN RETURN 'INVALID: employee not found';
  WHEN OTHERS        THEN RETURN 'ERROR: ' || SQLERRM;
END fn_validate_payroll;
/
