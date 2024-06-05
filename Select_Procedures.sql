-- CREATE DATABASE db_universidade;
USE db_universidade;

DROP PROCEDURE IF EXISTS pr_mostrar_alunos;
DELIMITER $
CREATE PROCEDURE pr_mostrar_alunos()
BEGIN
	SELECT * FROM vw_alunos;
END $
DELIMITER ;

DROP PROCEDURE IF EXISTS pr_mostrar_cursos;
DELIMITER $
CREATE PROCEDURE pr_mostrar_cursos()
BEGIN
	SELECT * FROM vw_cursos;
END $
DELIMITER ;

DROP PROCEDURE IF EXISTS pr_mostrar_matriculas;
DELIMITER $
CREATE PROCEDURE pr_mostrar_matriculas()
BEGIN
	SELECT * FROM vw_matriculas;
END $
DELIMITER ;