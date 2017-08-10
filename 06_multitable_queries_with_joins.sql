-- 1. Find the domestic and international sales for each movie.

SELECT title, domestic_sales, international_sales
  FROM boxoffice
  JOIN movies ON movie_id = movies.id;

-- 2. Show the sales numbers for each movie that did better internationally
-- rather than domestically.

SELECT title, domestic_sales, international_sales
  FROM boxoffice
  JOIN movies ON movie_id = movies.id
 WHERE international_sales > domestic_sales;

-- 3. List all the movies by their ratings in descending order.

  SELECT title, rating
    FROM movies
    JOIN boxoffice ON movies.id = movie_id
ORDER BY rating DESC;
