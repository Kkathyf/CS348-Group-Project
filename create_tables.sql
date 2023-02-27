CREATE TABLE Movie (
  id INT NOT NULL PRIMARY KEY,
  name VARCHAR(255),
  year INT,
  time INT,
  language VARCHAR(255),
  country VARCHAR(255),
  rate DECIMAL(4,2),
  num_votes INT
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
  name VARCHAR(255),
  num_of_rating INT
);

CREATE TABLE Rating (
  rid INT NOT NULL,
  mid INT NOT NULL,
  star DECIMAL(2,1),
  PRIMARY KEY (rid, mid),
  FOREIGN KEY (rid) REFERENCES Reviewer(id),
  FOREIGN KEY (mid) REFERENCES Movie(id)
);