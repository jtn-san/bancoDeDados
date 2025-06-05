create database BD_Produtos
go

use BD_Produtos
go

/*
21/05
*/

create table Produto(
	IdProduto	 int primary key identity,
	Nome		 varchar(50) not null,
	Descricao	 varchar(800) not null,
	Estoque		 int not null, 
	EhLancamento bit not null,
	Preco		 decimal(10,2) not null
);
go

create table Departamento(
	IdDepartamento	 int primary key identity,
	Nome			 varchar(50) not null
);
go

create table Categoria(
	IdCategoria	 int primary key identity,
	Nome		 varchar(50) not null,
	IdDepartamento int foreign key references Departamento(IdDepartamento)
);
go

create table ProdutoCategoria(
IdProduto	 int foreign key references Produto(IdProduto),
IdCategoria	 int foreign key references Categoria(IdCategoria)
);
go

-- INSERINDO DEPARTAMENTOS
insert into Departamento(Nome)
values('Tecnologia'),('Vestuário'),('Alimentação'),('Esportes'),('Móveis')
go

-- INSERINDO CATEGORIAS E O ID DO DEPARTAMENTO
insert into Categoria (Nome, IdDepartamento)
values('Smartphones', 1), ('Notebooks', 1), ('Televisores', 1), ('Roupas Esportivas', 2), ('Calçados', 2),('Alimentos Saudáveis', 3), ('Laticínios', 3), ('Futebol', 4), ('Bicicletas', 4), ('Cadeiras', 5);
go

-- INSERINDO PRODUTOS

insert into Produto(Nome, Descricao, Estoque, EhLancamento, Preco) 
values ('iPhone 14 Pro', 'Smartphone de última geração com câmera 48MP', 50, 1, 9.999)
go

insert into Produto(Nome, Descricao, Estoque, EhLancamento, Preco) 
values ('MacBook', 'Notebook potente com chip M1', 30, 1, 14999)
go

insert into Produto(Nome, Descricao, Estoque, EhLancamento, Preco) 
values ('Smart TV 55" 4K', 'Televisor com resolução 4K e Smart TV', 20, 1, 4499)
go

insert into Produto(Nome, Descricao, Estoque, EhLancamento, Preco) 
values ('Camiseta de Futebol', 'Camiseta oficial para prática de esportes', 150, 0, 199)
go

insert into Produto(Nome, Descricao, Estoque, EhLancamento, Preco) 
values ('Tênis de Corrida', 'Tênis leve e resistente para corrida', 80, 1, 499)
go

insert into Produto(Nome, Descricao, Estoque, EhLancamento, Preco) 
values ('Leite Integral', 'Leite fresco integral de alta qualidade', 200, 0, 5.99)
go

insert into Produto(Nome, Descricao, Estoque, EhLancamento, Preco) 
values ('Bicicleta Mountain', 'Bicicleta resistente para trilhas', 15, 0, 2999)
go

insert into Produto(Nome, Descricao, Estoque, EhLancamento, Preco) 
values ('Cadeira de Escritório', 'Cadeira ergonômica com ajuste de altura', 100, 1, 899)
go

-- INSERINDO PRODUTOS COM CATEGORIAS
insert into ProdutoCategoria(IdProduto, IdCategoria) 
values (1, 1), (1, 2), (1, 3), (1, 4), (1, 5)
go

insert into ProdutoCategoria(IdProduto, IdCategoria) 
values (2, 1), (2, 2), (2, 3)
go

insert into ProdutoCategoria(IdProduto, IdCategoria) 
values (3, 2), (3, 3), (3, 4)
go

insert into ProdutoCategoria(IdProduto, IdCategoria) 
values (4, 4), (4, 8)
go

insert into ProdutoCategoria(IdProduto, IdCategoria) 
values (5, 4), (5, 5)
go

insert into ProdutoCategoria(IdProduto, IdCategoria) 
values (6, 7) 
go

insert into ProdutoCategoria(IdProduto, IdCategoria) 
values (7, 9) 
go

insert into ProdutoCategoria(IdProduto, IdCategoria) 
values (8, 10)
go

-- ATUALIZANDO O PREÇO DO IdProduto = 1 DE 9.999 PARA 9999
update Produto set Preco = '9999'
where IdProduto = 1
go

-- VISUALIZANDO AS TABELAS
select * from Produto
select * from Departamento
select * from Categoria
select * from ProdutoCategoria