/*
22/05

		DQL - Data Query Language - Linguagem de Consultaa de Dados

				select = basicamente o único comando do DQL

*/

-- Seleciona todas as colinas e linhas da tabela indicada.
select * from Produto

select Nome, Preco from Produto

select IdProduto, Nome from Produto

-- Ordenando as colunas

-- || Crescente (asc é valor padrão)
select Nome, Preco from Produto order by Preco 
-- || Decrescente
select Nome, Preco from Produto order by Preco desc 

-- Ordenando duas colunas diferentes
select Nome, EhLancamento, Preco from Produto order by EhLancamento desc, Nome

-- Select TOP N
select top 3 Nome, Estoque from Produto order by Estoque desc 

-- Apelido de colunas - Alias (as) e palavras que contenha espaço após o as utilizar []                                                                                                                                                                                                               
select IdProduto as Código, Nome, Preco as Preço From Produto

select Nome, Preco, getdate() as Data from Produto


-- Formatando a coluna de data.

select Nome, Preco, convert(varchar, getdate(), 103) + '  ' + convert(varchar, getdate(), 108) as Data from Produto

-- Filtrando Dados - Where
/*

Operadores aritméticos
+
-
*
/
^ (potência)

Operadores relacionais

= igual
<> diferente ou !=
> maior
< menor
>= maior ou igual
<= menor ou igual

Operadores lógicos

and - e		|| Só é verdadeiro quando os dois operandos forem verdadeiros
or - ou		|| Só é falso quando os dois operandos foram falso
not - não	|| Inverte a operação


Tabela da Verdade

V and V		= V
V and F		= F
F and V		= F
F and F		= F

V or V		= V
V or F		= V
F or V		= V
F or F		= F

 not V		= F
 not F		= V

Precedência de operadores lógicos

1º not
2º and
3º or

Precedência entre todos tipos de operadores
1º Operadores aritméticos
2º Operadores aritméticos
3º Operadores lógicos

() use parenteses para forçar uma odem diferente

ULA = Unidade lógica aritmética


*/

select * from Produto where IdProduto = 5
select * from Produto where IdProduto <> 5
select * from Produto where Estoque > 100
select * from Produto where Estoque >= 100
select * from Produto where Preco < 200

select * from Produto where Estoque >= 50 and EhLancamento = 1
								/* >= 50 and 1 = 1
									V and V
									   V  */

							/* 30 >= 50 and 1 = 1
									F and V
									   F  */

						/*         ----               */

							/* 50 >= 50 or 1 = 1
									V	or   V
									   V  */
									   /* 50 > 50 
											F */

							/* 30 >= 50 or 1 = 1
									F or V
									   V */

							/* 15 >= 50 or 1 = 1
									F or F
									   F */

									   /*         ----               */



select * from Produto where not Estoque >= 50 or EhLancamento = 1

-- Operadores IN

select * from Produto where IdProduto = 5 or IdProduto = 7 or IdProduto = 2

select * from Produto where IdProduto in (5, 7, 8)

select * from Produto where IdProduto not in (5, 7, 8)

-- Operadores BETWEEN

select * from Produto where IdProduto between 4 and 7
select * from Produto where IdProduto not between 4 and 7


-- Operador LIKE

select * from Produto where Nome = 'iPhone 14 Pro' 

select * from Produto where Nome like 'iPhone%' -- Começa com a palavra antes do  %
select * from Produto where Nome like '%Pro' -- Termina com a palavra após o %
select * from Produto where Nome like '%de%' -- Contém a palavra antes dos %

-- Utilizando tudo junto
select Nome, Preco as Preço, Estoque 
from Produto 
where Nome Like '%Pro%' 
order by Estoque desc

-- JOIN (juntando tabelas)
select	CAT.IdCategoria,
		CAT.Nome as CatNome, 
		CAT.IdDepartamento,
		-- ?? nome do dpto
		DEP.Nome as DepNome
from Categoria as CAT
inner join Departamento as DEP
on DEP.IdDepartamento = CAT.IdDepartamento

-- Selecionando produtos de uma categoria específica

select	PRO.IdProduto,
		PRO.Nome,
		-- ? categoria
		CAT.Nome as Categoria

from Produto as PRO
inner join ProdutoCategoria as PRC
on PRC.IdProduto = PRO.IdProduto
inner join Categoria as CAT
on CAT.IdCategoria = PRC.IdCategoria
where CAT.Nome = 'Roupas Esportivas'







-- VISUALIZANDO AS TABELAS
select * from Produto
select * from Departamento
select * from Categoria
select * from ProdutoCategoria