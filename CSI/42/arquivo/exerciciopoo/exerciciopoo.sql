create database exemplopoo;

use exemplopoo;

create table usuarios (
	id int primary key auto_increment,
    nome varchar(255) not null,
    email varchar(255) not null,
    senha varchar(255) not null
);


create table administrador (
	id int primary key auto_increment,
    usuario_id int,
    cargo varchar(255),
    departamento varchar(255),
	foreign key (usuario_id) references usuarios(id)
);

create table cliente (
	id int primary key auto_increment,
    usuario_id int,
    telefone varchar(20),
    endereco varchar(255),
	foreign key (usuario_id) references usuarios(id)
);

