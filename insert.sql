-- Исполнители 

INSERT INTO artists (name) VALUES
    ('Bynuod'),
    ('Lera'),
    ('The band'),
    ('Max');

-- Жанры 

INSERT INTO genres (name) VALUES
    ('Rock'),
    ('Pop'),
    ('Jazz');

--  Альбомы 

INSERT INTO albums (name, release_year) VALUES
    ('My Journey', 2019),
    ('Summer Vibes', 2020),
    ('Night Mood', 2021);

-- Треки 

INSERT INTO tracks (name, duration, albums_id) VALUES
    ('My Heart', 240, 1),
    ('мой мир', 210, 1),
    ('Dance All Night', 195, 2),    
    ('Long Song', 220, 2),          
    ('Oh My God', 180, 3),         
    ('Silence', 300, 3),            
    ('my', 150, 1),                 
    ('myself', 200, 1),             
    ('premyne', 190, 1);

-- Сборники 

INSERT INTO compilations (name, release_year) VALUES
    ('Best of 2018', 2018),
    ('Hits 2019', 2019),
    ('Top 2020', 2020),
    ('New Wave', 2022);

-- Исполнители + жанры 

INSERT INTO artists_genres (artist_id, genres_id) VALUES
    (1, 1),  
    (1, 2),  
    (2, 2),  
    (3, 3),  
    (3, 1),  
    (4, 3); 

-- Исполнители + альбомы

INSERT INTO album_artists (artist_id, albums_id) VALUES
    (1, 1), 
    (2, 2),  
    (3, 3),  
    (4, 3);

-- Сборники + треки 

INSERT INTO compilation_tracks (compilation_id, track_id) VALUES
    (1, 1), 
    (1, 3),  
    (2, 2),  
    (2, 4),  
    (3, 5),  
    (4, 1), 
    (4, 7);