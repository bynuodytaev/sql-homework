-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра
SELECT DISTINCT a.name AS album_name
FROM albums a
JOIN album_artists aa ON a.id = aa.albums_id
JOIN artists_genres ag ON aa.artist_id = ag.artist_id
GROUP BY a.id, a.name
HAVING COUNT(DISTINCT ag.genres_id) > 1;

-- Наименования треков, которые не входят в сборники
SELECT t.name
FROM tracks t
LEFT JOIN compilation_tracks ct ON t.id = ct.track_id
WHERE ct.track_id IS NULL;

-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек
SELECT DISTINCT ar.name
FROM artists ar
JOIN album_artists aa ON ar.id = aa.artist_id
JOIN tracks t ON aa.albums_id = t.albums_id
WHERE t.duration = (SELECT MIN(duration) FROM tracks);

-- Названия альбомов, содержащих наименьшее количество треков
WITH track_counts AS (
    SELECT albums_id, COUNT(*) AS track_num
    FROM tracks
    GROUP BY albums_id
)
SELECT a.name
FROM albums a
JOIN track_counts tc ON a.id = tc.albums_id
WHERE tc.track_num = (SELECT MIN(track_num) FROM track_counts);
