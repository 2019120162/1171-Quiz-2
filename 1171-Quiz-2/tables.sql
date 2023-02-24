--23/02/2023

DROP TABLE IF EXISTS albums CASCADE;
DROP TABLE IF EXISTS tracks CASCADE;

CREATE TABLE albums(
    album_id serial PRIMARY KEY,
    title text NOT NULL
);

CREATE TABLE tracks(
    album_id integer REFERENCES albums(album_id),
    track_id serial NOT NULL,
    title text NOT NULL,
    length integer NOT NULL
);

INSERT INTO albums(title)
VALUES
('This is life'),
('What is life'),
('Around the corner');

INSERT INTO tracks(album_id, title, length)
VALUES
(1,'We cry', 3),
(1,'We live', 2),
(1,'We grow', 3),
(1,'We learn', 4),
(2,'This life of ours', 4),
(2,'There we go', 5),
(2,'In need of help', 5),
(3,'Help us no more', 2),
(3,'Am I finished?', 3),
(3,'This is not the end', 3);

SELECT A.title as Album_name, T.title as Track_name
FROM albums as A 
INNER JOIN tracks as T 
ON A.album_id = T.album_id;

SELECT T.title as Track_name, A.title as Album_name
FROM albums as A 
INNER JOIN tracks as T 
ON A.album_id = T.album_id;

SELECT COUNT(T.title) as Number_of_tracks, A.title as Album_name
FROM albums as A 
INNER JOIN tracks as T 
ON A.album_id = T.album_id
GROUP BY A.album_id;

SELECT COUNT(A.title) as Number_of_albums_the_track_is_in, T.title as Track_name
FROM albums as A 
INNER JOIN tracks as T 
ON A.album_id = T.album_id
GROUP BY T.title;