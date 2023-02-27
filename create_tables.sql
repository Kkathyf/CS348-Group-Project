CREATE TABLE Movie (
  id INT NOT NULL PRIMARY KEY,
  name VARCHAR(255),
  year INT,
  time INT,
  language VARCHAR(255),
  country VARCHAR(255),
  avg_rate DECIMAL(4,2),
  num_of_ratings INT
);

CREATE TABLE Actor (
  id INT NOT NULL PRIMARY KEY,
  first_name VARCHAR(255),
  surname VARCHAR(255),
  gender VARCHAR(255)
);

CREATE TABLE Director (
  id INT NOT NULL PRIMARY KEY,
  first_name VARCHAR(255),
  surname VARCHAR(255)
);

CREATE TABLE Direction (
  did INT NOT NULL,
  mid INT NOT NULL,
  PRIMARY KEY (did, mid),
  FOREIGN KEY (did) REFERENCES Director(id),
  FOREIGN KEY (mid) REFERENCES Movie(id)
);

CREATE TABLE Cast (
  aid INT NOT NULL,
  mid INT NOT NULL,
  PRIMARY KEY (aid, mid),
  FOREIGN KEY (aid) REFERENCES Actor(id),
  FOREIGN KEY (mid) REFERENCES Movie(id)
);

CREATE TABLE Genre (
  id INT NOT NULL PRIMARY KEY,
  type VARCHAR(255)
);

CREATE TABLE Moviegenre (
  gid INT NOT NULL,
  mid INT NOT NULL,
  PRIMARY KEY (gid, mid),
  FOREIGN KEY (gid) REFERENCES Genre(id),
  FOREIGN KEY (mid) REFERENCES Movie(id)
);

CREATE TABLE Reviewer (
  id INT NOT NULL PRIMARY KEY,
  username VARCHAR(255),
  num_of_ratings INT
);

CREATE TABLE Rating (
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

