create database colegio;
use colegio;

create table usuario(
id int auto_increment not null,
login varchar(100) null,
senha varchar(100) null,
nome varchar(200) null,
email varchar(100),
primary key(id));

create table licoes(
idli int auto_increment not null,
nomecurso varchar(100) null,
modulo int null,
licao varchar(100) null,
nlicao int null,
estatus boolean null,
nivel int null,
video varchar(100) null,
usercurso int not null,
primary key(idli),
foreign key(usercurso) references usuario(id));

##ações com CRUD - Create, Read, Update e delete
#Inserir dados - insert

insert into usuario (id, login, senha, nome, email) values ('larisa', '123456', 'larisa santos', 'larisa123@gmail.com');

 insert into usuario values
(2,'leticia', '85456248', 'leticia santos', 'leticinha45@gmail.com'),
(3,'livia', '123456', 'livia mendonca', 'liviamed3@gmail.com'),
(4,'lais', '123456', ' lais santos', 'lais123@gmail.com');

select * from usuario;

select * from usuario where id = 1;
##ou
select * from usuario where login = 'larisa' and senha = '123456';

update usuario set nome = 'lais' where id = 4;

##delete-apagar
delete from usuario where id = 2;




 