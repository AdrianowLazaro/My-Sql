create database cursos_programacao_senai_2023;

use cursos_programacao_senai_2023;

create table cursos_Senai(
nome varchar(50),
descricao varchar(100),
carga int,
tot_aulas int,
ano year
);

insert into cursos_Senai values
("HTML5","Curso de HTML 5", 40, 37, "2014"),
("Algortimos", "Logica de Programação", 20, 15, "2014"),
("Photoshop", "Dicas de Photoshop CC", 10, 8, "2014"),
("PHP", "Curso de PHP para inciantes", 40,20,"2015"),
("Java", "Introdução a linguagem Java", 40, 29, "2015"),
("Mysql", "Banco de dados Mysql", 30,15,"2016"),
("Word", "Curso completo de Word", 40,30,"2016"),
("Curso de Python", "Logica", 40, 18, "2017"),
("POO", "Curso de programação orientada a objeto", 60,35,"2016"),
("Excel","Curso completo de excel",40,30,"2017"),
("Responsividade", "Curso de Responsividade", 30,15,"2018"),
("C++", "Curso de C++ orientado a objeto", 40,25,"2017"),
("C#","Curso de C#",30,12,"2017"),
("Android","Curso de Desenvolvimento de aplicativos",60,30,"2018"),
("JavaScript","curso de Javascript",35,18,"2017"),
("PowerPoint","Curso completo de PowePoint",30,12,"2018"),
("Swift","Curso de desenvolvimentos de aplicativos mobile",60,30,"2019"),
("Hardware", "Curso de Montagem e configuração",30,12,"2018"),
("Redes","Curso de REdes para inciantes",40,15,"2016"),
("Seurança","Curso de Segurança",15,8,"2018"),
("Seurança","Curso de Segurança",15,8,"2018"),
("Premiere", "Curso de edição de videos com Premiere",20,10,"2017"),
("AfterEffects", "Curso de Efeitos em Videos com AfterEffects", 20,10,"2018"),
("WordPress", "Criação de sites com Word press",60,30,"2019"),
("Joomla", "Criação de sites com Joomla",60,30,"2019"),
("Magento", "Curso de criação de lojas virtuais", 50,25,"2019"),
("Modelagem de dados"," Curso de Modelagem de dado",30,12,"2020"),
("HTML4", "Curso Basico de HTML versao 4.0", 20,9,"2010"),
("PHP7", "Curso de PHP versao 7.0",40,20,"2020"),
("PHP4"," Curso de PHP versao 4.0", 30,11,"2010");

select * from cursos_Senai;

-- QUESTÃO 1
select * from cursos_Senai
where nome like "a%";

-- QUESTÃO 2
select * from cursos_Senai
where carga >50
order by nome;

-- QUESTÃO 3
select  nome, carga 
from cursos_senai
order by carga
limit 1;

-- QUESTÃO 4
select nome, carga
from cursos_Senai
order by carga desc
limit 1;

-- QUESTÃO 5
select * from cursos_senai
where carga >30;

select * from cursos_senai
where tot_aulas <40;
