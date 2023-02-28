# Feature 1:
SELECT * 
FROM Movie
WHERE year <= 2000;

# Feature 2:
SELECT name
FROM Movie
WHERE avg_rate > 7.0;

# Feature 3:
SELECT name
FROM Movie
WHERE id in (SELECT mid
	     FROM Director join Direction on id = did
	     WHERE first_name = "Lana" and surname = "Wachowski");

# Feature 4:
SELECT name
FROM (SELECT name, RANK() OVER (ORDER BY (avg_rate) DESC) as r
      FROM Movie)
WHERE r <= 3;

# Feature 5:
INSERT INTO Rating VALUES (1, 133093, 6.2, "I like this movie.");
