set serveroutput on;
DECLARE
    str varchar2(100);
    rev varchar2(100):='';
BEGIN
    str:='&str';
    for i in reverse 1..Length(str) loop
        rev:=rev||SUBSTR(str,i,1);
    end loop;
    DBMS_OUTPUT.PUT_LINE('original String:'||str);
    DBMS_OUTPUT.PUT_LINE('reversed String: '||REv);
end;
/
