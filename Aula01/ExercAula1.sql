CREATE TABLE Curso(
	idCurso INTEGER,
	nomeCurso VARCHAR(30),
	nroSemestres INTEGER,
	dtaFundacao DATE,
	CONSTRAINT pk_curso PRIMARY KEY (idCurso)
);

CREATE TABLE Aluno(
	prontuario VARCHAR(30),
	nome VARCHAR(30),
	dtaNasc DATE,
	sexo CHAR(1),
	idCurso INTEGER,
	CONSTRAINT pk_aluno PRIMARY KEY (prontuario),
	CONSTRAINT fk_curso FOREIGN KEY (idCurso) REFERENCES Curso(idCurso)
);

INSERT INTO Curso(idCurso, nomeCurso, nroSemestres, dtaFundacao) VALUES (1, 'Ciência da Computação', 8, '1986-03-01'),
																		(2, 'Direito', 8, '1975-12-14'),
																		(3, 'Medicina', 12, '2000-07-05'),
																		(4, 'Engenharia Elétrica', 10, '1996-12-10'),
																		(5, 'Biologia', 8, '1993-06-06'),
																		(6, 'Matemática', 8, '1968-07-01');

INSERT INTO Aluno(prontuario, nome, dtaNasc, sexo, idCurso) VALUES ('11aa', 'Paulo', '1986-07-01', 'M', 1),
																   ('11bb', 'Ana', '1990-07-08', 'F', 5),
																   ('11cc', 'Júlio', '1980-05-08', 'M', 3),
																   ('11dd', 'Carlos', '1983-11-10', 'M', 2),
																   ('11ee', 'Gabriele', '1990-05-08', 'F', 3),
																   ('11ff', 'Antônio', '1955-06-15', 'M', 4),
																   ('11gg', 'Ana', '1975-12-08', 'F', 5),
																   ('11hh', 'Mara', '1970-07-07', 'F', 1),
																   ('11ii', 'Roberto', '1956-07-01', 'M', 3),
																   ('11jj', 'Carmen', '1950-02-03', 'F', 2);

INSERT INTO Aluno(prontuario, nome, dtaNasc, sexo, idCurso) VALUES ('11kk', 'Pedro Roberto', '2000-01-11', 'M', 3);

DELETE FROM Aluno WHERE idCurso = 2;

DELETE FROM Curso WHERE idCurso = 2;

UPDATE Aluno SET nome = 'Ana Paula' WHERE prontuario = '11gg';

SELECT * FROM Aluno;

SELECT * FROM Curso;