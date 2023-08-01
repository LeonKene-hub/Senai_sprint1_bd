CREATE DATABASE Exercicio_1_2
USE Exercicio_1_2

--Cliente 

--criar
CREATE TABLE Cliente
(
	IdCliente INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(50) NOT NULL,
	CPF VARCHAR(11) NOT NULL
)

--excluir
DROP TABLE Cliente

--criar
CREATE TABLE Marca
(
	IdMarca INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(50) NOT NULL
)

--excluir
DROP TABLE Marca

--criar

CREATE TABLE Modelo
(
	IdModelo INT PRIMARY KEY IDENTITY,
	IdMarca INT FOREIGN KEY REFERENCES Marca(IdMarca),
	Nome VARCHAR(50) NOT NULL, 
	Cor VARCHAR(50) NOT NULL,
	Ano VARCHAR(50) NOT NULL,
	Preco VARCHAR(50) NOT NULL
)

--criar

CREATE TABLE Veiculo
(
	IdVeiculo INT PRIMARY KEY IDENTITY,
	idMarca INT FOREIGN KEY REFERENCES Marca(IdMarca),
	IdModelo INT FOREIGN KEY REFERENCES Modelo(IdModelo),
	Placa CHAR(8) NOT NULL
)

--criar

CREATE TABLE Aluguel
(
	IdAluguel INT PRIMARY KEY IDENTITY,
	IdCliente INT FOREIGN KEY REFERENCES Cliente(IdCliente),
	IdVeiculo INT FOREIGN KEY REFERENCES Veiculo(IdVeiculo),
	[DataExpiracao] DATE NOT NULL,
	Valor INT NOT NULL
)

--criar

CREATE TABLE Empresa
(
	IdEmpresa INT PRIMARY KEY IDENTITY,
	IdCliente INT FOREIGN KEY REFERENCES Cliente(IdCliente),
	IdVeiculo INT FOREIGN KEY REFERENCES Veiculo(IdVeiculo),
	Nome VARCHAR(50) NOT NULL
)

--cliente
INSERT INTO Cliente(Nome,CPF)
VALUES('Gabriel', '12345678901')

SELECT * FROM Cliente

--Marca
INSERT INTO Marca(Nome)
VALUES('BMW')

SELECT * FROM Marca

--Modelo
INSERT INTO Modelo(IdMarca, Nome, Cor, Ano, Preco)
VALUES(1, '320I', 'branca', '2022', '1299')

SELECT * FROM Modelo

--Veiculo
INSERT INTO Veiculo(idMarca, IdModelo, Placa)
VALUES(1, 1, 'BMWG')

SELECT * FROM Veiculo

--Aluguel
INSERT INTO Aluguel(IdCliente, IdVeiculo, DataExpiracao, Valor)
VALUES(1, 3, '12-11-2023', 1900)

SELECT * FROM Aluguel

--Empresa
INSERT INTO Empresa(IdCliente, IdVeiculo, Nome)
VALUES(1, 3, 'CarRussian')

SELECT * FROM Empresa

UPDATE Empresa
SET Nome = 'RubensCar' WHERE IdEmpresa = 1

DELETE FROM Empresa
WHERE IdEmpresa = 1