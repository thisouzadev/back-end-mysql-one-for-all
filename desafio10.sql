USE SpotifyClone;
DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(id INT)
RETURNS INT READS SQL DATA
BEGIN
    DECLARE qtdcancao INT;
    SELECT COUNT(*)
    FROM reproducoes_por_usuario AS rpu
    INNER JOIN usuario AS u
    ON rpu.usuario_id = u.usuario_id
    WHERE u.usuario_id = id
    INTO qtdcancao;
    RETURN qtdcancao;
END $$
DELIMITER ;

-- SELECT quantidade_musicas_no_historico(3)
