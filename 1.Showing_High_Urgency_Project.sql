SELECT
    Project_name,
    Urgency_level,
    status,
    start_date,
    end_date
FROM
    Project
WHERE
    Urgency_level IN ('High');