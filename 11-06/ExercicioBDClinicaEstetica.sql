/*

MANIPULA��O DE DADOS - CONSULTAS
Utilizando o banco de dados ClinicaEstetica, elabore as consultas abaixo:

*/

use ClinicaEstetica

-- VISUALIZANDO as TABELAS
select * from AgendamentoServico
select * from Agendamento
select * from StatusAgendamento
select * from Cliente
select * from Servico
select * from TipoServico
select * from Usuario
select * from TipoUsuario

-- 1. Selecione o id e nome dos tipos de servi�o em ordem alfab�tica

select * from TipoServico
order by Nome; 

-- 2. Selecione o id, nome e pre�o dos servi�os da categoria Esmalteria
select 
    S.IdTipoServico,
    S.nome,
    S.valor
from Servico S
join TipoServico ON S.idTipoServico = TipoServico.IdTipoServico
where 
    TipoServico.nome = 'Esmateria';

-- 3. Selecione o id, nome do servi�o e nome do tipo de servi�o ordenados pelo tipo de servi�o
select 
    S.IdServico,
    S.nome,
    ts.Nome as [Tipo de Servi�o]
from Servico S
JOIN TipoServico TS ON S.idTipoServico = TS.IdTipoServico
order by Nome; 

-- 4. Selecione o id, nome do servi�o e nome do tipo de servi�os ativos e que o pre�o seja maior ou igual a 50 reais (obs: status = 1)
select 
    S.IdServico,
    S.Nome AS [Servico],
    TipoServico.Nome AS [Tipo Servico],
	S.valor as [Pre�o]
from Servico S
join TipoServico ON S.IdTipoServico = TipoServico.IdTipoServico
where S.Status = 1
    AND S.Valor >= 50;


-- 5. Selecione o id, nome, email e cpf de todos os clientes ativos (obs. status = 1)
select 
  C.IdCliente,
  C.Nome as [Cliente],
  C.Email as [E-mail],
  C.Cpf as [CPF],
  case 
    when C.Status = 1 then 'Sim'
  end as [Ativo]
from Cliente C
where 
  C.Status = 1;


-- 6. Selecione o id, nome, email e cpf de todos os cliente inativos (obs. status = 0)
select 
  C.IdCliente,
  C.Nome as [Cliente],
  C.Email as [E-mail],
  C.Cpf as [CPF],
  case 
    when C.Status = 0 then 'N�o'
  end as [Ativo]
from Cliente C
where 
  C.Status = 0;


-- 7. Selecione o id, nome, email e cpf de todos usu�rios do tipo Operador
select 
  U.IdUsuario,
  U.Nome AS [Usu�rio],
  U.Email AS [E-mail]
from Usuario U
join TipoUsuario ON U.IdTipoUsuario = TipoUsuario.IdTipoUsuario
where TipoUsuario.Nome = 'Operador';

-- 8. Selecione o id, nome e telefone de todos os clientes em ordem por id descrescente

select 
  C.IdCliente as [ID],
  C.Nome as [Cliente],
  C.Telefone as [Contato]
from Cliente C
order by IdCliente desc;


-- 9. Selecione todos os dados de clientes que moram na cidade de S�o Paulo, Suzano ou 
-- Itaqua e que estejam ativos (status = 1)

select 
  C.IdCliente,
  C.Nome as [Cliente],
  C.Email as [E-mail],
  C.Cidade,
  case 
    when C.Status = 1 then 'Sim'
  end as [Resid�ncia em umas das cidades?]
from Cliente C
where 
  C.Status = 1 and Cidade in ('S�o Paulo', 'Suzano','Mogi das Cruzes');
  
  
  /* Ver2 */

select 
  C.IdCliente,
  C.Nome as [Cliente],
  C.Email as [E-mail],
  C.Cidade,
  case 
    when C.Status = 1 then 'Sim'
  end as [Reside?],
  'Reside em uma das cidades selecionadas' as [Observa��o]
from Cliente C
where 
  C.Status = 1
  AND C.Cidade IN ('S�o Paulo', 'Suzano', 'Mogi das Cruzes');

-- 10.Selecione o id e nome dos servi�os do agendamento (de um dos agendamentos 
-- cadastrados)
select 
  S.IdServico [ID],
  s.nome as [Servi�o]

from Agendamento A
join AgendamentoServico ASV on A.idagendamento = ASV.idagendamento
join Servico S on ASV.IdServico = S.IdServico

where 
  A.IdAgendamento = 2;
   

-- 11.Selecione o nome do cliente, status de agendamento, valor total, desconto, data de 
-- agendamento e nome do usu�rio de cadastro de todos os agendamentos.

select 
  C.nome [Nome do cliente],
  SA.nome  [Status do agendamento],
  A.ValorTotal [Total],
  A.ValorDesconto [Desconto],
  A.DataAgendamento [Agendamento: ],
  U.nome [Usu�rio de cadastro]
from 
  Agendamento A
join 
  Cliente C on A.IdCliente = C.IdCliente
join 
  StatusAgendamento sa on A.IdStatusAgendamento = SA.IdStatusAgendamento
join 
  Usuario u on a.IdUsuarioCadastro = u.IdUsuario;

-- 12.Selecione o nome do cliente, data de agendamento, motivo de cancelamento, data 
-- e nome do usu�rio de altera��o de todos os agendamentos com status Cancelado


select 
  C.nome [Cliente: ],
  A.DataAgendamento [Agendamento: ],
  SA.nome [Status: ],
  A.motivocancelamento [Motivo: ],
  A.dataalteracao [Data de Altera��o],
  U.nome [usu�rio de altera��o]
  
from agendamento a
join Cliente C on a.IdCliente = C.IdCliente
join StatusAgendamento SA on A.IdStatusAgendamento = SA.idstatusagendamento
left join Usuario U on a.IdUsuarioAlteracao = U.IdUsuario
where 
  SA.IdStatusAgendamento = 4;



-- 13.Selecione a soma total de agendamentos diferentes de cancelados 
select * from Agendamento
select * from StatusAgendamento
select 
  sum(ValorTotal) as [Total De Agendamentos N�o Cancelados]
from	Agendamento A
join	StatusAgendamento SA on a.IdStatusAgendamento = SA.IdStatusAgendamento
where	SA.nome <> 'Cancelado';

---V2
select sum(ValorTotal - ValorDesconto) [Soma Total]
from Agendamento
where IdStatusAgendamento
not in(
select IdStatusAgendamento
from StatusAgendamento
where StatusAgendamento.IdStatusAgendamento = 4
);

-- V3
select sum(ValorTotal) - sum(ValorDesconto) [Soma Total]
from Agendamento
where IdStatusAgendamento
not in(
        select IdStatusAgendamento
		from StatusAgendamento
		where StatusAgendamento.IdStatusAgendamento = 4
    );


-- 14.Selecione a quantidade de agendamentos por Status de AgendamentO

select 
   SA.nome as [Status Do Agendamento],
  count(A.IdAgendamento) as [Quantidade De Agendamentos]
from 
  Agendamento A
join 
  StatusAgendamento SA on a.IdStatusAgendamento = SA.IdStatusAgendamento
group by 
  SA.nome;
