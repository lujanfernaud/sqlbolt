-- 1. Find the number of Artists in the studio (without a HAVING clause).

SELECT COUNT(name) AS number_of_artists
  FROM employees
 WHERE role = 'Artist';

-- 2. Find the number of Employees of each role in the studio.

  SELECT role,
         COUNT(name) AS employees
    FROM employees
GROUP by role;

-- 3. Find the total number of years employed by all Engineers.

  SELECT role,
         SUM(years_employed) AS total_years_employed
    FROM employees
GROUP BY role
  HAVING role = 'Engineer';
