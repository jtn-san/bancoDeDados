
-- SELECIONAR OS DADOS DOS CURSOS QUE POSSUAM MATRÍCULAS
SELECT	Aluno.nm_aluno, 
		Curso.nm_curso, 
		Matricula.dt_matricula  
FROM Matricula 
INNER JOIN Curso ON Curso.id_curso = Matricula.id_curso
INNER JOIN Aluno ON Aluno.id_aluno = Matricula.id_aluno


-- MESMA CONSULTA USANDO APELIDOS (ALIAS)
SELECT	ALU.nm_aluno AS ALUNO, 
		CUR.nm_curso AS CURSO, 
		MAT.dt_matricula AS [DATA DE MATRÍCULA]
FROM Matricula AS MAT
INNER JOIN Curso AS CUR ON CUR.id_curso = MAT.id_curso
INNER JOIN Aluno AS ALU ON ALU.id_aluno = MAT.id_aluno

