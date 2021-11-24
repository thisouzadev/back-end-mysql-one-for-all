USE SpotifyClone;
DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN artistaNome VARCHAR(50))
BEGIN
SELECT a.artista_nome AS `artista`,
al.album_nome AS `album`
FROM artista AS a
INNER JOIN album AS al
ON a.artista_id = al.artista_id
WHERE a.artista_nome = artistaNome;
END $$
DELIMITER ;
