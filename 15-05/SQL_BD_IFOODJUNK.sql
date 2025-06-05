CREATE DATABASE BD_iJunkFood
GO

USE BD_iJunkFood
GO

CREATE TABLE Cliente (
   IdCliente INT NOT NULL,
   Nome VARCHAR(100) NOT NULL,
   Cpf VARCHAR(100) NOT NULL,
   Telefone VARCHAR(14) NOT NULL,
   Email VARCHAR(100) NOT NULL,
   Senha VARCHAR(10) NOT NULL,
   PRIMARY KEY (IdCliente)
);


CREATE TABLE Endereco (
   IdEndereco INT NOT NULL,
   IdCliente INT NOT NULL,
   Endereco VARCHAR(100) NOT NULL,
   Nro VARCHAR(6) NOT NULL,
   Complemento VARCHAR(30),
   Bairro VARCHAR(50) NOT NULL,
   Cidade VARCHAR(70) NOT NULL,
   Uf VARCHAR(2) NOT NULL,
   Cep VARCHAR(9) NOT NULL,
   Principal BIT NOT NULL,
   PRIMARY KEY (IdEndereco)
);


CREATE TABLE Restaurante (
   IdRestaurante INT NOT NULL,
   RazaoSocial VARCHAR(100) NOT NULL,
   NomeFantasia VARCHAR(50) NOT NULL,
   Cnpj VARCHAR(18) NOT NULL,
   Telefone1 VARCHAR(14) NOT NULL,
   Telefone2 VARCHAR(14),
   Email VARCHAR(100) NOT NULL,
   Senha VARCHAR(10) NOT NULL,
   Endereco VARCHAR(100) NOT NULL,
   Nro VARCHAR(6) NOT NULL,
   Complemento VARCHAR(30),
   Bairro VARCHAR(50) NOT NULL,
   Cidade VARCHAR(70) NOT NULL,
   Uf VARCHAR(2) NOT NULL,
   Cep VARCHAR(9) NOT NULL,
   PRIMARY KEY (IdRestaurante)
);


CREATE TABLE Entregador (
   IdEntregador INT NOT NULL,
   Nome VARCHAR(100) NOT NULL,
   Cpf VARCHAR(100) NOT NULL,
   Telefone VARCHAR(14) NOT NULL,
   Email VARCHAR(100) NOT NULL,
   Senha VARCHAR(10) NOT NULL,
   DataNascimento DATETIME NOT NULL,
   Cnh VARCHAR(11),
   PRIMARY KEY (IdEntregador)
);


CREATE TABLE Categoria (
   IdCategoria INT NOT NULL,
   Nome VARCHAR(30) NOT NULL,
   Imagem VARCHAR(200),
   IdRestaurante INT NOT NULL,
   PRIMARY KEY (IdCategoria)
);


CREATE TABLE Prato (
   IdPrato INT NOT NULL,
   Nome VARCHAR(30) NOT NULL,
   Descricao VARCHAR(500),
   Valor MONEY NOT NULL,
   Imagem VARCHAR(200),
   IdCategoria INT NOT NULL,
   PRIMARY KEY (IdPrato)
);


CREATE TABLE Pedido (
   IdPedido INT NOT NULL,
   IdEntregador INT,
   IdCliente INT NOT NULL,
   IdRestaurante INT NOT NULL,
   ValorTotal MONEY NOT NULL,
   ValorDesconto MONEY,
   IdEnderecoEntrega INT,
   IdStatusPedido INT NOT NULL,
   PRIMARY KEY (IdPedido)
);


CREATE TABLE PedidoPrato (
   IdPedidoPrato INT NOT NULL,
   IdPedido INT NOT NULL,
   IdPrato INT NOT NULL,
   Qtde INT NOT NULL,
   Valor MONEY NOT NULL,
   Observacao VARCHAR(200),
   PRIMARY KEY (IdPedidoPrato)
);


CREATE TABLE Pagamento (
   IdPagamento INT NOT NULL,
   IdPedido INT NOT NULL,
   IdFormaPagamento INT NOT NULL,
   Valor MONEY NOT NULL,
   PRIMARY KEY (IdPagamento)
);


CREATE TABLE FormaPagamento (
   IdFormaPagamento INT NOT NULL,
   Nome VARCHAR(20) NOT NULL,
   PRIMARY KEY (IdFormaPagamento)
);


CREATE TABLE StatusPedido (
   IdStatusPedido INT NOT NULL,
   Nome VARCHAR(20) NOT NULL,
   PRIMARY KEY (IdStatusPedido)
);


