CREATE VIEW perfil_artistas AS
SELECT a.artista_nome AS`artista`,
al.album_nome AS `album`,
COUNT(hds.artista_id) AS `seguidores`
FROM SpotifyClone.historico_de_seguidores AS hds
INNER JOIN SpotifyClone.artista AS a
ON a.artista_id = hds.artista_id
INNER JOIN SpotifyClone.album AS al
ON al.artista_id = a.artista_id
GROUP BY a.artista_nome, al.album_nome
ORDER BY seguidores DESC, artista ASC, album ASC
