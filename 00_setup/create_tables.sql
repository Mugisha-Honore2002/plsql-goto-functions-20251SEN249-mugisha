-- 00_setup/create_tables.sql
-- Creates DEPARTMENTS and EMPLOYEES with sample data. Salary = MONTHLY gross (RWF).
SET SERVEROUTPUT ON

BEGIN
  FOR t IN (SELECT 'EMPLOYEES' n FROM dual UNION ALL SELECT 'DEPARTMENTS' FROM dual) LOOP
    BEGIN
      EXECUTE IMMEDIATE 'DROP TABLE ' || t.n || ' PURGE';
    EXCEPTION WHEN OTHERS THEN NULL;  -- table did not exist
    END;
  END LOOP;
END;
/

CREATE TABLE departments (
  dept_id NUMBER PRIMARY KEY,
  dept_name VARCHAR2(50) NOT NULL
);

CREATE TABLE employees (
  emp_id NUMBER PRIMARY KEY,
  first_name VARCHAR2(30) NOT NULL,
  last_name VARCHAR2(30) NOT NULL,
  dept_id NUMBER,
  salary NUMBER(12,2),
  hire_date DATE,
  status VARCHAR2(10) DEFAULT 'ACTIVE'
);

INSERT INTO departments VALUES (10, 'Finance');
INSERT INTO departments VALUES (20, 'IT');
INSERT INTO departments VALUES (30, 'Human Resources');

-- registering employees
INSERT INTO employees VALUES (1, 'Alice', 'Uwase', 10, 850000,  DATE '2015-03-01', 'ACTIVE');
INSERT INTO employees VALUES (2, 'Brian', 'Mugisha', 20, 450000,  DATE '2020-07-15', 'ACTIVE');
INSERT INTO employees VALUES (3, 'Chantal','Ingabire', 20,  80000,  DATE '2023-01-10', 'ACTIVE');
INSERT INTO employees VALUES (4, 'David', 'Habimana', 30, 300000,  DATE '2012-11-20', 'INACTIVE');
INSERT INTO employees VALUES (5, 'Esther', 'Niyonsenga', 99, 520000,  DATE '2018-05-05', 'ACTIVE');
INSERT INTO employees VALUES (6, 'Frank', 'Kamanzi', 10, 0,  DATE '2019-09-09', 'ACTIVE');
INSERT INTO employees VALUES (7, 'Grace', 'Mukamana', 30, 1200000, DATE '2010-02-14', 'ACTIVE');
COMMIT;

   SELECT COUNT(*) FROM departments;   -- expect 3
   SELECT COUNT(*) FROM employees;     -- expect 7