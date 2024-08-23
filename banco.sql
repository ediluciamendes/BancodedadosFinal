create database banco_de_sangue;
use banco_de_sangue;
create table Endereco_doador(
	id_endereco int not null auto_increment,
	CEP int(15) not null,
    bairro varchar(50),
    rua varchar(50),
    referencia varchar(200),
    primary key (id_endereco)
);

create table Doadores(
	id_doador int NOT NULL AUTO_INCREMENT,
    Nome varchar(200) not null,
    Data_nascimento date,
    Grupo_sangueneo varchar(3) not null,
    Telefone varchar(20) not null,
    Email varchar(200),
    id_endereco int,
    primary key(id_doador),
	foreign key(id_endereco) references endereco_doador(id_endereco)
);

create table Endereco_paciente(
	id_endereco int not null auto_increment,
	CEP int(15) not null,
    bairro varchar(50),
    rua varchar(50),
    referencia varchar(200),
    primary key (id_endereco)
);

create table Pacientes(
	id_paciente int NOT NULL auto_increment,
    nome varchar(200) not null,
    data_nascimento date,
    grupo_sanguineo varchar(3),
    doenca varchar(300) not null,
    numero_identificacao int not null,
    id_endereco int,
    primary key(id_paciente),
    foreign key(id_endereco) references endereco_paciente(id_endereco)
);

create table bolsa_sangue(
	id_bolsa int not null auto_increment,
	id_doador int,
    data_doacao date,
    quantidade int not null,
    grupo_sanguineo varchar(3),
    primary key (id_bolsa),
    foreign key(id_doador) references Doadores(id_doador)
);

create table doacoes(
	id_doacao int not null auto_increment,
    id_doador int,
    data_doacao date,
    quantidade int not null,
    grupo_sanguineo varchar(3),
    primary key(id_doacao),
    foreign key(id_doador) references Doadores(id_doador)
);

create table transfusoes(
	id_transfusoes int not null auto_increment,
    id_paciente int,
    id_bolsa int,
    data_transfusoes date,
    quantidade int not null,
    primary key(id_transfusoes),
    foreign key(id_paciente) references Pacientes(id_paciente),
    foreign key(id_bolsa) references bolsa_sangue(id_bolsa)
);








