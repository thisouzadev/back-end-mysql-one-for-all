use SpotifyClone;
CREATE VIEW historico_reproducao_usuarios AS
SELECT u.usuario_nome AS usuario, c.cancao_nome AS nome 
FROM reproducoes_por_usuario AS rps
INNER JOIN  usuario AS u
ON u.usuario_id = rps.usuario_id
INNER JOIN cancao AS c
ON c.cancao_id = rps.cancao_id
ORDER BY u.usuario_nome ASC, c.cancao_nome ASC
