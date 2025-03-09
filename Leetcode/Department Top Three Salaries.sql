SELECT
    d1.name AS "Department",
    e1.name AS "Employee",
    e1.salary AS "Salary"
FROM
    department d1
JOIN
    employee e1
ON
    d1.id = e1.departmentId
WHERE
    e1.salary IN
    ( 
        -- Top 3 unique highest salaries for a Department
        SELECT
            e.salary
        FROM
            Department d
        JOIN
            Employee e
        ON
            d.id = e.departmentId
        WHERE
            d.id = d1.id
        GROUP BY 
            e.salary
        ORDER BY 
            e.salary DESC
        LIMIT 3
    );
