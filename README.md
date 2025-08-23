# Banking-Project-Managing

📝 Project Overview
This project is a data analysis simulation focused on tracking and managing various corporate projects within an organization. The primary goal is to leverage SQL to extract operational and strategic insights related to project urgency, resource allocation, divisional workload, and the identification of potential project delays.

🎯 Business Problem
The management team faces challenges in gaining a clear, data-driven overview of the project landscape. Key difficulties include:

Identifying which projects are the most urgent and require immediate attention.

Understanding the distribution of workload across different divisions and employees.

Proactively detecting projects that are at risk of falling behind schedule.

Assessing the overall performance and completion rates of projects.

📊 Dataset
The dataset was built from the ground up to simulate a realistic corporate environment. Dummy data was generated using Mockaroo, incorporating conditional logic to ensure data integrity (e.g., projects with 'In Progress' or 'Pending' statuses do not have an end_date).

Database Schema (EERD):
The database consists of several interconnected tables including Project, Employee, Division, Product, and junction tables to manage the many-to-many relationships.

(https://github.com/andrian13333/Banking-Project-Managing/blob/d7083a24010aaa757f21fadab5fd616cc27d0781/EERD_Banking_Project_Management.png)

🛠️ Tools Used
Database: MySQL

IDE: MySQL Workbench (For EERD design, query execution, and database management)

Data Generation: Mockaroo

Version Control: Git & GitHub

🔍 Analysis & Key Findings
A series of SQL queries were developed to answer critical business questions. Below are some key examples:

1. Project Performance Report
Business Question: How can we categorize the performance of all projects at a glance?
Insight: This query creates a dynamic performance status for each project, allowing management to quickly differentiate between projects that were completed on time, late, or are currently at risk of delay. This is a crucial report for periodic performance reviews.

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

2. At-Risk Projects Identification
Business Question: Which active projects have already passed their target completion date?
Insight: This query acts as an early warning system, highlighting projects that require immediate intervention to mitigate further delays and manage stakeholder expectations.

SELECT
    Project_name,
    Urgency_level,
    start_date,
    end_date,
    DATEDIFF(CURDATE(), end_date) AS days_overdue
FROM
    Project
WHERE
    end_date < CURDATE() AND status = 'In Progress';

3. Division Workload Analysis
Business Question: How many active projects is each division currently handling?
Insight: By quantifying the workload, management can make informed decisions about resource allocation, identify potential bottlenecks within specific divisions, and plan for future project assignments more effectively.

-- Calculates the number of active projects being handled by each division.
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

🚀 How to Use
To replicate this project:

Run the 1.Dataset_Banking_Project_Mangement.sql script to create all necessary tables and relationships with sample data.

Execute the queries found in this repositories to perform the analysis.
