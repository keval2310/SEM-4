﻿create database CSE_A9_269

--LAB-1

CREATE TABLE Artists ( 
Artist_id INT PRIMARY KEY, 
Artist_name NVARCHAR(50) 
); 


CREATE TABLE Albums ( 
Album_id INT PRIMARY KEY, 
Album_title NVARCHAR(50), 
Artist_id INT, 
Release_year INT, 
FOREIGN KEY (Artist_id) REFERENCES Artists(Artist_id) 
); 


CREATE TABLE Songs ( 
Song_id INT PRIMARY KEY, 
Song_title NVARCHAR(50), 
Duration DECIMAL(4, 2), 
Genre NVARCHAR(50), 
Album_id INT, 
FOREIGN KEY (Album_id) REFERENCES Albums(Album_id) 
); 

-- Insert Data into Artists Table 
INSERT INTO Artists (Artist_id, Artist_name) VALUES 
(1, 'Aparshakti Khurana'), 
(2, 'Ed Sheeran'), 
(3, 'Shreya Ghoshal'), 
(4, 'Arijit Singh'), 
(5, 'Tanishk Bagchi'); 

-- Insert Data into Albums Table 
INSERT INTO Albums (Album_id, Album_title, Artist_id, Release_year) VALUES (1007, 'Album7', 1, 2015), 
(1001, 'Album1', 1, 2019), 
(1002, 'Album2', 2, 2015), 
(1003, 'Album3', 3, 2018), 
(1004, 'Album4', 4, 2020), 
(1005, 'Album5', 2, 2020), 
(1006, 'Album6', 1, 2009) 

-- Insert Data into Songs Table 
INSERT INTO Songs (Song_id, Song_title, Duration, Genre, Album_id) VALUES 
(101, 'Zaroor', 2.55, 'Feel good', 1001), 
(102, 'Espresso', 4.10, 'Rhythmic', 1002), 
(103, 'Shayad', 3.20, 'Sad', 1003), 
(104, 'Roar', 4.05, 'Pop', 1002), 
(105, 'Everybody Talks', 3.35, 'Rhythmic', 1003), 
(106, 'Dwapara', 3.54, 'Dance', 1002), 
(107, 'Sa Re Ga Ma', 4.20, 'Rhythmic', 1004), 
(108, 'Tauba', 4.05, 'Rhythmic', 1005), 
(109, 'Perfect', 4.23, 'Pop', 1002), 
(110, 'Good Luck', 3.55, 'Rhythmic', 1004)

--PART-A
--1 Retrieve a unique genre of songs.
SELECT DISTINCT GENRE FROM SONGS

--2 Find top 2 albums released before 2010.
SELECT TOP 2 * FROM ALBUMS WHERE Release_year<2010

--3 Insert Data into the Songs Table. (1245, �Zaroor�, 2.55, �Feel good�, 1005)
INSERT INTO SONGS VALUES (1245,'Zaroor',2.55,'Feel good',1005)

--4 Change the Genre of the song �Zaroor� to �Happy�
UPDATE SONGS
SET GENRE='Happy'
WHERE Song_title='Zaroor'

--5 Delete an Artist �Ed Sheeran�
DELETE FROM ARTISTS
WHERE Artist_name='Ed Sheeran';

--6 Add a New Column for Rating in Songs Table. [Ratings decimal(3,2)]
ALTER TABLE SONGS
ADD Ratings DECIMAL(3,2)

--7 Retrieve songs whose title starts with 'S'. 
SELECT * FROM SONGS
WHERE SONG_TITLE like 'S%'

--8 Retrieve all songs whose title contains 'Everybody'.
SELECT * FROM SONGS
WHERE SONG_TITLE LIKE '%Everybody%'

--9 Display Artist Name in Uppercase.
SELECT UPPER(Artist_name) FROM ARTISTS

--10 Find the Square Root of the Duration of a Song �Good Luck�
SELECT SQRT(Duration) FROM SONGS WHERE SONG_TITLE='Good Luck'

--11 Find Current Date. 
SELECT GETDATE();

--12 Find the number of albums for each artist. 
SELECT ARTIST_NAME, COUNT(DISTINCT ALBUMS.ALBUM_ID) 
FROM ARTISTS
JOIN ALBUMS ON ARTISTS.ARTIST_ID = ALBUMS.ARTIST_ID 
GROUP BY ARTIST_NAME;

--13 Retrieve the Album_id which has more than 5 songs in it.
SELECT ALBUM_ID FROM SONGS GROUP BY ALBUM_ID HAVING COUNT(SONG_ID) > 5;

--14 Retrieve all songs from the album 'Album1'. (using Subquery) 
SELECT Song_title FROM Songs
WHERE Album_id=(SELECT Album_id FROM Albums where Album_title='Album1')

