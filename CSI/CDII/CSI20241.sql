-- comentario de uma linha

/*
Comentario de 
mais de uma linha
*/

-- criacao de um banco de dados
CREATE DATABASE bd2;

-- exclusao de um banco de dados
DROP DATABASE bd2;

-- diz qual banco de dados iremos utilizar
USE bd2;

-- criacao de uma tabela
/*
CREATE TABLE nome_da_tabela (
	coluna1 tipo(tamanho) restricaos,
    coluna2 tipo(tamanho) restricoes,
    coluna3 tipo(tamanho) restricoes
);
*/

CREATE TABLE produtos (
	id int(11) primary key auto_increment,
    nome varchar(255) not null,
    valor float(8,2) not null
);

-- obs:
-- chave primaria - unica e not null
-- varchar vai aceitar números letras e simbolos
-- float - 10.22

-- mostra a estrutura de uma tabela
show columns from produtos;

-- inserindo dado de teste
insert into produtos (nome, valor) values ('caneta', 125.25);
insert into produtos (nome, valor) values ('borracha', 25.43);
insert into produtos (nome, valor) values ('lapis', 30);

-- selecionando dados
select * from produtos;

-- deletando tabela
drop table produtos;

-- renomear tabelas
rename table produtos to meus_produtos;

select * from meus_produtos;

-- limpa os dados da tabela e volta o auto_increment para seu estado original
truncate table meus_produtos;

insert into meus_produtos (nome, valor) values ('lapiseira', 120);

