use MyCloset

--SELECTS

select * from usuarios;
select * from pe�as;
select * from looks;
select * from categorias;

select distinct u.nome, u.ocupacao, p�.nome_pecas, p�.tamanho, c.nome_categoria from usuarios u
inner join pe�as p� on p�.id_usuario=u.id_usuario and u.id_usuario=1
inner join categorias c on c.id_usuario=u.id_usuario


--TABELA USU�RIOS

create table usuarios
(
id_usuario int PRIMARY KEY NOT NULL, 
id_pe�as int NOT NULL,
id_looks int NOT NULL,
id_categorias int NOT NULL, 
nome varchar (200) NOT NULL,
sexo char(1) NULL, 
estado_civil varchar (15) NOT NULL,
ocupacao varchar (200) NOT NULL,
salario numeric (15,2), 
hobbies varchar (200) NOT NULL, 
aplicativos varchar (200) NOT NULL, 
data_cadastro datetime NOT NULL, 
login_cadastro varchar(15)NOT NULL
); 

INSERT into usuarios
(id_usuario, id_pe�as, id_looks,id_categorias, nome, sexo, estado_civil, ocupacao, salario, hobbies, aplicativos, data_cadastro, login_cadastro)
values
(1,1,1,1,'Joana','F', 'solteira','Mestrado na �rea de Arquitetura','2500','Ler', 'Instagram','21/09/2023', 'personas');
INSERT into usuarios
(id_usuario, id_pe�as, id_looks,id_categorias, nome, sexo, estado_civil, ocupacao, salario, hobbies, aplicativos, data_cadastro, login_cadastro)
values
(2,2,2,2,'Laura','F', 'Noiva','M�dica','12000','viajar', 'Twitter','21/09/2023', 'personas');
INSERT into usuarios
(id_usuario, id_pe�as, id_looks,id_categorias, nome, sexo, estado_civil, ocupacao, salario, hobbies, aplicativos, data_cadastro, login_cadastro)
values
(3,3,3,3,'Clara','F', 'casada','Empres�ria','20000','correr', 'Pinterest','21/09/2023', 'personas');

select * from usuarios

--TABELA PE�AS: --camisetas, blusas, cal�as, saias, vestidos, casacos, jaquetas, shorts, macac�es, e acess�rios como chap�us, cintos�e�bolsas.

create table pe�as 
(
id_pe�as int PRIMARY KEY NOT NULL,
id_usuario varchar (200) not null,
id_looks int  NOT NULL,
id_categorias int NOT NULL, 
nome_pecas varchar (200) not null,
cor varchar (200) not null,
tamanho varchar (200) not null,
tecido varchar (200) not null,
data_cadastro datetime  NOT NULL,
login_cadastro varchar(15),
); 

--CONSTRAINT USU�RIOS X PE�AS

alter table usuarios add constraint fk_pe�as foreign key (id_pe�as) references pe�as (id_pe�as);


INSERT into pe�as
(id_pe�as, id_usuario, id_looks, id_categorias, nome_pecas, cor, tamanho, tecido, data_cadastro, login_cadastro)
values
(1,1,1,1, 'cal�a', 'azul escuro', 'P', 'jeans','23/09/2023', 'pe�as'); 
INSERT into pe�as
(id_pe�as, id_usuario, id_looks, id_categorias, nome_pecas, cor, tamanho, tecido, data_cadastro, login_cadastro)
values
(2, 2,2,2, 'camiseta', 'bege', 'PP', 'algod�o','23/09/2023', 'pe�as'); 
INSERT into pe�as
(id_pe�as, id_usuario, id_looks, id_categorias, nome_pecas, cor, tamanho, tecido, data_cadastro, login_cadastro)
values
(3,3,3,3, 'terninho', 'preto', 'M', 'linho','23/09/2023', 'pe�as'); 
INSERT into pe�as
(id_pe�as, id_usuario, id_looks, id_categorias, nome_pecas, cor, tamanho, tecido, data_cadastro, login_cadastro)
values
(4,1,3,3, 'regata', 'rosa', 'M', 'algod�o','23/09/2023', 'pe�as'); 
INSERT into pe�as
(id_pe�as, id_usuario, id_looks, id_categorias, nome_pecas, cor, tamanho, tecido, data_cadastro, login_cadastro)
values
(5,2,2,3, 'jaqueta', 'laranja', 'M', 'couro','23/09/2023', 'pe�as'); 

