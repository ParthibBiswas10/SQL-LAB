-- check Leap Year



set serveroutput on;
DECLARE
    n number; -- n means year
    
BEGIN
    n:=&n;
        if (mod(n,400)=0) or (mod(n,4)=0 and mod(n,100)<>0) then
            DBMS_OUTPUT.put_line(n||' is Leap Year');
        else
            DBMS_OUTPUT.put_line(n||'is not Leap Year');
         end if;
end;
/