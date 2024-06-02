-- CREATE DATABASE db_universidade;
USE db_universidade;

TRUNCATE TABLE tbl_alunos;
-- DROP TABLE Nomes;
-- DROP TABLE Sobrenomes;

DROP PROCEDURE pr_insert_200_alunos;
DELIMITER $
CREATE PROCEDURE pr_insert_200_alunos()
BEGIN
    DECLARE Counter INT DEFAULT 3;
    DECLARE RA INT;
    DECLARE Var_Nome VARCHAR(50);
    DECLARE Var_Sobrenome VARCHAR(50);

    CREATE TABLE Nomes (Nome VARCHAR(50));
    INSERT INTO Nomes (Nome) VALUES
    ('Ana'), ('Bruno'), ('Carlos'), ('Daniela'), ('Eduardo'),
    ('Fernanda'), ('Gustavo'), ('Helena'), ('Igor'), ('Juliana'),
    ('Kleber'), ('Laura'), ('Marcos'), ('Natália'), ('Otávio'),
    ('Patrícia'), ('Quirino'), ('Renata'), ('Sérgio'), ('Tatiane');

    CREATE TABLE Sobrenomes (Sobrenome VARCHAR(50));
    INSERT INTO Sobrenomes (Sobrenome) VALUES
    ('Silva'), ('Santos'), ('Oliveira'), ('Souza'), ('Lima'),
    ('Pereira'), ('Ferreira'), ('Costa'), ('Rodrigues'), ('Martins'),
    ('Almeida'), ('Mendes'), ('Gomes'), ('Barbosa'), ('Ribeiro'),
    ('Carvalho'), ('Azevedo'), ('Teixeira'), ('Freitas'), ('Correia');

	CALL pr_insert_aluno(100001, "Gabriel", "Rosa");
    CALL pr_insert_aluno(100002, "Daniel", "Ohata");

    WHILE Counter <= 200 DO
        SET RA = 100000 + Counter;

        SET Var_Nome = (SELECT Nome FROM Nomes ORDER BY RAND() LIMIT 1);
        SET Var_Sobrenome = (SELECT Sobrenome FROM Sobrenomes ORDER BY RAND() LIMIT 1);

        CALL pr_insert_aluno(RA, Var_Nome, Var_Sobrenome);
        
        SET Counter = Counter + 1;
    END WHILE;

    DROP TABLE Nomes;
    DROP TABLE Sobrenomes;
END $
DELIMITER ;

CALL pr_insert_200_alunos();

SELECT * FROM tbl_alunos;