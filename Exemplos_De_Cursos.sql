-- CREATE DATABASE db_universidade;
USE db_universidade;

INSERT INTO tbl_cursos (Curso_Nome, Curso_Area) VALUES
('Engenharia Civil', 'Engenharia'),
('Engenharia Mecânica', 'Engenharia'),
('Engenharia Elétrica', 'Engenharia'),
('Engenharia da Computação', 'Engenharia'),
('Engenharia Química', 'Engenharia'),
('Medicina', 'Ciências da Saúde'),
('Enfermagem', 'Ciências da Saúde'),
('Odontologia', 'Ciências da Saúde'),
('Fisioterapia', 'Ciências da Saúde'),
('Nutrição', 'Ciências da Saúde'),
('Direito', 'Ciências Jurídicas'),
('Administração', 'Ciências Sociais Aplicadas'),
('Economia', 'Ciências Sociais Aplicadas'),
('Contabilidade', 'Ciências Sociais Aplicadas'),
('Psicologia', 'Ciências Humanas'),
('História', 'Ciências Humanas'),
('Geografia', 'Ciências Humanas'),
('Letras', 'Ciências Humanas'),
('Matemática', 'Ciências Exatas'),
('Física', 'Ciências Exatas'),
('Química', 'Ciências Exatas'),
('Biologia', 'Ciências Biológicas'),
('Ciência da Computação', 'Tecnologia da Informação'),
('Sistemas de Informação', 'Tecnologia da Informação'),
('Banco de Dados', 'Tecnologia da Informação');

SELECT * FROM tbl_cursos;