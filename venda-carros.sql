use vendas_de_veiculo;

select * from funcionario;

alter table clientes add constraint unique_cnh UNIQUE (cnh); 

create table clientes
(
id_cliente int unsigned not null auto_increment primary key,
nome varchar(45) not null, 
cnh varchar(20),
tipo_cliente varchar(15) not null,
check (tipo_cliente in ('fisica', 'juridica')),
cartao varchar(16)
);

create table veiculos
(
	id_veiculo int unsigned not null auto_increment primary key, 
	marca varchar(30) not null,
	placa varchar(7) not null unique,
	valor double not null,
	modelo varchar(20) not null,
	ano int unsigned not null
);

create table veiculo_venda
(
id_venda int unsigned not null auto_increment primary key,
valor_venda double not null,
veiculo_id int unsigned not null,
cliente_id int unsigned not null,
funcionario_id int unsigned not null,
data_venda date not null,
constraint fk_veiculo_id foreign key (veiculo_id) references veiculos (id_veiculo),
constraint fk_funcionario_id foreign key (funcionario_id) references funcionario (id_funcionario),
constraint fk_cliente_id foreign key (cliente_id) references clientes (id_cliente)
); 

DROP table veiculo_venda;

SHOW COLUMNS FROM clientes;
ALTER TABLE funcionario
CHANGE COLUMN id id_funcionario int unsigned not null;

ALTER TABLE veiculo_venda
ADD COLUMN cliente_id int unsigned not null;

insert into clientes (nome, cnh, tipo_cliente, cartao)
values ('Adriano', '123456', 'FISICA', 'CRÉDITO');

insert into clientes values 
(2,'Douglas', '789456', 'FISICA', '654784'),
(3,'Henrique', '789453', 'FISICA', '654783'),
(4,'Breno', '789452', 'FISICA', '654782'),
(5,'Danilo', '789451', 'FISICA', '654781');


INSERT INTO FUNCIONARIO (id_funcionario, nome, salario, departamento) VALUES
(1, 'Ana Oliveira', 5500.00, 'Recursos Humanos'),
(2, 'Carlos Silva', 6000.00, 'Desenvolvimento'),
(3, 'Fernanda Souza', 4500.00, 'Marketing'),
(4, 'João Santos', 5000.00, 'Vendas'),
(5, 'Mariana Costa', 7000.00, 'Financeiro');


INSERT INTO VEICULOS (marca, placa, valor, modelo, ano) VALUES
('Toyota', 'ABC1234', 75000.00, 'Corolla', 2021),
('Fiat', 'XYZ5678', 85000.00, 'Civic', 2022),
('Ford', 'LMN9101', 65000.00, 'Focus', 2020);


INSERT INTO VEICULO_VENDA VALUES
(default, 50000, 3, 5, 1, '2024-09-11'),
(default, 60000, 2, 4, 2, '2024-08-11'),
(default, 90000, 1, 1, 3, '2024-09-11');


/*3.	Consultas: Realize as seguintes consultas:
o	Selecione todos os dados das tabelas cliente, funcionario, veiculo, e veiculo_venda.
o	Liste todos os veículos vendidos, incluindo marca, modelo, ano, placa, valor de venda, data da venda, nome do cliente e nome do funcionário que realizou a venda.
o	Atualize o preço de um veículo da tabela veiculo.*/


SELECT * FROM veiculo_venda;
SELECT * FROM VEICULOS;
SELECT * FROM FUNCIONARIO;
SELECT * FROM CLIENTES;

UPDATE VEICULOS 
SET VALOR = 98.566
WHERE
ID_VEICULO = 1;


SELECT 
VEIC.MARCA AS 'MARCA DO VEÍCULO',
VEIC.MODELO AS 'MODELO DO VEÍCULO',
VEIC.ANO AS 'ANO DO VEÍCULO',
VEIC.PLACA AS 'PLACA DO VEÍCULO',
VENDAS.VALOR_VENDA AS 'VENDA',	
VENDAS.DATA_VENDA AS 'DATA DA VENDA',
CLI.NOME AS 'NOME DO CLIENTE',
FUNC.nome AS 'NOME DO FUNCIONÁRIO'
FROM 
	VEICULO_VENDA AS VENDAS
    INNER JOIN  VEICULOS AS VEIC ON VENDAS.VEICULO_ID = VEIC.ID_VEICULO
    INNER JOIN funcionario AS FUNC ON VENDAS.FUNCIONARIO_ID = FUNC.id_funcionario
    INNER JOIN clientes AS CLI ON VENDAS.CLIENTE_ID = CLI.id_cliente;
    
    
   
   /*4.	Desafio de Atualização e Consulta:
o	Atualize o registro de um veículo que ainda não foi vendido, atribuindo a ele uma venda existente.
o	Liste todos os veículos que foram vendidos após uma data específica (exemplo: vendas realizadas após 01/09/2024).
*/
   
    INSERT INTO VEICULOS (marca, placa, valor, modelo, ano) VALUE
    ('Honda', 'KKK5271', 11000.00, 'Civic', 2024);

	INSERT INTO VEICULO_VENDA VALUES
	(default, 50000, 8, 5, 1, '2024-09-11');
    
SELECT 
VEIC.MARCA AS 'MARCA DO VEÍCULO',
VEIC.MODELO AS 'MODELO DO VEÍCULO',
VEIC.ANO AS 'ANO DO VEÍCULO',
VEIC.PLACA AS 'PLACA DO VEÍCULO',
VENDAS.VALOR_VENDA AS 'VENDA',	
VENDAS.DATA_VENDA AS 'DATA DA VENDA',
CLI.NOME AS 'NOME DO CLIENTE',
FUNC.nome AS 'NOME DO FUNCIONÁRIO'
FROM 
	VEICULO_VENDA AS VENDAS
    INNER JOIN  VEICULOS AS VEIC ON VENDAS.VEICULO_ID = VEIC.ID_VEICULO
    INNER JOIN funcionario AS FUNC ON VENDAS.FUNCIONARIO_ID = FUNC.id_funcionario
    INNER JOIN clientes AS CLI ON VENDAS.CLIENTE_ID = CLI.id_cliente
    WHERE 
    DATA_VENDA > '2024-01-09'
