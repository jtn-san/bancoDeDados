-- criação do banco de dados
create database bd_agenda;
go

-- seleciona o banco de dados
use bd_agenda;
go

-- criação da tabela tipotelefone
create table tipotelefone (
    idtipotelefone int identity primary key,
    tipo varchar(20) not null check (tipo in ('celular', 'comercial', 'recado'))
    -- tipo in é quando só será aceito um desses valores no campo, isso impede que sejam inseridos valores diferentes desses na coluna tipo.
);
go

-- inserção dos tipos de telefone
insert into tipotelefone (tipo)
values ('celular'), ('comercial'), ('recado');
go

-- criação da tabela tiporesidencia
create table tiporesidencia (
    idtiporesidencia int identity primary key,
    tipo varchar(20) not null check (tipo in ('comercial', 'residencial'))
);
go

-- inserção dos tipos de residência
insert into tiporesidencia (tipo)
values ('comercial'), ('residencial');
go

-- criação da tabela contato
create table contato (
    idcontato int identity primary key,
    nome varchar(100) not null,
    apelido varchar(50) null,
    email varchar(100) null,
    instagram varchar(100) null,
    linkedin varchar(100) null,
    tiktok varchar(100) null,
    datanascimento date null
);
go

-- criação da tabela telefone
create table telefone (
    idtelefone int identity primary key,
    idcontato int foreign key references contato(idcontato),
    numero varchar(20) not null,
    tipotelefone int,
    iswhatsapp bit not null,
    idtipotelefone int foreign key references tipotelefone(idtipotelefone)
);
go

-- criação da tabela endereco
create table endereco (
    idendereco int identity primary key,
    idcontato int foreign key references contato(idcontato),
    logradouro varchar(255) not null,
    numero varchar(10) null,
    complemento varchar(100) null,
    bairro varchar(100) null,
    cidade varchar(100) not null,
    estado varchar(50) not null,
    cep varchar(20) null,
    idtiporesidencia int foreign key references tiporesidencia(idtiporesidencia)
);
go

-- inserindo um contato (ronny)
insert into contato (nome, apelido, email, instagram, linkedin, tiktok, datanascimento)
values ('Ronny', 'Ronny', 'Ronny@email.com', 'Ronny_instagram', 'Ronny_linkedin', 'Ronny_tiktok', '1985-07-20');
go

insert into contato (nome, apelido, email, instagram, tiktok, datanascimento)
values ('Ana Silva', 'Aninha', 'ana.silva@email.com', 'ana_insta', 'ana_tiktok', '1990-03-15');
go

insert into contato (nome, apelido, email, linkedin)
values ('Bruno Costa', 'Bru', 'bruno.costa@email.com', 'bruno_linkedin');
go

insert into contato (nome, apelido, email, instagram, linkedin, tiktok, datanascimento)
values ('Carla Mendes', 'Carlinha', 'carla.mendes@email.com', 'carla_insta', 'carla_linkedin', 'carla_tiktok', '1992-11-05');
go

insert into contato (nome, email, tiktok, datanascimento)
values ('Diego Souza', 'diego.souza@email.com', 'diego_tiktok', '1987-01-20');
go

insert into contato (nome, apelido,  instagram, linkedin, tiktok, datanascimento)
values ('Elisa Ferreira', 'Eli', 'elisa_insta', 'elisa_linkedin', 'elisa_tiktok', '1995-06-30');
go

insert into contato (nome, apelido)
values ('Fábio Oliveira', 'Fabinho');
go

insert into contato (nome, apelido, email, instagram, linkedin, tiktok, datanascimento)
values ('Gisele Rocha', 'Gis', 'gisele.rocha@email.com', 'gisele_insta', 'gisele_linkedin', 'gisele_tiktok', '1991-04-12');
go

insert into contato (nome)
values ('Hugo Almeida');
go

insert into contato (nome, datanascimento)
values ('Isabela Martins', '1993-07-22');
go


-- inserindo telefones para o contato 
-- Referência tabela TipoTelefone 
-- 1 celular | 2 comercial | 3 recado

-- 2 contatos com 3 telefones
insert into telefone (idcontato, numero, tipotelefone, iswhatsapp, idtipotelefone)
values 
(1, '11987654321', 1, 1, 1), 
(1, '1122334455', 2, 0, 2),   
(1, '1133445566', 3, 0, 3);   
go

