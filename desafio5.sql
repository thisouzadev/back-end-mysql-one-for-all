CREATE VIEW top_3_artistas AS
SELECT a.artista_nome AS `artista`, COUNT(hds.usuario_id) AS `seguidores`
FROM SpotifyClone.historico_de_seguidores AS hds
INNER JOIN SpotifyClone.artista AS a
ON a.artista_id = hds.artista_id
GROUP BY artista
ORDER BY seguidores DESC, artista ASC
LIMIT 3;
