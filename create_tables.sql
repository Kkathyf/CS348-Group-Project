DROP TABLE IF EXISTS Movies;

CREATE TABLE Movies (
  id INT NOT NULL PRIMARY KEY,
  name VARCHAR(255),
  year INT,
  time INT,
  country VARCHAR(255),
  avg_rate DECIMAL(4,2),
  num_of_ratings INT
);

DROP TABLE IF EXISTS Languages;

CREATE TABLE Languages (
  id INT NOT NULL PRIMARY KEY,
  language_code VARCHAR(10) DEFAULT NULL,
  language_name VARCHAR(500) DEFAULT NULL
);

DROP TABLE IF EXISTS Movie_Language;

CREATE TABLE Movie_Language (
  movie_id INT NOT NULL,
  language_id INT NOT NULL,
  CONSTRAINT fk_ml_movie FOREIGN KEY (movie_id) REFERENCES Movie (id),
  CONSTRAINT fk_ml_lang FOREIGN KEY (language_id) REFERENCES Languages (id)
);

DROP TABLE IF EXISTS Actors;

CREATE TABLE Actors (
  id INT NOT NULL PRIMARY KEY,
  first_name VARCHAR(255),
  surname VARCHAR(255),
  gender VARCHAR(255)
);

DROP TABLE IF EXISTS Directors;

CREATE TABLE Directors (
  id INT NOT NULL PRIMARY KEY,
  first_name VARCHAR(255),
  surname VARCHAR(255)
);

DROP TABLE IF EXISTS Directions;

CREATE TABLE Directions (
  did INT NOT NULL,
  mid INT NOT NULL,
  PRIMARY KEY (did, mid),
  FOREIGN KEY (did) REFERENCES Director(id),
  FOREIGN KEY (mid) REFERENCES Movie(id)
);

DROP TABLE IF EXISTS Casts;

CREATE TABLE Casts (
  aid INT NOT NULL,
  mid INT NOT NULL,
  PRIMARY KEY (aid, mid),
  FOREIGN KEY (aid) REFERENCES Actor(id),
  FOREIGN KEY (mid) REFERENCES Movie(id)
);

DROP TABLE IF EXISTS Genres;

CREATE TABLE Genres (
  id INT NOT NULL PRIMARY KEY,
  type VARCHAR(255)
);

DROP TABLE IF EXISTS Movie_Genres;

CREATE TABLE Movie_Genres (
  gid INT NOT NULL,
  mid INT NOT NULL,
  PRIMARY KEY (gid, mid),
  FOREIGN KEY (gid) REFERENCES Genre(id),
  FOREIGN KEY (mid) REFERENCES Movie(id)
);

DROP TABLE IF EXISTS Reviewers;

CREATE TABLE Reviewers (
  id INT NOT NULL PRIMARY KEY,
  username VARCHAR(255),
  num_of_ratings INT
);

DROP TABLE IF EXISTS Ratings;

CREATE TABLE Ratings (
  rid INT NOT NULL,
  mid INT NOT NULL,
  rate DECIMAL(2,1),
  comment VARCHAR(255),
  PRIMARY KEY (rid, mid),
  FOREIGN KEY (rid) REFERENCES Reviewer(id),
  FOREIGN KEY (mid) REFERENCES Movie(id)
);

CREATE TRIGGER update_movie_rating
AFTER INSERT ON Rating
REFERENCES NEW ROW as new_rating
FOR EACH ROW
BEGIN
  UPDATE Movie
  SET avg_rate = (avg_rate * num_of_ratings + new_rating.rate) / (num_of_ratings + 1),
      num_of_ratings = num_of_ratings + 1
  WHERE id = new_rating.mid;
END;


CREATE TRIGGER update_reviewer_num_of_ratings
AFTER INSERT ON Rating
REFERENCES NEW ROW as new_rating
FOR EACH ROW
BEGIN
    UPDATE Reviewer SET num_of_ratings = num_of_ratings + 1 WHERE id = new_rating.rid;
END;

