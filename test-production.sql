# Feature 1:
SELECT *
FROM Movie
WHERE name LIKE "%The Lord of the Rings%";

# Feature 2:
SELECT name
FROM Movie
WHERE avg_rate < 8.5;

# Feature 3:
SELECT name
FROM Movie
WHERE id in (SELECT mid
	     FROM Director join Direction on id = did
	     WHERE first_name = "Frank" and surname = "Darabont");

# Feature 4:
SELECT name
FROM (SELECT name, RANK() OVER (ORDER BY (avg_rate) DESC) as r
      FROM Movie) as T
WHERE r <= 20;

# Feature 5:
INSERT INTO Reviewer VALUE(1, 'CS348', 0);

INSERT INTO Rating VALUES (1, 0111161, 9.0, "I like this movie.");
SELECT *
FROM Rating;
