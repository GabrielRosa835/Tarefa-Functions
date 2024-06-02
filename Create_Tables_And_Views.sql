-- CREATE DATABASE db_universidade;
USE db_universidade;

DROP TABLE tbl_matriculas;
DROP TABLE tbl_alunos;
DROP TABLE tbl_cursos;

CREATE TABLE tbl_alunos (
	Aluno_RA INT PRIMARY KEY,
	Aluno_Nome VARCHAR(40) NOT NULL,
    Aluno_Sobrenome VARCHAR(40) NOT NULL,
    Aluno_Email VARCHAR(40) UNIQUE
);

CREATE TABLE tbl_cursos (
	Curso_Id INT PRIMARY KEY AUTO_INCREMENT,
    Curso_Nome VARCHAR(100) NOT NULL,
    Curso_Area VARCHAR(50)
);

CREATE TABLE tbl_matriculas (
	Matricula_Id INT PRIMARY KEY AUTO_INCREMENT,
    Aluno_RA INT UNIQUE NOT NULL,
    Curso_Id INT NOT NULL,
    FOREIGN KEY fk_aluno_ra (Aluno_RA)
    REFERENCES tbl_alunos (Aluno_RA),
    FOREIGN KEY fk_curso_id (Curso_Id)
    REFERENCES tbl_cursos (Curso_Id)
);

CREATE OR REPLACE VIEW vw_matriculas AS
	SELECT 
		tbl_alunos.Aluno_RA AS "RA",
        CONCAT(tbl_alunos.Aluno_Nome, ' ', tbl_alunos.Aluno_Sobrenome) AS "Nome",
        tbl_cursos.Curso_Nome AS "Curso",
        tbl_cursos.Curso_Area AS "Área"
	FROM tbl_alunos
    INNER JOIN tbl_matriculas
		ON tbl_alunos.Aluno_Ra = tbl_matriculas.Aluno_Ra
    INNER JOIN tbl_cursos
		ON tbl_matriculas.Curso_Id = tbl_cursos.Curso_Id
;