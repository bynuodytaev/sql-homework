
-- 2.1: Название и продолжительность самого длительного трека
SELECT name, duration
FROM tracks
WHERE duration = (SELECT MAX(duration) FROM tracks);

-- 2.2: Название треков, продолжительность которых не менее 3,5 минут (210 сек)
SELECT name
FROM tracks
WHERE duration >= 210;

-- 2.3: Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT name
FROM compilations
WHERE release_year BETWEEN 2018 AND 2020;

-- 2.4: Исполнители, чьё имя состоит из одного слова (нет пробелов)
SELECT name
FROM artists
WHERE name NOT LIKE '% %';

-- 2.5: Название треков, которые содержат слово «мой» или «my» (ЦЕЛОЕ СЛОВО!)
SELECT DISTINCT name
FROM tracks
WHERE 
    -- Слово "мой"
    name ILIKE 'мой %'
    OR name ILIKE '% мой'
    OR name ILIKE '% мой %'
    OR name ILIKE 'мой'
    -- Слово "my"
    OR name ILIKE 'my %'
    OR name ILIKE '% my'
    OR name ILIKE '% my %'
    OR name ILIKE 'my';

-- =================== ЗАДАНИЕ 3 ===================

-- 3.1: Количество исполнителей в каждом жанре
SELECT g.name AS genre_name, COUNT(ag.artist_id) AS artists_count
FROM genres g
LEFT JOIN artists_genres ag ON g.id = ag.genres_id
GROUP BY g.id, g.name
ORDER BY artists_count DESC;

-- 3.2: Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(t.id) AS tracks_count
FROM tracks t
JOIN albums a ON t.albums_id = a.id
WHERE a.release_year BETWEEN 2019 AND 2020;

-- 3.3: Средняя продолжительность треков по каждому альбому
SELECT a.name AS album_name, ROUND(AVG(t.duration), 2) AS avg_duration
FROM albums a
JOIN tracks t ON a.id = t.albums_id
GROUP BY a.id, a.name
ORDER BY avg_duration DESC;

-- 3.4: Все исполнители, которые НЕ выпустили альбомы в 2020 году
SELECT DISTINCT ar.name
FROM artists ar
WHERE ar.id NOT IN (
    SELECT aa.artist_id
    FROM album_artists aa
    JOIN albums a ON aa.albums_id = a.id
    WHERE a.release_year = 2020
);

-- 3.5: Названия сборников, в которых присутствует конкретный исполнитель (выберем "Bunyod", id=1)
SELECT DISTINCT c.name AS compilation_name
FROM compilations c
JOIN compilation_tracks ct ON c.id = ct.compilation_id
JOIN tracks t ON ct.track_id = t.id
JOIN albums al ON t.albums_id = al.id
JOIN album_artists aa ON al.id = aa.albums_id
WHERE aa.artist_id = 1  -- Bunyod
ORDER BY c.name;


-- =================== ЗАДАНИЕ 4 (необязательное) ===================

-- 4.1: Названия альбомов, в которых присутствуют исполнители более чем одного жанра
SELECT DISTINCT a.name AS album_name
FROM albums a
JOIN album_artists aa ON a.id = aa.albums_id
JOIN artists_genres ag ON aa.artist_id = ag.artist_id
GROUP BY a.id, a.name, aa.artist_id
HAVING COUNT(DISTINCT ag.genres_id) > 1;

-- 4.2: Наименования треков, которые НЕ входят в сборники
SELECT t.name
FROM tracks t
WHERE t.id NOT IN (
    SELECT DISTINCT track_id 
    FROM compilation_tracks
);

-- 4.3: Исполнитель(и), написавший самый короткий трек (может быть несколько)
SELECT ar.name AS artist_name, t.name AS track_name, t.duration
FROM artists ar
JOIN album_artists aa ON ar.id = aa.artist_id
JOIN tracks t ON aa.albums_id = t.albums_id
WHERE t.duration = (SELECT MIN(duration) FROM tracks);

-- 4.4: Названия альбомов
SELECT a.name AS album_name, COUNT(t.id) AS tracks_count
FROM albums a
LEFT JOIN tracks t ON a.id = t.albums_id
GROUP BY a.id, a.name
HAVING COUNT(t.id) = (
    SELECT MIN(track_count)
    FROM (
        SELECT COUNT(t2.id) AS track_count
        FROM albums a2
        LEFT JOIN tracks t2 ON a2.id = t2.albums_id
        GROUP BY a2.id
    ) AS subquery
);