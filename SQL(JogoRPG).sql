--DDL(linguagem de definição de dados) - para criar a estrutura do banco de dados e das tabelas.

CREATE DATABASE RpgBDFST2
GO

USE RpgBDFST2
GO

CREATE TABLE Usuarios(
	IdUsuario INT PRIMARY KEY IDENTITY,
	Email VARCHAR(100) UNIQUE NOT NULL,
	Senha VARCHAR(255) NOT NULL
)
GO

CREATE TABLE Classes(
	IdClasse INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(100) UNIQUE NOT NULL,
	Descricao VARCHAR(255)
)
GO

CREATE TABLE Personagens(
	IdPersonagem INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(30) UNIQUE NOT NULL,
	IdUsuario INT UNIQUE FOREIGN KEY REFERENCES Usuarios(IdUsuario),
	IdClasse INT FOREIGN KEY REFERENCES Classes(IdClasse)
)
GO

CREATE TABLE Habilidades(
	IdHabilidade INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(100) UNIQUE NOT NULL,
	Descricao VARCHAR(MAX)
)
GO

CREATE TABLE ClasseHabilidade(
	IdClasse INT FOREIGN KEY REFERENCES Classes(IdClasse),
	IdHabilidade INT FOREIGN KEY REFERENCES Habilidades(IdHabilidade)
)
GO


--DML (linguagem de manipulação de dados) - Para manipular os dados, como inserir valores, atualizar ou remover dados

INSERT INTO Usuarios VALUES ('email@email.com', 123456)
INSERT INTO Classes VALUES ('Bárbaro', 'Descrição da classe Bárbaro')
INSERT INTO Habilidades VALUES ('Lança Mortal', 'Descrição da Lança Mortal'), ('Escudo Supremo', 'Descrição do Escudo Supremo')
INSERT INTO Personagens VALUES ('DeuBug', 1, 1) -- nome do personagem, IdUsuario, IdClasse
INSERT INTO ClasseHabilidade VALUES (1, 1), (1, 2) -- IdClasse, IdHabilidade

INSERT INTO Usuarios VALUES ('outroemail@email.com', 654321)
INSERT INTO Classes VALUES ('Monge', 'Descrição da classe Bárbaro')
INSERT INTO Habilidades VALUES ('Recuperar vida', 'Descrição de Recuperar vida')
INSERT INTO Personagens VALUES ('BitBug', 2, 2)
INSERT INTO ClasseHabilidade VALUES (2, 2), (2, 3)

--Exemplo de atualização de dados: vamos alterar a senha do usuário cujo id é igual a 1
UPDATE Usuarios -- tabela
SET Senha = 1234567 -- coluna 
WHERE IdUsuario = 1 -- linha/registro/instância


--DQL (linguagem de consulta de dados) - Para selecionar elementos e fazer consultas

SELECT * FROM Usuarios
SELECT * FROM Classes
SELECT * FROM Habilidades
SELECT * FROM Personagens
SELECT * FROM ClasseHabilidade


--Para juntar conteúdos das tabelas, vamos usar o JOIN (O termo INNER é opcional)

--Selecionando tudo
SELECT * FROM Personagens
INNER JOIN Classes 
ON Personagens.IdClasse = Classes.IdClasse

--Especificando as colunas selecionadas
SELECT Personagens.Nome, Classes.Nome, Classes.Descricao FROM Personagens
INNER JOIN Classes
ON Personagens.IdClasse = Classes.IdClasse

--Abreviandos os nomes das tabelas
SELECT P.Nome, C.Nome 'Classe', C.Descricao FROM Personagens AS P -- 'AS P' indica que P é o apelido da tabela Personagens; o comando AS é opcional / Usamos 'Classe' para dar nome à coluna que tem o nome da classe
INNER JOIN Classes AS C
ON P.IdClasse = C.IdClasse

CREATE LOGIN jogador
WITH PASSWORD = '123456'

CREATE USER jogador FOR LOGIN jogador

GRANT SELECT TO jogador