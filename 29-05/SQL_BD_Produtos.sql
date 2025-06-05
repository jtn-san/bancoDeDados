USE BD_PRODUTOS
GO

/*
	DQL - Data Query Language - Linguagem de Consulta de Dados
	SELECT = BASICAMENTE O ÚNICO COMANDO
*/

--SELECIONA TODAS AS COLUNAS E LINHAS DA TABELA
SELECT * FROM Produto

-- SELECIONA COLUNAS ESPECÍFICAS DE UMA TABELA
SELECT Nome,Preco FROM Produto
SELECT IdProduto, Nome FROM Produto


-- ORDENADO AS COLUNAS
SELECT Nome, Preco FROM Produto ORDER BY Preco -- CRESCENTE
SELECT Nome, Preco FROM Produto ORDER BY Preco DESC -- DECRESCENTE
SELECT Nome,EhLancamento,Preco FROM Produto ORDER BY EhLancamento DESC


--ORDENANDO DUAS COLUNAS DIFERENTES
SELECT Nome,EhLancamento,Preco FROM Produto ORDER BY EhLancamento DESC, Nome ASC


-- SELECIONANDO O TOP 3 (OU OUTRO)
SELECT TOP 3 Nome, Estoque FROM Produto ORDER BY Estoque DESC


-- APELIDOS DE COLUNAS - ALIAS (AS)[Alterando os nomes da coluna]
SELECT IdProduto AS Código, Nome, Preco AS [Preço de venda] FROM Produto -- Palavras separadas precisam estar dentro de colchetes
SELECT Nome, Preco, GETDATE() AS DATA FROM Produto -- Data é nome que vai ficar no titulo da coluna


-- Filtrando Dados - Where

/*
OPERADORES ARITMÉTICOS (ordem de procedência)

1° ^ | Potência
2° /* | Divisão e multiplicação
3° +- | Soma e subtração


1° Operadores aritméticos
2° Operadores Relacionais
3° Operadores Lógicos

() use parenteses para forçar uma ordem diferente


Operadores relacionais
= igual
<> diferente
> maior
< menor
>= maior ou igual
<= menor ou igual
 
Operadores lógicos
 
and - e		| Só é verdadeiro quando os dois operandos forem verdadeiros
or - ou		| Só é falso quando os dois operandos foram falso
not - não	| Inverte a operação
 
 
Tabela da Verdade
 
V and V		= V
V and F		= F
F and V		= F
F and F		= F

---------------------

V or V		= V
V or F		= V
F or V		= V
F or F		= F

NOT F = V
NOT V = F

PRECEDÊNCIA DE OPERADORES LÓGICOS

1° NOT
2° AND
3° OR
*/
*/


-- SELECT COM OPERADORES RELACIONAIS E LOGICOS
SELECT * from Produto where IdProduto = 5
SELECT * from Produto where IdProduto <> 5
SELECT * from Produto where Estoque > 100
SELECT * from Produto where Estoque >= 100
SELECT * from Produto where Preco < 200
SELECT * from Produto where Estoque >= 50 AND EhLancamento = 1
SELECT * from Produto where NOT (Estoque >= 50 OR EhLancamento = 1)


--OPERADOR IN
SELECT * FROM Produto WHERE IdProduto IN (5,7,8) -- Vai trazer os produtos do ID 5,7,8
SELECT * FROM Produto WHERE IdProduto NOT IN (5,7,8) -- Vai trazer os produtos restantes


-- OPERADOR BETWEEN
SELECT * FROM Produto WHERE IdProduto BETWEEN 4 AND 7 -- Vai trazer os produtos do ID 4 ao 7
SELECT * FROM Produto WHERE IdProduto NOT BETWEEN 4 AND 7 -- Vai trazer o restante dos produtos



-- OPERADOR LIKE
SELECT * FROM Produto WHERE Nome LIKE 'iphone%' -- Vai trazer tudo que começa com iphone
SELECT * FROM Produto WHERE Nome LIKE '%iphone' -- Vai trazer tudo que Termina com iphone
SELECT * FROM Produto WHERE Nome LIKE '%iphone%' -- Vai trazer tudo que Contém com iphone


-- UTILIZANDO TUDO JUNTO
SELECT Nome,
       Preco as Preço,
	   Estoque
FROM Produto
WHERE Nome LIKE '%pro%'
ORDER BY Estoque DESC


-- INNER JOIN (Juntando tabelas)
SELECT CAT.IdCategoria,
	   CAT.Nome AS Categoria,
	   CAT.IdDepartamento,
	   DEP.Nome AS Depto
FROM Categoria AS CAT -- Usei o 'AS' para mudar o nome Categoria para CAT, para não ficar tão poluido 
FULL JOIN Departamento AS DEP -- Usei o 'AS' para mudar o nome Departamento para DEP, para não ficar tão poluido 
ON DEP.IdDepartamento = CAT.IdDepartamento



