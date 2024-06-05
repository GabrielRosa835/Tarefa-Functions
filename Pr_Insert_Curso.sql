-- CREATE DATABASE db_universidade;
USE db_universidade;

DROP PROCEDURE IF EXISTS pr_insert_curso;
DELIMITER $
CREATE PROCEDURE pr_insert_curso(
	curso_nome_in VARCHAR(100),
    curso_area_in VARCHAR(50)
)
BEGIN
	INSERT INTO tbl_cursos VALUES 
	(NULL, curso_titulo_in, curso_area_in);
END $ 
DELIMITER ;