insert into telefone (idcontato, numero, tipotelefone, iswhatsapp, idtipotelefone)
values 
(5, '11987654321', 1, 1, 1),  
(5, '1122334455', 2, 0, 2),   
(5, '1133445566', 3, 0, 3);   
go

-- 3 contatos com 1 telefone
insert into telefone (idcontato, numero, tipotelefone, iswhatsapp, idtipotelefone)
values 
(2, '11987654321', 1, 1, 1),  
(3, '1122334455', 1, 1, 1),  
(4, '1133445566', 1, 0, 1);   
go


-- 2 contatos com 2 telefones
insert into telefone (idcontato, numero, tipotelefone, iswhatsapp, idtipotelefone)
values 
(6, '11987654321', 1, 1, 1),  
(6, '1122334455', 3, 1, 1),  
(7, '1133445566', 2, 1, 1), 
(7, '1133445566', 2, 0, 1);
go

-- 1 contato com 4 telefones
insert into telefone(idcontato, numero, iswhatsapp)
values(8, '11987654321', 1),(8, '1122334455', 1),(8, '1133445566', 0),(8, '1133445566', 0);
go

-- 2 contatos com nenhum telefone


-- inserindo endereço para o contato
insert into endereco (idcontato, logradouro, numero, complemento, bairro, cidade, estado, cep, idtiporesidencia)
values 
(1, 'Av. Marechal Tito', '1258', 'Escola Senac', 'São Miguel Paulista', 'São Paulo', 'SP', '03410-000', 1);  -- residencial
go

insert into endereco (idcontato, cidade, estado, idtiporesidencia)
values 
(2, 'Rio de Janeiro', 'RJ', 1);  -- residencial
go


-- VISUALIZANDO as TABELas
select * from TipoTelefone
delete from TipoTelefone
where idTipoTelefone between 7 and 9;

delete from TipoTelefone where IdTipoTelefone IN (4, 5, 6);

select * from TipoResidencia
delete from TipoResidencia
where idTipoResidencia = 4;
select * from endereco
select * from Contato
select * from Telefone
delete from Telefone
where idTelefone between 17 and 18;


-- Através do Join, buscar apenas pelo nome, tipo de telefone e o número.
select distinct
    cont.nome as Contato,
    tp.tipo as [Tipo de telefone],
    tel.numero as Número
from contato as cont
inner join telefone as tel
    on cont.idcontato = tel.idcontato
inner join tipotelefone as tp
    on tel.idtipotelefone = tp.idtipotelefone;


-- Através do Join, tabela com o número de telfone e seu tipo. 
-- 1º Busca apenas quem possui endereço. 
select distinct
    cont.nome as [Contato],
    tp.tipo as [Tipo de telefone],
    tel.numero as [Número de telefone],
    e.logradouro as [Logradouro],
    e.numero as [Número do Endereço],
    e.complemento as [Complemento],
    e.bairro as [Bairro],
    e.cidade as [Cidade],
    e.estado as [Estado],
    e.cep as [CEP]
from contato as cont
inner join telefone as tel
    on cont.idcontato = tel.idcontato
inner join tipotelefone as tp
    on tel.idtipotelefone = tp.idtipotelefone
inner join endereco as e
    on cont.idcontato = e.idcontato;

-- 2º Busca todos com ou sem endereço. 
select 
    cont.nome as [Contato],
    tp.tipo as [Tipo de telefone],
    tel.numero as [Número de telefone],
    e.logradouro as [Logradouro],
    e.numero as [Número do Endereço],
    e.complemento as [Complemento],
    e.bairro as [Bairro],
    e.cidade as [Cidade],
    e.estado as [Estado],
    e.cep as [CEP]
from contato as cont
left join telefone as tel
    on cont.idcontato = tel.idcontato
left join tipotelefone as tp
    on tel.idtipotelefone = tp.idtipotelefone
left join endereco as e
    on cont.idcontato = e.idcontato;



	/*
	
	 Exercícios de Consultas SQL
 Consultas Simples	*/


