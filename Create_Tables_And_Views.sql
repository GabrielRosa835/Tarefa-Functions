-- CREATE DATABASE db_universidade;
USE db_universidade;

DROP TABLE IF EXISTS tbl_matriculas;
DROP TABLE IF EXISTS tbl_alunos;
DROP TABLE IF EXISTS tbl_cursos;

CREATE TABLE IF NOT EXISTS tbl_alunos (
	Aluno_RA INT PRIMARY KEY,
	Aluno_Nome VARCHAR(40) NOT NULL,
    Aluno_Sobrenome VARCHAR(40) NOT NULL,
    Aluno_Email VARCHAR(40) UNIQUE
);

CREATE TABLE IF NOT EXISTS tbl_cursos (
	Curso_Id INT PRIMARY KEY AUTO_INCREMENT,
    Curso_Nome VARCHAR(100) NOT NULL,
    Curso_Area VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS tbl_matriculas (
	Matricula_Id INT PRIMARY KEY AUTO_INCREMENT,
    Aluno_RA INT UNIQUE NOT NULL,
    Curso_Id INT NOT NULL,
    FOREIGN KEY fk_aluno_ra (Aluno_RA)
    REFERENCES tbl_alunos (Aluno_RA),
    FOREIGN KEY fk_curso_id (Curso_Id)
    REFERENCES tbl_cursos (Curso_Id)
);

CREATE OR REPLACE VIEW vw_alunos AS
	SELECT 
		CONCAT(tbl_alunos.Aluno_Nome, ' ', tbl_alunos.Aluno_Sobrenome) AS "Nome",
		tbl_alunos.Aluno_RA AS "RA",
		tbl_alunos.Aluno_Email AS "Email",
        tbl_cursos.Curso_Nome AS "Curso"
	FROM tbl_cursos
    RIGHT JOIN tbl_matriculas
		ON tbl_matriculas.Curso_Id = tbl_cursos.Curso_Id
	RIGHT JOIN tbl_alunos
		ON tbl_alunos.Aluno_Ra = tbl_matriculas.Aluno_Ra
;

CREATE OR REPLACE VIEW vw_cursos AS
	SELECT
		tbl_cursos.Curso_Nome AS "Nome",
        tbl_cursos.Curso_Area AS "Área"
	FROM tbl_cursos
;

CREATE OR REPLACE VIEW vw_matriculas AS
	SELECT 
		CONCAT(tbl_alunos.Aluno_Nome, ' ', tbl_alunos.Aluno_Sobrenome) AS "Nome",
		tbl_alunos.Aluno_RA AS "RA",
        tbl_cursos.Curso_Nome AS "Curso",
        tbl_cursos.Curso_Area AS "Área"
	FROM tbl_alunos
    INNER JOIN tbl_matriculas
		ON tbl_alunos.Aluno_Ra = tbl_matriculas.Aluno_Ra
    INNER JOIN tbl_cursos
		ON tbl_matriculas.Curso_Id = tbl_cursos.Curso_Id
;