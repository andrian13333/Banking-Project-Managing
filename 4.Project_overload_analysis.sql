SELECT
    e.Employee_name,
    d.Division_name,
    COUNT(p.Project_id) AS running_project_count
FROM
    Employee e
JOIN
    Employee_has_Project ehp ON e.Employee_id = ehp.Employee_Employee_id
JOIN
    Project p ON ehp.Project_Project_id = p.Project_id
JOIN
    Division d ON e.Division_Division_id = d.Division_id
WHERE
    p.status = 'In Progress'
GROUP BY
    e.Employee_id, e.Employee_name, d.Division_name
HAVING
    running_project_count > 3;