drop database if exists construtora;
create database construtora;
use construtora;

create table departamento(
id_departamento int primary key,
nome_departamento varchar(32) not null
);

create table projeto(
id_projeto int primary key,
nome_projeto varchar(32) not null,
status_projeto varchar(7),
departamento_id int,
foreign key (departamento_id) references departamento(id_departamento)
);

create table funcionario(
matricula_funcionario int primary key,
nome_funcionario varchar(32) not null,
salario_funcionario float not null,
departamento_id int not null,
chefe_matricula int not null,

FOREIGN KEY (departamento_id) references departamento(id_departamento),
FOREIGN KEY (chefe_matricula) references funcionario(matricula_funcionario)
);

create table funcionario_projeto(
funcionario_matricula int,
projeto_id int,

primary key (funcionario_matricula, projeto_id),
foreign key (funcionario_matricula) references funcionario(matricula_funcionario),
foreign key (projeto_id) references projeto(id_projeto)
);

insert into departamento (id_departamento, nome_departamento) values
(1,'front end'),
(2,'back end'),
(3,'fullstack');

insert into projeto (id_projeto, nome_projeto, status_projeto, departamento_id) values
(101, 'crud java','pronto',1),
(102, 'crud javascript','pronto',2),
(103, 'crud spring web','fazendo',1),
(104, 'crud spring json','pronto',1),
(105, 'crud json java/js','fazendo',3),
(106, 'cadastro ajax', 'fazendo', 2);
SET FOREIGN_KEY_CHECKS=0;

insert into funcionario (matricula_funcionario, nome_funcionario, salario_funcionario, departamento_id, chefe_matricula) values
(10, 'lucas', 1100, 1, null),
(11, 'karolina', 9500, 3, null),
(12, 'matheus', 1400, 2, null),
(13, 'neiva', 2000, 3, null),
(14, 'bandida', 1300, 1, null),
(15, 'aladdin', 1700, 3, null),
(16, 'tigrinha', 2300, 2,null);

UPDATE funcionario SET chefe_matricula = 10 where matricula_funcionario = 10;
UPDATE funcionario SET chefe_matricula = 11 where matricula_funcionario = 11;
UPDATE funcionario SET chefe_matricula = 16 where matricula_funcionario = 12;
UPDATE funcionario SET chefe_matricula = 11 where matricula_funcionario = 13;
UPDATE funcionario SET chefe_matricula = 10 where matricula_funcionario = 14;
UPDATE funcionario SET chefe_matricula = 11 where matricula_funcionario = 15;
UPDATE funcionario SET chefe_matricula = 16 where matricula_funcionario = 16;

SET FOREIGN_KEY_CHECKS=1;


insert into funcionario_projeto (projeto_id, funcionario_matricula) values
(101, 10),
(101, 14),
(105, 11),
(105, 13),
(105, 15),
(105, 10),
(105, 14),
(102, 16),
(102, 12),
(103, 10),
(104, 10),
(104, 14),
(106, 11);

select projeto_id, nome_projeto, funcionario_matricula, nome_funcionario
from funcionario_projeto
left join funcionario on funcionario_matricula = matricula_funcionario
left join projeto on projeto_id = id_projeto
order by projeto_id;