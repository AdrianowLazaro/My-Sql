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

SELECT * FROM CLIENTES;

INSERT INTO FUNCIONARIO (id_funcionario, nome, salario, departamento) VALUES
(1, 'Ana Oliveira', 5500.00, 'Recursos Humanos'),
(2, 'Carlos Silva', 6000.00, 'Desenvolvimento'),
(3, 'Fernanda Souza', 4500.00, 'Marketing'),
(4, 'João Santos', 5000.00, 'Vendas'),
(5, 'Mariana Costa', 7000.00, 'Financeiro');

SELECT * FROM FUNCIONARIO;

INSERT INTO VEICULOS (marca, placa, valor, modelo, ano) VALUES
('Toyota', 'ABC1234', 75000.00, 'Corolla', 2021),
('Fiat', 'XYZ5678', 85000.00, 'Civic', 2022),
('Ford', 'LMN9101', 65000.00, 'Focus', 2020);

SELECT * FROM VEICULOS;

INSERT INTO VEICULO_VENDA VALUES
(default, 50000, 3, 5, 1, '2024-09-11'),
(default, 60000, 2, 4, 2, '2024-08-11'),
(default, 90000, 1, 1, 3, '2024-09-11');

SELECT * FROM veiculo_venda;

SELECT nome_cliente, valor_venda, data_venda
from veiculo_venda
inner join clientes ON veiculos_venda.cliente_id = clientes.id_cliente;
