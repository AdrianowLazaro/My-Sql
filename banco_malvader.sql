create table usuario(
id_usuario int unsigned not null auto_increment primary key unique,
nome_usuario varchar(100),
cpf varchar(11),
data_nascimento_usuario date,
telefone varchar(15),
tipo_usuario enum ('FUNCIONARIO', 'CLIENTE'),
senha varchar(50)
);


create table funcionario(
id_funcionario int unsigned not null auto_increment primary key unique,
usuario_id int unsigned not null,
codigo_funcionario varchar(20),
cargo varchar(50),
constraint fk_usuario_id foreign key (usuario_id) references usuario (id_usuario)
);

create table cliente(
id_cliente int unsigned not null auto_increment primary key unique,
cliente_usuario_id int unsigned not null,
constraint fk_cliente_usuario_id foreign key (cliente_usuario_id) references usuario (id_usuario)
);

create table endereco(
id_endereco int unsigned not null auto_increment primary key unique,
endereco_usuario_id int unsigned not null,
cep varchar(50),
endereco_local varchar(100),
numero_casa int,
bairro varchar(50),
cidade varchar(50),
estado varchar(2),
constraint fk_endereco_usuario_id foreign key (endereco_usuario_id) references usuario (id_usuario)
);

create table conta(
id_conta int unsigned not null auto_increment primary key unique,
conta_cliente_id int unsigned not null,
numero_conta varchar(20),
agencia varchar(10),
saldo decimal(15,2),
tipo_conta enum ('POUPANCA', 'CORRENTE'),
constraint fk_conta_cliente_id foreign key (conta_cliente_id) references cliente (id_cliente)
);


create table conta_corrente(
id_conta_corrente int unsigned not null auto_increment primary key unique,
conta_corrente_id int unsigned not null, #esta é a chave estrangeira da tabela conta!
limite decimal(15,2),
data_vencimento_cc date,
constraint fk_conta_corrente_id foreign key (conta_corrente_id) references conta (id_conta)
);

create table conta_poupanca(
id_conta_poupanca int unsigned not null auto_increment primary key unique,
conta_poupanca_id int unsigned not null,
taxa_rendimento decimal(5,2),
constraint fk_conta_poupanca_id foreign key (conta_poupanca_id) references conta (id_conta)
);

create table transacao(
id_transacao int unsigned not null auto_increment primary key unique,
conta_transacao_id int unsigned not null,
tipo_transacao enum('DEPOSITO', 'SAQUE', 'TRANSFERENCIA'),
valor_transacao decimal(15,2),
data_hora_transacao timestamp,
constraint fk_conta_transacao_id foreign key (conta_transacao_id) references conta (id_conta)
);

create table relatorio(
id_relatorio int unsigned not null auto_increment primary key unique,
relatorio_usuario_id int unsigned not null,
tipo_relatorio varchar(50),
data_geracao_relatorio timestamp,
conteudo_relatorio longtext,
constraint fk_relatorio_usuario_id foreign key (relatorio_usuario_id) references usuario (id_usuario)
);

INSERT INTO usuario (nome_usuario, cpf, data_nascimento_usuario, telefone, tipo_usuario, senha)
VALUES ('DOUGLAS', '12345678901', '1990-05-15', '11987654321', 'CLIENTE', '123');



insert into cliente (cliente_usuario_id) values (1);
select * from cliente;

SELECT * FROM USUARIO;

select 
us.id_usuario,
us.nome_usuario,
us.cpf,
cliente.cliente_usuario_id
from usuario as us
inner join cliente on cliente.id_cliente = us.id_usuario