CREATE TABLE AvaliacaoPedido (
   IdPedido INT NOT NULL,
   Nota TINYINT NOT NULL,
   Justificativa VARCHAR(100),
   PRIMARY KEY (IdPedido)
);


CREATE TABLE ClientePagamento (
   IdClientePagamento INT NOT NULL,
   IdCliente INT NOT NULL,
   IdFormaPagamento INT NOT NULL,
   NomeTitular VARCHAR(20),
   NumeroCartao VARCHAR(16),
   Validade VARCHAR(5),
   CodSeguranca VARCHAR(3),
   PRIMARY KEY (IdClientePagamento)
);


CREATE TABLE Veiculo (
   IdVeiculo INT NOT NULL,
   IdEntregador INT NOT NULL,
   Marca VARCHAR(20) NOT NULL,
   Modelo VARCHAR(50) NOT NULL,
   Placa VARCHAR(8) NOT NULL,
   PRIMARY KEY (IdVeiculo)
);



ALTER TABLE Endereco ADD CONSTRAINT FK_8245a43e_bf7c_46c2_adfe_cae178bd529e FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente)  ;

ALTER TABLE Categoria ADD CONSTRAINT FK_7e03fe8d_9be9_4986_954f_b9423508bf79 FOREIGN KEY (IdRestaurante) REFERENCES Restaurante(IdRestaurante)  ;

ALTER TABLE Prato ADD CONSTRAINT FK_9b09e43b_46dc_4722_9f7b_ecca77768d2d FOREIGN KEY (IdCategoria) REFERENCES Categoria(IdCategoria)  ;

ALTER TABLE Pedido ADD CONSTRAINT FK_3acca6d0_d934_4e98_a508_3f45f3c2635d FOREIGN KEY (IdEntregador) REFERENCES Entregador(IdEntregador)  ;

ALTER TABLE Pedido ADD CONSTRAINT FK_69fabf03_afa2_43f1_8833_635658702273 FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente)  ;

ALTER TABLE Pedido ADD CONSTRAINT FK_8e8f931a_9e52_404d_bf49_7beacf573d83 FOREIGN KEY (IdRestaurante) REFERENCES Restaurante(IdRestaurante)  ;

ALTER TABLE Pedido ADD CONSTRAINT FK_8e2e29a1_a3f8_496b_8c14_bb2f3a7cbe14 FOREIGN KEY (IdEnderecoEntrega) REFERENCES Endereco(IdEndereco)  ;

ALTER TABLE Pedido ADD CONSTRAINT FK_82d46305_54c5_4229_9ef8_71c4cd287c84 FOREIGN KEY (IdStatusPedido) REFERENCES StatusPedido(IdStatusPedido)  ;

ALTER TABLE PedidoPrato ADD CONSTRAINT FK_9dfdbfc4_250f_4803_87a7_788d55d30d90 FOREIGN KEY (IdPedido) REFERENCES Pedido(IdPedido)  ;

ALTER TABLE PedidoPrato ADD CONSTRAINT FK_37a0f061_c9c5_4417_bb53_1e6f4af7eea3 FOREIGN KEY (IdPrato) REFERENCES Prato(IdPrato)  ;

ALTER TABLE Pagamento ADD CONSTRAINT FK_7d793b13_8935_473b_b015_d7ac7b992089 FOREIGN KEY (IdPedido) REFERENCES Pedido(IdPedido)  ;

ALTER TABLE Pagamento ADD CONSTRAINT FK_392a07ad_6701_4fb9_8333_ecd4a699ae37 FOREIGN KEY (IdFormaPagamento) REFERENCES FormaPagamento(IdFormaPagamento)  ;

ALTER TABLE AvaliacaoPedido ADD CONSTRAINT FK_20f95cee_059f_459f_86f3_f03f03400bd4 FOREIGN KEY (IdPedido) REFERENCES Pedido(IdPedido)  ;

ALTER TABLE ClientePagamento ADD CONSTRAINT FK_fcf62d8e_ce6f_43b9_8666_6fb00ed8dd95 FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente)  ;

ALTER TABLE ClientePagamento ADD CONSTRAINT FK_53bacadd_9f15_4a21_b3c0_cecd51c98ece FOREIGN KEY (IdFormaPagamento) REFERENCES FormaPagamento(IdFormaPagamento)  ;

ALTER TABLE Veiculo ADD CONSTRAINT FK_c3430c11_fa8b_459c_8692_86103d8f955b FOREIGN KEY (IdEntregador) REFERENCES Entregador(IdEntregador)  ;
