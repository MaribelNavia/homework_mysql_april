#1 Write a query to get the department name and number of employees in the department.
SELECT E.DEPARTMENT_ID, D.DEPARTMENT_NAME, COUNT(*) FROM Employees E INNER JOIN Departments D ON E.DEPARTMENT_ID= D.DEPARTMENT_ID GROUP BY E.DEPARTMENT_ID;
#2 Write a query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.
SELECT E.EMPLOYEE_ID, J.JOB_TITLE , DATEDIFF(H.END_DATE, H.START_DATE) AS DAYSBETWEEN FROM Employees E INNER JOIN Jobs J ON E.JOB_ID = J.JOB_ID INNER JOIN JobHistory H ON J.JOB_ID = H.JOB_ID WHERE H.DEPARTMENT_ID = 90;
#3 Write a query to display the department ID and name and first name of manager.
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME FROM Departments D INNER JOIN Employees E ON D.MANAGER_ID =E.EMPLOYEE_ID;
#4 Write a query to display the department name, manager name, and city.
SELECT D.DEPARTMENT_NAME, D.LOCATION_ID, L.CITY, E.FIRST_NAME AS MANAGER FROM Departments D INNER JOIN Locations L ON D.LOCATION_ID=L.LOCATION_ID INNER JOIN Employees E ON D.MANAGER_ID = E.EMPLOYEE_ID;
#5 Write a query to display the job title and average salary of employees.
SELECT JOB_TITLE, AVG(MIN_SALARY+MAX_SALARY)/2 FROM Jobs GROUP BY JOB_TITLE;
#6 Write a query to display job title, employee name, and the difference between salary of the employee and minimum salary for the job.
SELECT E.FIRST_NAME, (E.SALARY-J.MIN_SALARY) AS 'DIFFERENCE IN MINIMUNSALARY', J.JOB_TITLE FROM Employees E INNER JOIN Jobs J ON E.JOB_ID=J.JOB_ID;
#7 Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary.
SELECT E.EMPLOYEE_ID, E.SALARY, E.FIRST_NAME, E.LAST_NAME, MIN(J.START_DATE) START_DATE, MAX(J.END_DATE) END_DATE
FROM Employees E
INNER JOIN JobHistory J ON J.EMPLOYEE_ID = E.EMPLOYEE_ID
WHERE E.salary > 10000
GROUP BY E.EMPLOYEE_ID;
#8 Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.
SELECT d.DEPARTMENT_NAME, CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME) name, e.HIRE_DATE, e.SALARY
FROM Employees e
INNER JOIN Jobs j on e.JOB_ID = j.JOB_ID
INNER JOIN Departments d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
LEFT JOIN JobHistory jh on jh.EMPLOYEE_ID = e.EMPLOYEE_ID
WHERE j.JOB_TITLE LIKE '%Manager%'
AND ((DATEDIFF(NOW(), e.HIRE_DATE)) / 365) > 15;