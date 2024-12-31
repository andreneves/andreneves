-- Exercício: venda

O sistema deve permitir a um cliente cadastrado fazer a compra de um ou mais produtos. Cada produto pertence a uma categoria.
O cliente deve ter nome, sobrenome, endereco e cidade.
Todos os produtos devem ter seu preço.
Na hora da venda deve-se guardar a data da venda.

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `valor` float NOT NULL,
  `categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria_id` (`categoria_id`),
  CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`)
);

CREATE TABLE `cliente` (
  `id` int(11) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `sobrenome` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL
);

itens_venda
id
venda_id
produto_id
quantidade

venda
id
cliente_id
data
