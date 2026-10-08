-- A3: Illegal GOTO and Fix
SET SERVEROUTPUT ON

BEGIN
  GOTO inside_block;
  IF 1 = 1 THEN
    <<inside_block>>
    DBMS_OUTPUT.PUT_LINE('Inside the IF block');
  END IF;
END;
/
 
BEGIN
  GOTO outside_block;
  DBMS_OUTPUT.PUT_LINE('This line is skipped');
  <<outside_block>>
  DBMS_OUTPUT.PUT_LINE('Jumped to a legal label');
END;
/
