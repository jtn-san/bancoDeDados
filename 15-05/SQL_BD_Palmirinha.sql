create database BD_Palmirinha
go

use BD_Palmirinha
go

create table Loja(
   IdLoja	INT PRIMARY KEY IDENTITY NOT NULL,
   Nome		VARCHAR(50) NOT NULL,
   Logradouro VARCHAR(100) NOT NULL,
   Nro VARCHAR(10) NOT NULL,
   Complemento VARCHAR(50),
   Bairro VARCHAR(50) NOT NULL,
   Cidade VARCHAR(50) NOT NULL,
   Uf VARCHAR(2) NOT NULL,
   Cep VARCHAR(9) NOT NULL,
   Cnpj VARCHAR(18) NOT NULL,
   Telefone VARCHAR(14) NOT NULL
);
GO

create table Ingrediente(
    IdIngrediente	INT PRIMARY KEY IDENTITY NOT NULL,
	Nome			VARCHAR(50) NOT NULL,
	PrecoSugerido	DECIMAL(10,2)
);
GO

create table IngredienteLoja(
	IdIngredienteLoja INT PRIMARY KEY IDENTITY NOT NULL,
	IdIngrediente INT FOREIGN KEY REFERENCES Ingrediente(IdIngrediente) NOT NULL,
	IdLoja INT FOREIGN KEY REFERENCES Loja(IdLoja) NOT NULL	
);
GO

create table ReceitaIngrediente (
    IdReceitaIngrediente INT PRIMARY KEY,
    IdReceita INT FOREIGN KEY REFERENCES Receita(IdReceita),
    IdIngrediente INT FOREIGN KEY REFERENCES Ingrediente(IdIngrediente),
    Qtde INT
);
GO

create table Receita (
    IdReceita INT PRIMARY KEY,
    IdGrauDificuldade INT FOREIGN KEY REFERENCES GrauDificuldade(IdGrauDificuldade),
    Nome VARCHAR(50),
    TempoPreparo INT,
    ModoPreparo VARCHAR(8000),
    QtdePorcoes TINYINT
);
GO

create table GrauDificuldade (
    IdGrauDificuldade INT PRIMARY KEY,
    Nome VARCHAR(15)
);
GO

create table Usuario (
    IdUsuario INT PRIMARY KEY,
    Nome VARCHAR(50),
    Email VARCHAR(100)
);
GO
 
create table UsuarioAcesso (
    IdUsuario INT PRIMARY KEY FOREIGN KEY REFERENCES Usuario(IdUsuario),
    Login VARCHAR(20),
    Senha VARCHAR(50),
    Bloqueado BIT
);
GO

create table Avaliacao (
    IdAvaliacao INT PRIMARY KEY,
    IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario),
    IdReceita INT FOREIGN KEY REFERENCES Receita(IdReceita),
    Nota TINYINT,
    Comentario VARCHAR(1000),
    Data DATE
        
);
GO