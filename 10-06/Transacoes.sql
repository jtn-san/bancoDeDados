use EscolaRoni

--Iniciando a transacao
BEGIN TRANSACTION
INSERT INTO Curso (nm_curso, vl_curso) VALUES ('Datilografia', 1230.80)
INSERT INTO Curso (nm_curso, vl_curso) VALUES ('Farm�cia', 1230.80)
INSERT INTO Curso (nm_curso, vl_curso) VALUES ('Culin�ria', 1230.80)
UPDATE Curso SET nm_curso = 'Curso Teste', vl_curso = 0

-- Desfazendo as altera��es
ROLLBACK

-----------------------------------------------------------------

--Iniciando outra transa��o 
BEGIN TRANSACTION
UPDATE Curso SET nm_curso = 'Digita��o' WHERE id_curso = 12

-- Confirmando as altera��es
COMMIT