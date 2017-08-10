-- 1. Find all the Toy Story movies.

SELECT title
  FROM movies
 WHERE title LIKE 'Toy Story%';

-- 2. Find all the movies directed by John Lasseter.

SELECT title
  FROM movies
 WHERE director = 'John Lasseter';

-- 3. Find all the movies (and director) not directed by John Lasseter.

SELECT title
  FROM movies
 WHERE director != 'John Lasseter';

-- 4. Find all the WALL-* movies.

SELECT title
 FROM movies
WHERE title LIKE 'WALL-%';
