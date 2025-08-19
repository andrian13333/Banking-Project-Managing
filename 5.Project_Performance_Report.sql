SELECT
    Project_name,
    status,
    end_date,
    CASE
        WHEN status = 'Completed' AND end_date <= end_date THEN 'Completed On Time'
        WHEN status = 'Completed' AND end_date > end_date THEN 'Completed Late'
        WHEN status = 'In Progress' AND end_date < CURDATE() THEN 'In Progress & At Risk of Delay'
        ELSE 'In Progress On Schedule'
    END AS Project_Performance
FROM
    Project;