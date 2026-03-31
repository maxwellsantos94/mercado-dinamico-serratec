---------------
-- MODELAGEM --
---------------

-- Criar tabela Categoria
create table categoria (
	id_categoria serial primary key,
	nome varchar(100) not null,
	descricao text
);

-- Criar tabela Produto
create table produto (
	id_produto serial primary key,
	nome varchar(150) not null unique,
	descricao text,
	unidade varchar(10) not null,
	id_categoria int not null references categoria(id_categoria) on delete restrict
);

-- Criar tabela Estoque
create table estoque (
	id_estoque serial primary key,
	id_produto int not null unique references produto(id_produto) on delete restrict,
	quantidade int not null check (quantidade >= 0),
	estoque_minimo int not null,
	ultima_atualizacao timestamp default current_timestamp
);

-- Criar tabela historico_preco
create table historico_preco (
	id_historico serial primary key,
	id_produto int not null references produto(id_produto) on delete restrict,
	preco decimal(10,2) not null,
	data_inicio timestamp default current_timestamp,
	motivo text
);

-- Criar tabela Venda
create table venda (
	id_venda serial primary key,
	data_venda timestamp default current_timestamp,
	cliente varchar(150),
	total decimal(10,2) default 0
);

-- Criar tabela item_venda
create table item_venda (
	id_item serial primary key,
	id_venda int not null references venda(id_venda) on delete restrict,
	id_produto int not null references produto(id_produto) on delete restrict,
	quantidade int not null,
	preco_unitario decimal(10,2) not null,
	subtotal decimal(10,2) not null
);

------------------------------------------------------------------

---------------
-- INSERÇÕES -- 
---------------

-- Inserção de dados na tabela categoria
insert into categoria (nome, descricao)
values 
('Bebidas', 'Cervejas, Sucos, Refrigerantes e águas.'),
('Laticínios', 'Produtos derivados do leite.'),
('Hortifruti', 'Frutas e verduras.'),
('Limpeza', 'Produtos de limpeza em geral.');

------------------------------------------------------------------

-- Inserção de dados na tabela produto
insert into produto (nome, unidade, id_categoria)
values 
('Coca Cola', 'l', 1),
('Skoll', 'ml', 1),
('Suco de Tamarindo', 'l', 1),
('Água Mineral', 'l', 1),
('Velho Barreiro', 'ml', 1);

insert into produto (nome, unidade, id_categoria)
values
('Queijo Mussarela', 'kg', 2),
('Iogurte', 'g', 2),
('Queijo Coalho', 'g', 2),
('Manteiga','g', 2),
('Leite Integral','L', 2);

insert into produto (nome, unidade, id_categoria)
values
('Maça', 'kg', 3),
('Banana' ,'kg', 3),
('Abacate' ,'un', 3),
('Alface' ,'un', 3),
('Agrião' ,'kg', 3);

insert into produto (nome, unidade, id_categoria)
values
('Veja Multiuso' ,'un', 4),
('Cloro', 'un', 4),
('Desinfetante' ,'un', 4),
('Detergente', 'un', 4),
('Água Sanitária', 'un', 4);

-----------------------------------------------------------------

-- Inserção de dados na tabela estoque
insert into estoque (id_produto, quantidade, estoque_minimo)
values
(1, 65, 10), -- Coca Cola
(2, 80, 10), -- Skoll
(3, 59, 10), -- Suco de Tamarindo
(4, 9, 10), -- Água Mineral (Estoque Baixo)
(5, 7, 10); -- Velho Barreiro (Estoque Baixo)

insert into estoque (id_produto, quantidade, estoque_minimo)
values
(6, 15, 10), -- Queijo Mussarela
(7, 40, 10), -- Iogurte
(8, 25, 10), -- Queijo Coalho
(9, 8, 10), -- Manteiga (Estoque Baixo)
(10, 6, 10); -- Leite Integral (Estoque Baixo)

insert into estoque (id_produto, quantidade, estoque_minimo)
values
(11, 50, 10), -- Maçã
(12, 23, 10), -- Banana
(13, 18, 10), -- Abacate
(14, 6, 10), -- Alface (Estoque Baixo)
(15, 7, 10); -- Agrião (Estoque Baixo)

insert into estoque (id_produto, quantidade, estoque_minimo)
values
(16, 85, 10), -- Veja Multiuso
(17, 22, 10), -- Cloro
(18, 75, 10), -- Desinfetante
(19, 8, 10), -- Detergente (Baixo)
(20, 9, 10); -- Água Sanitária (Estoque Baixo)

