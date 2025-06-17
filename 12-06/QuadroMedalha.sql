CREATE DATABASE IF NOT EXISTS Olimpiadas;
USE Olimpiadas;

CREATE TABLE Pais (
    IdPais INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL
);

CREATE TABLE Modalidade (
    IdModalidade INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Genero VARCHAR(10) NOT NULL CHECK (Genero IN ('Masculino', 'Feminino'))
);

CREATE TABLE Atleta (
    IdAtleta INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(60) NOT NULL,
    DtNasc DATE NOT NULL,
    IdPais INT NOT NULL,
    IdModalidade INT NOT NULL,
    FOREIGN KEY (IdPais) REFERENCES Pais(IdPais),
    FOREIGN KEY (IdModalidade) REFERENCES Modalidade(IdModalidade)
);

CREATE TABLE Medalha (
    IdMedalha INT PRIMARY KEY AUTO_INCREMENT,
    Tipo VARCHAR(6) NOT NULL CHECK (Tipo IN ('Ouro', 'Prata', 'Bronze')),
    IdAtleta INT NOT NULL,
    DtConquista DATE NOT NULL,
    FOREIGN KEY (IdAtleta) REFERENCES Atleta(IdAtleta)
);

INSERT INTO Pais (nome)
VALUES ('Deutschland'), ('United States'),('South Korea'),
('Brasil'),('Japan');

INSERT INTO Modalidade (nome, genero)
VALUES ('Volleyball', 'Masculino');
INSERT INTO Modalidade (nome, genero)
VALUES ('Volleyball', 'Feminino');
INSERT INTO Modalidade (nome, genero)
VALUES ('Natação Artística', 'Feminino'),('Futebol','Masculino'),
('Ginástica Rítmica', 'Feminino'),('Ginástica artística', 'Feminino'),
('Ginástica Artística','Masculino'),('Esgrima','Feminino');

INSERT INTO Atleta (nome, dtnasc, idpais, idmodalidade)
VALUES ('Arthur Nory', '1993-09-18', 4, 7);

DELETE FROM Atleta WHERE IdAtleta = 1;

INSERT INTO Atleta (nome, dtnasc, idpais, idmodalidade)
VALUES ('Jayson Rampersad', '2003-07-31', 2, 7),
('Helene Mayer', '1953-10-15', 1, 8),
('Yūki Ishikawa', '1995-12-11', 5, 1),
('João Pedro Silva', '1998-03-18', 4, 2),
('Min-Jae Kim', '1996-11-15', 3, 4),
('Rebeca Andrade', '1999-05-08', 4, 6),  
('Simone Biles', '1997-03-14', 2, 6),  
('Kim Yeon-koung', '1988-02-26', 3, 2),
('Gilberto - Giba', '1976-12-23', 4, 1);


INSERT INTO Medalha (Tipo, IdAtleta, DtConquista)
VALUES ('Bronze', 1, '2024-04-20'),
('Ouro', 3, '1928-05-05'),
('Prata', 3, '1936-08-13'),
('Ouro', 7, '2024-08-05'),
('Bronze', 7, '2024-07-30'),
('Ouro', 8, '2024-07-30'),
('Ouro', 8, '2024-08-01'),
('Prata', 8, '2024-08-05'),
('Ouro', 10, '2004-08-29'),
('Prata', 10, '2012-08-12');


SELECT * FROM Medalha;
SELECT * FROM Atleta;
SELECT * FROM Modalidade;
SELECT * FROM Pais; 

-- Atividade 1: Listar todos os países
-- Descrição: Liste o nome de todos os países cadastrados no banco de dados.

SELECT nome FROM Pais; 

-- ----------------------------------------------------------------------------------------------------

-- Atividade 2: Mostrar todas as modalidades femininas
-- Descrição: Liste todas as modalidades cujo gênero seja "Feminino".

SELECT * FROM Modalidade WHERE genero = 'Feminino';

-- ----------------------------------------------------------------------------------------------------
-- Atividade 3: Listar todos os atletas e os países que eles representam
-- Descrição: Faça uma consulta que mostre o nome de cada atleta junto com o país que ele representa.

SELECT 
    A.Nome AS Atletas, 
    P.Nome AS Seu_País
FROM Atleta AS A
JOIN Pais AS P
    ON A.idPais = P.idPais
ORDER BY A.Nome;


-- ----------------------------------------------------------------------------------------------------

-- Atividade 4: Mostrar todas as medalhas de um atleta específico
-- Descrição: Mostre todas as medalhas ganhas por um atleta específico, como "João da Silva".

SELECT 
    A.Nome AS Atleta,
    M.Tipo AS Medalha,
    COUNT(M.IdMedalha) AS `Quantidade De Medalhas`
