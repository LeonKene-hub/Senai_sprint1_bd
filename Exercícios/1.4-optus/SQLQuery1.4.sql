CREATE DATABASE Exercicio_1_4
USE Exercicio_1_4

CREATE TABLE Artista
(
	IdArtista INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(30) NOT NULL
)

CREATE TABLE Estilo
(
	IdEstilo INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(30) NOT NULL
)

CREATE TABLE Usuario
(
	IdUsuario INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(30) NOT NULL,
	Email VARCHAR(30) NOT NULL,
	Senha VARCHAR(30) NOT NULL,
	TipoPermissao VARCHAR(30) NOT NULL
)

CREATE TABLE Album
(
	IdAlbum INT PRIMARY KEY IDENTITY,
	IdArtista INT FOREIGN KEY REFERENCES Artista(IdArtista),
	IdEstilo INT FOREIGN KEY REFERENCES Estilo(IdEstilo),
	IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario),
	Titulo VARCHAR(20),
	DataLancamento DATE,
	Minutos INT
)

--Artista
INSERT INTO Artista(Nome)
VALUES('Bad Omens')

SELECT * FROM Artista

--Estilo
INSERT INTO Estilo(Nome)
VALUES('Rock')

SELECT * FROM Estilo

--Usuario
INSERT INTO Usuario(Nome, Email, Senha, TipoPermissao)
VALUES('Pedro', 'Pedrokis@gmail.com', 'pato-frito', 'premium')

SELECT * FROM Usuario

--Album
INSERT INTO Album(IdArtista, IdEstilo, IdUsuario, Titulo, DataLancamento, Minutos)
VALUES(1, 1, 1, 'Feel Nothing', '03-05-2021', 186)

SELECT * FROM Album