INSERT INTO Movie VALUES
(133093, "The Matrix", 1999, 136, 8.7, 1931124),
(234215, "The Matrix Reloaded", 2003, 138, 7.2, 601677),
(242653, "The Matrix Revolutions", 2003, 129, 6.7, 519511),
(234426, "Beyond Our Dreams", 2000, 100, 4.2, 38);

INSERT INTO Actor VALUES
(206, "Keanu", "Reeves"),
(401, "Laurence", "Fishburne"),
(5251, "Carrie-Anne", "Moss"),
(915989,"Hugo", "Weaving"),
(803263, "Olivier", "Sitruk"),
(899964, "Ruzan", "Mesropyan"),
(43203, "Romen", "Avinian"),
(46561, "Edik", "Bagdasarian");

INSERT INTO Cast VALUES
(206, 133093),
(401, 133093),
(5251, 133093),
(915989, 133093),
(206, 234215),
(401, 234215),
(5251, 234215),
(915989, 234215),
(206, 242653),
(401, 242653),
(5251, 242653),
(915989, 242653),
(803263, 234426),
(899964, 234426),
(43203, 234426),
(46561, 234426);


INSERT INTO Director VALUES
(905154, "Lana", "Wachowski"),
(905152, "Lilly", "Wachowski"),
(757954, "Hiner", "Saleem");

INSERT INTO Direction VALUES
(905154, 133093),
(905152, 133093),
(905154, 234215),
(905152, 234215),
(905154, 242653),
(905152, 242653),
(757954, 234426);

INSERT INTO Genre VALUES
(1, "Action"),
(2, "Sci-Fi"),
(3, "Adventure"),
(4, "Drama"),
(5, "Romance");

INSERT INTO Movie_Genre VALUES
(1, 133093),
(1, 234215),
(1, 242653),
(2, 133093),
(2, 234215),
(2, 242653),
(3, 234426),
(4, 234426),
(5, 234426);
