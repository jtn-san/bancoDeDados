use BD_Produtos
 
 
-- 1
SELECT TOP 3 
    Nome, 
    Preco
FROM Produto
ORDER BY Preco;
 
-- 2
SELECT TOP 2 
    Nome, 
    Estoque
FROM Produto
ORDER BY Estoque;
 
-- 3
SELECT
    Nome, 
    Preco
FROM Produto
WHERE EhLancamento = 1;
 
-- 4
SELECT 
    Nome, 
    Preco
FROM Produto
WHERE Preco > 5000;
 
-- 5
SELECT 
    Nome, 
    Estoque
FROM Produto
WHERE Estoque BETWEEN 50 AND 150;

/*Segunda opção
WHERE Estoque >= 50 AND Estoque <= 150;
*/
 
-- 6
SELECT 
    Nome, 
    Preco
FROM Produto
ORDER BY Preco;
 
-- OU Listando todas as colunas.

SELECT * FROM Produto ORDER BY Preco;

--7
SELECT 
    P.Nome AS [Nome Produto],
    C.Nome AS [Nome Categoria],
    D.Nome AS [Nome Departamento]
FROM Produto P
JOIN ProdutoCategoria PC ON P.IdProduto = PC.IdProduto
JOIN Categoria C ON PC.IdCategoria = C.IdCategoria
JOIN Departamento D ON C.IdDepartamento = D.IdDepartamento;

-- Versão 2

SELECT DISTINCT
	-- PROD.Nome AS [Nome Produto],
    CATE.Nome AS [Nome Categoria],
    DPTO.Nome AS [Nome Departamento]
FROM Produto AS PROD
INNER JOIN ProdutoCategoria AS PRCT
	ON PROD.IdProduto = PRCT.IdCategoria
INNER JOIN Categoria AS CATE
	ON PRCT.IdCategoria = CATE.IdCategoria
INNER JOIN Departamento AS DPTO
	ON CATE .IdDepartamento = DPTO.IdDepartamento
ORDER BY dpto.Nome
 


--8
SELECT 
    C.Nome AS NomeCategoria,
    COUNT(PC.IdCategoria) AS QuantidadeProdutos
FROM Categoria C
JOIN ProdutoCategoria PC ON C.IdDepartamento = PC.IdCategoria
GROUP BY C.Nome

-- VERSÃO 2
SELECT CAT.Nome,
COUNT (PCT.IdProduto) AS QTDE
FROM Categoria AS CAT
LEFT JOIN ProdutoCategoria AS PCT
ON CAT.IdCategoria = PCT.IdCategoria
GROUP BY CAT.Nome
HAVING COUNT(PCT.IdProduto) > 1
ORDER BY QTDE DESC

/*

SELECT 
    P.Nome AS NomeProduto,
    C.Nome AS NomeCategoria,
    D.Nome AS NomeDepartamento
FROM Produto P
LEFT JOIN ProdutoCategoria PC ON P.IdProduto = PC.IdProduto
LEFT JOIN Categoria C ON PC.IdCategoria = C.IdCategoria
LEFT JOIN Departamento D ON C.IdDepartamento = D.IdDepartamento;

*/

insert into Produto(Nome, Descricao, Estoque, EhLancamento, Preco, Situacao) 
values ('Pastel de Carne', 'Carne Moida temperada', 50, 0, 8.70, 'Novo')
go


