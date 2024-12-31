CREATE TABLE categorias (
	id INT (11) NOT NULL, -- AUTO_INCREMENT,
	nome VARCHAR(200) -- ,
	-- PRIMARY KEY (id)
)

CREATE TABLE produtos (
	id INT (11) NOT NULL,-- AUTO_INCREMENT,
	nome VARCHAR(200),
	categoria_id INT (11) -- ,
	-- PRIMARY KEY (id)
)

-- caso não tenha add primary key no create
ALTER TABLE categorias
ADD CONSTRAINT pk_categorias_id PRIMARY KEY (id);

ALTER TABLE produtos
ADD CONSTRAINT pk_produtos_id PRIMARY KEY (id);

-- add autoincremet
ALTER TABLE categorias
MODIFY COLUMN id  int(11) NOT NULL AUTO_INCREMENT FIRST;

ALTER TABLE produtos
MODIFY COLUMN id  int(11) NOT NULL AUTO_INCREMENT FIRST;


-- chave extrangeira
ALTER TABLE produtos
ADD FOREIGN KEY (categoria_id) REFERENCES categorias(id); 


INSERT INTO categorias (id, nome) VALUES (NULL, 'Limpeza');
INSERT INTO categorias (id, nome) VALUES (NULL, 'Frios');


INSERT INTO produtos (id, nome, categoria_id) VALUES (NULL, 'Sabão', 1);
INSERT INTO produtos (id, nome, categoria_id) VALUES (NULL, 'Lixeira', 1);

INSERT INTO produtos (id, nome, categoria_id) VALUES (NULL, 'Presunto', 2);
INSERT INTO produtos (id, nome, categoria_id) VALUES (NULL, 'Queijo', 2);


