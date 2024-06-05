-- CREATE DATABASE db_universidade;
USE db_universidade;

DROP PROCEDURE IF EXISTS pr_fazer_matricula;
DELIMITER $
CREATE PROCEDURE pr_fazer_matricula (
	Aluno_Nome_In VARCHAR(40),
    Aluno_Sobrenome_In VARCHAR(40),
    Aluno_Email_In VARCHAR(40),
    Curso_Nome_In VARCHAR(100),
    Curso_Area_In VARCHAR(50)
)
BEGIN
	SET @var_aluno_ra = fn_get_aluno_ra(
			Aluno_Nome_In, 
			Aluno_Sobrenome_In, 
			Aluno_Email_In
        );
    SET @var_curso_id = fn_get_curso_id(
			Curso_Nome_In,
            Curso_Area_In
		);
        
	IF (SELECT Aluno_RA FROM tbl_matriculas WHERE Aluno_RA = @var_aluno_ra) IS NULL 
    THEN
		INSERT INTO tbl_matriculas VALUES
		(NULL, @var_aluno_ra, @var_curso_id);
	ELSE
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "Aluno já matriculado",
		MYSQL_ERRNO = 2022;
	END IF;
END $
DELIMITER ;