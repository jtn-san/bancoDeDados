-- SELECIONA/LISTA A TABELA INTEIRA
select * from Cliente
/* 
Seleciona a tabela e clica ALT F1 para ver detalhes.
*/

-- COMANDOS DML = Data Manipulation Language
/*
Em sql, os comando do CRUD são:
C = INSERT - Insere dados em uma tabela
R = SELECT - Seleciona dados de uma tabela
U - UPDATE - Altera dados de uma tabela
D = DELETE - Apaga dados de uma tabela
*/


-- INSERINDO DADOS DE UM CLIENTE
-- SINTAXE: INSERT INTO TABELO (colunas) values (valores das colunas)

insert into Cliente (Nome, Cpf, Endereco, Nro, Complemento, Bairro, Cidade, Uf, Cep, DDD, Telefone, Email)
values('Fulano da Silva', '123.456.789-01', 'Avenida Marechal Tito', '1500', 'portão A', 'São Miguel Paulista', 'São Paulo', 'SP', '08010-090', '11', '2504-8400','sãomiguel@senac.com')



insert into Cliente (Nome, Cpf, Endereco, Nro, Complemento, Bairro, Cidade, Uf, Cep, DDD, Telefone, Email)
values('Senac', '123.456.789-02', 'Avenida Marechal Tito', '1500', 'portão B', 'São Miguel Paulista', 'São Paulo', 'SP', '08010-090', '11', '2504-8400','senac@sãomiguel.com')

-- INSERINDO VALORES NULOS

insert into Cliente (Nome, Cpf, Endereco, Nro, Complemento, Bairro, Cidade, Uf, Cep, DDD, Telefone, Email)
values('Senac São Miguel Paulista', '123.456.789-03', null, null, null, null, null, null, null, '11', '2504-8400','senac@saomiguel.com')


-- OMITINDO AS COLUNAS NULAS
insert into Cliente (Nome, Cpf, DDD, Telefone, Email)
values('Recepção São Miguel Paulista', '123.456.789-04', '11', '2504-8400','recepcao@saomiguel.com')

insert into Cliente (Nome, Cpf, DDD, Telefone, Email)
values('Administração São Miguel Paulista', '123.456.789-05', '11', '2504-8400','adm@saomiguel.com')

/*----*/

insert into Cliente (Nome, Cpf, Endereco, Nro, Complemento, Bairro, Cidade, Uf, Cep, DDD, Telefone, Email)
values('Docentes Senac', '123.456.789-06', 'Avenida Marechal Tito', '1500', 'portão C', 'São Miguel Paulista', 'São Paulo', 'SP', '08010-090', '11', '2504-8400','docentes@saomiguel.com')

select * from Cliente


-- INSERINDO CHAMADO MECÂNICO

insert into Chamado (IdCliente, Endereco, Nro, Complemento, Bairro, Cidade, UF, Cep, Descricao, DataHora, Situacao)
values (2, 'Av. Cangaíba', '50', '', 'Penha', 'São Paulo', 'SP', '01471-541', 'Furou o pneu', '2025-05-20 20:17:00', 'Aguardando')

-- COM GETDATE :: COLOCA DATA E HORA AUTOMATICAMENTE E NA HORA QUE FAZ O CADASTRO
insert into Chamado (IdCliente, Endereco, Nro, Complemento, Bairro, Cidade, UF, Cep, Descricao, DataHora, Situacao)
values (2, 'Av. Paulista', '1050', 'Perto do Masp', 'Centro', 'São Paulo', 'SP', '01310-200', 'Furou o pneu', GETDATE(), 'Aguardando')

-- INSERINDO CHAMADO COM O ID INVÁLIDO
insert into Chamado (IdCliente, Endereco, Nro, Complemento, Bairro, Cidade, UF, Cep, Descricao, DataHora, Situacao)
values (10, 'Av. Paulista', '1050', 'Perto do Masp', 'Centro', 'São Paulo', 'SP', '01310-200', 'Furou o pneu', GETDATE(), 'Aguardando')

