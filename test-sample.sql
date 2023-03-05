# Feature 1:
SELECT name
FROM Movie
WHERE avg_rate > 7.0;

# Feature 2:
SELECT name
FROM Movie
WHERE id in (SELECT mid
	     FROM Director join Direction on id = did
	     WHERE first_name = "Hiner" and surname = "Saleem");

# Feature 3:
SELECT name
FROM (SELECT name, RANK() OVER (ORDER BY (avg_rate) DESC) as r
      FROM Movie) as T
WHERE r <= 3;

# Feature 4:
INSERT INTO Rating VALUES (1, 133093, 6.5, "I like this movie.");
SELECT *
FROM Rating;
