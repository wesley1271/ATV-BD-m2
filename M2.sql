create database umc;
use umc;

create table aluno (
    rgm int primary key,
    nome varchar (100),
    dt_nasc date
);

create table disciplina (
    codigo int primary key,
    nome varchar(100),
    numero_creditos int
);


CREATE TABLE aluno_disciplina (
    rgm int,
    codigo int,
    p1 decimal(4,2),
    p2 decimal(4,2),
    media decimal(4,2),
    faltas int,
    primary key (rgm, codigo),
    foreign key (rgm) references Aluno(rgm),
    foreign key (codigo) references Disciplina(codigo)
);

INSERT INTO Aluno (rgm, nome, dt_nasc) VALUES
(101, 'Lucas Silva', '2001-04-12'),
(102, 'Mariana Souza', '2000-09-23'),
(103, 'João Pereira', '1999-02-15'),
(104, 'Ana Costa', '2002-06-30'),
(105, 'Rafael Lima', '2001-12-11');

INSERT INTO Disciplina (codigo, nome, numero_creditos) VALUES
(1, 'Banco de Dados', 4),
(2, 'Programação Web', 5),
(3, 'Estrutura de Dados', 4),
(4, 'Engenharia de Software', 3),
(5, 'Redes de Computadores', 4);

INSERT INTO aluno_disciplina (rgm, codigo, p1, p2, media, faltas) VALUES
(101, 1, 8.0, 7.0, NULL, 2),
(102, 1, 6.0, 9.0, NULL, 1),
(103, 2, 7.5, 8.5, NULL, 3),
(104, 3, 9.0, 8.0, NULL, 0),
(105, 4, 5.5, 6.0, NULL, 4);

SET SQL_SAFE_UPDATES = 0;
update aluno_disciplina
set media = (p1 + p2) / 2;

alter table aluno
modify nome varchar(100) not null;

alter table disciplina
modify nome varchar(100) not null;

select nome, numero_creditos
from disciplina
order by numero_creditos desc, nome asc;

alter table aluno
add telefone varchar(15)
check (telefone regexp '^[0-9]+$');

UPDATE Aluno SET telefone = '11987654321' WHERE rgm = 101;
UPDATE Aluno SET telefone = '11965432178' WHERE rgm = 102;
UPDATE Aluno SET telefone = '11999887766' WHERE rgm = 103;
UPDATE Aluno SET telefone = '21988776655' WHERE rgm = 104;
UPDATE Aluno SET telefone = '11912345678' WHERE rgm = 105;

alter table aluno
change dat_nasc nascimento date;

alter table disciplina
drop column numero_creditos;

create table usuarios (
id_usuario int primary key,
rgm int,
login varchar(50) not null,
senha varchar(50) not null,
nivel_acesso int check (nivel_acesso in (1, 2, 3)),
foreign key (rgm) references aluno(rgm) 
);

create database umc;
 
use umc;
create table aluno (
    rgm int primary key,
    nome varchar (100),
    dat_nasc date
);
create table disciplina (
    codigo int primary key,
    nome varchar(100),
    numero_creditos int
);

CREATE TABLE aluno_disciplina (
    rgm int,
    codigo int,
    p1 decimal(4,2),
    p2 decimal(4,2),
    media decimal(4,2),
    faltas int,
    primary key (rgm, codigo),
    foreign key (rgm) references Aluno(rgm),
    foreign key (codigo) references Disciplina(codigo)
);
INSERT INTO Aluno (rgm, nome, dat_nasc) VALUES
(101, 'Lucas Silva', '2001-04-12'),
(102, 'Mariana Souza', '2000-09-23'),
(103, 'João Pereira', '1999-02-15'),
(104, 'Ana Costa', '2002-06-30'),
(105, 'Rafael Lima', '2001-12-11');
INSERT INTO Disciplina (codigo, nome, numero_creditos) VALUES
(1, 'Banco de Dados', 4),
(2, 'Programação Web', 5),
(3, 'Estrutura de Dados', 4),
(4, 'Engenharia de Software', 3),
(5, 'Redes de Computadores', 4);
INSERT INTO aluno_disciplina (rgm, codigo, p1, p2, media, faltas) VALUES
(101, 1, 8.0, 7.0, NULL, 2),
(102, 1, 6.0, 9.0, NULL, 1),
(103, 2, 7.5, 8.5, NULL, 3),
(104, 3, 9.0, 8.0, NULL, 0),
(105, 4, 5.5, 6.0, NULL, 4);
SET SQL_SAFE_UPDATES = 0;
update aluno_disciplina
set media = (p1 + p2) / 2;
alter table aluno
modify nome varchar(100) not null;
alter table disciplina
modify nome varchar(100) not null;
select nome, numero_creditos
from disciplina
order by numero_creditos desc, nome asc;
alter table aluno
add telefone varchar(15)
check (telefone regexp '^[0-9]+$');
UPDATE Aluno SET telefone = '11987654321' WHERE rgm = 101;
UPDATE Aluno SET telefone = '11965432178' WHERE rgm = 102;
UPDATE Aluno SET telefone = '11999887766' WHERE rgm = 103;
UPDATE Aluno SET telefone = '21988776655' WHERE rgm = 104;
UPDATE Aluno SET telefone = '11912345678' WHERE rgm = 105;
alter table aluno
change dat_nasc nascimento date;
alter table disciplina
drop column numero_creditos;
create table usuarios (
id_usuario int primary key,
rgm int,
login varchar(50) not null,
senha varchar(50) not null,
nivel_acesso int check (nivel_acesso in (1, 2, 3)),
foreign key (rgm) references aluno(rgm)
);
 
 
SELECT nome, telefone
FROM aluno
ORDER BY nome ASC;
 
INSERT INTO usuarios (id_usuario, rgm, login, senha, nivel_acesso) VALUES
(1, 101, 'lucas', '123', 2),
(2, 102, 'mariana', '123', 2),
(3, 103, 'joao', '123', 2),
(4, 104, 'ana', '123', 2),
(5, 105, 'rafael', '123', 2);
 
SELECT rgm, login
FROM usuarios
WHERE nivel_acesso = 3
ORDER BY rgm ASC;
 
SELECT d.nome AS disciplina, COUNT(ad.rgm) AS quantidade_alunos
FROM disciplina d
LEFT JOIN aluno_disciplina ad ON d.codigo = ad.codigo
GROUP BY d.nome
ORDER BY d.nome ASC;
 
SELECT d.nome AS disciplina, AVG(ad.media) AS media_geral
FROM disciplina d
LEFT JOIN aluno_disciplina ad ON d.codigo = ad.codigo
GROUP BY d.nome
ORDER BY d.nome ASC;
 
DELETE FROM usuarios
WHERE nivel_acesso = 1;