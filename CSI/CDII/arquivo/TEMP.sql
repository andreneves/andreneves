SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for perfil
-- ----------------------------
DROP TABLE IF EXISTS `perfil`;
CREATE TABLE `perfil`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador com autoincremento',
  `nome` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'nome do perfil',
  `descricao` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL COMMENT 'descricao do perfil',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador com autoincremento',
  `nome` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `senha` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `perfil_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_perfil_id`(`perfil_id`) USING BTREE,
  CONSTRAINT `fk_perfil_id` FOREIGN KEY (`perfil_id`) REFERENCES `perfil` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;





-- BANCO DE DADOS

-- CREATE DATABASE NomeDoBancoDeDados; 
CREATE DATABASE bd2;

-- DROP DATABASE NomeDoBancoDeDados; 
DROP DATABASE bd2;

-- TABELA
/*
CREATE TABLE NomeDaTabela (
    coluna1 tipo,
    coluna1 tipo,
    coluna1 tipo,
   ....
);
*/

CREATE TABLE cliente (
    id int,
    nome varchar(255),
    sobrenome varchar(255),
    endereco varchar(255),
    cidade varchar(255)
);

-- DROP TABLE NomeDaTabela; 
DROP TABLE cliente; -- deleta a tabela

TRUNCATE TABLE cliente; -- limpa todos os dados, mas preserva a estrutura da tabela



CREATE TABLE produtos (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome varchar(80) NOT NULL
)



-- ALTER TABLE

-- ADD
-- ALTER TABLE NomeDaTabela
-- ADD NomeDaColuna tipo; 

ALTER TABLE produtos
ADD descricao TEXT;

ALTER TABLE produtos
ADD valor float;

-- DROP COLUMN
-- ALTER TABLE NomeDaTabela
-- DROP COLUMN NomeDaColuna; 
ALTER TABLE produtos
DROP COLUMN descricao;

-- MODIFY
ALTER TABLE produtos
MODIFY COLUMN descricao varchar(255); 



-- SQL Constraints

-- SQL constraints are used to specify rules for the data in a table.
-- Constraints are used to limit the type of data that can go into a table. This ensures the accuracy and reliability of the data in the table. If there is any violation between the constraint and the data action, the action is aborted.
-- Constraints can be column level or table level. Column level constraints apply to a column, and table level constraints apply to the whole table.

    NOT NULL - Ensures that a column cannot have a NULL value
    UNIQUE - Ensures that all values in a column are different
    PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
    FOREIGN KEY - Uniquely identifies a row/record in another table
    CHECK - Ensures that all values in a column satisfies a specific condition
    DEFAULT - Sets a default value for a column when no value is specified
    INDEX - Used to create and retrieve data from the database very quickly


-- SQL NOT NULL Constraint

By default, a column can hold NULL values.

Example
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);

-- SQL NOT NULL on ALTER TABLE

ALTER TABLE Persons
MODIFY Age int NOT NULL; 


-- SQL UNIQUE Constraint

The UNIQUE constraint ensures that all values in a column are different.

SQL UNIQUE Constraint on CREATE TABLE

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    UNIQUE (ID)
); 



-- SQL PRIMARY KEY Constraint

The PRIMARY KEY constraint uniquely identifies each record in a table.

Primary keys must contain UNIQUE values, and cannot contain NULL values.

A table can have only ONE primary key; and in the table, this primary key can consist of single or multiple columns (fields).
SQL PRIMARY KEY on CREATE TABLE

The following SQL creates a PRIMARY KEY on the "ID" column when the "Persons" table is created:

MySQL:
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (ID)
); 


To allow naming of a PRIMARY KEY constraint, and for defining a PRIMARY KEY constraint on multiple columns, use the following SQL syntax:

MySQL / SQL Server / Oracle / MS Access:
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)
); 


-- SQL FOREIGN KEY Constraint

A FOREIGN KEY is a key used to link two tables together.

A FOREIGN KEY is a field (or collection of fields) in one table that refers to the PRIMARY KEY in another table.

The table containing the foreign key is called the child table, and the table containing the candidate key is called the referenced or parent table.

Look at the following two tables:

"Persons" table:

SQL FOREIGN KEY on CREATE TABLE

The following SQL creates a FOREIGN KEY on the "PersonID" column when the "Orders" table is created:

MySQL:
CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
); 


SQL FOREIGN KEY on ALTER TABLE

To create a FOREIGN KEY constraint on the "PersonID" column when the "Orders" table is already created, use the following SQL:

MySQL / SQL Server / Oracle / MS Access:
ALTER TABLE Orders
ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID); 



DROP a FOREIGN KEY Constraint

To drop a FOREIGN KEY constraint, use the following SQL:

MySQL:
ALTER TABLE Orders
DROP FOREIGN KEY FK_PersonOrder; 



-- SQL CHECK Constraint

The CHECK constraint is used to limit the value range that can be placed in a column.

