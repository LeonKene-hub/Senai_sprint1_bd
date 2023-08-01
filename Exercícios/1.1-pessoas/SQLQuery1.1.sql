CREATE DATABASE Exercicio_1_1;
USE Exercicio_1_1;

--criando tabela pessoa
CREATE TABLE Pessoa
(
	IdPessoa INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(50) NOT NULL,
	CNH VARCHAR(50) NOT NULL
)

--criando tabela email
CREATE TABLE Email
(
	IdEmail INT PRIMARY KEY IDENTITY,
	IdPessoa INT FOREIGN KEY REFERENCES Pessoa(IdPessoa),
	Endereco VARCHAR(50) NOT NULL
)

--criando tabela telefone
CREATE TABLE Telefone
(
	IdTelefone INT PRIMARY KEY IDENTITY,
	IdPessoa INT FOREIGN KEY REFERENCES Pessoa(IdPessoa),
	Numero VARCHAR(30) NOT NULL
)

--comando para visualizar as tabelas
SELECT * FROM Email
SELECT * FROM Telefone
SELECT * FROM Pessoa

--inserindo valores nas tabelas:
INSERT INTO Pessoa(Nome, CNH)
VALUES('Pedro', '8193');

INSERT INTO Telefone(IdPessoa, Numero)
VALUES(2, '888887777')

INSERT INTO Email(IdPessoa, Endereco)
VALUES(3, 'beta@gmail.com')