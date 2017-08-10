# SQLBolt

Practising SQL on [sqlbolt.com](https://sqlbolt.com).

## Index

01. SELECT Queries 101
02. Queries With Constraints (Pt. 1)
03. Queries With Constraints (Pt. 2)
04. Filtering and Sorting Query Results
05. Simple SELECT Queries
06. Multi-table Queries With JOINs
07. OUTER JOINs
08. A Short Note on NULLs
09. Queries With Expressions
10. Queries With Aggregates (Pt. 1)
11. Queries With Aggregates (Pt. 2)
12. Order of Execution of a Query
13. Inserting Rows
14. Updating Rows
15. Deleting Rows
16. Creating Tables
17. Altering Tables
18. Dropping Tables

## 01. SELECT Queries 101

1. Find the title of each film.

```sql
SELECT title
  FROM movies;
```

2. Find the director of each film.

```sql
SELECT director
  FROM movies;
```

3. Find the title and director of each film.

```sql
SELECT title, director
  FROM movies;
```

4. Find the title and year of each film.

```sql
SELECT title, year
  FROM movies;
```

5. Find all the information about each film.

```sql
SELECT *
  FROM movies;
```

## 02. Queries With Constraints (Pt. 1)

1. Find the movie with a row id of 6.

```sql
SELECT title
  FROM movies
 WHERE id = 6;
```

2. Find the movies released in the years between 2000 and 2010.

```sql
SELECT title
  FROM movies
 WHERE year BETWEEN 2000 AND 2010;
```

3. Find the movies not released in the years between 2000 and 2010.

```sql
SELECT title
  FROM movie
 WHERE year NOT BETWEEN 2000 and 2010;
```

4. Find the first 5 Pixar movies and their release year.

```sql
SELECT title, year
  FROM movies
 WHERE year <= 2003;
```

## 03. Queries With Constraints (Pt. 2)

1. Find all the Toy Story movies.

```sql
SELECT title
  FROM movies
 WHERE title LIKE 'Toy Story%';
```

2. Find all the movies directed by John Lasseter.

```sql
SELECT title
  FROM movies
 WHERE director = 'John Lasseter';
```

3. Find all the movies (and director) not directed by John Lasseter.

```sql
SELECT title
  FROM movies
 WHERE director != 'John Lasseter';
```

4. Find all the WALL-* movies.

```sql
SELECT title
  FROM movies
 WHERE title LIKE 'WALL-%';
```

## 04. Filtering and Sorting Query Results

1. List all directors of Pixar movies (alphabetically), without duplicates.

```sql
  SELECT DISTINCT director
    FROM movies
ORDER BY director;
```

2. List the last four Pixar movies released (ordered from most recent
to least).

```sql
  SELECT title
    FROM movies
ORDER BY year DESC
   LIMIT 4;
```

3. List the first five Pixar movies sorted alphabetically.

```sql
  SELECT title
    FROM movies
ORDER BY title
   LIMIT 5;
```

4. List the next five Pixar movies sorted alphabetically.

```sql
  SELECT title
    FROM movies
ORDER BY title
   LIMIT 5 OFFSET 5;
```

## 05. Simple SELECT Queries

1. List all the Canadian cities and their populations.

```sql
  SELECT city, population
    FROM north_american_cities
   WHERE country = 'Canada';
```

2. Order all the cities in the United States by their latitude from
north to south.

```sql
  SELECT city
    FROM north_american_cities
   WHERE country = 'United States'
ORDER BY latitude DESC;
```

3. List all the cities west of Chicago, ordered from west to east.

```sql
  SELECT city
    FROM north_american_cities
   WHERE longitude < -87.629798
ORDER BY longitude;
```

4. List the two largest cities in Mexico (by population).

```sql
  SELECT city
    FROM north_american_cities
   WHERE country = 'Mexico'
ORDER BY population DESC
   LIMIT 2;
```

5. List the third and fourth largest cities (by population) in the United
States and their population.

```sql
  SELECT city, population
    FROM north_american_cities
   WHERE country = 'United States'
ORDER BY population DESC
   LIMIT 2 OFFSET 2;
```

## 06. Multi-table Queries With JOINs

1. Find the domestic and international sales for each movie.

```sql
SELECT title, domestic_sales, international_sales
  FROM boxoffice
  JOIN movies ON movie_id = movies.id;
```

2. Show the sales numbers for each movie that did better internationally
rather than domestically.

```sql
SELECT title, domestic_sales, international_sales
  FROM boxoffice
  JOIN movies ON movie_id = movies.id
 WHERE international_sales > domestic_sales;
```

3. List all the movies by their ratings in descending order.

```sql
  SELECT title, rating
    FROM movies
    JOIN boxoffice ON movies.id = movie_id
ORDER BY rating DESC;
```

## 07. OUTER JOINs

1. Find the list of all buildings that have employees.

```sql
   SELECT DISTINCT building
     FROM employees
LEFT JOIN buildings ON building = building_name;
```

2. Find the list of all buildings and their capacity.

```sql
SELECT building_name, capacity
  FROM buildings;
```

3. List all buildings and the distinct employee roles in each building
(including empty buildings).

```sql
   SELECT DISTINCT building_name, role
     FROM buildings
LEFT JOIN employees ON building = building_name;
```

## 08. A Short Note on NULLs

1. Find the name and role of all employees who have not been assigned
to a building.

```sql
SELECT name, role
  FROM employees
 WHERE building IS NULL;
```

2. Find the names of the buildings that hold no employees.

```sql
   SELECT DISTINCT building_name
     FROM buildings
LEFT JOIN employees ON building_name = building
    WHERE name IS NULL;
```

## 09. Queries With Expressions

1. List all movies and their combined sales in millions of dollars.

```sql
SELECT title,
       (domestic_sales + international_sales) / 1000000 AS gross_sales
  FROM movies
  JOIN boxoffice ON movies.id = boxoffice.movie_id;
```

2. List all movies and their ratings in percent.

```sql
SELECT title,
       rating * 10 AS rating_percent
  FROM movies
  JOIN boxoffice ON movies.id = boxoffice.movie_id;
```

3. List all movies that were released on even number years.

```sql
SELECT title
  FROM movies
 WHERE year % 2 = 0;
```

## 10. Queries With Aggregates (Pt. 1)

1. Find the longest time that an employee has been at the studio.

```sql
SELECT MAX(years_employed) AS maximum_years_employed
  FROM employees;
```

2. For each role, find the average number of years employed by employees in
that role.

```sql
  SELECT role,
         AVG(years_employed) AS average_number_of_years
    FROM employees
GROUP BY role;
```

3. Find the total number of employee years worked in each building.

```sql
  SELECT building,
         SUM(years_employed) AS total_years
    FROM employees
GROUP BY building;
```

## 11. Queries With Aggregates (Pt. 2)

1. Find the number of Artists in the studio (without a HAVING clause).

```sql
SELECT COUNT(name) AS number_of_artists
  FROM employees
 WHERE role = 'Artist';
```

2. Find the number of Employees of each role in the studio.

```sql
  SELECT role,
         COUNT(name) AS employees
    FROM employees
GROUP by role;
```

3. Find the total number of years employed by all Engineers.

```sql
  SELECT role,
         SUM(years_employed) AS total_years_employed
    FROM employees
GROUP BY role
  HAVING role = 'Engineer';
```

## 12. Order of Execution of a Query

> 1. `FROM` and `JOIN`s
2. `WHERE`
3. `GROUP BY`
4. `HAVING`
5. `SELECT`
6. `DISTINCT`
7. `ORDER BY`
8. `LIMIT` / `OFFSET`

1. Find the number of movies each director has directed.

```sql
  SELECT director,
         COUNT(title) AS number_of_movies
    FROM movies
GROUP BY director;
```

2. Find the total domestic and international sales that can be attributed
to each director.

```sql
  SELECT director,
         SUM(domestic_sales + international_sales) AS total_sales
    FROM movies
    JOIN boxoffice ON movies.id = boxoffice.movie_id
GROUP BY director;
```

## 13. Inserting Rows

1. Add the studio's new production, Toy Story 4 to the list of movies
(you can use any director).

```sql
INSERT INTO movies
VALUES (4, 'Toy Story 4', 'John Lasseter', 2017, 90);
```

2. Toy Story 4 has been released to critical acclaim! It had a rating of
8.7, and made 340 million domestically and 270 million internationally.
Add the record to the BoxOffice table.

```sql
INSERT INTO boxoffice
VALUES (4, 8.7, 340000000, 270000000);
```

## 14. Updating Rows

1. The director for A Bug's Life is incorrect, it was actually directed by
John Lasseter.

```sql
UPDATE movies
   SET director = 'John Lasseter'
 WHERE id = 2;
```

2. The year that Toy Story 2 was released is incorrect, it was actually
released in 1999.

```sql
UPDATE movies
   SET year = 1999
 WHERE title = 'Toy Story 2';
```

3. Both the title and director for Toy Story 8 is incorrect! The title
should be "Toy Story 3" and it was directed by Lee Unkrich.

```sql
UPDATE movies
   SET title = 'Toy Story 3',
       director = 'Lee Unkrich'
 WHERE title = 'Toy Story 8'
   AND director = 'El Directore';
```

## 15. Deleting Rows

1. This database is getting too big, lets remove all movies that were
released before 2005.

```sql
DELETE FROM movies
 WHERE year < 2005;
```

2. Andrew Stanton has also left the studio, so please remove all movies
directed by him.

```sql
DELETE FROM movies
 WHERE director = 'Andrew Stanton';
```

## 16. Creating Tables

1. Create a new table named Database with the following columns:

   – Name A string (text) describing the name of the database
   – Version A number (floating point) of the latest version of this database
   – Download_count An integer count of the number of times this database was downloaded

This table has no constraints.

```sql
CREATE TABLE IF NOT EXISTS database (
       name STRING,
       version FLOAT,
       download_count INTEGER);
```

## 17. Altering Tables

1. Add a column named Aspect_ratio with a FLOAT data type to store the
aspect-ratio each movie was released in..

```sql
ALTER TABLE movies
  ADD aspect_ratio FLOAT;
```

2. Add another column named Language with a TEXT data type to store the
language that the movie was released in. Ensure that the default for this
language is English.

```sql
ALTER TABLE movies
  ADD language TEXT DEFAULT 'English';
```

## 18. Dropping Tables

1. We've sadly reached the end of our lessons, lets clean up by removing
the Movies table.

```sql
DROP TABLE IF EXISTS movies;
```

2. And drop the BoxOffice table as well.

```sql
DROP TABLE IF EXISTS boxoffice;
```
