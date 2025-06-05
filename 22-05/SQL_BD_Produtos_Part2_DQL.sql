/*
22/05

		DQL - Data Query Language - Linguagem de Consultaa de Dados

				select = basicamente o �nico comando do DQL

*/

-- Seleciona todas as colinas e linhas da tabela indicada.
select * from Produto

select Nome, Preco from Produto

select IdProduto, Nome from Produto

-- Ordenando as colunas

-- || Crescente (asc � valor padr�o)
select Nome, Preco from Produto order by Preco 
-- || Decrescente
select Nome, Preco from Produto order by Preco desc 

-- Ordenando duas colunas diferentes
select Nome, EhLancamento, Preco from Produto order by EhLancamento desc, Nome

-- Select TOP N
select top 3 Nome, Estoque from Produto order by Estoque desc 

-- Apelido de colunas - Alias (as) e palavras que contenha espa�o ap�s o as utilizar []                                                                                                                                                                                                               
select IdProduto as C�digo, Nome, Preco as Pre�o From Produto

select Nome, Preco, getdate() as Data from Produto


-- Formatando a coluna de data.

select Nome, Preco, convert(varchar, getdate(), 103) + '  ' + convert(varchar, getdate(), 108) as Data from Produto

-- Filtrando Dados - Where
/*

Operadores aritm�ticos
+
-
*
/
^ (pot�ncia)

Operadores relacionais

= igual
<> diferente ou !=
> maior
< menor
>= maior ou igual
<= menor ou igual

Operadores l�gicos

and - e		|| S� � verdadeiro quando os dois operandos forem verdadeiros
or - ou		|| S� � falso quando os dois operandos foram falso
not - n�o	|| Inverte a opera��o


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

Preced�ncia de operadores l�gicos

1� not
2� and
3� or

Preced�ncia entre todos tipos de operadores
1� Operadores aritm�ticos
2� Operadores aritm�ticos
3� Operadores l�gicos

() use parenteses para for�ar uma odem diferente

ULA = Unidade l�gica aritm�tica


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

select * from Produto where Nome like 'iPhone%' -- Come�a com a palavra antes do  %
select * from Produto where Nome like '%Pro' -- Termina com a palavra ap�s o %
select * from Produto where Nome like '%de%' -- Cont�m a palavra antes dos %

-- Utilizando tudo junto
select Nome, Preco as Pre�o, Estoque 
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

-- Selecionando produtos de uma categoria espec�fica

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