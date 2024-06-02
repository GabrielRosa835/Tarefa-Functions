-- CREATE DATABASE db_universidade;
USE db_universidade;

DROP FUNCTION fn_get_curso_id;
DELIMITER $
CREATE FUNCTION fn_get_curso_id (
	curso_nome_in VARCHAR(100),
    curso_area_in VARCHAR(50)
) RETURNS INT DETERMINISTIC
BEGIN 
	RETURN (SELECT Curso_Id FROM tbl_cursos
		WHERE Curso_Nome = curso_nome_in
			AND Curso_Area = curso_area_in
		)
	;
END $
DELIMITER ;