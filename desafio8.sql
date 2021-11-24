use SpotifyClone;
DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON usuario
FOR EACH ROW
BEGIN
DELETE FROM reproducoes_por_usuario WHERE usuario_id = OLD.usuario_id;
DELETE FROM historico_de_seguidores WHERE usuario_id = OLD.usuario_id;
END$$
DELIMITER ;