If you define a CHECK constraint on a single column it allows only certain values for this column.

If you define a CHECK constraint on a table it can limit the values in certain columns based on values in other columns in the row.
SQL CHECK on CREATE TABLE

The following SQL creates a CHECK constraint on the "Age" column when the "Persons" table is created. The CHECK constraint ensures that you can not have any person below 18 years:

MySQL:
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CHECK (Age>=18)
); 

To allow naming of a CHECK constraint, and for defining a CHECK constraint on multiple columns, use the following SQL syntax:

MySQL / SQL Server / Oracle / MS Access:
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255),
    CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sandnes')
); 


-- SQL DEFAULT Constraint

The DEFAULT constraint is used to provide a default value for a column.

The default value will be added to all new records IF no other value is specified.
SQL DEFAULT on CREATE TABLE

The following SQL sets a DEFAULT value for the "City" column when the "Persons" table is created:

My SQL / SQL Server / Oracle / MS Access:
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Sandnes'
);

The DEFAULT constraint can also be used to insert system values, by using functions like GETDATE():
CREATE TABLE Orders (
    ID int NOT NULL,
    OrderNumber int NOT NULL,
    OrderDate date DEFAULT GETDATE()
); 


SQL DEFAULT on ALTER TABLE

To create a DEFAULT constraint on the "City" column when the table is already created, use the following SQL:

MySQL:
ALTER TABLE Persons
ALTER City SET DEFAULT 'Sandnes'; 


-- SQL CREATE INDEX Statement

The CREATE INDEX statement is used to create indexes in tables.

Indexes are used to retrieve data from the database very fast. The users cannot see the indexes, they are just used to speed up searches/queries.

Note: Updating a table with indexes takes more time than updating a table without (because the indexes also need an update). So, only create indexes on columns that will be frequently searched against.
CREATE INDEX Syntax

Creates an index on a table. Duplicate values are allowed:
CREATE INDEX index_name
ON table_name (column1, column2, ...);
CREATE UNIQUE INDEX Syntax

Creates a unique index on a table. Duplicate values are not allowed:
CREATE UNIQUE INDEX index_name
ON table_name (column1, column2, ...); 


CREATE INDEX Example

The SQL statement below creates an index named "idx_lastname" on the "LastName" column in the "Persons" table:
CREATE INDEX idx_lastname
ON Persons (LastName);

If you want to create an index on a combination of columns, you can list the column names within the parentheses, separated by commas:
CREATE INDEX idx_pname
ON Persons (LastName, FirstName); 


DROP INDEX Statement

The DROP INDEX statement is used to delete an index in a table.

MySQL:
ALTER TABLE table_name
DROP INDEX index_name; 


-- -------------------------------------------------------------
-- AUTO INCREMENT Field

Auto-increment allows a unique number to be generated automatically when a new record is inserted into a table.

Often this is the primary key field that we would like to be created automatically every time a new record is inserted.
Syntax for MySQL

The following SQL statement defines the "Personid" column to be an auto-increment primary key field in the "Persons" table:
CREATE TABLE Persons (
    Personid int NOT NULL AUTO_INCREMENT,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (Personid)
); 


ALTER TABLE Persons AUTO_INCREMENT=100; 
INSERT INTO Persons (FirstName,LastName)
VALUES ('Lars','Monsen'); 


-- SQL Working With Dates
As long as your data contains only the date portion, your queries will work as expected. However, if a time portion is involved, it gets more complicated.
MySQL comes with the following data types for storing a date or a date/time value in the database:

    DATE - format YYYY-MM-DD
    DATETIME - format: YYYY-MM-DD HH:MI:SS
    TIMESTAMP - format: YYYY-MM-DD HH:MI:SS
    YEAR - format YYYY or YY


Now we want to select the records with an OrderDate of "2008-11-11" from the table above.

We use the following SELECT statement:
SELECT * FROM Orders WHERE OrderDate='2008-11-11'



-- SQL CREATE VIEW Statement

In SQL, a view is a virtual table based on the result-set of an SQL statement.

A view contains rows and columns, just like a real table. The fields in a view are fields from one or more real tables in the database.

You can add SQL functions, WHERE, and JOIN statements to a view and present the data as if the data were coming from one single table.
CREATE VIEW Syntax
CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;

Note: A view always shows up-to-date data! The database engine recreates the data, using the view's SQL statement, every time a user queries a view.
SQL CREATE VIEW Examples

The following SQL creates a view that shows all customers from Brazil:
Example
CREATE VIEW [Brazil Customers] AS
SELECT CustomerName, ContactName
FROM Customers
WHERE Country = "Brazil";

We can query the view above as follows:
Example
SELECT * FROM [Brazil Customers];

The following SQL creates a view that selects every product in the "Products" table with a price higher than the average price:
Example
CREATE VIEW [Products Above Average Price] AS
SELECT ProductName, Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);

We can query the view above as follows:
Example
SELECT * FROM [Products Above Average Price]; 