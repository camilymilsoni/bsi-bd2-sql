
CREATE TABLE marinheiros (id_marin integer PRIMARY KEY, nome_marin VARCHAR (40), avaliacao integer, idade integer);

INSERT INTO marinheiros VALUES (1,'Capitão Gancho', 8, 57),(2,'Alma Negra', 9, 37),
			(3,'Jack Sparrow', 5, 35),(4,'Marujo Frajuto', 3, 42),(5,'Barba Branca', 10, 67);

--INSERT INTO marinheiros VALUES (6,'Willy caolho', 8, 59)
CREATE TABLE barcos (id_barco INTEGER PRIMARY KEY, nome_barco VARCHAR (40), cor VARCHAR(10));

INSERT INTO barcos VALUES (1, 'Pérola Negra', 'Preto'), (2, 'Azul do Mar', 'Azul'),(3, 'Catraca voadora', 'Verde')
			,(4, 'Sigano do Mar', 'Marron'),(5, 'Jóia do Oceano', 'Preto'),(6, 'Marinheiros Gayvotenses', 'Rosa');

CREATE TABLE reservas (id_marin INTEGER REFERENCES marinheiros (id_marin), id_barco INTEGER REFERENCES barcos (id_barco), data_res date,
			PRIMARY KEY (id_marin,id_barco,data_res));

INSERT INTO reservas values (1,2,'01/01/2013'),(2,4,'07/04/2013'),(3,1,'05/06/2013'),(2,2,'07/08/2013'),(4,2,'05/03/2013'),
(5,6,'24/10/2013'),(3,5,'08/02/2013'),(2,4,'12/08/2013'),(5,5,'03/04/2013'),(3,5,'07/04/2013'),(1,6,'25/09/2013');

SELECT * FROM marinheiros;
SELECT * FROM barcos;
SELECT * FROM reservas;

--EXERCÍCIOS

--3) Utilizando sub consultas, retorne o nome de todos os marinheiros que reservaram algum barco.
SELECT m.nome_marin FROM marinheiros m
WHERE m.id_marin IN
	(SELECT r.id_marin FROM reservas r);

--4) Retorne o nome de todos os barcos que já foram reservados utilizando sub consultas. 
SELECT b.nome_barco FROM barcos b
WHERE b.id_barco IN
	(SELECT r.id_barco FROM reservas r);

--5) Utilizando sub consultas, retorne o nome de todos os marinheiros que reservaram algum barco Marrom.
SELECT m.nome_marin FROM marinheiros m
WHERE m.id_marin IN
	(SELECT r.id_marin FROM reservas r
	 WHERE r.id_barco IN
		(SELECT b.id_barco FROM barcos b
		 WHERE b.cor = 'Marron'));

--6) Utilizando sub consultas, retorne o nome de todos os marinheiros que reservaram algum barco Marrom ou Azul.
SELECT m.nome_marin FROM marinheiros m
WHERE m.id_marin IN
	(SELECT r.id_marin FROM reservas r
	 WHERE r.id_barco IN
		(SELECT b.id_barco FROM barcos b
		 WHERE b.cor = 'Marron' OR b.cor = 'Azul'));

--7) Utilizando sub consultas, retorne o nome de todos os marinheiros que reservaram algum barco Marrom E Azul. DICA: dois selects INTERNOS comparando id_marin, separados por AND.
SELECT m.nome_marin FROM marinheiros m WHERE m.id_marin IN
	(SELECT r.id_marin FROM reservas r WHERE r.id_barco IN 
		(SELECT b.id_barco FROM barcos b WHERE b.cor = 'Marron')) 
	AND m.id_marin IN
	(SELECT r.id_marin FROM reservas r WHERE r.id_barco IN 
		(SELECT b.id_barco FROM barcos b WHERE b.cor = 'Azul')); 
		
--8) Selecionar o nome do marinheiro que fez a última reserva.
SELECT m.nome_marin FROM marinheiros m 
WHERE m.id_marin IN
	(SELECT r.id_marin FROM reservas r
	 WHERE r.data_res IN
		(SELECT MAX(r.data_res) FROM reservas r));