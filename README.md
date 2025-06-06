# 📇 Banco de Dados - Agenda de Contatos - SQL Server

<div align="center">
  <img width="60"  src="https://img.icons8.com/color/96/microsoft-sql-server.png" alt="SQL Server Logo" />
  <img width="60" src="https://img.icons8.com/fluency/96/sql.png" alt="SSMS Logo" />
</div>


Este projeto consiste na criação e manipulação de um banco de dados chamado `bd_agenda`, desenvolvido no **SQL Server Management Studio (SSMS)**. O banco é voltado para o gerenciamento de contatos, incluindo informações pessoais, telefones, redes sociais e endereços.

## 🧾 Descrição

O banco de dados foi criado utilizando scripts T-SQL e possui tabelas normalizadas como `contato`, `telefone`, `tipotelefone`, `endereco` e `tiporesidencia`. Também estão incluídas diversas consultas SQL com `JOINs`, `GROUP BY`, filtros e agregações para análise e extração de dados.

## 🗂️ Estrutura do Projeto

- **Banco de Dados**: `bd_agenda`
- **Tabelas**:
  - `contato`
  - `telefone`
  - `tipotelefone`
  - `endereco`
  - `tiporesidencia`
- **Recursos**:
  - Inserção de dados de exemplo
  - Consultas básicas e avançadas
  - Filtros por cidade, tipo de telefone, aniversariantes, entre outros

## 🚀 Como Executar

1. Abra o **SQL Server Management Studio (SSMS)**.
2. Execute o script `exercicioBDAgenda.sql`.
3. O banco de dados será criado e populado automaticamente.
4. Use os `SELECTs` ao final do arquivo para realizar consultas e testar as relações.

## ✅ Requisitos

- Microsoft SQL Server 2019 ou superior
- SQL Server Management Studio (SSMS)

## 👨‍💻 Autor

Desenvolvido por [Jonathan](https://github.com/jtn-san), como parte de estudos e práticas em modelagem e administração de banco de dados com SQL Server.