FROM Atleta AS A
JOIN Pais AS P ON A.idPais = P.idPais
JOIN Medalha AS M ON A.idAtleta = M.idAtleta
WHERE A.Nome = 'Rebeca Andrade';


-- WHERE A.Nome = 'Simone Biles'; 
-- Helene Mayer

select * from atleta

-- ----------------------------------------------------------------------------------------------------

-- Atividade 5: Contar o número total de medalhas conquistadas por cada país
-- Descrição: Faça uma consulta para contar o número total de medalhas que cada país conquistou.

SELECT 
    P.Nome AS Pais,
    COUNT(M.IdMedalha) AS `Quantidade Total De Medalhas`
FROM Pais AS P
LEFT JOIN Atleta AS A ON A.idPais = P.idPais
LEFT JOIN Medalha AS M ON M.idAtleta = A.idAtleta
GROUP BY P.Nome
ORDER BY P.Nome;


-- ----------------------------------------------------------------------------------------------------

-- Atividade 6: Listar atletas que competem em modalidades masculinas
-- Descrição: Liste os nomes de todos os atletas que competem em modalidades cujo gênero é "Masculino".
SELECT 
    A.Nome AS Atleta
FROM Atleta AS A
JOIN Modalidade AS M ON A.idModalidade = M.idModalidade
WHERE M.Genero = 'Masculino';

-- ----------------------------------------------------------------------------------------------------

-- Atividade 7: Encontrar países que conquistaram medalhas de ouro ou prata
-- Descrição**: Liste os países que conquistaram medalhas de **ouro** ou **prata**.


SELECT 
    P.nome AS País,
    M.Tipo AS Medalha
FROM Medalha AS M
JOIN Atleta AS A ON M.IdAtleta = A.IdAtleta
JOIN Pais AS P ON A.idPais = P.idPais
WHERE M.Tipo IN ('Ouro', 'Prata')
ORDER BY P.Nome;

select * from Medalha
select * from Pais
-- ----------------------------------------------------------------------------------------------------

-- Atividade 8: Mostrar o número de medalhas conquistadas por modalidade
-- Descrição**: Conte quantas medalhas foram conquistadas em cada modalidade (sem distinguir entre ouro, prata ou bronze).
    
SELECT 
    MD.Nome AS Modalidade,
    COUNT(M.IdMedalha) AS `Quantidade 
    Total De Medalhas`
FROM Modalidade AS MD
LEFT JOIN Atleta AS A ON A.idModalidade = MD.idModalidade
LEFT JOIN Medalha AS M ON M.idAtleta = A.idAtleta
GROUP BY MD.Nome
ORDER BY MD.Nome;


-- ----------------------------------------------------------------------------------------------------

-- Atividade 9: Listar países que conquistaram mais de 3 medalhas no total
-- Descrição**: Liste os países que conquistaram mais de 3 medalhas, independente do tipo de medalha.
    
SELECT 
    P.nome AS País,
    COUNT(*) AS TotalMedalhas
FROM Medalha AS M
JOIN Atleta AS A ON M.IdAtleta = A.IdAtleta
JOIN Pais AS P ON A.idPais = P.idPais
GROUP BY P.nome
HAVING COUNT(*) > 3
ORDER BY P.nome;


-- ----------------------------------------------------------------------------------------------------

-- Atividade 10 (Quadro de Medalhas): Mostrar um quadro de medalhas
-- Descrição: Crie uma consulta que mostre o **quadro de medalhas** com a seguinte ordem:

-- 1. País com mais ouros no topo.
-- 2. Em caso de empate, o país com mais pratas.
-- 3. Se ainda houver empate, o país com mais bronzes.
-- A consulta deve mostrar o total de medalhas de ouro, prata e bronze para cada país.
    
SELECT 
    P.nome AS País,
    SUM(CASE WHEN M.Tipo = 'Ouro' THEN 1 ELSE 0 END) AS Ouro,
    SUM(CASE WHEN M.Tipo = 'Prata' THEN 1 ELSE 0 END) AS Prata,
    SUM(CASE WHEN M.Tipo = 'Bronze' THEN 1 ELSE 0 END) AS Bronze,
    SUM(CASE WHEN M.Tipo IN ('Ouro', 'Prata', 'Bronze') THEN 1 ELSE 0 END) AS Total
FROM Medalha AS M
JOIN Atleta AS A ON M.IdAtleta = A.IdAtleta
JOIN Pais AS P ON A.idPais = P.idPais
GROUP BY P.nome
ORDER BY 
    Ouro DESC,
    Prata DESC,
    Bronze DESC;
    

