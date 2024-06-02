-- CREATE DATABASE db_universidade;
USE db_universidade;

DROP PROCEDURE pr_insert_aluno;
DELIMITER $
CREATE PROCEDURE pr_insert_aluno(
	aluno_ra_in VARCHAR(50),
    aluno_nome_in VARCHAR(50),
    aluno_sobrenome_in VARCHAR(50)
)
BEGIN
    INSERT INTO tbl_alunos VALUES 
    (aluno_ra_in, aluno_nome_in, aluno_sobrenome_in, NULL);
END $
DELIMITER ;