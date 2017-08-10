-- 1. Add the studio's new production, Toy Story 4 to the list of movies
-- (you can use any director).

INSERT INTO movies
VALUES (4, 'Toy Story 4', 'John Lasseter', 2017, 90);

-- 2. Toy Story 4 has been released to critical acclaim! It had a rating of
-- 8.7, and made 340 million domestically and 270 million internationally.
-- Add the record to the BoxOffice table.

INSERT INTO boxoffice
VALUES (4, 8.7, 340000000, 270000000);
