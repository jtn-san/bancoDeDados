--FUNÇÕES DE AGRUPAMENTO
SELECT	COUNT(*) AS [QTD MATRICULAS],	-- QTDE
		SUM(CUR.vl_curso) AS [VL TOTAL],-- SOMA
		AVG(CUR.vl_curso) AS [VL MEDIO],-- VALOR MEDIO
		MIN(MAT.dt_matricula) AS [MENOR DATA], -- MINIMO
		MAX(MAT.dt_matricula) AS [MAIOR DATA]  -- MAXIMO
FROM Matricula AS MAT
INNER JOIN Curso AS CUR ON CUR.id_curso = MAT.id_curso
INNER JOIN Aluno AS ALU ON ALU.id_aluno = MAT.id_aluno



--TOTAIS AGRUPADOS POR ALUNO
SELECT	ALU.id_aluno,
		ALU.nm_aluno,
		COUNT(*) AS [QTD MATRICULAS],	-- QTDE
		SUM(CUR.vl_curso) AS [VL TOTAL],-- SOMA
		AVG(CUR.vl_curso) AS [VL MEDIO],-- VALOR MEDIO
		MIN(MAT.dt_matricula) AS [MENOR DATA], -- MINIMO
		MAX(MAT.dt_matricula) AS [MAIOR DATA]  -- MAXIMO
FROM Matricula AS MAT
INNER JOIN Curso AS CUR ON CUR.id_curso = MAT.id_curso
INNER JOIN Aluno AS ALU ON ALU.id_aluno = MAT.id_aluno
GROUP BY ALU.id_aluno, ALU.nm_aluno


--TOTAIS AGRUPADOS POR ALUNO QUE MORAM NA CIDADE DE SÃO PAULO ORDENADOS POR NOME DO ALUNO
SELECT	ALU.id_aluno,
		ALU.nm_aluno,
		COUNT(*) AS [QTD MATRICULAS],	-- QTDE
		SUM(CUR.vl_curso) AS [VL TOTAL],-- SOMA
		AVG(CUR.vl_curso) AS [VL MEDIO],-- VALOR MEDIO
		MIN(MAT.dt_matricula) AS [MENOR DATA], -- MINIMO
		MAX(MAT.dt_matricula) AS [MAIOR DATA]  -- MAXIMO
FROM Matricula AS MAT
INNER JOIN Curso AS CUR ON CUR.id_curso = MAT.id_curso
INNER JOIN Aluno AS ALU ON ALU.id_aluno = MAT.id_aluno
WHERE ALU.nm_cidade = 'São Paulo'
GROUP BY ALU.id_aluno, ALU.nm_aluno
ORDER BY ALU.nm_aluno DESC