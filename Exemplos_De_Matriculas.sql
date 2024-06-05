-- CREATE DATABASE db_universidade;
USE db_universidade;

CALL pr_fazer_matricula(
	"Gabriel",
    "Rosa",
	"gabriel.rosa@email.com",
    "Banco de Dados",
    "Tecnologia da Informação"
);
CALL pr_fazer_matricula(
	"Daniel",
    "Ohata",
	"daniel.ohata@email.com",
    "Engenharia da Computação",
    "Engenharia"
);
CALL pr_mostrar_matriculas;