--15 Retrieve all albums name from the artist �Aparshakti Khurana� (using Subquery)
SELECT ALBUM_TITLE FROM ALBUMS
WHERE ARTIST_ID=(SELECT ARTIST_ID FROM ARTISTS WHERE ARTIST_NAME='Aparshakti Khurana')

--16 Retrieve all the song titles with its album title.
SELECT SONG_TITLE,ALBUMS.ALBUM_TITLE FROM SONGS JOIN ALBUMS ON SONGS.ALBUM_ID=ALBUMS.ALBUM_ID

--17 Find all the songs which are released in 2020.
SELECT SONG_TITLE FROM SONGS 
WHERE ALBUM_ID IN (SELECT ALBUM_ID FROM ALBUMS WHERE Release_year=2020)

--18 Create a view called �Fav_Songs� from the songs table having songs with song_id 101-105. 
CREATE VIEW Fav_Songs
AS 
SELECT * FROM SONGS WHERE SONG_ID BETWEEN 101 AND 105

--19 Update a song name to �Jannat� of song having song_id 101 in Fav_Songs view.
UPDATE Fav_Songs
SET Song_title='Jannat'
where song_id=101

--20 Find all artists who have released an album in 2020.
SELECT Artist_name FROM Artists
WHERE Artist_ID in (SELECT Artist_ID FROM ALBUMS WHERE Release_year=2020)

--21 Retrieve all songs by Shreya Ghoshal and order them by duration.
SELECT Songs.SONG_TITLE 
FROM Songs 
JOIN Albums ON Songs.Album_id = Albums.Album_id 
JOIN Artists ON Artists.Artist_id = Albums.Artist_id 
WHERE Artists.Artist_name = 'Shreya Ghoshal' 
ORDER BY Songs.DURATION;

--PART-B
--22 Retrieve all song titles by artists who have more than one album.
SELECT S.SONG_TITLE
FROM Songs S
JOIN Albums A ON S.Album_id = A.Album_id
JOIN Artists AR ON A.Artist_id = AR.Artist_id
WHERE AR.Artist_id IN (
    SELECT Artist_id
    FROM Albums
    GROUP BY Artist_id
    HAVING COUNT(DISTINCT Album_id) > 1
);

--23 Retrieve all albums along with the total number of songs.
SELECT ALBUM_TITLE,COUNT(SONGS.SONG_ID) FROM ALBUMS JOIN SONGS ON ALBUMS.ALBUM_ID=SONGS.ALBUM_ID
GROUP BY ALBUM_TITLE

--24 Retrieve all songs and release year and sort them by release year.
SELECT SONG_TITLE,ALBUMS.release_year FROM SONGS JOIN ALBUMS ON SONGS.ALBUM_ID=ALBUMS.ALBUM_ID
ORDER BY ALBUMS.RELEASE_YEAR

--25 Retrieve the total number of songs for each genre, showing genres that have more than 2 songs.
SELECT GENRE,COUNT(DISTINCT SONG_TITLE) FROM SONGS GROUP BY GENRE HAVING COUNT(DISTINCT SONG_TITLE)>2

--26 List all artists who have albums that contain more than 3 songs.
SELECT ARTISTS.ARTIST_NAME
FROM ARTISTS
JOIN ALBUMS ON ARTISTS.ARTIST_ID = ALBUMS.ARTIST_ID
JOIN SONGS ON ALBUMS.ALBUM_ID = SONGS.ALBUM_ID
GROUP BY ARTISTS.ARTIST_NAME, ALBUMS.ALBUM_ID
HAVING COUNT(SONGS.SONG_ID) > 3;

--PART-C

--27 Retrieve albums that have been released in the same year as 'Album4'
SELECT ALBUM_TITLE FROM ALBUMS WHERE Release_year=(SELECT Release_year FROM ALBUMS WHERE Album_title='Album4')

--28 Find the longest song in each genre
SELECT S1.GENRE, S1.SONG_TITLE, S1.DURATION
FROM SONGS S1
JOIN (
    SELECT GENRE, MAX(DURATION) AS MAX_DURATION
    FROM SONGS
    GROUP BY GENRE
) S2
ON S1.GENRE = S2.GENRE AND S1.DURATION = S2.MAX_DURATION;

--29 Retrieve the titles of songs released in albums that contain the word 'Album' in the title.
SELECT SONG_TITLE FROM SONGS JOIN ALBUMS ON SONGS.Album_id=ALBUMS.ALBUM_ID WHERE ALBUMS.ALBUM_TITLE LIKE '%Album%'

--30 Retrieve the total duration of songs by each artist where total duration exceeds 15 minutes.
SELECT ARTISTS.ARTIST_NAME,SUM(SONGS.DURATION) FROM ARTISTS 
JOIN ALBUMS ON ARTISTS.Artist_id=ALBUMS.Artist_id 
JOIN SONGS ON ALBUMS.Album_id=SONGS.Album_id 
GROUP BY ARTISTS.Artist_name 
HAVING SUM(SONGS.DURATION)>15