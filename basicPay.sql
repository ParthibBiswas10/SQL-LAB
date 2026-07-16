-- 10) Write a PL/SQL program to calculate the salary from basic pay
set serveroutput on;
DECLARE
    BasicPay number;
    Gross number;
    da number;
    hra number;
BEGIN
    BasicPay:=&BasicPay;
    da:=&da;
    hra:=&hra;
    da:=BasicPay*(da/100);
    hra:=BasicPay*(hra/100);
    Gross:=BasicPay+da+hra;

    DBMS_OUTPUT.PUT_LINE('Basic Pay : ' || basicpay);
    DBMS_OUTPUT.PUT_LINE('DA        : ' || da);
    DBMS_OUTPUT.PUT_LINE('HRA       : ' || hra);
    DBMS_OUTPUT.PUT_LINE('Gross Salary : ' || gross);
end;
/