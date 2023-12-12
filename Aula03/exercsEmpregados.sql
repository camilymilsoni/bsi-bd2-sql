CREATE TABLE EMPREGADO(idEmp integer PRIMARY KEY, pNome character varying (20) NOT NULL, sNome character varying(20) NOT NULL, idade integer, salario real NOT NULL, cargo character varying(30) NOT NULL);

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

select * from empregado;

--EXERCÍCIOS

--Selecionar o primeiro nome e o cargo dos empregados
SELECT pnome, cargo FROM empregado;

--Selecionar o pnome, snome e salario dos empregados
SELECT pNome, sNome, salario FROM EMPREGADO;

--Selecionar o cargo e a idade dos empregados
SELECT cargo, idade FROM EMPREGADO;

--Consultar o pnome e a idade de todos os empregados que possuem a idade = 32
SELECT pnome, idade FROM empregado where idade=32;

--Consultar o pnome e o salário de todos os empregados que ganham acima de 3000
SELECT pnome, salario FROM empregado WHERE salario > 3000;

--Fazer uma consulta que retorne o primeiro nome e a idade de todos os empregados com idade diferente (<>) de 29
SELECT pNome, idade FROM EMPREGADO WHERE idade <> 29;

--Selecionar todos os nomes maiores que Carlos
SELECT pnome FROM empregado	WHERE pnome > 'Carlos';

--Selecionar o nome dos empregados que possuem o cargo diferente de ‘Vendedor’
SELECT pNome FROM EMPREGADO WHERE cargo <> 'Vendedor';

--Selecionar o pnome e o snome de todos os funcionários com idade superior a 30 anos
SELECT pNome, sNome FROM EMPREGADO WHERE idade > 30;

--Selecionar o nome e o salário dos funcionários vendedores
SELECT pNome, salario FROM EMPREGADO WHERE cargo = 'Vendedor';

--Selecionar os cargos existentes na empresa, eliminando linhas repetidas
SELECT DISTINCT cargo FROM EMPREGADO;

--Seleciona todos os pnome e o cargo dos empregados que possuem o cargo de secretário OU gerente
SELECT pnome, cargo FROM empregado WHERE cargo = 'Secretária' OR cargo = 'Gerente';

--Selecionar o pnome, cargo e salario de todos os empregados que são Vendedor ou ganham mais que 3000
SELECT pNome, cargo, salario FROM empregado WHERE cargo = 'Vendedor' OR salario > 3000;

--Selecionar o pnome, salario,cargo de todos os Analistas de Sistemas que ganham mais de 4000
SELECT pnome, cargo, salario FROM empregado WHERE salario > 4000 AND cargo = 'Analista de Sistemas'

--Verificar se algum Gerente possui o pnome de Pedro
SELECT pNome = 'Pedro' FROM EMPREGADO WHERE cargo = 'Gerente';

--Usando o comando IN, selecione o pnome e o cargo de todos os empregados que sejam Gerentes, Estagiários ou Vendedor
SELECT pnome, cargo FROM empregado WHERE cargo IN ('Gerente','Estagiário','Vendedor');

--Selecionar todos os cargos que sejam Analista de Sistemas ou Técnico em segurança (usando IN) E que possuam salário maior que 2000
SELECT pNome, cargo, salario FROM EMPREGADO WHERE cargo IN ('Analista de Sistemas', 'Técnico em Segurança') AND salario > 2000;

--Selecionar todos os empregados que não são Gerente nem Vendedor
SELECT * FROM empregado WHERE cargo NOT IN ('Gerente','Vendedor');

--Retorne todos os empregados que ganham entre 2500 a 4000
SELECT pnome, salario FROM empregado WHERE salario BETWEEN 2500 AND 4000;

--Selecionar o pnome, o salario, o cargo de todos os empregados em ordem crescente
SELECT pnome, salario, cargo FROM EMPREGADO ORDER BY pnome

--Selecionar o pnome, salario e cargo dos funcionarios que ganham mais de 2500 em ordem decrescente de salario
SELECT pNome, salario, cargo FROM EMPREGADO WHERE salario > 2500 ORDER BY salario DESC;

--Selecionar o primeiro nome, cargo e salário, renomeando a coluna pnome para PrimeiroNome e salario para Salário
SELECT pNome as "Primeiro Nome", cargo, salario as "Salário" FROM EMPREGADO; 