-----------------------------------------------------------------

-- Inserção de dados na tabela historico_preco
insert into historico_preco (id_produto, preco, data_inicio, motivo)
values
-- Bebidas (1 a 5)
(1, 9.90, '2026-01-01 08:00:00', 'Preço Inicial'),
(1, 11.50, '2026-02-15 10:30:00', 'Reajuste'),
(2, 3.80, '2026-01-01 08:00:00', 'Preço Inicial'),
(2, 4.20, '2026-03-05 09:15:00', 'Reajuste'),
(3, 8.50, '2026-01-01 08:00:00', 'Preço Inicial'),
(3, 9.80, '2026-02-20 14:00:00', 'Reajuste'),
(4, 2.90, '2026-01-01 08:00:00', 'Preço Inicial'),
(4, 3.50, '2026-03-10 08:45:00', 'Reajuste'),
(5, 14.50, '2026-01-01 08:00:00', 'Preço Inicial'),
(5, 16.90, '2026-02-28 17:00:00', 'Reajuste'),

-- Laticínios (6 a 10)
(6, 39.90, '2026-01-01 08:00:00', 'Preço Inicial'),
(6, 45.90, '2026-03-12 11:20:00', 'Reajuste'),
(7, 2.80, '2026-01-01 08:00:00', 'Preço Inicial'),
(7, 3.20, '2026-02-10 09:00:00', 'Reajuste'),
(8, 52.00, '2026-01-01 08:00:00', 'Preço Inicial'),
(8, 58.00, '2026-03-18 10:00:00', 'Reajuste'),
(9, 10.50, '2026-01-01 08:00:00', 'Preço Inicial'),
(9, 12.50, '2026-02-05 08:30:00', 'Reajuste'),
(10, 4.80, '2026-01-01 08:00:00', 'Preço Inicial'),
(10, 5.40, '2026-03-22 15:45:00', 'Reajuste'),

-- Hortifruti (11 a 15)
(11, 8.90, '2026-01-01 08:00:00', 'Preço Inicial'),
(11, 10.90, '2026-02-12 07:00:00', 'Reajuste'),
(12, 5.50, '2026-01-01 08:00:00', 'Preço Inicial'),
(12, 6.50, '2026-03-02 08:15:00', 'Reajuste'),
(13, 4.20, '2026-01-01 08:00:00', 'Preço Inicial'),
(13, 5.50, '2026-02-25 09:30:00', 'Reajuste'),
(14, 2.80, '2026-01-01 08:00:00', 'Preço Inicial'),
(14, 3.50, '2026-03-14 06:00:00', 'Reajuste'),
(15, 3.50, '2026-01-01 08:00:00', 'Preço Inicial'),
(15, 4.00, '2026-02-18 11:00:00', 'Reajuste'),

-- Limpeza (16 a 20)
(16, 5.90, '2026-01-01 08:00:00', 'Preço Inicial'),
(16, 6.80, '2026-03-08 13:20:00', 'Reajuste'),
(17, 4.80, '2026-01-01 08:00:00', 'Preço Inicial'),
(17, 5.50, '2026-02-09 10:00:00', 'Reajuste'),
(18, 7.50, '2026-01-01 08:00:00', 'Preço Inicial'),
(18, 8.90, '2026-03-25 09:00:00', 'Reajuste'),
(19, 1.95, '2026-01-01 08:00:00', 'Preço Inicial'),
(19, 2.40, '2026-02-14 16:30:00', 'Reajuste'),
(20, 3.70, '2026-01-01 08:00:00', 'Preço Inicial'),
(20, 4.20, '2026-03-01 10:15:00', 'Reajuste');

-----------------------------------------------------------------

-- Inserção de dados nas tabelas venda e item_venda
-- Venda 1: Maxwell
insert into venda (cliente, total) values ('Maxwell', 14.10);
insert into item_venda (id_venda, id_produto, quantidade, preco_unitario, subtotal) values 
(1, 11, 1, 10.90, 10.90),
(1, 7, 1, 3.20, 3.20);

-- Venda 2: Matheus
insert into venda (cliente, total) values ('Matheus', 240.40);
insert into item_venda (id_venda, id_produto, quantidade, preco_unitario, subtotal) values 
(2, 2, 2, 4.20, 8.40),
(2, 8, 4, 58.00, 232.00);

-- Venda 3: Filipe
insert into venda (cliente, total) values ('Filipe', 59.10);
insert into item_venda (id_venda, id_produto, quantidade, preco_unitario, subtotal) values 
(3, 11, 3, 10.90, 32.70),
(3, 19, 2, 2.40, 4.80),
(3, 10, 4, 5.40, 21.60);

