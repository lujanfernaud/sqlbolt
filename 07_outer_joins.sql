-- 1. Find the list of all buildings that have employees.

   SELECT DISTINCT building
     FROM employees
LEFT JOIN buildings ON building = building_name;

-- 2. Find the list of all buildings and their capacity.

SELECT building_name, capacity
  FROM buildings;

-- 3. List all buildings and the distinct employee roles in each building
-- (including empty buildings).

   SELECT DISTINCT building_name, role
     FROM buildings
LEFT JOIN employees ON building = building_name;
