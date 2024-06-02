-- CREATE DATABASE db_universidade;
USE db_universidade;

DROP PROCEDURE pr_fazer_matricula;
DELIMITER $
CREATE PROCEDURE pr_fazer_matricula (
	Aluno_Nome_In VARCHAR(40),
    Aluno_Sobrenome_In VARCHAR(40),
    Aluno_Email_In VARCHAR(40),
    Curso_Nome_In VARCHAR(100),
    Curso_Area_In VARCHAR(50)
)
BEGIN
	SET @aluno_ra = fn_get_aluno_ra(
			Aluno_Nome_In, 
			Aluno_Sobrenome_In, 
			Aluno_Email_In
        );
    SET @curso_id = fn_get_curso_id(
			Curso_Nome_In,
            Curso_Area_In
		);
        
	INSERT INTO tbl_matriculas VALUES
    (NULL, @aluno_ra, @curso_id);
END $
DELIMITER ;