use ClinicaEstetica


select * from Agendamento
select * from AgendamentoServico


-- Abrindo transa��o

begin transaction
delete from AgendamentoServico --where IdAgendamento = 4
delete from Agendamento --where IdAgendamento = 4

-- Confirmar a transa��o 
commit 

-- Desafazer a transa��o 
rollback 


/* BACKUP */

-- Bot�o direito em cima do BD > Tarefas  Fazer backup