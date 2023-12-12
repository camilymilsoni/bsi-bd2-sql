CREATE TABLE CARRO(
	RENAVAM VARCHAR(20),
	MODELO VARCHAR(50) NOT NULL, 
	MARCA VARCHAR(50) NOT NULL,
	Preço REAL NOT NULL,
	Ano INTEGER NOT NULL, 
	CONSTRAINT pk_carro PRIMARY KEY (RENAVAM)
);

INSERT INTO CARRO VALUES ('11AA22AA', 'Fusca', 'Volkswagen', 20000, 1970),
						 ('11BB33BB', 'Toro', 'Fiat', 80000, 2019),
						 ('22CC44CC', 'HB20', 'Hyunday', 50000, 2018),
						 ('44AA22BB', 'Polo', 'Volkswagen', 60000, 2020),
						 ('55AA22BB', 'Amarok', 'Volkswagen', 170000, 2019),
						 ('66AA22BB', 'Toro', 'Fiat', 80000, 2019),
						 ('77AA22BB', 'Strada', 'Fiat', 50000, 2018),
						 ('88AA22BB', 'HB20', 'Hyunday', 60000, 2021),
						 ('99AA22BB', 'Corolla', 'Toyota', 70000, 2012),
						 ('10AA22BB', 'Corolla', 'Toyota', 90000, 2018),
						 ('13AA22BB', 'Hylux', 'Toyota', 170000, 2019),
						 ('25AA22BB', 'Civic', 'Honda', 80000, 2016),
						 ('35AA22BB', 'Gol', 'Volkswagen', 40000, 2015);
			
--Selecione todos os carros da FIAT de 2019
SELECT * FROM CARRO WHERE MARCA = 'Fiat' AND Ano = 2019;

--Selecione todos os carros com valor superior a 50000 e que não sejam da Hyunday
SELECT * FROM CARRO WHERE Preço > 50000 AND MARCA <> 'Hyunday';

--Selecione o modelo e a marca dos carros de 2018 até 2021 que custam entre 50 e 90 mil
SELECT MODELO, MARCA FROM CARRO WHERE Ano BETWEEN 2018 AND 2021 AND Preço BETWEEN 50000 AND 90000;

--Faça uma consulta que retorne o Modelo do carro, a marca e o preço em ordem decrescente do preço
SELECT MODELO, MARCA, Preço FROM CARRO ORDER BY Preço DESC;

--Faça uma consulta que retorne o Modelo do carro (substitua o nome modelo para Nome do Carro), a Marca, o Ano do carro como Ano do Carro e o seu preço, 
--em ordem crescente do ano todos os carros entre 2017 e 2020
SELECT MODELO AS "Nome do Carro", MARCA, Ano AS "Ano do Carro", Preço FROM CARRO
WHERE Ano >= 2017 AND Ano <= 2020
ORDER BY Ano ASC;

--Repita a consulta 7 com o operador BETWEEN
SELECT MODELO AS "Nome do Carro", MARCA, Ano AS "Ano do Carro", Preço FROM CARRO
WHERE Ano BETWEEN 2017 AND 2020
ORDER BY Ano ASC;

--Faça uma consulta que retorne em ordem crescente do modelo dos carros, os modelos dos carros de 2019, as marcas e os preços. Coloque um Alias para 
--modelo de “Carros de 2019”
SELECT MODELO AS "Carros de 2019", MARCA, Preço FROM CARRO
WHERE Ano = 2019
ORDER BY Modelo;

--Faça uma consulta que retorne a marca e o preço máximo de cada marca
SELECT MARCA, max(Preço) AS preço_maximo_marca FROM CARRO
GROUP BY MARCA;

--Seleciona a quantidade de carros e a marca agrupados pela marca
SELECT MARCA, COUNT(*) AS qtd_carros FROM CARRO
GROUP BY MARCA;

--Seleciona a quantidade de carros e a marca agrupados pela marca e ordenados pela marca desde que a quantidade seja maior que 2
SELECT MARCA, COUNT(*) AS qtd_carros FROM CARRO
GROUP BY MARCA
HAVING COUNT(*) > 2
ORDER BY MARCA;

--Selecione a soma e a média dos preços dos carros agrupados pela marca do carro. Crie um ALIAS para a soma e média
SELECT marca, SUM(Preço) AS soma_preço_carros, AVG(Preço) AS media_preço_carros FROM CARRO
GROUP BY MARCA;

--Selecione todos os carros que possuem C como primeira letra ou que possuem na última
SELECT * FROM CARRO WHERE MODELO LIKE 'C%' OR MODELO LIKE '%a';

--Repita a consulta 15 de tal forma que não faça diferenciação entre ‘C’ e’c’ e ‘A’ e ‘a’
SELECT * FROM CARRO WHERE MODELO ILIKE 'C%' OR MODELO ILIKE '%a';

--Selecione o modelo, a marca e o preço de todos os carros da montadora FIAT que possuam alguma letra i, ordenados pelo modelo
SELECT MODELO, MARCA, Preço FROM CARRO
WHERE MARCA = 'Fiat' AND MODELO LIKE '%i%'
ORDER BY MODELO;

--Selecione todos os carros entre 2018 e 2021 que possuam algum i no modelo ordenados em forma decrescente pelo ano
SELECT * FROM CARRO
WHERE Ano BETWEEN 2018 AND 2021 AND MODELO LIKE '%i%'
ORDER BY Ano DESC;