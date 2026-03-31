# mercado-dinamico-serratec
Projeto Final de Banco de Dados (Residência Serratec)

# 🛒 Sistema de Mercado com Preço Dinâmico

Projeto Integrador do Módulo de Banco de Dados Relacional desenvolvido para a Residência em TI do Serratec. 

## 📋 Sobre o Projeto
Este projeto consiste na modelagem e implementação de um banco de dados relacional para um supermercado moderno. O grande diferencial do sistema é a adoção de uma estratégia de **Preço Dinâmico**, onde o valor dos produtos não é fixo, mas sim registrado em um histórico de preços que muda conforme a demanda e o estoque.

O banco garante a rastreabilidade completa: o preço cobrado em uma venda é "congelado" no momento da compra, preservando o valor praticado na data exata da transação.

## 🛠️ Tecnologias Utilizadas
* **PostgreSQL**
* Linguagem SQL (DDL, DML, DQL)

## 🗂️ Estrutura do Script
O projeto foi consolidado em um único script `.sql` dividido nas seguintes seções:

1. **Modelagem (DDL):** Criação de tabelas (Categoria, Produto, Estoque, Histórico de Preço, Venda e Item Venda) com suas respectivas PKs, FKs (`ON DELETE RESTRICT`) e restrições (`UNIQUE`, `CHECK`).
2. **Inserções (DML):** População do banco com dados realistas, incluindo variações de estoque e alterações de preços para simular a flutuação do mercado.
3. **Consultas (DQL):** Resolução de 8 perguntas de negócio (C1 a C8), utilizando agregações, joins e subconsultas para análise de faturamento, estoque crítico e histórico de preços.
4. **Desafio Final:** Lógica de negócio dinâmica que identifica produtos com menos de 10 unidades no estoque, calcula um reajuste de 15% e insere automaticamente os novos valores na tabela de histórico.

## 🚀 Como Executar
1. Crie um banco de dados no PostgreSQL (ex: `mercado_dinamico`).
2. Execute o arquivo `trabalho_final.sql` (ou o nome que você deu ao arquivo) por completo.
3. O script irá criar a estrutura, inserir os dados, rodar as consultas analíticas e processar a rotina de ajuste de preço por escassez de estoque.

---
*Desenvolvido por Maxwell, Matheus, Filipe, Luis e Bernardo - Grupo 1: Banco de Dados*
