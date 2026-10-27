WITH numbered_projects AS (
    SELECT Start_Date,
           End_Date,
           ROW_NUMBER() OVER (ORDER BY Start_Date) AS rn
    FROM Projects
),
project_groups AS (
    SELECT Start_Date,
           End_Date,
           DATE_SUB(Start_Date, INTERVAL rn DAY) AS project_group
    FROM numbered_projects
)
SELECT MIN(Start_Date) AS project_start,
       MAX(End_Date) AS project_end
FROM project_groups
GROUP BY project_group
ORDER BY DATEDIFF(MAX(End_Date), MIN(Start_Date)),
         MIN(Start_Date);
