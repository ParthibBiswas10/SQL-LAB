CREATE FUNCTION getNthHighestSalary(n INT) RETURNS INT
BEGIN
    set n=n-1;
    RETURN (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT 1 OFFSET n
    );
END