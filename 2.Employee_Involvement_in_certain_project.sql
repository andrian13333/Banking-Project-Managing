SELECT
    p.Project_name,
    e.Employee_name
FROM
    Project p
JOIN
    Employee_has_Project ehp ON p.Project_id = ehp.Project_Project_id
JOIN
    Employee e ON ehp.Employee_Employee_id = e.Employee_id
WHERE
    p.Project_name = 'Automation';