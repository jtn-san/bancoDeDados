select * from Cliente

-- FUNÇÕES DE STRING

select lower(Nome) Nome,
		UPPER(Cidade) Cidade, 
		REPLACE(Nome, ' ', '_') [Nome Sem Espaço],
		REPLACE(Nome, 'A', '4') [Nome Hacker],
		REPLACE(REPLACE(Nome, 'A','4'), 'E', '3') [Nome Hacker1],
		REPLACE(REPLACE(Lower(Nome), 'A','4'), 'E', '3') [Nome Hacker2],
		TRIM(Nome), 
		LEFT(Nome, 4) [Primeiras Letras],
		RIGHT(Nome, 4) [Últimas Letras],
		LEN(Nome) [Quantidade de Letras],
		CHARINDEX(' ', Nome) [Posição Espaço],
		LEFT(Nome, CHARINDEX(' ', Nome)) [Primeiro Nome],
		Right(Nome, LEN(Nome) - CHARINDEX(' ', Nome)) Sobrenome,
		REVERSE(Nome) [Inverter Texto],
		Right(Nome, CHARINDEX(' ', REVERSE(Nome))) [Último nome],
		CONCAT('Bom', ' ', 'Dia') [Texto Concatenado],
		'Bom dia, ' +  Nome [Saudação],
		SUBSTRING(Nome, 4, 8) [Parte do nome]
from Cliente

where RIGHT(Nome, 1) = 'o'


-- Funções matemáticas
select POWER(4, 2) [PotÊncia],
SQRT(16) [Raiz Quadrada],
PI() [Nº PI],
--Arredondamento
ROUND(PI(), 2) [Arredondamento],
floor(PI()) [Arredondar para baixo],
ceiling(PI()) [Arredondar para Cima]

-- FUNÇÃO DATA
select GETDATE() [Data],
		DAY(GETDATE()) [Dia],
		MONTH(GETDATE()) [Mês],
		YEAR(GETDATE()) [Ano],
		DATENAME(MONTH, GETDATE()) [Nome do Mês],
		DATENAME(WEEKDAY, GETDATE()) [Dia da semana],
		DATEADD(DAY, 10, GETDATE()) [Adiciona dias],
		DATEADD(MONTH, 10, GETDATE()) [Adiciona meses],
		DATEADD(YEAR, 10, GETDATE()) [Adiciona anos],
		DATEDIFF(DAY, '1992-05-05', GETDATE()) [DIF Dias],
		DATEDIFF(MONTH, '1992-05-05', GETDATE()) [DIF Meses],
		DATEDIFF(YEAR, '1992-05-05', GETDATE()) [DIF Anos]