-- 1. Liste todos os contatos cadastrados. (mostrar todos os campos da tabela)
select 
    cont.idcontato as [ID Contato],
    cont.nome as [Contato],
    cont.apelido as [Apelido],
    cont.email as [Email],
    cont.instagram as [Instagram],
    cont.linkedin as [LinkedIn],
    cont.tiktok as [TikTok],
    cont.datanascimento as [Data de Nascimento],

    tel.numero as [Número de telefone],
    tel.iswhatsapp as [Is WhatsApp],
    tp.tipo as [Tipo de Telefone],

    e.logradouro as [Logradouro],
    e.numero as [Número do Endereço],
    e.complemento as [Complemento],
    e.bairro as [Bairro],
    e.cidade as [Cidade],
    e.estado as [Estado],
    e.cep as [CEP]

from contato as cont
LEFT JOIN telefone as tel
    on cont.idcontato = tel.idcontato
LEFT JOIN tipotelefone as tp
    on tel.idtipotelefone = tp.idtipotelefone
LEFT JOIN endereco as e
    on cont.idcontato = e.idcontato;




-- 2. Liste apenas os nomes e e-mails de todos os contatos..
select 
    cont.nome as [Contato],
    cont.email as [Email]

from contato as cont
LEFT JOIN telefone as tel
    on cont.idcontato = tel.idcontato


-- 3. Liste todos os contatos ordenados por nome em ordem alfabética.
select 
    cont.idcontato as [ID Contato],
    cont.nome as [Contato],
    cont.apelido as [Apelido],
    cont.email as [Email],
    cont.instagram as [Instagram],
    cont.linkedin as [LinkedIn],
    cont.tiktok as [TikTok],
    cont.datanascimento as [Data de Nascimento],

    tel.numero as [Número de telefone],
    tel.iswhatsapp as [Is WhatsApp],
    tp.tipo as [Tipo de Telefone],

    e.logradouro as [Logradouro],
    e.numero as [Número do Endereço],
    e.complemento as [Complemento],
    e.bairro as [Bairro],
    e.cidade as [Cidade],
    e.estado as [Estado],
    e.cep as [CEP]

from contato as cont
LEFT JOIN telefone as tel
    on cont.idcontato = tel.idcontato
LEFT JOIN tipotelefone as tp
    on tel.idtipotelefone = tp.idtipotelefone
LEFT JOIN endereco as e
    on cont.idcontato = e.idcontato
ORDER BY cont.nome asC;  

-- Versão 2
select 
    cont.idcontato as [ID Contato],
    cont.nome as [Contato]
from contato as cont
left join telefone as tel
    on cont.idcontato = tel.idcontato
order by cont.nome asc;


-- 4. Liste os contatos que moram na cidade de São Paulo (SP).
select 
    cont.nome as [Contato],
    tp.tipo as [Tipo de telefone],
    tel.numero as [Número de telefone],
    e.logradouro as [Logradouro],
    e.numero as [Número do Endereço],
    e.complemento as [Complemento],
    e.bairro as [Bairro],
    e.cidade as [Cidade],
    e.estado as [Estado],
    e.cep as [CEP]
from contato as cont
LEFT JOIN telefone as tel
    on cont.idcontato = tel.idcontato
LEFT JOIN tipotelefone as tp
    on tel.idtipotelefone = tp.idtipotelefone
LEFT JOIN endereco as e
    on cont.idcontato = e.idcontato
WHERE e.estado = 'SP';

-- Versão 2
select * from endereco
where estado like '%SP%';


-- 5. Liste os contatos que nasceram após o ano 1995.select 
    cont.idcontato as [ID Contato],
    cont.nome as [Contato],
    cont.datanascimento as [Data de Nascimento]
from contato as cont
where cont.datanascimento > '1995-12-31'
order by cont.nome asc; 

-- Versão 2
select * from contato
where YEAR(datanascimento) > 1995;


/* DISTINCT e FILTROS*/
-- 6. Liste todos os tipos de telefones cadastrados, sem repetição.
select distinct numero
from telefone;

-- 7. Liste todos os contatos que possuem número de WhatsApp.
select ctt.nome, tel.numero
from contato ctt
join telefone tel ON ctt.idcontato = tel.idcontato
where tel.iswhatsapp = 1;

-- 8. Liste todos os contatos que possuem pelo menos um telefone do tipo Comercial.
select ctt.nome, tel.numero
from contato ctt
join telefone tel on ctt.idcontato = tel.idcontato
where tel.tipotelefone = 2;


