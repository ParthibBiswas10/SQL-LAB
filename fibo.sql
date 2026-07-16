-- 4) Write a PL/SQL program to display the Fibonacci series upto 20000 using While loop

set serveroutput on;
DECLARE
    a number:=0;
    b number:=1;
    c number;
begin
    while a<=18 loop
        DBMS_OUTPUT.PUT_LINE(a);
        c:=a+b;
        a:=b;
        b:=c;
    end loop;
end;
