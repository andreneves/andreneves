-- BDIIA06

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




-- CHECK 
-- É usada para limitar os valores de uma coluna.
-- Pode ser aplicada em uma coluna ou tabela.

-- na criação
-- uma coluna
CREATE TABLE alunos (
    id int PRIMARY KEY auto_increment,
    nome varchar(255) NOT NULL,
    cidade varchar(255) NOT NULL,
    idade int,
    CHECK (idade >= 18)
); 

insert into alunos (nome, cidade, idade) values ('André', 'São Paulo', 19);
insert into alunos (nome, cidade, idade) values ('Paulo', 'São Paulo', 16);

-- na criação
-- varias colunas
CREATE TABLE alunos (
    id int PRIMARY KEY auto_increment,
    nome varchar(255) NOT NULL,
    cidade varchar(255) NOT NULL,
    idade int,
    CONSTRAINT CHK_Alunos CHECK (idade >= 18 AND cidade = 'Rio de Janeiro')
); 

insert into alunos (nome, cidade, idade) values ('André', 'Rio de Janeiro', 19);
insert into alunos (nome, cidade, idade) values ('Henrique', 'São Paulo', 19);
insert into alunos (nome, cidade, idade) values ('Paulo', 'São Paulo', 16);

-- alteracao
CREATE TABLE alunos (
    id int PRIMARY KEY auto_increment,
    nome varchar(255) NOT NULL,
    cidade varchar(255) NOT NULL,
    idade int
); 

-- uma coluna
ALTER TABLE alunos
ADD CHECK (idade >= 18);

-- varias colunas
ALTER TABLE alunos
ADD CONSTRAINT CHK_Alunos CHECK (idade >= 18 AND cidade = 'Rio de Janeiro');

-- drop
ALTER TABLE alunos
DROP CONSTRAINT CHK_Alunos; 


-- ------------------------------------------------------------------------------------------------------------------


-- DEFAULT
-- valor padrão da coluna
-- o campo é preenchido automaticamente caso não seja declarado um valor

-- na criação
CREATE TABLE alunos (
    id int PRIMARY KEY auto_increment,
    nome varchar(255) NOT NULL,
    cidade varchar(255) NOT NULL DEFAULT 'Rio de Janeiro',
    idade int
); 

insert into alunos (nome, idade) values ('André', 19);

-- na alteração
CREATE TABLE alunos (
    id int PRIMARY KEY auto_increment,
    nome varchar(255) NOT NULL,
    cidade varchar(255) NOT NULL,
    idade int
); 

ALTER TABLE alunos
ALTER cidade SET DEFAULT 'Rio de Janeiro'; 

insert into alunos (nome, idade) values ('André', 19);

-- drop
ALTER TABLE alunos
ALTER cidade DROP DEFAULT; 



-- exemplo com default now()

create table inscricoes (
    id int(11) primary key auto_increment,
    nome varchar(255) not null,
    data datetime not null default now()
);

insert into inscricoes (nome) values ('André');
insert into inscricoes (nome) values ('Diego');
insert into inscricoes (nome) values ('Elisa');
insert into inscricoes (nome) values ('Carmen');

select * from inscricoes;