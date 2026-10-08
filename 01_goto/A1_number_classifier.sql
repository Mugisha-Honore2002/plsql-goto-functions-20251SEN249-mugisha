SET SERVEROUTPUT ON
DECLARE
  v_num    NUMBER := 7;
  v_sign   VARCHAR2(20);
  v_parity VARCHAR2(20);
BEGIN
  IF v_num = 0 THEN GOTO is_zero; END IF;
  IF v_num < 0 THEN GOTO is_negative; END IF;

  v_sign := 'Positive';
  GOTO check_parity;

  <<is_zero>>
  v_sign := 'Zero';
  v_parity := 'Even';
  GOTO show_result;

  <<is_negative>>
  v_sign := 'Negative';

  <<check_parity>>
  IF MOD(v_num, 2) = 0 THEN GOTO is_even; END IF;
  v_parity := 'Odd';
  GOTO show_result;

  <<is_even>>
  v_parity := 'Even';

  <<show_result>>
  DBMS_OUTPUT.PUT_LINE(v_num || ' is ' || v_sign || ' and ' || v_parity);
END;
/