-- EXERCICIOS


-- 1) Crie o comando que altera a tabela abaixo colocando o campo id como chave primárias

CREATE TABLE estudantes (
	id INT,
	nome varchar(255) NOT NULL,
	cidade varchar(255) NOT NULL
);



-- 2) Crie uma tabela contendo os campos abaixo e colocando o campo cpf_responsavel como unique
Tabela: escritorios
Campos obrigatorios: id, localizacao, nome_responsavel, cpf_responsavel



-- 3) Crie o comando que altere a tabela "artigos" fazendo com que sua chave extrangeira faça referência a chave primária da tabela "autores"

create table autores (
	id int(11) primary key auto_increment,
    nome varchar(255) not null
);

create table artigos (
	id int(11) primary key auto_increment,
    nome varchar(255) not null,
    valor float not null,
    autor_id int(11) not null
);


