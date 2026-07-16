set serveroutput on;
CREATE TABLE random_no(
    rand_no Number(20)
);

DECLARE
    r number;
BEGIN   
    for i in 1..100 loop
        r:=trunc(dbms_random.value(1,1000));
        insert into random_no VALUES(r);
     end loop;
     commit;
    
    DBMS_OUTPUT.PUT_LINE('100 random numbers inserted.');
end;
/

select * from random_no;