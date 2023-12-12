CREATE TABLE Curso(
	codCurso INTEGER,
	nome VARCHAR(50) NOT NULL,
	valor REAL,
	CONSTRAINT pk_curso PRIMARY KEY (codCurso)
);

CREATE TABLE Aluno(
	ra VARCHAR(10),
	nome VARCHAR(80) NOT NULL,
	endereco VARCHAR(100) NOT NULL,
	codCurso INTEGER,
	CONSTRAINT pk_aluno PRIMARY KEY (ra),
	CONSTRAINT fk_curso_aluno FOREIGN KEY (codCurso) REFERENCES Curso
);

CREATE TABLE Coordenador(
	cod_coord INTEGER,
	nome VARCHAR(50),
	codCurso INTEGER UNIQUE,
	CONSTRAINT pk_coordenador PRIMARY KEY (cod_coord),
	CONSTRAINT fk_curso_coord FOREIGN KEY (codCurso) REFERENCES Curso
);