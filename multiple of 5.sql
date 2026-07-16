-- 9) Write a PL/SQL program to display multiples of 5 using for loop

set serveroutput on;
DECLARE
    n number;
    var number;
BEGIN
    n:=&n;
     DBMS_OUTPUT.put_line('Multiple of 5 upto '||n);
    for i in 1..n loop
        if mod(i,5)=0 then
    DBMS_OUTPUT.put_line(i);
    end if;
    end loop;
end;
/