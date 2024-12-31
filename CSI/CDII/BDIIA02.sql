-- BDIIA02

DROP DATABASE bd2;
CREATE DATABASE bd2;

USE bd2;

------------------
-- CREATE TABLE --
------------------

-- Explicação: Cria uma nova tabela no banco de dados selecionado.

-- Sintaxe:

-- TABELA
/*
CREATE TABLE NomeDaTabela (
    coluna1 tipo,
    coluna1 tipo,
    coluna1 tipo,
   ....
);
*/

-- Exemplo: 

CREATE TABLE clientes (
    id int primary key auto_increment,
    nome varchar(100),
    sobrenome varchar(100),
    endereco varchar(255),
    cidade varchar(50),
    uf varchar(2)
);


-- inserindo valores

INSERT INTO clientes (nome, sobrenome, endereco, cidade, uf) 
values ('André', 'Neves', 'Rua A', 'Rio de Janeiro', 'RJ');


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



-- para saber o valor do auto_increment
SELECT AUTO_INCREMENT FROM information_schema.tables
WHERE table_name = 'alunos' AND table_schema = 'bd2';

