CREATE TABLE departamento (
	id_departamento INTEGER,
	nome_departamento VARCHAR (255) NOT NULL,
	CONSTRAINT PK_DEP PRIMARY  KEY (id_departamento)
);

CREATE TABLE empregado (
	id_empregado INTEGER,
	nome_empregado VARCHAR (255),
	id_departamento INTEGER,
    CONSTRAINT PK_EMP PRIMARY  KEY (id_empregado),
    CONSTRAINT FK_EMP_DEP FOREIGN KEY (ID_DEPARTAMENTO) 
    references departamento
);

INSERT INTO departamento VALUES (1, 'Sales'),
								(2, 'Marketing'),
								(3, 'HR'),
								(4, 'IT'),
								(5, 'Production');
								
INSERT INTO empregado VALUES (1, 'Bette Nicholson', 1),
							 (2, 'Christian Gable', 1),
							 (3, 'Joe Swank', 2),
							 (4, 'Fred Costner', 3),
							 (5, 'Sandra Kilmer', 4),
							 (6, 'Julia Mcqueen', null);
							 
--Faça uma consulta que retorne o nome do departamento que não tem empregado.
SELECT d.nome_departamento, e.id_empregado
FROM departamento d
LEFT OUTER JOIN empregado e ON d.id_departamento = e.id_departamento
WHERE e.id_empregado IS NULL;

SELECT d.nome_departamento, e.nome_empregado
FROM departamento d
LEFT OUTER JOIN empregado e ON d.id_departamento = e.id_departamento
WHERE e.id_departamento IS NULL;

--Verifique se tem algum empregado que não está vinculado a um departamento. Selecione o nome do departamento e do empregado.
SELECT e.nome_empregado, d.nome_departamento
FROM empregado e
LEFT OUTER JOIN departamento d ON e.id_departamento = d.id_departamento
WHERE d.nome_departamento IS NULL;

--Faça uma consulta que verifique se tem algum departamento sem empregado e se algum empregado não está vinculado a um departamento.
SELECT d.nome_departamento, e.nome_empregado
FROM departamento d
FULL OUTER JOIN empregado e ON d.id_departamento = e.id_departamento
WHERE d.id_departamento IS NULL OR e.id_departamento IS NULL;