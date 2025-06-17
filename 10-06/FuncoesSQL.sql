--FUNÇÕES DE STRING
SELECT	LOWER(nm_aluno) AS MINUSCULO,	--MINUSCULO
		UPPER(nm_aluno) AS MAIUSCULO,	--MAIUSCULO
		REPLACE(nm_aluno, 'ni', 'nny'),	--SUBSTITUI 'ni' p/ 'nny'
		LTRIM(nm_aluno),			--REMOVE ESPAÇO A ESQ
		RTRIM(nm_aluno),			--REMOVE ESPAÇO A DIR
		LEFT(nm_aluno, 5),			--PRIMEIRAS 5 LETRAS DO NOME
		RIGHT(nm_aluno, 5),			--ULTIMAS 5 LETRAS DO NOME
		SUBSTRING(nm_aluno, 5, 3),	--PEGA 3 LETRAS A PARTIR DA LETRA 5
		LEN(nm_aluno)				--TAMANHO DA COLUNA
FROM ALUNO

-- FUNÇÕES MATEMÁTICAS
SELECT POWER(10, 3)	--Nro 10 elevado a Potência
SELECT SQRT(16)		--Raiz Quadrada
SELECT ROUND(vl_curso, 2) FROM Curso --Arredonda o valor do curso 

-- FUNÇÕES DE DATA
SELECT DAY('2019-06-05')	--Pega o dia da data
SELECT MONTH('2019-06-05')	--Pega o mês da data
SELECT YEAR('2019-06-05')	--Pega o ano da data
SELECT DATEADD(DAY, 5, '2019-06-05') --Adiciona dias em uma data
SELECT DATEDIFF(DAY, '2019-06-05', '2019-06-20') --Qtde de dias entre uma data e outra