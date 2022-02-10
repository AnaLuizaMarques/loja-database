CREATE DATABASE handson;

USE handson;

CREATE TABLE cliente(

   id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 

   nome VARCHAR(100) NOT NULL, 

   email VARCHAR(70) NOT NULL UNIQUE, 

   senha VARCHAR(20) NOT NULL, 

   cpf VARCHAR(15) NOT NULL UNIQUE

);

CREATE TABLE departamento(

codigo INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 

nome   VARCHAR(50) NOT NULL, 

descricao TEXT

);

CREATE TABLE endereco(

num_seq    INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 

tipo       VARCHAR(5) , 

logradouro VARCHAR(45) , 

numero     INTEGER, 

complemento VARCHAR(20), 

bairro     VARCHAR(30), 

cidade     VARCHAR(50),

    estado     VARCHAR(2), 

cep        VARCHAR(10), 

cliente_id INTEGER NOT NULL,

CONSTRAINT endereco_cliente FOREIGN KEY AUTO_INCREMENT

(cliente_id) REFERENCES cliente(id)

);


CREATE TABLE pedido(

numero INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 

status VARCHAR(1) NOT NULL, 

data_pedido DATE, 

valor_bruto DOUBLE, 

desconto    DOUBLE, 

valor_final   DOUBLE, 

cliente_id INTEGER NOT NULL,

CONSTRAINT cliente_pedido FOREIGN KEY 

   (cliente_id) REFERENCES cliente(id)

);

CREATE TABLE produto(

codigo INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 

nome VARCHAR(45) NOT NULL, 

descricao TEXT, 

preco DOUBLE, 

estoque INTEGER, 

link_foto VARCHAR(255), 

    departamento_codigo INTEGER NOT NULL,

CONSTRAINT produto_depto FOREIGN KEY 

(departamento_codigo) REFERENCES departamento(codigo)

);

CREATE TABLE item_pedido(

num_sequencial INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 

quantidade INTEGER, 

valor_unitario DOUBLE, 

valor_total DOUBLE, 

produto_codigo INTEGER NOT NULL, 

pedido_numero INTEGER NOT NULL,

CONSTRAINT item_produto FOREIGN KEY 

(produto_codigo) REFERENCES produto(codigo),

CONSTRAINT item_pedido FOREIGN KEY 

    (pedido_numero) REFERENCES pedido(numero)

);


-- Questao 1

INSERT INTO cliente ( nome, email, senha, cpf) values ( 'Maria', 'ma@gmail.com', 123, '000.000.000-1');
INSERT INTO cliente ( nome, email, senha, cpf) values ('Ana', 'ana@gmail.com', 123, '000.000.000-2');
INSERT INTO cliente ( nome, email, senha, cpf) values ('Agatha', 'agatha@gmail.com', 123, '000.000.000-3');
INSERT INTO cliente ( nome, email, senha, cpf) values ('Gustavo', 'gustavo@gmail.com', 123, '000.000.000-4');
INSERT INTO cliente ( nome, email, senha, cpf) values ('Felipe', 'felipe@gmail.com', 123, '000.000.000-5');
INSERT INTO cliente ( nome, email, senha, cpf) values ('Joao', 'joao@gmail.com', 123, '000.000.000-6');
INSERT INTO cliente ( nome, email, senha, cpf) values ('Joana', 'joana@gmail.com', 123, '000.000.000-7');
INSERT INTO cliente ( nome, email, senha, cpf) values ( 'Luke', 'skaywalker@gmail.com', 124, '000.000.000-8');
INSERT INTO cliente ( nome, email, senha, cpf) values ( 'Camila', 'skaywalker@gmail.com', 124, '000.000.000-9');
INSERT INTO cliente ( nome, email, senha, cpf) values ( 'Pedro', 'skaywalker@gmail.com', 124, '000.000.001-0');

