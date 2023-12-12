CREATE TABLE EMPREGADO(idEmp integer, 
		       pNome VARCHAR (20) NOT NULL, 
		       sNome VARCHAR(20) NOT NULL, 
		       idade integer, 
		       salario real NOT NULL, 
		       cargo VARCHAR(30) NOT NULL,
		       CONSTRAINT pk_empregado PRIMARY KEY (idEmp));

--drop table empregado

INSERT INTO empregado VALUES (1,'Carlos','Alberto',24,2500,'Técnico em Segurança');
INSERT INTO empregado VALUES (2,'Pedro','Augusto',32,3500,'Analista de Sistemas');
INSERT INTO empregado VALUES (3,'Mara','Antonia',27,1200,'Secretária');
INSERT INTO empregado VALUES (4,'Derci','Gonçalves',56,6500,'Gerente');
INSERT INTO empregado VALUES (5,'Pedro','Bueno',28,1500,'Estagiário');
INSERT INTO empregado VALUES (6,'Edson','Arantes',60,7500,'Gerente');
INSERT INTO empregado VALUES (7,'Odete','Roitman',54,2000,'Técnico em Segurança');
INSERT INTO empregado VALUES (8,'Antonio','Da Lua',38,2500,'Analista de Sistemas');
INSERT INTO empregado VALUES (9,'Sassa','Mutema',55,3000,'Vendedor');
INSERT INTO empregado VALUES (10,'José','Silvério',42,2800,'Vendedor');
INSERT INTO empregado VALUES (11,'Gabriel','Oliveira',24,2500,'Técnico em Segurança');
INSERT INTO empregado VALUES (12,'Flávia','Camargo',29,4200,'Analista de Sistemas');
INSERT INTO empregado VALUES (13,'Marina','Delbonis',20,1000,'Secretária');
INSERT INTO empregado VALUES (14,'Paulo','Roberto',33,1500,'Vendedor');
INSERT INTO empregado VALUES (15,'José','Carlos da Silva',27,2900,'Analista de Sistemas');
INSERT INTO empregado VALUES (16,'Rúbia','Miranda',29,3500,'Administrador');
INSERT INTO empregado VALUES (17,'Roberto','Andrade Silva',35,3300,'Vendedor');
INSERT INTO empregado VALUES (18,'Ana','Julia',31,2900,'Secretária');
INSERT INTO empregado VALUES (19,'Pedro','Antonio',41,3500,'Administrador');
INSERT INTO empregado VALUES (20,'Ana','Mara',22,2200,'Psicóloga');
INSERT INTO empregado VALUES (21,'João','Augusto',44,5500,'Gerente');

select * from empregado ORDER BY pnome;

--EXERCÍCIOS

--Selecione todos os empregados que possuem a letra A como a primeira letra
select * from empregado WHERE pnome LIKE 'A%';

--Selecione o nome e cargo de todos os empregados que possuem uma letra ‘a’ no nome
SELECT pnome, cargo FROM empregado WHERE pnome LIKE '%a%';

--Repita a consulta do exemplo 2, utilizando ILIKE e veja a diferença
SELECT pnome, cargo FROM empregado WHERE pnome ILIKE '%a%';

--Selecione todos os empregados que possuam a segunda letra ‘e’ no primeiro nome ou que tenham a penúltima letra ‘i’
SELECT * FROM empregado WHERE pnome LIKE '_e%' OR pnome LIKE '%i_';

--Faça uma consulta que retorne o primeiro nome de todos os empregados que possuam uma letra ‘a’ e depois uma letra ‘s’ (não necessariamente na sequência)
SELECT pnome FROM empregado WHERE pnome LIKE '%a%s%';

--Repita as duas consultas anteriores utilizando o operador ILIKE
SELECT * FROM empregado WHERE pnome ILIKE '_e%' OR pnome ILIKE '%i_';
SELECT pnome FROM empregado WHERE pnome ILIKE '%a%s%';

--Selecione a média dos salários da empresa
SELECT avg(salario) from empregado;

--Selecionar a quantidade de gerentes da empresa
SELECT count(*) AS "Quantidade de Gerente na Empresa" FROM empregado WHERE cargo = 'Gerente';

--Selecione o maior e o menor salário da empresa
SELECT max(salario), min(salario) from empregado;

--Selecionar a quantidade gasta com salários na empresa
SELECT sum(salario) AS "Soma salarial" FROM empregado;

--Selecione a quantidade de empregados para cada cargo da empresa
SELECT cargo, Count(*) AS qtd_empregados_cargo from empregado GROUP BY cargo;

--Selecione o cargo e a média (AVG) salarial de cada cargo
SELECT cargo, AVG(salario) AS media_salario_cargo FROM empregado GROUP BY cargo;

--Selecione os cargos da empresas e a folha salarial de cada cargo, desde que esses gastos sejam superiores a 10000
SELECT cargo, sum(salario) AS folha_salario_cargo from empregado GROUP BY cargo HAVING sum(salario) > 10000;

--Selecione o maior e o menor salário de cada cargo, desde que o cargo não seja o de Gerente, e o salário maior seja maior que 2000 e o menor seja menor que 2500
SELECT cargo, max(salario) AS maior_salario, min(salario) AS menor_salario FROM EMPREGADO 
WHERE cargo <> 'Gerente'
GROUP BY cargo 
HAVING max(salario) > 2000 AND min(salario) < 2500;