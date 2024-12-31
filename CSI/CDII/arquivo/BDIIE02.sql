-- Excercício Blog

Um sistema de blod deve conter as postagens que devem ser de uma determinada categoria.
Deve ser possível fazer comentários a estas postagens

CREATE TABLE categorias (
  id int(11) NOT NULL AUTO_INCREMENT,
  nome varchar(200) NOT NULL,
  PRIMARY KEY (id)
);


CREATE TABLE comentarios (
  id int(11) NOT NULL AUTO_INCREMENT,
  postagem_id int(11) NOT NULL,
  conteudo varchar(200) NOT NULL,
  PRIMARY KEY (id),
  KEY fk_p_postagem_id_idx (postagem_id),
  CONSTRAINT fk_p_postagem_id FOREIGN KEY (postagem_id) REFERENCES postagens (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);


CREATE TABLE postagens (
  id int(11) NOT NULL AUTO_INCREMENT,
  categoria_id int(11) NOT NULL,
  titulo varchar(45) NOT NULL,
  conteudo text NOT NULL,
  status tinyint(4) NOT NULL,
  PRIMARY KEY (id),
  KEY fk_p_categoria_id_idx (categoria_id),
  CONSTRAINT fk_p_categoria_id FOREIGN KEY (categoria_id) REFERENCES categorias (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

