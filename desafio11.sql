CREATE VIEW cancoes_premium AS
SELECT c.cancao_nome AS `nome`,
COUNT(rps.cancao_id) AS `reproducoes`
FROM SpotifyClone.reproducoes_por_usuario AS rps
INNER JOIN SpotifyClone.cancao AS c
ON c.cancao_id = rps.cancao_id
INNER JOIN SpotifyClone.usuario AS u
ON u.usuario_id = rps.usuario_id
WHERE u.plano_id = 2 OR u.plano_id=  3
GROUP BY c.cancao_nome
ORDER BY nome ASC
