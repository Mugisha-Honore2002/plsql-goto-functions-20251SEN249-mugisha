-- A2: Salary Review (GOTO as a "continue")
-- Skips inactive employees and those already at the cap; proposes a raise for the rest.
-- Display only: no UPDATE is performed.
SET SERVEROUTPUT ON
DECLARE
  c_cap CONSTANT NUMBER := 1000000;
  v_years NUMBER;
  v_rate NUMBER;
  v_new_sal NUMBER;
BEGIN
  FOR r IN (SELECT emp_id, first_name, salary, hire_date, status FROM employees ORDER BY emp_id) LOOP

    IF r.status <> 'ACTIVE' THEN
      DBMS_OUTPUT.PUT_LINE(r.first_name || ': skipped (inactive)');
      GOTO next_employee;
    END IF;

    IF r.salary IS NULL OR r.salary <= 0 THEN
      DBMS_OUTPUT.PUT_LINE(r.first_name || ': skipped (invalid salary)');
      GOTO next_employee;
    END IF;

    IF r.salary >= c_cap THEN
      DBMS_OUTPUT.PUT_LINE(r.first_name || ': at salary cap, no raise');
      GOTO next_employee;
    END IF;

    v_years := TRUNC(MONTHS_BETWEEN(SYSDATE, r.hire_date) / 12);
    v_rate  := CASE WHEN v_years >= 10 THEN 0.10
                    WHEN v_years >= 5  THEN 0.07
                    ELSE 0.03 END;
    v_new_sal := ROUND(r.salary * (1 + v_rate));
    DBMS_OUTPUT.PUT_LINE(r.first_name || ': ' || v_years || ' yrs, ' ||
                         v_rate * 100 || '% raise -> ' || v_new_sal);

    <<next_employee>>
    NULL;   -- a label must be followed by a statement
  END LOOP;
END;
/
