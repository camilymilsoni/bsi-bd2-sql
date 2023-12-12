CREATE TABLE Filme(
	codFilme INTEGER,
	nome VARCHAR(50) NOT NULL,
	genero VARCHAR(20) NOT NULL,
	dtaLanc DATE,
	CONSTRAINT pk_filme PRIMARY KEY (codFilme) 
);

CREATE TABLE Ator(
	idAtor INTEGER,
	nome VARCHAR(50) NOT NULL,
	dtaNasc DATE,
	CONSTRAINT pk_ator PRIMARY KEY (idAtor)
);

CREATE TABLE Cliente(
	codCliente INTEGER,
	nome VARCHAR(50) NOT NULL,
	rua VARCHAR(30),
	nro INTEGER,
	CEP INTEGER,
	cidade VARCHAR(40),
	CONSTRAINT pk_cliente PRIMARY KEY (codCliente)
);

CREATE TABLE telefoneCliente(
	telefone VARCHAR(13),
	codCliente INTEGER,
	CONSTRAINT pk_telefoneCliente PRIMARY KEY (telefone, codCliente),
	CONSTRAINT fk_telefoneCliente FOREIGN KEY (codCliente) REFERENCES Cliente
);

CREATE TABLE atorEstrelaFilme(
	idAtor INTEGER,
	codFilme INTEGER,
	CONSTRAINT pk_atorEstrelaFilme PRIMARY KEY (idAtor, codFilme),
	CONSTRAINT fk_ator FOREIGN KEY (idAtor) REFERENCES Ator,
	CONSTRAINT fk_filme FOREIGN KEY (codFilme) REFERENCES Filme
);

CREATE TABLE Exemplar(
	nroExemplar INTEGER,
	codFilme INTEGER,
	CONSTRAINT pk_exemplar PRIMARY KEY (nroExemplar, codFilme),
	CONSTRAINT fk_filme_exemplar FOREIGN KEY (codFilme) REFERENCES Filme
);

CREATE TABLE clienteAlugaExemplarFilme(
	codCliente INTEGER,
	codFilme INTEGER,
	nroExemplar INTEGER,
	dtaRet DATE,
	dtaDev DATE,
	CONSTRAINT pk_clienteAlugaExemplarFilme PRIMARY KEY (codCliente, codFilme, nroExemplar, dtaRet, dtaDev),
	CONSTRAINT fk_cliente FOREIGN KEY (codCliente) REFERENCES Cliente,
	CONSTRAINT fk_exemplar_filme FOREIGN KEY (nroExemplar, codFilme) REFERENCES Exemplar
);