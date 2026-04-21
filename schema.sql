-- Заполняем таблицу genres
INSERT INTO genres (name) VALUES
('Рок'),
('Поп'),
('Хип‑хоп'),
('Электронная музыка');

-- Заполняем таблицу artists
INSERT INTO artists (name) VALUES
('Группа А'),
('Певец Б'),
('Исполнитель В'),
('Дуэт Г и Д');

-- Связываем исполнителей с жанрами
INSERT INTO artists_genres (artist_id, genres_id) VALUES
(1, 1),
(2, 2),
(3, 3), 
(4, 4),
(1, 3),
(3, 1); 

-- Заполняем таблицу albums
INSERT INTO albums (name, release_year) VALUES
('Альбом 1', 2018),
('Альбом 2', 2019),
('Альбом 3', 2020);

-- Связываем альбомы с исполнителями
INSERT INTO album_artists (albums_id, artist_id) VALUES
(1, 1),
(2, 2),
(3, 3), 
(1, 4); 

-- Заполняем таблицу tracks
INSERT INTO tracks (name, duration, albums_id) VALUES
('Трек 1', 210, 1),  
('Трек 2', 240, 1),  
('Трек 3', 180, 2),  
('Трек 4', 300, 2),  
('Трек 5', 270, 3),  
('Трек 6', 150, 3);  

-- Заполняем таблицу compilations
INSERT INTO compilations (name, release_year) VALUES
('Сборник 1', 2018),
('Сборник 2', 2019),
('Сборник 3', 2020),
('Сборник 4', 2021);

-- Связываем сборники с треками
INSERT INTO compilation_tracks (compilations_id, track_id) VALUES
(1, 1), 
(1, 2), 
(2, 3), 
(2, 4), 
(3, 5), 
(4, 6); 
