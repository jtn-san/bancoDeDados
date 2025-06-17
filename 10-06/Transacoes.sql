use EscolaRoni

--Iniciando a transacao
BEGIN TRANSACTION
INSERT INTO Curso (nm_curso, vl_curso) VALUES ('Datilografia', 1230.80)
INSERT INTO Curso (nm_curso, vl_curso) VALUES ('Farmácia', 1230.80)
INSERT INTO Curso (nm_curso, vl_curso) VALUES ('Culinária', 1230.80)
UPDATE Curso SET nm_curso = 'Curso Teste', vl_curso = 0

-- Desfazendo as alterações
ROLLBACK

-----------------------------------------------------------------

--Iniciando outra transação 
BEGIN TRANSACTION
UPDATE Curso SET nm_curso = 'Digitação' WHERE id_curso = 12

-- Confirmando as alterações
COMMIT