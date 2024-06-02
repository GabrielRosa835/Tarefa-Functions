-- CREATE DATABASE db_universidade;
USE db_universidade;

DROP FUNCTION fn_get_aluno_ra;
DELIMITER $
CREATE FUNCTION fn_get_aluno_ra (
	aluno_nome_in VARCHAR(40),
    aluno_sobrenome_in VARCHAR(40),
    aluno_email_in VARCHAR(40)
) RETURNS INT DETERMINISTIC
BEGIN 
	RETURN (SELECT Aluno_RA FROM tbl_alunos
		WHERE Aluno_Nome = aluno_nome_in
			AND Aluno_Sobrenome = aluno_sobrenome_in
            AND Aluno_Email = aluno_email_in
		)
	;
END $
DELIMITER ;