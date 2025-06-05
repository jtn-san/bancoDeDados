-- Criação do Banco de Dados
CREATE DATABASE BD_Agenda;
GO

-- Seleciona o banco de dados
USE BD_Agenda;
GO

/*
03/06
*/

-- Tabela Contato
CREATE TABLE Contato (
    IdContato INT IDENTITY(1,1) PRIMARY KEY, -- Identificador único
    Nome NVARCHAR(100) NOT NULL,
    Apelido NVARCHAR(50) NULL,
    Email NVARCHAR(100) NULL,
    Instagram NVARCHAR(100) NULL,
    Linkedin NVARCHAR(100) NULL,
    Tiktok NVARCHAR(100) NULL,
    DataNascimento DATE NULL,
    Endereco NVARCHAR(255) NULL
);
GO

-- Tabela Telefone
CREATE TABLE Telefone (
    IdTelefone INT IDENTITY(1,1) PRIMARY KEY,  -- Identificador único
    IdContato INT,  -- Relacionamento com Contato
    Numero NVARCHAR(20) NOT NULL,  -- Número do telefone
    TipoTelefone NVARCHAR(20) NOT NULL,  -- Tipo de telefone: Celular, Comercial, Recado
    IsWhatsApp BIT NOT NULL,  -- Se o número é WhatsApp
    CONSTRAINT FK_Telefone_Contato FOREIGN KEY (IdContato) REFERENCES Contato(IdContato)
);
GO

-- Inserindo um contato
INSERT INTO Contato (Nome, Apelido, Email, Instagram, Linkedin, Tiktok, DataNascimento, Endereco)
VALUES ('Ronny Silva', 'Ronny', 'Ronny@email.com', 'Ronny_instagram', 'Ronny_linkedin', 'Ronny_tiktok', '1990-05-05', 'Av. Marechal Tito, ');

-- Inserindo telefones para o contato João Silva
INSERT INTO Telefone (IdContato, Numero, TipoTelefone, IsWhatsApp)
VALUES 
(1, '11987654321', 'Celular', 1),  -- WhatsApp
(1, '1122334455', 'Comercial', 0); -- Não é WhatsApp
GO


-- VISUALIZANDO AS TABELAS
select * from Contato
select * from Telefone
select * from Contato