select * from pe�as

--TABELA LOOKS: 1. casual, 2. formal, 3. esportivo, 4. elegante, 5. boho

create table looks 
(
id_looks int PRIMARY KEY NOT NULL,
id_usuario  int not null,
id_pe�as int NOT NULL,
id_categorias int NOT NULL, 
nome_looks varchar (200) not null,
data_cadastro datetime  NOT NULL,
login_cadastro varchar(15),
);

--CONSTRAINT USUARIOS X LOOKS

alter table usuarios add constraint fk_usuario_lk foreign key (id_looks)  references looks (id_looks);

INSERT into looks
(id_looks, id_usuario, id_pe�as,id_categorias, nome_looks, data_cadastro, login_cadastro)
values
(1, 1,1,1, 'casual','23/09/2023', 'looks')
INSERT into looks
(id_looks, id_usuario, id_pe�as,id_categorias, nome_looks, data_cadastro, login_cadastro)
values
(2,2,2,2, 'formal','23/09/2023', 'looks')
INSERT into looks
(id_looks, id_usuario, id_pe�as,id_categorias, nome_looks, data_cadastro, login_cadastro)
values
(3,3,3,3, 'esportivo','23/09/2023', 'looks');

select * from looks

--TABELAS CATEGORIAS : 1. novas, 2. usadas, 3. doa��o, 4. favoritas

create table categorias  
(
id_categoria int PRIMARY KEY NOT NULL,
id_pe�as  int not null,
id_usuario  int not null,
id_looks int NOT NULL,
nome_categoria varchar (200) not null,
data_cadastro datetime  NOT NULL,
login_cadastro varchar(15),
);

--CONSTRAINT USUARIOSXCATEGORIAS

alter table usuarios add constraint fk_usuario_cat foreign key (id_categorias) references categorias (id_categoria);


select * from categorias

insert into categorias
(id_categoria,	id_pe�as , id_usuario, id_looks, nome_categoria, data_cadastro, login_cadastro)
values 
(1, 1, 1,1, 'novas', '23/09/2023', 'categorias');
insert into categorias
(id_categoria,	id_pe�as , id_usuario, id_looks, nome_categoria, data_cadastro, login_cadastro)
values 
(2, 2, 2,2, 'usadas', '23/09/2023', 'categorias');
insert into categorias
(id_categoria,	id_pe�as , id_usuario, id_looks, nome_categoria, data_cadastro, login_cadastro)
values 
(3, 3, 3,3, 'doa�ao', '23/09/2023', 'categorias');
insert into categorias
(id_categoria,	id_pe�as , id_usuario, id_looks, nome_categoria, data_cadastro, login_cadastro)
values 
(4, 4, 4,4, 'favoritas', '23/09/2023', 'categorias');

select p�.id_usuario,  u.nome, p�.nome_pecas, p�.tamanho, lk.nome_looks from pe�as p�
inner join looks lk on lk.id_pe�as=p�.id_pe�as
inner join usuarios u on u.id_usuario=p�.id_usuario

select count (p�.nome_pecas) as Pe�as from pe�as p�
group by p�.nome_pecas;

select count (c.nome_categoria) as categorias, u.nome,c.data_cadastro, p�.nome_pecas from categorias c
join usuarios u on u.id_usuario=c.id_usuario
join pe�as p� on p�.id_pe�as=c.id_pe�as
group by c.nome_categoria, u.nome,c.data_cadastro, c.login_cadastro, p�.nome_pecas;