-- Venda 4: Luis
insert into venda (cliente, total) values ('Luis', 59.30);
insert into item_venda (id_venda, id_produto, quantidade, preco_unitario, subtotal) values 
(4, 14, 4, 3.50, 14.00),
(4, 10, 1, 5.40, 5.40),
(4, 11, 3, 10.90, 32.70),
(4, 19, 3, 2.40, 7.20);

-- Venda 5: Bernardo
insert into venda (cliente, total) values ('Bernardo', 23.50);
insert into item_venda (id_venda, id_produto, quantidade, preco_unitario, subtotal) values 
(5, 17, 3, 5.50, 16.50),
(5, 4, 2, 3.50, 7.00);

-- Venda 6: Ana
insert into venda (cliente, total) values ('Ana', 122.10);
insert into item_venda (id_venda, id_produto, quantidade, preco_unitario, subtotal) values 
(6, 20, 2, 4.20, 8.40),
(6, 5, 4, 16.90, 67.60),
(6, 12, 3, 6.50, 19.50),
(6, 2, 3, 4.20, 12.60),
(6, 4, 4, 3.50, 14.00);

-- Venda 7: Carlos
insert into venda (cliente, total) values ('Carlos', 25.20);
insert into item_venda (id_venda, id_produto, quantidade, preco_unitario, subtotal) values 
(7, 2, 4, 4.20, 16.80),
(7, 20, 2, 4.20, 8.40);

-- Venda 8: Diana
insert into venda (cliente, total) values ('Diana', 272.80);
insert into item_venda (id_venda, id_produto, quantidade, preco_unitario, subtotal) values 
(8, 1, 2, 11.50, 23.00),
(8, 17, 3, 5.50, 16.50),
(8, 11, 2, 10.90, 21.80),
(8, 9, 3, 12.50, 37.50),
(8, 8, 3, 58.00, 174.00);

-- Venda 9: Eduardo
insert into venda (cliente, total) values ('Eduardo', 94.40);
insert into item_venda (id_venda, id_produto, quantidade, preco_unitario, subtotal) values 
(9, 9, 3, 12.50, 37.50),
(9, 3, 3, 9.80, 29.40),
(9, 1, 1, 11.50, 11.50),
(9, 15, 4, 4.00, 16.00);

-- Venda 10: Fernanda
insert into venda (cliente, total) values ('Fernanda', 77.50);
insert into item_venda (id_venda, id_produto, quantidade, preco_unitario, subtotal) values 
(10, 3, 2, 9.80, 19.60),
(10, 5, 1, 16.90, 16.90),
(10, 12, 1, 6.50, 6.50),
(10, 1, 3, 11.50, 34.50);

------------------------------------------------------------------

---------------
-- CONSULTAS --
---------------

-- C1: Lista de produtos com categorias
/*
  Exibe o nome de todos os produtos, categoria a qual pertencem e a unidade de medida.
 */
select
	p.nome as nome_produto,
	c.nome as categoria,
	p.unidade
from produto p
left join categoria c on p.id_categoria = c.id_categoria
order by c.nome, p.nome;

-- C2: Estoque Atual de Todos os Produtos
/*
 Exibe o estoque atual e mínimo de todos os produtos.
 */
select
	p.nome as nome_produto,
	e.quantidade as quantidade_estoque,
	e.estoque_minimo
from produto p
inner join estoque e on p.id_produto = e.id_produto
order by e.quantidade asc;

-- C3: Histórico Completo de Preços
/*
 Lista o histórico de alteração dos preços de todos os produtos, incluindo o motivo da alteração.
 */
select
	p.nome as nome_produto,
	hp.preco as preco,
	hp.data_inicio as data_inicio,
	hp.motivo as motivo
from produto p
inner join historico_preco hp on hp.id_produto = p.id_produto
order by p.nome, hp.data_inicio desc;

-- C4: Preço Atual de Cada Produto
/*
 Exibe o preço atual de cada produto, considerando o registro mais recente na tabela de historico_preco.
 */
select
	p.nome as nome_produto,
	hp.preco as preco,
	hp.data_inicio as data_vigencia
from produto p
join historico_preco hp on hp.id_produto = p.id_produto
where hp.data_inicio = (select MAX(h2.data_inicio) from historico_preco h2
where h2.id_produto = p.id_produto)
order by p.nome asc;

-- C5: Total de Vendas por Período
/*
 Exibe o total de cada venda, com data, nome do cliente e a quantidade de itens comprados pelo cliente.
 */
