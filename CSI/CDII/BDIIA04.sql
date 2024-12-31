-- BDIIA04

DROP DATABASE bd2;
CREATE DATABASE bd2;

USE bd2;



-- Restrições
-- Constraints
-- As restrições são usadas para limitar o tipo de dados que pode entrar em uma tabela. Isso garante a precisão e a confiabilidade dos dados na tabela. Se houver alguma violação entre a restrição e a ação dos dados, a ação será abortada.
-- Podem ser especificadas na criação ou inseridas na alteração da estrutura de uma tabela.

-- na criação
CREATE TABLE nome_da_tabela (
    coluna1 tipo restrição,
    coluna2 tipo restrição,
    coluna3 tipo restrição
);

-- ou

-- na alteração
ALTER TABLE nome_da_tabela
ADD CONSTRAINT restrição;

-----------------------------------------------------------------------------------------

-- São retrições: 
-- NOT NULL - a coluna não pode ser nula (null)
-- UNIQUE   - Garante que todos os valores em uma coluna sejam diferentes (sem valores repetidos)
-- PRIMARY KEY  - Uma combinação de NOT NOT NULL e UNIQUE. Identifica exclusivamente cada linha em uma tabela
-- FOREIGN KEY  - Identifica exclusivamente uma linha / registro em outra tabela
-- CHECK - Garante que todos os valores em uma coluna satisfaçam uma condição específica
-- DEFAULT - Define um valor padrão para uma coluna quando nenhum valor é especificado

-----------------------------------------------------------------------------------------

-- OBS:
-- Para verficar as modificações na tabela do banco de dados
SHOW COLUMNS FROM produtos;

-- EXEMPLO

-- na criação
CREATE TABLE produtos (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome varchar(80) NOT NULL
);

-- OU

-- na alteração
CREATE TABLE produtos (
	id INT,
	nome varchar(80) NOT NULL
);

ALTER TABLE produtos
ADD CONSTRAINT PRIMARY KEY (id);

ALTER TABLE produtos
MODIFY COLUMN id int(11) NOT NULL AUTO_INCREMENT; -- FIRST;

-- inserindo dados para testar
insert into produtos (nome) values ('camisa');
insert into produtos (nome) values ('calça');
insert into produtos (nome) values ('meia');

-- selecionando dados para testar
select * from produtos;


