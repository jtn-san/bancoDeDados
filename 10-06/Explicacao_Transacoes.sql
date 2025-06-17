use ClinicaEstetica


select * from Agendamento
select * from AgendamentoServico


-- Abrindo transação

begin transaction
delete from AgendamentoServico --where IdAgendamento = 4
delete from Agendamento --where IdAgendamento = 4

-- Confirmar a transação 
commit 

-- Desafazer a transação 
rollback 


/* BACKUP */

-- Botão direito em cima do BD > Tarefas  Fazer backup