-- /* LIMITANDO RESULTADOS (TOP)*/
-- 9. Liste os 3 primeiros contatos cadastrados ordenados por data de nascimento (mais 
-- antigos primeiro).

select * from contato

select top 3 ctt.nome, ctt.datanascimento 
from contato ctt
where ctt.datanascimento is not null  
order by ctt.datanascimento asc;  





-- 10. Mostre os 2 contatos mais novos (nascidos mais recentemente).

select top 2 ctt.nome, ctt.datanascimento
from contato ctt
where ctt.datanascimento is not null
order by ctt.datanascimento desc;



-- /* JOINS (Relacionamento entre as tabelas)*/
-- 11. Liste o nome dos contatos e seus respectivos números de telefone.
select distinct
    cont.nome as Contato,
    tel.numero as Número
from contato as cont
inner join telefone as tel
    on cont.idcontato = tel.idcontato

-- 12. Liste os contatos que possuem telefone do tipo 'Recado', mostrando o nome, o tipo do 
-- telefone e o número.
select ctt.nome, tel.numero
from contato ctt
join telefone tel on ctt.idcontato = tel.idcontato
where tel.tipotelefone = 3;


-- /* Agregações (GROUP BY, COUNT, MAX, MIN, AVG, SUM)*/
-- 13. Mostre quantos telefones cada contato possui. (Nome do contato e quantidade de 
-- telefones)
select ctt.nome, count(tel.idtelefone) as Quantidade
from contato ctt
left join telefone tel on ctt.idcontato = tel.idcontato
group by ctt.nome;


-- 14. Liste os contatos que possuem mais de um telefone.
select ctt.nome, count(tel.idtelefone) as [Quantidade de telefones]
from contato ctt
join telefone tel on ctt.idcontato = tel.idcontato  
group by ctt.nome
having count(tel.idtelefone) > 1;


-- 15. Quantos telefones do tipo 'Celular' estão cadastrados?
select count(tel.idtelefone) as Quantidade
from contato ctt
left join telefone tel on ctt.idcontato = tel.idcontato
group by ctt.nome;


-- 16. Mostre a quantidade total de números que são WhatsApp e quantos não são.
select
  sum(case when tel.iswhatsapp = 1 then 1 else 0 end) as [Quantidade de número que são WhatsApp],
  sum(case when tel.iswhatsapp = 0 then 1 else 0 end) as [Quantidade de número que nãosão WhatsApp]
from telefone tel;


-- 17. Liste o contato que possui o maior número de telefones.
select top 1 ctt.nome, count(tel.idtelefone) as [Quantidade de telefones]
from contato ctt
join telefone tel on ctt.idcontato = tel.idcontato
group by ctt.nome
order by [Quantidade de telefones] desc;


-- 18. Mostre a data de nascimento mais antiga e a mais recente entre os contatos.
select 
  min(ctt.datanascimento) as [Data de NAscimento antiga],
  max(ctt.datanascimento) as [Data de NAscimento recente]
from contato ctt;



-- /* Desafio extra*/
-- 19. Liste os aniversariantes do mês atual.
select ctt.nome, ctt.datanascimento
from contato ctt
where month(ctt.datanascimento) = month(getdate())  
  and year(ctt.datanascimento) < year(getdate());  


-- 20. Liste os contatos que não possuem telefone do tipo 'Recado'	
select ctt.nome
from contato ctt
where not exists (
  select 1
  from telefone tel
  join tipotelefone tptel on tel.idtipotelefone = tptel.idtipotelefone
  where tel.idcontato = ctt.idcontato
  and tptel.tipo = 'Recado'
);


-- Adicional com quantidade de números de telefone
select ctt.nome, count(tel.idtelefone) as [Quantidade de telefones]
from contato ctt
left join telefone tel on ctt.idcontato = tel.idcontato
left join tipotelefone tptel on tel.idtipotelefone = tptel.idtipotelefone
where not exists (
    select 1
    from telefone tel2
    join tipotelefone tptel2 on tel2.idtipotelefone = tptel2.idtipotelefone
    where tel2.idcontato = ctt.idcontato
    and tptel2.tipo = 'Recado'
)
group by ctt.nome;




