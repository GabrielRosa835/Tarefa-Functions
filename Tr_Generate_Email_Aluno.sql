-- CREATE DATABASE db_universidade;
USE db_universidade;

DROP TRIGGER tr_generate_email_aluno;
DELIMITER $
CREATE TRIGGER tr_generate_email_aluno 
BEFORE INSERT ON tbl_alunos
FOR EACH ROW
    BEGIN
		SET @contagem = (SELECT COUNT(*) FROM tbl_alunos 
			WHERE Aluno_Nome = NEW.Aluno_Nome
				AND Aluno_Sobrenome = NEW.Aluno_Sobrenome
			)
		;
		SET NEW.Aluno_Email = LOWER(
			CONCAT(NEW.Aluno_Nome, '.', NEW.Aluno_Sobrenome, 
				IF(@contagem > 0, CONCAT('.', @contagem), ''), '@email.com'
			)
		);
    END $
DELIMITER ;