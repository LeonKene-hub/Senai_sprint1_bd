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

SELECT * FROM Empresa

--cliente
INSERT INTO Cliente(Nome,CPF)
VALUES
	('Gabriel', '42098389'),
	('Rubens', '571224169'),
	('Alan', '0214629342'),
	('Kauan', '12404230'),
	('Julia', '360267099'),
	('Pedro', '14359135')

SELECT * FROM Cliente

--Marca
INSERT INTO Marca(Nome)
VALUES
	('BMW'),
	('Fiat'),
	('Ford'),
	('Nissan'),
	('Volwagen'),
	('Tesla')

SELECT * FROM Marca

--Modelo
INSERT INTO Modelo(IdMarca, Nome, Cor, Ano, Preco)
VALUES
	(1, 'IX1', 'branca', '2018', '1209'),
	(2, 'portofino', 'vermelha', '2019', '1800'),
	(3, 'Pulse', 'preto', '2019', '1200'),
	(4, 'Mustang', 'preto', '1968', '2300'),
	(5, 'Kicks', 'laranja', '2019', '1280'),
	(6, 'Polo', 'prata', '2019', '1500'),
	(7, 'ModelX', 'azul', '2020', '1890')

SELECT * FROM Modelo

--Veiculo
INSERT INTO Veiculo(idMarca, IdModelo, Placa)
VALUES
	(1, 2, 'IX1'),
	(2, 3, 'porto'),
	(3, 4, 'Pulse'),
	(4, 5, 'Mustang'),
	(5, 6, 'Kicks'),
	(6, 7, 'Polo'),
	(7, 8, 'ModelX')
	
SELECT * FROM Veiculo

--Aluguel
INSERT INTO Aluguel(IdCliente, IdVeiculo, DataExpiracao, Valor)
VALUES
	(1, 3, '12-11-2023', 1900),
	(7, 6, '08-04-2020', 1830),
	(4, 7, '07-09-2018', 1720),
	(6, 8, '23-06-2023', 1245),
	(5, 9, '15-06-2021', 1643)

SELECT * FROM Aluguel

--Empresa
INSERT INTO Empresa(IdCliente, IdVeiculo, Nome)
VALUES(1, 3, 'CarRussian')

SELECT * FROM Empresa

UPDATE Empresa
SET Nome = 'RubensCar' WHERE IdEmpresa = 1

UPDATE Marca
SET Nome = 'Volkswagen' WHERE IdMarca = 6

DELETE FROM Empresa
WHERE IdEmpresa = 1

-- DQL
-- listar todos os alugueis mostrando as datas de início e fim, o nome do cliente que alugou e nome do modelo do carro
-- listar os alugueis de um determinado cliente mostrando seu nome, as datas de início e fim e o nome do modelo do carro

SELECT 
	Veiculo.IdVeiculo,
	Veiculo.Placa,
	Marca.Nome AS Marca,
	Modelo.Nome AS Modelo,
	Modelo.Cor,
	Modelo.Ano,
	Modelo.Preco
FROM 
Veiculo LEFT JOIN Marca ON Veiculo.idMarca = Marca.idMarca
LEFT JOIN Modelo ON Veiculo.IdModelo = Modelo.IdModelo


SELECT
	Empresa.Nome AS Empresa,
	Cliente.Nome AS NomeCliente,
	Cliente.CPF,
	Aluguel.DataExpiracao,
	Marca.Nome AS Marca,
	Modelo.Nome AS Modelo,
	Veiculo.Placa
FROM
	Empresa LEFT JOIN Cliente ON Empresa.IdCliente = Cliente.IdCliente
	LEFT JOIN Aluguel ON Empresa.IdVeiculo = Aluguel.IdVeiculo
	LEFT JOIN Veiculo ON Veiculo.IdVeiculo  = Empresa.IdVeiculo
	LEFT JOIN Marca ON Marca.IdMarca = Veiculo.IdMarca
	LEFT JOIN Modelo ON Modelo.IdMarca = Marca.IdMarca
