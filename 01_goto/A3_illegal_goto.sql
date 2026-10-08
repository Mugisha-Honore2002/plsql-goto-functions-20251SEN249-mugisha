-- A3: Illegal GOTO and Fix
SET SERVEROUTPUT ON

PROMPT === PART 1: ILLEGAL (GOTO into an IF block) ===
BEGIN
  GOTO inside_block;
  IF 1 = 1 THEN
    <<inside_block>>
    DBMS_OUTPUT.PUT_LINE('Inside the IF block');
  END IF;
END;
/

PROMPT === PART 2: FIX (label at the same block level) ===
BEGIN
  GOTO outside_block;
  DBMS_OUTPUT.PUT_LINE('This line is skipped');
  <<outside_block>>
  DBMS_OUTPUT.PUT_LINE('Jumped to a legal label');
END;
/