-- Въпрос 1: песните в плейлист Road Trip по ред: позиция, заглавие, изпълнител, продължителност в секунди
SELECT ps.position,
       s.title,
       a.name AS artist,
       s.duration_seconds
FROM playlists p
JOIN playlist_songs ps ON ps.playlist_id = p.playlist_id
JOIN songs s ON s.song_id = ps.song_id
JOIN artists a ON a.artist_id = s.artist_id
WHERE p.name = 'Road Trip'
ORDER BY ps.position;

-- Въпрос 2: за всеки плейлист: име, брой песни и обща продължителност в секунди
SELECT p.name,
       COUNT(*) AS song_count,
       SUM(s.duration_seconds) AS total_seconds
FROM playlists p
JOIN playlist_songs ps ON ps.playlist_id = p.playlist_id
JOIN songs s ON s.song_id = ps.song_id
GROUP BY p.playlist_id, p.name
ORDER BY p.name;