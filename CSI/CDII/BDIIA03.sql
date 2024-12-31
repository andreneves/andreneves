-- BDIIA03

DROP DATABASE bd2;
CREATE DATABASE bd2;

USE bd2;

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