INSERT INTO endereco (numero, complemento, cliente_id ) values (10, "Rua das Arvores", 1 );
INSERT INTO endereco (numero, complemento, cliente_id ) values (102, "Rua das Flores", 2 );
INSERT INTO endereco (numero, complemento, cliente_id ) values (22, "Rua das Margaridas", 3 );
INSERT INTO endereco (numero, complemento, cliente_id ) values (203, "Rua das Esmeraldas", 4 );
INSERT INTO endereco (numero, complemento, cliente_id ) values (120, "Rua dos Ipês", 5 );
INSERT INTO endereco (numero, complemento, cliente_id ) values (230, "Rua das Tulipas", 6 );
INSERT INTO endereco (numero, complemento, cliente_id ) values (230, "Rua dos Passaros", 7 );
INSERT INTO endereco (numero, complemento, cliente_id ) values (230, "Rua dos Arbustos", 8 );
INSERT INTO endereco (numero, complemento, cliente_id ) values (230, "Rua dos Tamanduas", 9 );
INSERT INTO endereco (numero, complemento, cliente_id ) values (230, "Rua das Borboletas", 10 );

INSERT INTO departamento (codigo, nome) values (1 , 'Eletronicos');
INSERT INTO departamento (codigo, nome) values (2 , 'Eletrodomesticos');
INSERT INTO departamento (codigo, nome) values (3 , 'Brinquedos');
INSERT INTO departamento (codigo, nome) values (4 , 'Esportes');
INSERT INTO departamento (codigo, nome) values (5 , 'Escritório');
INSERT INTO departamento (codigo, nome) values (6 , 'Moveis');
INSERT INTO departamento (codigo, nome) values (7 , 'Utensilios de Cozinha');
INSERT INTO departamento (codigo, nome) values (8 , 'Livros');

INSERT INTO produto (codigo, nome, preco, estoque, departamento_codigo) values (1, 'Notebook', 2000.0, 10, 1);
INSERT INTO produto (codigo, nome, preco, estoque, departamento_codigo) values (2, 'Smartphone', 1000.0, 15, 1);
INSERT INTO produto (codigo, nome, preco, estoque, departamento_codigo) values (3, 'Kindle', 300.0, 8, 1);
INSERT INTO produto (codigo, nome, preco, estoque, departamento_codigo) values (4, 'Geladeira', 1500.0, 6, 2);
INSERT INTO produto (codigo, nome, preco, estoque, departamento_codigo) values (5, 'Fogao', 800.0, 8, 2);
INSERT INTO produto (codigo, nome, preco, estoque, departamento_codigo) values (6, 'Maquina de Lavar', 2300.0, 7, 2);
INSERT INTO produto (codigo, nome, preco, estoque, departamento_codigo) values (7, 'Boneca', 80.0, 6, 3);
INSERT INTO produto (codigo, nome, preco, estoque, departamento_codigo) values (8, 'Carrinho', 15.0, 6, 3);
INSERT INTO produto (codigo, nome, preco, estoque, departamento_codigo) values (9, 'Oculos de Natacao', 60.0, 5, 4);
INSERT INTO produto (codigo, nome, preco, estoque, departamento_codigo) values (10, 'Toca de Natacao', 30.0, 7, 4);
INSERT INTO produto (codigo, nome, preco, estoque, departamento_codigo) values (11, 'Bicicleta', 1000.0, 4, 4);
INSERT INTO produto (codigo, nome, preco, estoque, departamento_codigo) values (12, 'Mesa de Escritorio', 400.0, 7, 5);
INSERT INTO produto (codigo, nome, preco, estoque, departamento_codigo) values (13, 'Impressora', 400.0, 4, 5);
INSERT INTO produto (codigo, nome, preco, estoque, departamento_codigo) values (14, 'Entiquetador', 50.0, 8, 5);
INSERT INTO produto (codigo, nome, preco, estoque, departamento_codigo) values (15, 'Mesa de Jantar', 1500.0, 4, 6);
INSERT INTO produto (codigo, nome, preco, estoque, departamento_codigo) values (16, 'Sofa', 2500.0, 6, 6);
INSERT INTO produto (codigo, nome, preco, estoque, departamento_codigo) values (17, 'Aparador', 800.0, 5, 6);
INSERT INTO produto (codigo, nome, preco, estoque, departamento_codigo) values (18, 'Aparelho de Jantar', 300.0, 9, 7);
INSERT INTO produto (codigo, nome, preco, estoque, departamento_codigo) values (19, 'O morro dos ventos uivantes', 40.0, 15, 8);
INSERT INTO produto (codigo, nome, preco, estoque, departamento_codigo) values (20, 'O mercador de Veneza', 30.0, 10, 8);

