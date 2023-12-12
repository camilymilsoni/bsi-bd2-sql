CREATE TABLE Proprietario(
	codPropri INTEGER,
	nome VARCHAR(50) NOT NULL,
	CONSTRAINT pk_propri PRIMARY KEY (codPropri)
);

CREATE TABLE Veiculo(
	placa VARCHAR(7),
	modelo VARCHAR(20) NOT NULL,
	ano_fabricacao DATE,
	CONSTRAINT pk_veiculo PRIMARY KEY (placa) 
);

CREATE TABLE proprietarioVeiculo(
	cod_propri INTEGER,
	placa VARCHAR(7),
	CONSTRAINT pk_proprietarioVeiculo PRIMARY KEY (cod_propri, placa),
	CONSTRAINT fk_propri FOREIGN KEY (cod_propri) REFERENCES Proprietario,
	CONSTRAINT fk_veiculo FOREIGN KEY (placa) REFERENCES Veiculo
);

CREATE TABLE Fisico(
	cod_propri INTEGER,
	cpf VARCHAR(13) NOT NULL,
	CONSTRAINT pk_fisico PRIMARY KEY (cod_propri),
	CONSTRAINT fk_propri FOREIGN KEY (cod_propri) REFERENCES Proprietario
);

CREATE TABLE Juridico(
	cod_propri INTEGER,
	cnpj VARCHAR(20) NOT NULL,
	CONSTRAINT pk_juridico PRIMARY KEY (cod_propri),
	CONSTRAINT fk_propri FOREIGN KEY (cod_propri) REFERENCES Proprietario
);