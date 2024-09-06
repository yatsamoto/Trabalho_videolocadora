create database videolocadora_FACEF_buster;
use videolocadora_FACEF_buster;

create table tbl_genero (
	id int not null primary key auto_increment,
    genero varchar(45) not null
);

create table tbl_diretor (
	id int not null primary key auto_increment,
    nome varchar(45) not null,
    nacionalidade varchar(45) not null,
    idade int not null
);

create table tbl_ator (
	id int not null primary key auto_increment,
    nome varchar(45) not null, 
    nacionalidade varchar(45) not null,
    idade int not null
);

create table tbl_cliente(
	id int not null primary key auto_increment,
    nome varchar(45) not null,
    telefone varchar(45) not null,
    email varchar(45) not null
);

create table tbl_filme(
	id int not null primary key auto_increment,
    nome varchar(45) not null,
    nacionalidade varchar(45) not null,
    ano_lancamento varchar(45) not null,
    avaliacao text not null,
    classificacao varchar(3) not null
);

create table tbl_filme_diretor(
	id int not null primary key auto_increment,
    id_diretor int not null,
    id_filme int not null,
    
    constraint FK_FILME_FILME_DIRETOR
    foreign key (id_filme)
    references tbl_filme(id),
    
    constraint FK_DIRETOR_ATOR_FILME
    foreign key (id_diretor)
    references tbl_diretor(id)
);

create table tbl_ator_filme (
	id int not null primary key auto_increment,
    id_ator int not null,
    id_filme int not null,
    
    constraint FK_ATOR_ATOR_FILME
    foreign key (id_ator)
    references tbl_ator(id),
    
    constraint FK_FILME_ATOR_FILME
    foreign key (id_filme)
    references tbl_filme(id)
);

create table tbl_filme_genero (
	id int not null primary key auto_increment,
    id_filme int not null,
    id_genero int not null,
    
	constraint FK_FILME_FILME_GENERO
    foreign key (id_filme)
    references tbl_filme(id),
    
    constraint FK_GENERO_FILME_GENERO
    foreign key (id_genero)
    references tbl_genero(id)
);

create table tbl_endereco (
	id int not null primary key auto_increment,
    logradouro varchar(45) not null,
    numero int not null,
    cep varchar (12) not null,
    cidade varchar (45) not null,
    estado varchar(45) not null,
    id_cliente int not null,
    
    constraint FK_CLIENTE_ENDERECO
    foreign key (id_cliente)
    references tbl_cliente(id)
);

create table tbl_aluguel(
	id int not null primary key auto_increment,
    data_aluguel date not null,
    valor float not null,
    id_cliente int not null,
    id_filme int not null,
    
    constraint FK_CLIENTE_ALUGUEL
    foreign key (id_cliente)
    references tbl_cliente(id),
	
    constraint FK_FILME_ALUGUEL
    foreign key (id_filme)
    references tbl_filme(id)
);

show tables;
select * from tbl_genero;

insert into tbl_genero (genero) values ('Romance');

