SELECT
    d.Division_name,
    COUNT(DISTINCT p.Project_id) AS active_project_count
FROM
    Division d
JOIN
    Employee e ON d.Division_id = e.Division_Division_id
JOIN
    Employee_has_Project ehp ON e.Employee_id = ehp.Employee_Employee_id
JOIN
    Project p ON ehp.Project_Project_id = p.Project_id
WHERE
    p.status = 'In Progress'
GROUP BY
    d.Division_name
ORDER BY
    active_project_count DESC;