/*ERROR: 
The INSERT statement conflicted with the FOREIGN KEY constraint 
"FK__Chamado__IdClien__4BAC3F29". The conflict occurred in database "BD_ZeDaBike", 
table "dbo.Cliente", column 'IdCliente'.
*/

-- INSERINDO USER ADM
insert into Usuario (Nome, Email, Cpf, DDD, Telefone, Senha, Bloqueado, TipoUsuario)
values('José Silva', 'jsilva@zedabike.com', '123.123.123.01', '11', '91234-5678', '123@mudare', 0, 'Admin')

-- INSERINDO MECANICO E SUA FICHA MÉDICA
insert into Mecanico (Nome, Email, Cpf, DDD, Telefone, Senha, Bloqueado, IdUsuarioCadastro)
values('Samuel Silva', 'ssilva@zedabike.com', '123.123.123.02', '11', '91234-5671', '123@muda', 0, 1)

insert into FichaMedica(IdMecanico, Peso, Altura, TipoSanguineo, EhAlergico)
values(2, 98, 1.75, '0+', 0)

insert into Mecanico (Nome, Email, Cpf, DDD, Telefone, Senha, Bloqueado, IdUsuarioCadastro)
values('Ronny Silva', 'rsilva@zedabike.com', '123.123.123.03', '11', '91234-5672', '123@muda', 0, 1)

insert into FichaMedica(IdMecanico, Peso, Altura, TipoSanguineo, EhAlergico)
values(3, 80, 1.85, 'B', 0)

insert into Mecanico (Nome, Email, Cpf, DDD, Telefone, Senha, Bloqueado, IdUsuarioCadastro)
values('Luan Silva', 'lsilva@zedabike.com', '123.123.123.04', '11', '91234-5673', '123@muda', 0, 1)

insert into FichaMedica(IdMecanico, Peso, Altura, TipoSanguineo, EhAlergico)
values(4, 90, 1.65, 'AB', 1)


-- INSERINDO CHAMADO MECANICO

insert into ChamadoMecanico (IdChamado, IdMecanico) 
values (1, 2)
insert into ChamadoMecanico (IdChamado, IdMecanico) 
values (2, 3)
insert into ChamadoMecanico (IdChamado, IdMecanico) 
values (2, 2)




-- ALTERANDO DADOS DA TABELA (UPDATE)
-- WHERE :: Restrição dos dados (Filtro)
update Cliente set Email = 'fulanosilva@senacsaomiguel.com'
where IdCliente = 1
update Cliente set Email = 'senac@saomiguel.com'
where IdCliente = 2
update Cliente set Email = 'recepcao@senacsaomiguel.com'
where IdCliente = 4
update Cliente set Email = 'adm@senacsaomiguel.com'
where IdCliente = 5
update Cliente set Email = 'docentes@senacsaomiguel.com'
where IdCliente = 6


-- PAGANDO DADOS DA TABELA (DELETE)
delete from Cliente
where IdCliente = 2

/*
Não pode apagar dados que contenha dependência com FK. 
*/


/*
ADICIONAIS :: 

NA TABELA BOTÃO DIREITO > EDITAR 200 LINHAS SUPERIORES, PODERÁ EXCLUIR/EDITAR/CADASTRAR DIRETAMENTE POR LÁ, SEM NECESSIDADE DOS COMANDOS. 

GERADOR DE PESSOAS 'GERADOR NV'
NO GOOGLE: GERADOR DE PESSOAS 'GERADOR NV' (QUANDO TIVER SEM CRIATIVIDADE PARA GERAR NA CRIAÇÃO DO BD PARA TREINO.

https://geradornv.com.br/gerador-pessoas/

*/

-- VISUALIZANDO AS TABELAS
select * from Cliente
select * from Chamado
select * from ChamadoMecanico
select * from Usuario
select * from Mecanico
select * from FichaMedica


