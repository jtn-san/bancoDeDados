select * from Cliente

-- FUN��ES DE STRING

select lower(Nome) Nome,
		UPPER(Cidade) Cidade, 
		REPLACE(Nome, ' ', '_') [Nome Sem Espa�o],
		REPLACE(Nome, 'A', '4') [Nome Hacker],
		REPLACE(REPLACE(Nome, 'A','4'), 'E', '3') [Nome Hacker1],
		REPLACE(REPLACE(Lower(Nome), 'A','4'), 'E', '3') [Nome Hacker2],
		TRIM(Nome), 
		LEFT(Nome, 4) [Primeiras Letras],
		RIGHT(Nome, 4) [�ltimas Letras],
		LEN(Nome) [Quantidade de Letras],
		CHARINDEX(' ', Nome) [Posi��o Espa�o],
		LEFT(Nome, CHARINDEX(' ', Nome)) [Primeiro Nome],
		Right(Nome, LEN(Nome) - CHARINDEX(' ', Nome)) Sobrenome,
		REVERSE(Nome) [Inverter Texto],
		Right(Nome, CHARINDEX(' ', REVERSE(Nome))) [�ltimo nome],
		CONCAT('Bom', ' ', 'Dia') [Texto Concatenado],
		'Bom dia, ' +  Nome [Sauda��o],
		SUBSTRING(Nome, 4, 8) [Parte do nome]
from Cliente

where RIGHT(Nome, 1) = 'o'


-- Fun��es matem�ticas
select POWER(4, 2) [Pot�ncia],
SQRT(16) [Raiz Quadrada],
PI() [N� PI],
--Arredondamento
ROUND(PI(), 2) [Arredondamento],
floor(PI()) [Arredondar para baixo],
ceiling(PI()) [Arredondar para Cima]

-- FUN��O DATA
select GETDATE() [Data],
		DAY(GETDATE()) [Dia],
		MONTH(GETDATE()) [M�s],
		YEAR(GETDATE()) [Ano],
		DATENAME(MONTH, GETDATE()) [Nome do M�s],
		DATENAME(WEEKDAY, GETDATE()) [Dia da semana],
		DATEADD(DAY, 10, GETDATE()) [Adiciona dias],
		DATEADD(MONTH, 10, GETDATE()) [Adiciona meses],
		DATEADD(YEAR, 10, GETDATE()) [Adiciona anos],
		DATEDIFF(DAY, '1992-05-05', GETDATE()) [DIF Dias],
		DATEDIFF(MONTH, '1992-05-05', GETDATE()) [DIF Meses],
		DATEDIFF(YEAR, '1992-05-05', GETDATE()) [DIF Anos]