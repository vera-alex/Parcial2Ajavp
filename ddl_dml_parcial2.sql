-- DDL
CREATE DATABASE Parcial2Ajavp;

USE [master]
GO
CREATE LOGIN [usrparcial2] WITH PASSWORD=N'12345678',
  DEFAULT_DATABASE = [Parcial2Ajavp],
  CHECK_EXPIRATION = OFF,
  CHECK_POLICY = ON
GO
USE [Parcial2Ajavp]
GO
CREATE USER [usrparcial2] FOR LOGIN [usrparcial2]
GO
ALTER ROLE [db_owner] ADD MEMBER [usrparcial2]
GO

DROP TABLE Serie;
GO

CREATE TABLE Serie (
  id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  titulo VARCHAR(250) NOT NULL,
  sinopsis VARCHAR(5000) NOT NULL,
  director VARCHAR(100) NOT NULL,
  episodios INT NOT NULL,
  fechaEstreno DATETIME NOT NULL DEFAULT GETDATE(),
  estado SMALLINT NOT NULL DEFAULT 1 -- -1: Eliminado, 0: Inactivo, 1: Activo
);
GO

ALTER PROCEDURE paSerieListar @parametro VARCHAR(50)
AS
  SELECT * FROM Serie
  WHERE estado<>-1 AND titulo LIKE '%'+REPLACE(@parametro,' ','%')+'%';
GO

EXEC paSerieListar 'Malcolm';
GO
-- DML
INSERT INTO Serie (titulo, sinopsis, director, episodios, fechaEstreno)
VALUES ('Malcolm (Malcolm in the Middle)', 'Los Cleavers son una familia peculiar. La madre es una crontroladora radical que grita, el padre es un hombre chistoso calvo, el hijo mayor, Francis huyo de la familia a corta edad, Reese es un criminal, Dewey es un cadete espacial y el joven Jamie es un chivo expiatorio. El niño del medio es Malcolm (que se encarga de la narración como entretenimiento sobre su clan desquiciado), es un genio que no quiere ser agotado por su ingenio.', 'Linwood Boomer, Michael Glouberman, Alex Reid', 151, '2000-01-09');

INSERT INTO Serie (titulo, sinopsis, director, episodios, fechaEstreno)
VALUES ('The Big Bang Theory', 'Leonard y Sheldon son dos cerebros privilegiados que pueden ser capaces de decirle a todo el mundo más de lo que quiere saber sobre la física cuántica, pero que no tienen ni la menor idea de cómo relacionarse socialmente, sobre todo cuando se trata de mujeres. Sin embargo, la llegada de una nueva vecina llamada Penny al edificio altera la vida sentimental de Leonard y las obsesiones de Sheldon.', 'Chuck Lorre, Bill Prady', 279, '2007-09-24');

SELECT * FROM Serie WHERE estado<>-1;
