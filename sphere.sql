set serveroutput on;
create table sphere(
    rad number(8),
    area number(10,2),
    volume number(10,3)

);

declare
    r number;
    a number;
    v number;
begin
    for r in 1..10 loop
        a:=4*3.14*r*r;
        v:=(4/3)*3.14*r*r*r;
        insert into sphere
        values(r,a,v);
    end loop;
    commit;
        DBMS_OUTPUT.PUT_LINE('Records inserted successfully.');
end;
/

select * from sphere;