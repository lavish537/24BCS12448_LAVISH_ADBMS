SELECT s.St_Name,
       c.Course_Name
FROM student s
CROSS JOIN course c;
