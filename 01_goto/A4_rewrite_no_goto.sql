SET SERVEROUTPUT ON
DECLARE
  v_num NUMBER := 7;
  v_sign VARCHAR2(20);
  v_parity VARCHAR2(20);
BEGIN
  v_sign := CASE WHEN v_num = 0 THEN 'Zero'
                 WHEN v_num > 0 THEN 'Positive'
                 ELSE 'Negative' END;
  v_parity := CASE WHEN MOD(v_num, 2) = 0 THEN 'Even' ELSE 'Odd' END;
  DBMS_OUTPUT.PUT_LINE(v_num || ' is ' || v_sign || ' and ' || v_parity);
END;
/