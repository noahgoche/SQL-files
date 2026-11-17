#User Questions
#1. What song is in the most playlists?
SELECT Songs.Title, 
COUNT(Playlist_Songs.PLAYLIST_ID) AS playlist_count
FROM Songs
JOIN playlist_songs ON songs.SONG_ID = playlist_songs.SONG_ID
GROUP BY songs.SONG_ID
ORDER BY playlist_count DESC
LIMIT 1;

#2. Who is the most popular artist?
SELECT Artists.Artist_Name,
COUNT(playlist_songs.PLAYLIST_ID) AS total_playlists_featured,
COUNT(playlist_songs.SONG_ID) AS songs_on_playlists
FROM Artists
JOIN Songs ON artists.ARTIST_ID = Songs.ARTIST_ID
JOIN playlist_songs ON Songs.SONG_ID = playlist_songs.SONG_ID
GROUP BY artists.ARTIST_ID
ORDER BY total_playlists_featured DESC
LIMIT 1;

#3. How many playlists do I have? Searching for playlists connected to the Noah User
SELECT users.Username, 
COUNT(Playlists.PLAYLIST_ID) AS playlists_count
FROM Users
LEFT JOIN Playlists ON users.USER_ID = playlists.USER_ID
GROUP BY users.Username
ORDER BY playlists_count DESC
Limit 1;

#4. What is the average song length?
SELECT ROUND(AVG(Songs.Duration), 2) AS avg_song_length
FROM Songs;

#5. What is the average amount of songs in a playlist?
SELECT ROUND(COUNT(playlist_songs.SONG_ID) / COUNT(DISTINCT playlists.PLAYLIST_ID), 2) AS avg_songs_per_playlist
FROM playlists
LEFT JOIN playlist_songs ON playlists.PLAYLIST_ID = playlist_songs.PLAYLIST_ID;
