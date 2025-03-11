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

-- selecao duas colunas
select nome, idade
from alunos 
where idade = 28;


------------------
-- RENAME TABLE --
------------------

-- Explicação: Renomeia uma tabela do banco de dados selecionado.
-- Sintaxe: 

-- RENAME TABLE NomeDaTabela; 

RENAME TABLE clientes TO Meus_Clientes;



----------------
-- DROP TABLE --
----------------

-- Explicação: Destrói uma tabela do banco de dados selecionado.
-- Sintaxe: 

-- DROP TABLE NomeDaTabela; 

-- Exemplo: 

DROP TABLE clientes; -- deleta a tabela


--------------------
-- TRUNCATE TABLE --
--------------------

-- Explicação: Limpa todos os dados, mas preserva a estrutura da tabela. Também volta o auto_increment para o status inicial.
-- Sintaxe: 

-- TRUNCATE TABLE NomeDaTabela; 


-- Exemplo: 

TRUNCATE TABLE clientes;

