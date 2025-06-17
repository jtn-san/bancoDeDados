USE ClinicaEstetica

-- FUNÇÕES DE STRING
-- upper = MAIUSCULO
-- LOWER = MINUSCULO
SELECT IdServico, UPPER(Nome) AS Nome_Maiusculo FROM Servico
SELECT IdServico, LOWER(Nome) AS minusculo FROM Servico
-- TRIM = REMOVE ESPAÇOS ANTES E DEPOIS
SELECT TRIM('    Roni     ') 
SELECT TRIM(Nome) FROM Servico
-- REPLACE = substitui texto
SELECT REPLACE(Nome, 'e', '3') FROM Cliente
SELECT LOWER(REPLACE(REPLACE(Nome, 'e', '3'),'a','4')) FROM Cliente
SELECT REPLACE('roni   costa', '   ', ' ')
-- LEN = conta a qtde de texto
SELECT Nome, LEN(Nome) AS Tamanho_nome FROM Cliente
-- LEFT e RIGHT
SELECT Nome, LEFT(NOME,10) FROM Cliente
-- RESERVE
SELECT REVERSE(Nome) FROM Cliente

-- FUNÇÕES MATEMATICAS
--PI = RETORNA O VALOR DE PI
--ROUND = arredonda um valor
--POWER = POTENCIA
--SQRT = RAIZ QUADRADA
SELECT PI()
SELECT ROUND(PI(),3)
SELECT POWER(3,3)
SELECT SQRT(49) AS RAIZ
--EXPRESSOES 
SELECT 1+1*2/3-1
SELECT * FROM Servico
SELECT valor, valor * 1.3 AS AUMENTO FROM Servico
SELECT Cidade + '/' + Estado FROM Cliente

--FUNÇÕES DE DATA
-- GETDATE() = DATA ATUAL
SELECT GETDATE()
-- DAY, MONTH, YEAR = dia, mes e ano de uma data 
SELECT DAY(GETDATE())
SELECT MONTH(GETDATE())
SELECT YEAR(GETDATE())
-- DATENAME E DATEPART = PEGA PARTE DA DATA OU NOME DA DATA
SELECT DATENAME(MONTH, GETDATE())
SELECT DATEPART(MONTH, GETDATE())
-- DATEADD = soma ou subtraia dias (ou meses) em uma data
SELECT DATEADD(day, 10, GETDATE())
SELECT DATEADD(MONTH, 3, GETDATE())
SELECT * FROM CLIENTE 
	WHERE DAY(DtNascimento) = 27 AND MONTH(DtNascimento) = 4
SELECT * FROM CLIENTE 
	WHERE MONTH(DtNascimento) = MONTH(GETDATE())

SELECT *, DATEDIFF(YEAR, DtNascimento, GETDATE())  AS idade
FROM Cliente ORDER BY DtNascimento


--FUNÇÕES DE AGREGAÇÃO
-- SUM = SOMA DE VALORES
-- MAX/MIN = VALOR MÁXIMO E MINIMO 
-- AVG = MEDIA
-- COUNT = CONTA OS REGISTROS
SELECT SUM(Valor) FROM Servico
SELECT MIN(Valor) AS menor_preco, 
	   MAX(Valor) AS maior_preco FROM Servico
SELECT AVG(Valor) AS media FROM Servico

--Group By e Having
SELECT	TS.Nome AS Tipo,
		ISNULL(SUM(S.Valor),0)
FROM Servico AS S
RIGHT JOIN TipoServico AS TS
ON TS.IdTipoServico = S.IdTipoServico
GROUP BY TS.Nome
HAVING SUM(S.Valor) > 40

--CONTA A QTDE DE SERVIÇOS POR TIPO
SELECT	TS.Nome AS Tipo,
		ISNULL(COUNT(S.IdServico),0)
FROM Servico AS S
RIGHT JOIN TipoServico AS TS
ON TS.IdTipoServico = S.IdTipoServico
GROUP BY TS.Nome
/* FAÇA UMA CONSULTA QUE MOSTRE A QUANTIDADE 
   DE AGENDAMENTOS POR STATUS DE AGENDAMENTO 

   Status		Agendamentos
   -------------------------
   Agendado		10
   Confirmado	5
   Efetuado		0
   Cancelado	3
*/





/* FAÇA UMA CONSULTA QUE MOSTRE A QUANTIDADE 
   DE AGENDAMENTOS POR CLIENTE 

   Cliente		Telefone			Agendamentos
   ----------------------------------------------
   Fulano		(11) 95412-4515		10
   Ciclano		(11) 91234-4511		5
   Beltrano		(11) 94512-4555		3
*/









--ADICIONA COLUNA DATA DE NASCIMENTO NA TAB CLIENTE
ALTER TABLE Cliente ADD DtNascimento DATETIME