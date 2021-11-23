CREATE VIEW estatisticas_musicais AS
SELECT 
	COUNT(cancao_id) AS `cancoes`,
	(SELECT COUNT(artista_id) FROM artista) AS `artistas`,
	(SELECT COUNT(album_id) FROM album) AS `albuns`
FROM SpotifyClone.cancao;
