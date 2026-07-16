-- 8) Write a PL/SQL program to display all multiples of 3 up to a number using while loop


set serveroutput on;
DECLARE
    n number;
    i NUMBER := 1;
BEGIN
    n:=&n;
     DBMS_OUTPUT.put_line('Multiple of 3 upto '||n);
    while i<=n loop
        if mod(i,3)=0 then
            DBMS_OUTPUT.put_line(i);
         end if;
        i:=i+1;
    end loop;
end;
/