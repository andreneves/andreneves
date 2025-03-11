-- CRIACAO DE BANCO DE DADOS
create database cd2;

-- dizer qual banco eu vou usar
use cd2;

-- criacao de tabela
create table alunos (
	id int(11) primary key auto_increment,
	nome varchar(255) not null,
	idade int(2)
);

-- mostra a estrutura da tabela
show columns from alunos;

-- inserindo dados na tabela
insert into alunos (nome, idade) values ('André', 26);
insert into alunos (nome, idade) values ('Carlos', 28);
insert into alunos (nome, idade) values ('Daniela', 30);

-- seleciona os dados da tabela
select * from alunos;

select nome from alunos;

select nome, idade
from alunos 
where idade = 28;