INSERT INTO pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values (1, 's', '2022-01-06', 1000.0, 10.0, 990.0, 1);
INSERT INTO pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values (2, 's', '2022-01-15', 1500.0, 0, 1500.0, 2);
INSERT INTO pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values (3, 's', '2022-02-03', 2500.0, 100.0, 2400.0, 3);
INSERT INTO pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values (4, 's', '2022-02-09', 50.0, 0, 50.0, 4);
INSERT INTO pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values (5, 's', '2022-02-21', 30.0, 0, 30.0, 5);
INSERT INTO pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values (6, 's', '2022-03-25', 300.0, 0, 300.0, 6);
INSERT INTO pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values (7, 's', '2022-03-21', 800.0, 20.0, 780.0, 7);
INSERT INTO pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values (8, 's', '2022-04-16', 300.0, 0, 300.0, 8);
INSERT INTO pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values (9, 's', '2022-04-28', 2000.0, 0, 2000.0, 9);
INSERT INTO pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values (10, 's', '2022-05-22', 2300.0, 0, 2300.0, 10);
INSERT INTO pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values (11, 's', '2022-05-09', 60.0, 0, 60.0, 1);
INSERT INTO pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values (12, 's', '2022-05-21', 1500.0, 0, 1500.0, 2);
INSERT INTO pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values (13, 's', '2022-06-11', 40.0, 0, 40.0, 3);
INSERT INTO pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values (14, 's', '2022-06-10', 30.0, 0, 30.0, 4);
INSERT INTO pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values (15, 's', '2022-06-09', 2000.0, 0, 2000.0, 5);
INSERT INTO pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values (16, 's', '2022-06-08', 1000.0, 0, 1000.0, 6);
INSERT INTO pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values (17, 's', '2022-07-21', 800.0, 0, 800.0, 7);
INSERT INTO pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values (18, 's', '2022-08-04', 400.0, 0, 400.0, 8);
INSERT INTO pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values (19, 's', '2022-09-18', 1000.0, 0, 1000.0, 9);
INSERT INTO pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values (20, 's', '2022-10-05', 2000.0, 0, 2000.0, 10);
INSERT INTO pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values (21, 's', '2022-10-06', 80.0, 0, 80.0, 1);
INSERT INTO pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values (22, 's', '2022-10-07', 15.0, 0, 15.0, 2);
INSERT INTO pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values (23, 's', '2022-10-08', 80.0, 0, 80.0, 3);
INSERT INTO pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values (24, 's', '2022-10-09', 300.0, 0, 300.0, 4);
INSERT INTO pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values (25, 's', '2022-11-27', 2000.0, 0, 2000.0, 5);
INSERT INTO pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values (26, 's', '2022-12-20', 300.0, 0, 300.0, 6);
INSERT INTO pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values (27, 's', '2022-12-15', 1500.0, 0, 1500.0, 7);
INSERT INTO pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values (28, 's', '2022-12-18', 40.0, 0, 40.0, 8);
INSERT INTO pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values (29, 's', '2022-12-19', 30.0, 0, 30.0, 9);
INSERT INTO pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values (30, 's', '2022-12-23', 2300.0, 0, 2300.0, 10);

