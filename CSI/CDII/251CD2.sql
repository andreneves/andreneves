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





-- CDIIA03

DROP DATABASE cd2;
CREATE DATABASE cd2;

USE cd2;

CREATE TABLE produtos (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome varchar(80) NOT NULL
);

-- inserindo dados para testar
insert into produtos (nome) values ('camisa');
insert into produtos (nome) values ('calça');
insert into produtos (nome) values ('meia');


-- selecionando dados para testar
select * from produtos;




-----------------
-- ALTER TABLE --
-----------------

-- Explicação: ALTER TABLE é responsável por modificar a estrutura da tabela, podendo acrescentar, excluir e alterar campos.
-- OBS.: Para fins didáticos vamos criar a tabela abaixo para poder testar o conceito.

-- Não esqueça de conferir o resultado de cada comando na estrutura de sua tabela utilizando o comando:
-- SHOW COLUMNS FROM nomeDaTabela



---------
-- ADD --
---------

-- Explicação: Adiciona um campo a tabela.

-- Sintaxe: 
-- ALTER TABLE nomeDaTabela
-- ADD NomeDaColuna tipo;

ALTER TABLE produtos
ADD descricao TEXT;

ALTER TABLE produtos
ADD valor float;

ALTER TABLE produtos
ADD observacao varchar(80);



-----------------
-- DROP COLUMN --
-----------------

-- Explicação: Destrói um campo da tabela.

-- Sintaxe: 
-- ALTER TABLE NomeDaTabela
-- DROP COLUMN NomeDaColuna;

ALTER TABLE produtos
DROP COLUMN descricao;



-------------------
-- MODIFY COLUMN --
-------------------

-- Explicação: Modifica um campo da tabela

-- Sintaxe: 
-- ALTER TABLE NomeDaTabela
-- MODIFY COLUMN NomeDaColuna tipo;

ALTER TABLE produtos
MODIFY COLUMN observacao varchar(255);

alter table produtos
modify column observacao TEXT;


-- teste convertendo de float para inteiro
-- converte, mas corta as casas decimais

insert into produtos (nome, valor, observacao)
values ('Timer', 10.34, 'observacao');

alter table produtos
modify column valor int(11);

select * from produtos;

alter table produtos
modify column observacao varchar(50);

-- se inserirmos um valor com casa decimal acima de 5 ele arredonda para o inteiro superior.
-- No exemplo ele arredondou para 21
insert into produtos (nome, valor, observacao)
values ('Relógio', 20.72, 'Uma grande observacao para testar o que acontece quando inserimos um campo grande e depois convertemos para um campo menor');

-- se inserirmos uma string maior e depois convertermos o campo para 
-- um campo texto menor ele vai cortar o conteúdo para o novo tamanho.
alter table produtos
modify column observacao varchar(50);




------------
-- CHANGE --
------------

-- Sintaxe: 
-- ALTER TABLE NomeDaTabela
-- MODIFY COLUMN NomeDaColuna NovoNomeDaColuna tipo;

ALTER TABLE produtos 
CHANGE observacao obs varchar(255);