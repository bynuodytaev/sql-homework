-- Количество исполнителей в каждом жанре
SELECT g.name AS genre_name, COUNT(ag.artist_id) AS artist_count
FROM genres g
LEFT JOIN artists_genres ag ON g.id = ag.genres_id
GROUP BY g.name;

-- Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(t.id) AS track_count
FROM tracks t
JOIN albums a ON t.albums_id = a.id
WHERE a.release_year BETWEEN 2019 AND 2020;

-- Средняя продолжительность треков по каждому альбому
SELECT a.name AS album_name, AVG(t.duration) AS avg_duration
FROM albums a
JOIN tracks t ON a.id = t.albums_id
GROUP BY a.name;

-- Все исполнители, которые не выпустили альбомы в 2020 году
SELECT DISTINCT a.name
FROM artists a
WHERE a.id NOT IN (
    SELECT aa.artist_id
    FROM album_artists aa
    JOIN albums al ON aa.albums_id = al.id
    WHERE al.release_year = 2020
);

-- Названия сборников, в которых присутствует конкретный исполнитель (например, «Группа А», id = 1)
SELECT DISTINCT c.name
FROM compilations c
JOIN compilation_tracks ct ON c.id = ct.compilations_id
JOIN tracks t ON ct.track_id = t.id
JOIN album_artists aa ON t.albums_id = aa.albums_id
WHERE aa.artist_id = 1;
