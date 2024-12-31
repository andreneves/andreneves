-- EXERCICIOS


-- 1) Execute a sequência de comandos
-- Crie um banco de dados chamado bd2exercicios
-- Diga que irá usar este banco de dados



-- 2) Crie uma tabela chamada usuarios que deverá conter os seguintes campos: id, nome, email, senha e perfil. Leve em consideração os dados que serão inseridos no item seguinte.




-- 3) insira os seguintes registros nesta tabela

-- Nome: André Neves
-- Email: andr@andr.com.br
-- senha: 123456789
-- perfil: desenvolvedor

-- Nome: Luciene
-- Email: lu@lu.com.br
-- senha: 987654321
-- perfil: administrador

-- Nome: Ana
-- Email: ana@ana.com.br
-- senha: 989898989
-- perfil: gerente

-- Obs.: Tente colocar a senha criptografada no banco de dados. Consulte a documentação para entender mais sobre criptografia e coloque SHA2 (256)
-- https://dev.mysql.com/doc/refman/8.0/en/encryption-functions.html#function_sha2




-- Com base na tabela abaixo responda as perguntas

create table carro (
  id int(11) primary key auto_increment,
  nome varchar(200) not null,
  valor int(11),
  endereco varchar(255)
);

-- 4) Altere o nome da tabela para 'carros'




-- 5) Altere o campo valor para float




-- 6) Retire da estrutura da tabela o campo 'endereco'




-- 7) Insira o campo 'observacao' que deve ser do tipo TEXT