INSERT INTO item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (1, 1, 990.0, 990.0, 2, 1);
INSERT INTO item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (2, 1, 1500.0, 1500.0, 15, 2);
INSERT INTO item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (3, 1, 2500.0, 2400.0, 16, 3);
INSERT INTO item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (4, 2, 50.0, 100.0, 14, 4);
INSERT INTO item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (5, 1, 30.0, 30.0, 10, 5);
INSERT INTO item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (6, 2, 300.0, 600.0, 18, 6);
INSERT INTO item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (7, 1, 780.0, 780.0, 5, 7);
INSERT INTO item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (8, 3, 300.0, 900.0, 3, 8);
INSERT INTO item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (9, 1, 2000.0, 2000.0, 1, 9);
INSERT INTO item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (10, 1, 2300.0, 2300.0, 6, 10);
INSERT INTO item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (11, 2, 60.0, 120.0, 9, 11);
INSERT INTO item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (12, 1, 1500.0, 1500.0, 4, 12);
INSERT INTO item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (13, 1, 40.0, 40.0, 19, 13);
INSERT INTO item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (14, 1, 30.0, 30.0, 20, 14);
INSERT INTO item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (15, 1, 2000.0, 2000.0, 1, 15);
INSERT INTO item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (16, 1, 1000.0, 1000.0, 2, 16);
INSERT INTO item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (17, 1, 800.0, 800.0, 17, 17);
INSERT INTO item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (18, 1, 400.0, 400.0, 13, 18);
INSERT INTO item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (19, 1, 1000.0, 1000.0, 11, 19);
INSERT INTO item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (20, 1, 2000.0, 2000.0, 1, 20);
INSERT INTO item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (21, 1, 80.0, 80.0, 7, 21);
INSERT INTO item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (22, 2, 15.0, 30.0, 7, 22);
INSERT INTO item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (23, 2, 80.0, 160.0, 7, 23);
INSERT INTO item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (24, 1, 300.0, 300.0, 3, 24);
INSERT INTO item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (25, 1, 2000.0, 2000.0, 1, 25);
INSERT INTO item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (26, 1, 300.0, 300.0, 18, 26);
INSERT INTO item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (27, 1, 1500.0, 1500.0, 4, 27);
INSERT INTO item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (28, 1, 40.0, 40.0, 19, 28);
INSERT INTO item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (29, 1, 30.0, 30.0, 20, 29);
INSERT INTO item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (30, 1, 2300.0, 2300.0, 6, 30);


-- Questao 2
SELECT COUNT(*) FROM cliente;

-- Questao 3
SELECT pdt.nome Produto_mais_caro, (pdt.preco) Preco
  FROM produto pdt
  ORDER BY pdt.preco DESC LIMIT 1;


-- Questao 4
SELECT pdt.nome Produto_mais_barato, (pdt.preco) Preco
  FROM produto pdt
  ORDER BY pdt.preco ASC LIMIT 1;

-- Questao 5
SELECT pdt.nome Produto, dpto.nome Departamento
  FROM produto pdt
  INNER JOIN departamento dpto ON dpto.codigo = pdt.departamento_codigo;


-- Questao 6
SELECT dpto.nome Departamento, COUNT(pdt.departamento_codigo) Quantidade_pdt_departamento 
  FROM produto pdt
  INNER JOIN departamento dpto ON dpto.codigo = pdt.departamento_codigo
  GROUP BY dpto.nome;
    
-- Questao 7
SELECT pdd.numero Numero_pedido, clt.nome Nome_cliente, pdt.nome Nome_produto
  FROM pedido pdd
  INNER JOIN cliente clt ON clt.id = pdd.cliente_id
  INNER JOIN item_pedido ipdd ON ipdd.pedido_numero = pdd.numero
  INNER JOIN produto pdt ON pdt.codigo = ipdd.produto_codigo;

-- Questao 8
SELECT MONTH(data_pedido) Mes, COUNT(numero) Total_Pedidos FROM pedido
  WHERE YEAR(data_pedido) = 2022
  GROUP BY MONTH(data_pedido);

-- Questao 9
SELECT MONTH(data_pedido) Mes, SUM(valor_final) Total_faturado FROM pedido
  GROUP BY MONTH(data_pedido);

-- Questao 10
SELECT dpto.nome Departamento, SUM(pdt.estoque) Total_estoque 
  FROM departamento dpto
  INNER JOIN produto pdt ON pdt.departamento_codigo = dpto.codigo
  GROUP BY dpto.nome