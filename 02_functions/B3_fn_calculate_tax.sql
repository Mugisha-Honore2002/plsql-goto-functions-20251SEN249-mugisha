-- B3: Progressive monthly tax (illustrative brackets, RWF):
CREATE OR REPLACE FUNCTION fn_calculate_tax (p_salary IN NUMBER)
RETURN NUMBER
IS
BEGIN
  IF p_salary IS NULL OR p_salary < 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Salary must be a non-negative number');
  ELSIF p_salary <= 60000 THEN
    RETURN 0;
  ELSIF p_salary <= 100000 THEN
    RETURN ROUND((p_salary - 60000) * 0.20, 2);
  ELSE
    RETURN ROUND(8000 + (p_salary - 100000) * 0.30, 2);
  END IF;
END fn_calculate_tax;
/
SELECT object_name, status FROM user_objects WHERE object_type = 'FUNCTION';
