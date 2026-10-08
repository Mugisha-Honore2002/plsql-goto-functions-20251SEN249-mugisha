-- Tests for B1-B4 (expected values in comments)
SET SERVEROUTPUT ON
BEGIN
  DBMS_OUTPUT.PUT_LINE('B1 emp 1 annual (10200000): '|| fn_annual_salary(1));
  DBMS_OUTPUT.PUT_LINE('B1 emp 999 (NULL): ' || NVL(TO_CHAR(fn_annual_salary(999)), 'NULL'));
  DBMS_OUTPUT.PUT_LINE('B2 emp 1 years: ' || fn_years_of_service(1));
  DBMS_OUTPUT.PUT_LINE('B3 tax 50000 (0): ' || fn_calculate_tax(50000));
  DBMS_OUTPUT.PUT_LINE('B3 tax 80000 (4000): ' || fn_calculate_tax(80000));
  DBMS_OUTPUT.PUT_LINE('B3 tax 450000 (113000): ' || fn_calculate_tax(450000));
  DBMS_OUTPUT.PUT_LINE('B4 dept 20 (IT): ' || fn_dept_name(20));
  DBMS_OUTPUT.PUT_LINE('B4 dept 99 (Unknown): ' || fn_dept_name(99));
  BEGIN
    DBMS_OUTPUT.PUT_LINE(fn_calculate_tax(-1));
  EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('B3 negative salary raised: ' || SQLERRM);
  END;
END;
/