select
	v.id_venda,
	v.data_venda,
	v.cliente,
	v.total as total_venda,
	count(distinct iv.id_produto) as qtd_itens
from venda v
inner join item_venda iv on v.id_venda = iv.id_venda
group by v.id_venda, v.data_venda, v.cliente, v.total
order by data_venda desc;

-- C6: Produto Mais Vendido
/*
 Exibe os produtos mais vendidos e sua categoria.
 */
select
	p.nome as nome_produto,
	c.nome as categoria_produto,
	sum(iv.quantidade) as total_unidades_vendidas
from produto p
inner join item_venda iv on p.id_produto  = iv.id_produto
inner join categoria c on p.id_categoria = c.id_categoria
group by p.nome, c.nome
order by total_unidades_vendidas desc
limit 5;

-- C7: Produtos com Estoque Crítico
/*
 Lista os produtos com estoque crítico e seu preço atual.
 */
select 
	p.nome as nome_produto, 
	e.quantidade as quantidade_atual, 
	e.estoque_minimo,
	(select hp.preco from historico_preco hp
	where hp.id_produto = p.id_produto 
	order by hp.data_inicio desc 
	limit 1) as preco_atual
from produto p
inner join estoque e on p.id_produto = e.id_produto
where e.quantidade < e.estoque_minimo
order by  e.quantidade asc, p.nome;

-- C8: Faturamento Total por Categoria
/*
 Calcula o faturamento total por categoria de produto.
 */
select
	c.nome as categoria,
	sum(iv.subtotal) as faturamento_total,
	sum(iv.quantidade) as total_itens_vendidos
from categoria c
inner join produto p on c.id_categoria  = p.id_categoria
inner join item_venda iv on p.id_produto = iv.id_produto
group by c.nome
order by faturamento_total desc;

-------------------------------------------------------

---------------------------------------------
-- DESAFIO FINAL - Regra de Negócio Dinâmica
---------------------------------------------
-- 01: Identificar os Produtos Afetados
/*
 Exibe o nome de todos os produtos com estoque crítico e preço atual.
 */
select
	p.nome as nome_produto,
	e.quantidade,
	hp.preco as preco_atual
from produto p
inner join estoque e on p.id_produto = e.id_produto
inner join historico_preco hp on p.id_produto  = hp.id_produto
where e.quantidade < 10 and hp.data_inicio = (
    select max(data_inicio) 
    from historico_preco h 
    where h.id_produto = p.id_produto
);

-- 02: Calcular o Novo Preço
/*
 Calcula e exibe os produtos com estoque crítico e o aumento de 15% no preço.
 */
select
	p.nome as nome_produto,
	e.quantidade,
	hp.preco * 1.15 as preco_com_aumento
from produto p
inner join estoque e on p.id_produto = e.id_produto
inner join historico_preco hp on p.id_produto  = hp.id_produto
where e.quantidade < 10 and hp.data_inicio = (
    select max(data_inicio) 
    from historico_preco h 
    where h.id_produto = p.id_produto
);

-- 03: Registrar no Histórico de Preços
/*
 Insere um novo registro na tabela historico_preco para os produtos com estoque crítico.
 */
insert into historico_preco (id_produto, preco, motivo)
select 
	p.id_produto, 
	hp.preco * 1.15, 
	'Ajuste automático: estoque crítico (< 10 unidades)'
from produto p
inner join estoque e on p.id_produto = e.id_produto
inner join historico_preco hp on p.id_produto = hp.id_produto
where e.quantidade < 10 
and hp.data_inicio = (select max(data_inicio) from historico_preco h where h.id_produto = p.id_produto);

-- 04: Validar a Alteração
/*
 Valida a atualização dos preços, exibindo a alteração na data_vigencia e o preço.
 */
select
	p.nome as nome_produto,
	hp.preco as preco,
	hp.data_inicio as data_vigencia
from produto p
join historico_preco hp on hp.id_produto = p.id_produto
where hp.data_inicio = (select max(h2.data_inicio) from historico_preco h2
where h2.id_produto = p.id_produto)
order by p.nome asc;


/*
 Exibe os produtos com estoque crítico após a atualização dos preços.
 */
select
	p.nome as nome_produto,
	e.quantidade,
	e.estoque_minimo,
	max(hp.preco) as preco_atual
from produto p
inner join estoque e on p.id_produto = e.id_produto
inner join historico_preco hp on p.id_produto = hp.id_produto
where e.quantidade < e.estoque_minimo
group by p.nome, e.quantidade, e.estoque_minimo;


