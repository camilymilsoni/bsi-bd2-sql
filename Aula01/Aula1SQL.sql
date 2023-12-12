CREATE TABLE Aluno(
	pront_aluno VARCHAR(15),
	nome_aluno VARCHAR(40) NOT NULL,
	idade_aluno INTEGER,
	CONSTRAINT pk_aluno PRIMARY KEY (pront_aluno)
);

INSERT INTO Aluno(pront_aluno, nome_aluno, idade_aluno) VALUES('12AB', 'Pedro Antônio', 20), 
															('13CD', 'Ana Vasconcelos', 21),
															('14EF', 'Thiago Alves', 19),
															('15GH', 'Marcela Silva', 20);
															
DELETE FROM Aluno WHERE idade_aluno = 20;

INSERT INTO Aluno(pront_aluno, nome_aluno, idade_aluno) VALUES('12AB', 'Pedro Antônio', 20),
															  ('15GH', 'Marcela Silva', 20); 
															  
UPDATE Aluno SET idade_aluno = 21 WHERE pront_aluno = '12AB';

UPDATE Aluno SET nome_aluno = 'Nomes Iguais';

SELECT * FROM Aluno;