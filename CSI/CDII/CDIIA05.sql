-- BDIIA05

DROP DATABASE bd2;
CREATE DATABASE bd2;

USE bd2;

-- Restrições
-- Constraints
-- As restrições são usadas para limitar o tipo de dados que pode entrar em uma tabela. Isso garante a precisão e a confiabilidade dos dados na tabela. Se houver alguma violação entre a restrição e a ação dos dados, a ação será abortada.
-- Podem ser especificadas na criação ou inseridas na alteração da estrutura de uma tabela.

-- São retrições: 
-- NOT NULL - garante que uma coluna não possa ter um valor NULL
-- UNIQUE - Garante que todos os valores em uma coluna sejam diferentes
-- PRIMARY KEY  - Uma combinação de NOT NOT NULL e UNIQUE. Identifica exclusivamente cada linha em uma tabela
-- FOREIGN KEY  - Identifica exclusivamente uma linha / registro em outra tabela
-- CHECK - Garante que todos os valores em uma coluna satisfaçam uma condição específica
-- DEFAULT - Define um valor padrão para uma coluna quando nenhum valor é especificado


-- OBS:
-- Para verficar as modificações na tabela do banco de dados
SHOW COLUMNS FROM alunos;


-- NOT NULL
-- Não aceita valores null
-- atua tanto na inserção como na atualização de dados

-- criação
CREATE TABLE alunos (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome varchar(80) NOT NULL
); 

insert into alunos (nome) values (null);

-- alteração
CREATE TABLE funcionarios (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome varchar(80)
); 

ALTER TABLE funcionarios
MODIFY nome varchar(80) NOT NULL; 

insert into funcionarios (nome) values (null);

---------------------------------------------------------------------------------------------------------------

-- UNIQUE
-- Valores precisam ser unicos
-- chaves primárias são obrigatoriamente unicas

-- criação
CREATE TABLE usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    UNIQUE (email)
);

insert into usuarios (nome, email) values ('André', 'andr@andr.com.br');
insert into usuarios (nome, email) values ('André 2', 'andr@andr.com.br');


-- na alteração
CREATE TABLE usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome varchar(255) NOT NULL,
    email varchar(255) NOT NULL
);

ALTER TABLE usuarios
ADD UNIQUE (email); 

insert into usuarios (nome, email) values ('André', 'andr@andr.com.br');
insert into usuarios (nome, email) values ('André 2', 'andr@andr.com.br');

-- OBS.: No caso de multiplas colunas
-- ALTER TABLE tabela
-- ADD CONSTRAINT nome_da_constraint UNIQUE (campo1, campo2); 

-- Exclusão de unique
-- ALTER TABLE tabela
-- DROP INDEX nome_da_constraint; 

-- -------------------------------------------------------------------------------------------------------------

-- PRIMARY KEY
-- unicos e não nulos
-- tem que ser unicos, mas podem ser constituidos e uma ou mais colunas

-- criação
CREATE TABLE usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome varchar(255) NOT NULL,
    email varchar(255) NOT NULL
);

-- ou 

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT,
    nome varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    PRIMARY KEY (id)    
);

-- Multiplas colunas - chave primária composta
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT,
    nome varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
CONSTRAINT PRIMARY KEY (id, nome)
);

-- SHOW COLUMNS FROM usuarios;

-- na alteração
CREATE TABLE usuarios (
    id INT,
    nome varchar(255) NOT NULL,
    email varchar(255) NOT NULL
);

-- unica
ALTER TABLE usuarios
ADD PRIMARY KEY (id); 

-- composta
ALTER TABLE usuarios
ADD CONSTRAINT PRIMARY KEY (id, nome); 

-- EXCLUSAO
ALTER TABLE usuarios
DROP PRIMARY KEY; 

-- -------------------------------------------------------------------------------------------------------------

-- FOREIGN KEY - chave estrangeira
-- É uma chave utilizada para estabelecer relação entre duas tabelas
-- É um, ou mais campos, de uma tabela que se referem a chave primária de outra tabela.
-- A tabela que contém a chave é chamada de tabela filho e a tabela que contém a chave candidata é chamada de tabela pai.


-- na criação
create table categorias (
	id int(11) primary key auto_increment,
    nome varchar(255) not null
);

create table produtos (
	id int(11) primary key auto_increment,
    nome varchar(255) not null,
    valor float not null,
    categoria_id int(11) not null,
    foreign key (categoria_id) references categorias(id)
);

-- na alteração
create table produtos (
	id int(11) primary key auto_increment,
    nome varchar(255) not null,
    valor float not null,
    categoria_id int(11) not null
);

ALTER TABLE produtos
ADD FOREIGN KEY (categoria_id) REFERENCES categorias(id); 

-- insert categorias 
insert into categorias (nome) values ('eletronicos');
insert into categorias (nome) values ('informatica');
insert into categorias (nome) values ('escritorio');

-- insert produtos 
insert into produtos (nome, valor, categoria_id) values ('microondas', 100, 1);
insert into produtos (nome, valor, categoria_id) values ('forno eletrico', 200, 1);
insert into produtos (nome, valor, categoria_id) values ('teclado', 50, 2);
insert into produtos (nome, valor, categoria_id) values ('mouse', 20, 2);
insert into produtos (nome, valor, categoria_id) values ('mesa', 120, 3);
insert into produtos (nome, valor, categoria_id) values ('cadeira', 80, 3);

-- selecionar todos os dados da tabela categorias
select * from categorias;

-- selecionar todos os dados da tabela produtos
select * from produtos;

-- inner join das duas tabelas
SELECT categorias.nome, produtos.nome, produtos.valor
FROM produtos
INNER JOIN categorias ON produtos.categoria_id = categorias.id;

-- excluindo chave estrangeira
-- ALTER TABLE produtos
-- DROP FOREIGN KEY nome_da_chave; 


