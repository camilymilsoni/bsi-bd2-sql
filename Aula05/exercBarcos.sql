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

--Faça uma consulta que selecione o nome de todos os barcos que foram alugados e a data da reserva, ordenados pela data crescentemente
SELECT b.nome_barco, r.data_res
FROM reservas r
INNER JOIN barcos b ON r.id_barco = b.id_barco
ORDER BY r.data_res ASC;

--Faça uma consulta que retorne o nome dos marinheiros que possuem uma letra i no nome que alugaram um barco depois de 05/05/2013
SELECT m.nome_marin, r.data_res
FROM reservas r
INNER JOIN marinheiros m ON r.id_marin = m.id_marin
WHERE r.data_res > '05/05/2013' AND m.nome_marin LIKE '%i%'

--Faça uma consulta que retorne a quantidade de barcos que cada marinheiro já fez reserva. Deve ser retornado o nome dos marinheiros e a quantidade
SELECT m.nome_marin, COUNT(*) AS qtd_barcos_reservados
FROM reservas r
INNER JOIN marinheiros m ON r.id_marin = m.id_marin
GROUP BY m.nome_marin;

--Modifique o exercício anterior para que sejam somente os marinheiros que alugaram uma quantidade maior que um barco
SELECT m.nome_marin, COUNT(*) AS qtd_barcos_reservados
FROM reservas r
INNER JOIN marinheiros m ON r.id_marin = m.id_marin
GROUP BY m.nome_marin
HAVING COUNT(*) > 1;

--Selecione o nome dos marinheiros e dos barcos que alugaram em ordem alfabética do marinheiro
SELECT m.nome_marin, b.nome_barco, r.data_res
FROM reservas r
INNER JOIN marinheiros m ON r.id_marin = m.id_marin
INNER JOIN barcos b ON r.id_barco = b.id_barco
ORDER BY m.nome_marin;