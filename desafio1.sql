CREATE SCHEMA IF NOT EXISTS `SpotifyClone` 

-- -----------------------------------------------------
-- Table `SpotifyClone`.`artista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artista` (
  `artista_id` INT NOT NULL AUTO_INCREMENT,
  `artista_nome` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`artista_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5



-- -----------------------------------------------------
-- Table `SpotifyClone`.`album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`album` (
  `album_id` INT NOT NULL AUTO_INCREMENT,
  `album_nome` VARCHAR(50) NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`album_id`),
  INDEX `artista_id` (`artista_id` ASC) VISIBLE,
  CONSTRAINT `album_ibfk_1`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artista` (`artista_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6



-- -----------------------------------------------------
-- Table `SpotifyClone`.`cancao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`cancao` (
  `cancao_id` INT NOT NULL AUTO_INCREMENT,
  `cancao_nome` VARCHAR(50) NOT NULL,
  `album_id` INT NOT NULL,
  PRIMARY KEY (`cancao_id`),
  INDEX `album_id` (`album_id` ASC) VISIBLE,
  CONSTRAINT `cancao_ibfk_1`
    FOREIGN KEY (`album_id`)
    REFERENCES `SpotifyClone`.`album` (`album_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 19



-- -----------------------------------------------------
-- Table `SpotifyClone`.`plano`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`plano` (
  `plano_id` INT NOT NULL AUTO_INCREMENT,
  `plano_nome` VARCHAR(50) NOT NULL,
  `plano_valor` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`plano_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4



-- -----------------------------------------------------
-- Table `SpotifyClone`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuario` (
  `usuario_id` INT NOT NULL AUTO_INCREMENT,
  `usuario_nome` VARCHAR(50) NOT NULL,
  `usuario_idade` INT NOT NULL,
  `plano_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`),
  INDEX `plano_id` (`plano_id` ASC) VISIBLE,
  CONSTRAINT `usuario_ibfk_1`
    FOREIGN KEY (`plano_id`)
    REFERENCES `SpotifyClone`.`plano` (`plano_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5



-- -----------------------------------------------------
-- Table `SpotifyClone`.`historico_de_seguidores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`historico_de_seguidores` (
  `usuario_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `artista_id`),
  INDEX `artista_id` (`artista_id` ASC) VISIBLE,
  CONSTRAINT `historico_de_seguidores_ibfk_1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuario` (`usuario_id`),
  CONSTRAINT `historico_de_seguidores_ibfk_2`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artista` (`artista_id`))
ENGINE = InnoDB



-- -----------------------------------------------------
-- Table `SpotifyClone`.`reproducoes_por_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`reproducoes_por_usuario` (
  `usuario_id` INT NOT NULL,
  `cancao_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `cancao_id`),
  INDEX `cancao_id` (`cancao_id` ASC) VISIBLE,
  CONSTRAINT `reproducoes_por_usuario_ibfk_1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuario` (`usuario_id`),
  CONSTRAINT `reproducoes_por_usuario_ibfk_2`
    FOREIGN KEY (`cancao_id`)
    REFERENCES `SpotifyClone`.`cancao` (`cancao_id`))
ENGINE = InnoDB

INSERT INTO plano(plano_nome, plano_valor)
VALUES
	('gratuito', 0),
    ('familiar', 7.99),
    ('universitário', 5.99);

INSERT INTO usuario(usuario_nome, usuario_idade, plano_id)
VALUES
	('Thati', 23, 1),
    ('Cintia', 35, 2),
    ('Bill',20, 3),
    ('Roger',45, 1);

INSERT INTO artista(artista_nome)
VALUES
	('Walter Phoenix'),
    ('Peter Strong'),
    ('Lance Day'),
    ('Freedie Shannon');

INSERT INTO album(album_nome, artista_id)
VALUES
	('Envious', 1),
    ('Exuberant', 1),
    ('Hallowed Steam', 2),
    ('Incandescent', 3),
    ('Temporary Culture', 4);

INSERT INTO cancao(cancao_nome, album_id)
VALUES
	('Soul For Us', 1),
	('Reflections Of Magic', 1),
	('Dance With Her Own', 1),
	('Troubles Of My Inner Fire', 2),
	('Time Fireworks', 2),
	('Magic Circus', 3),
	('Honey, So Do I', 3),
	("Sweetie, Let's Go Wild", 3),
	('She Knows', 3),
	('Fantasy For Me', 4),
	('Celebration Of More', 4),
	('Rock His Everything', 4),
	('Home Forever', 4),
	('Diamond Power', 4),
	("Honey, Let's Be Silly", 4),
	('Thang Of Thunder', 5),
	('Words Of Her Life', 5),
	('Without My Streets', 5);

INSERT INTO reproducoes_por_usuario (usuario_id, cancao_id)
VALUES
	(1, 1),
	(1, 6),
	(1, 14),
	(1, 16),
	(2, 13),
	(2, 17),
	(2, 2),
	(2, 15),
	(3, 4),
	(3, 16),
	(3, 6),
	(4, 3),
	(4, 18),
	(4, 11);

INSERT INTO historico_de_seguidores (usuario_id, artista_id)
VALUES
	(1, 1),
	(1, 4),
	(1, 3),
	(2, 1),
	(2, 3),
	(3, 2),
	(3, 1),
	(4, 4);

