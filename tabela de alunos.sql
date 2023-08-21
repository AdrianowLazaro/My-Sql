create database cursos_programação;
use cursos_programacao2;
drop database cursos_programacao2;

create table alunos(
	matricula int primary key auto_increment,
    nome varchar(50) not null,
    curso_preferido varchar(30),
    data_nasc date,
    sexo enum('F','M'),
    endereco varchar(30)

);

drop table alunos;

create table cursos (
	id_curso int primary key auto_increment,
    nome varchar(30),
    carga int unsigned,
    tot_aulas int unsigned,
    professor varchar(30)
);

alter table alunos
modify column matricula int primary key auto_increment;

describe alunos;
describe cursos;

select * from ALUNOS;

update alunos
set nome = "Victor"
where matricula = 1;

update alunos
set nome="Victor", sexo = "M"
where matricula = 1;

update alunos
set curso_preferido = "Python" 
where endereco = "ceilandia";

update alunos
set data_nasc = "1992-01-30", sexo = "M", curso_preferido = "Frontend"
where matricula = 2;

update alunos
set endereco = "Narnia"
where curso_preferido = "java"
limit 2;

delete from alunos
where matricula = 11;

delete from alunos
where endereco = "narnia"
limit 2;