SELECT * FROM Departamento
SELECT * FROM Categoria


INSERT INTO Departamento (Nome) VALUES ('PET')
INSERT INTO Departamento (Nome) VALUES ('GAMES')
INSERT INTO Categoria (Nome) VALUES ('Categoria ABC')
INSERT INTO Categoria (Nome) VALUES ('Categoria XYZ')



-- IS NULL
-- CATEGORIA SEM DEPARTAMENTO
SELECT * FROM Categoria WHERE IdDepartamento IS NULL

--CATEGORIA COM DEPARTAMENTO
SELECT * FROM Categoria WHERE IdDepartamento IS NOT NULL


--DEPARTAMENTO SEM CATEGORIA


SELECT DEP.IdDepartamento,
	   DEP.Nome AS Depto
FROM Categoria AS CAT 
RIGHT JOIN  Departamento AS DEP
ON DEP.IdDepartamento = CAT.IdDepartamento
WHERE  CAT.IdCategoria IS NULL


-- FUNÇÕES DE AGREGAÇÃO

/*
	COUNT = CONTAGEM
	SUM = SOMA
	MAX = VALOR MAXIMO
	MIN = VALOR MINIMO
	AVG = MEDIA
*/

SELECT COUNT(IdProduto) AS Qtde,
		SUM(Estoque) AS TotalEstoque,
		MIN(Preco) AS MenorPreço,
		MAX(Preco) AS MaiorPreço,
		AVG(preco) AS PrecoMedio
FROM Produto


--ADICIONANDO A COLUNA SITUAÇÃO DO PRODUTO
ALTER TABLE Produto ADD Situacao VARCHAR(10)

--ATUALIZANDO OS PRODUTOS NOVOS
UPDATE Produto SET Situacao = 'Novo' -- Estou inserindo a situação do produto, se ele é novo ou usado (tabela PRODUTO a qual eu quero que apareça a situação | SITUAÇÃO desse produto (novo ou usado))
WHERE IdProduto IN (1,3,5,7)
UPDATE Produto SET Situacao = 'Usado'
WHERE IdProduto IN (2,4,6,8)


--USANDO FUNÇÕES DE AGREGAÇÃO COM AGRUPAMENTO
SELECT Situacao,
	   COUNT(IdProduto) AS QTDE
FROM Produto
GROUP BY Situacao -- Toda vez que tiver coluna sem função, usar o GROUP BY



----------------------EXERCÍCIOS-------------------------------
--1 liste 3 produtos mais baratos, mostrando o nome e o preço
SELECT TOP 3 Nome, 
		   Preco 
FROM Produto ORDER BY Preco

--2 Mostre dois produtos com menor quantidade em estoque, exibindo nome e o estoque
SELECT TOP 3 Nome, 
		   Estoque 
FROM Produto ORDER BY Estoque

--3 Liste todos os produtos que são lançamentos (EhLancamento = 1), exibindo o nome e o preço
SELECT nome,Preco
FROM Produto where EhLancamento = 1

--4 Exiba os produtos cujo o preço seja maior que 5000, mostrando o nome e preço
SELECT Nome,
       Preco as Preço
FROM Produto WHERE Preco > 5000

--5 Mostre todos os produtos que possuem estoque entre 50 e 150, exibindo o nome e o estoque
SELECT Nome,
       Estoque
FROM Produto WHERE Estoque BETWEEN 50 AND 150

--6 Liste todos os produtos ordenados pelo preço, do mais barato para o mais caro
SELECT * FROM Produto ORDER BY Preco

--7 Mostre o nome do produto, nome da categoria e nome do departamento a que ele pertence

	   

--8 Mostre a quantidade de produtos em cada categoria


-----------------------------------------------------------------
-- SELECIONANDO PRODUTOS DA CATEGORIA ESPECÍFICA
SELECT PRO.IdProduto,
	   PRO.Nome,
	   CAT.Nome as Categoria
FROM Produto AS PRO
INNER JOIN ProdutoCategoria AS PRC
ON PRC.IdProduto = PRO.IdProduto
INNER JOIN Categoria AS CAT
ON CAT.IdCategoria = PRC.IdCategoria
WHERE CAT.Nome = 'Roupas esportivas'


/*
Os JOIN conectam tabelas para combinar dados relacionados. Aqui estão os principais:
 
INNER JOIN → Mostra apenas os registros que têm correspondência nas duas tabelas.
 
LEFT JOIN → Traz todos os registros da tabela da esquerda e os correspondentes da direita (se houver).
 
RIGHT JOIN → O contrário do LEFT JOIN, trazendo todos da direita e os correspondentes da esquerda.
 
FULL JOIN → Exibe todos os registros de ambas as tabelas, combinando onde há correspondência.
 
CROSS JOIN → Faz uma combinação de todos os registros das tabelas, criando um “cruzamento” de dados.

*/
