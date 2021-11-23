CREATE VIEW top_2_hits_do_momento AS
SELECT c.cancao_nome AS `cancao`, COUNT(rpu.cancao_id) AS `reproducoes`
FROM SpotifyClone.reproducoes_por_usuario AS rpu
INNER JOIN SpotifyClone.cancao AS c
ON c.cancao_id = rpu.cancao_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;
