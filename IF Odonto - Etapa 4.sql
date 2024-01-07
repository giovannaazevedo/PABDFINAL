/**Inserir dados da clínica**/

INSERT INTO ifodonto.Clinica (cnpj, nome, telefone, rua, numero, bairro, cidade, estado, idfungerente, chaveacesso)
VALUES(01234567891011,' IF Odonto', 998340987, 'Dr. Mauro Duarte', 366, 'José Clóvis', 'Parelhas', 'RN', 6, 'CGV3');

/**Inserir funcionarios**/

INSERT INTO ifodonto.Funcionario( cpf, nome, telefone, rua, numero, bairro, cidade, estado, salario, dataadmissao, datanasc, cnpjclinica) 
VALUES ( 12745387809, 'Maria das Vitórias', 84996107967, 'Aldo Evaristo', 11,' Maria Terceira', 'Parelhas', 'RN', 150, '2024-01-07', '2005-07-01', 01234567891011),
(11341617432, 'Giovanna Silva', 84996717881, 'Francisca de Medeiros Brito', 82, 'Bela Vista', 'Jardim do Seridó', 'RN', 270, ' 2024-01-02', '2005-08-28', 01234567891011),
(11277898909, 'Cybelly Batista', 84992173593, 'Heráclio Pires', 24, 'Alto Baixo',  'Jardim do Seridó', 'RN', 150.50, '2024-01-02', '2005-03-29', 01234567891011),
(12358687423,  'Débora Chianca', 84998563214, 'Inácio Gomes', 12, ' Bela Vista', 'Jardim do Seridó', 'RN', 220, '2024-01-07', '2005-11-11', 01234567891011),
(14785296323,  'Kauan Santos', 84997456123, 'Mauro Medeiros', 13, 'Ivan Bezerra', 'Parelhas', 'RN', 150, '2024-01-07', '2005-03-15', 01234567891011);

/**Inserir Pacientes**/

INSERT INTO ifodonto.Paciente(cpf, nome, telefone, rua, numero, bairro, cidade, estado, datacadastro, dataNnasc, indicacao)
	VALUES(18755534232, 'Andouglas Gonçalves', 84998764020, 'Celso Gomes', 121, 'Centro', 'Currais Novos',' RN', '2024-01-06', '1989-08-02', 'Instagram' ),
		(27899975646, 'Marquilene Lucena', 83996735666, 'Carlos Medeiros', 75, 'Boa Passagem', 'Remígio', 'PB', '2024-01-03', '1987-09-10', 'Instagram'),
		(70324261472, 'Rodolfo Medeiro', 84997863560, 'Pedro Cândido de Macedo', 28, 'Dinarte Mariz', 'Parelhas', 'RN', '2024-01-03', '1989-11-26', 'WhatsApp'),
		(70621436791, 'Marçal Morais', 84987403003, 'Felino Ivo Bezerra', 46, 'Maria Terceira',' Parelhas', 'RN', '2024-01-02', '1983-06-03', 'Instagram'),
		(08248023975, 'Renata Callipo', 84988382107, 'Senador Salgado Filho', 64,' Lagoa Nova',' Natal', 'RN',' 2024-01-02', '1975-05-12', 'Instagram'),
		(83409811260,' Rosa Maria da Silva', 83988456721,' Cônego João Borges', 109, 'Liberdade',' Campina Grande', 'PB', '2024-01-05', '1980-07-01', 'Facebook'),
		(58978922345, 'José Hélio Henrique de Lacerda', 83987665035, 'Ney Câmara', 235, 'Dinamérica', 'Campina Grande', 'PB', '2024-01-02', '1983-12-06', 'Facebook'),
		(44289754682, 'Jeremias Alves', 84997043387, 'Vital Gomes de Araújo', 118, 'Centro', 'Parelhas', 'RN', '2024-01-05', '1983-10-26', 'Instagram');

/**Inserir Dentistas**/

INSERT INTO ifodonto.Dentista(idFuncionario, CRO)
	VALUES(7, 12345),
		    (8, 67890),
            (9, 11121);
			
/**Inserir especialidades**/

INSERT INTO ifodonto.Especialidades(nomeespecialidade, idfuncionario)
VALUES('Ortodontia', 7),
    ('Implantodontia', 8),
    ('Odontopediatria', 8),
    ('Periodontia', 9)
	
/**Inserir consultas**/

INSERT INTO ifodonto.Consulta(idfuncionario, idpaciente, data, valor, formapagamento)
VALUES( 7, 1, '2024-01-08', 300.00, 'pix'),
	( 8, 2, '2024-01-08', 150.00, 'espécie'),
	( 7, 3, '2024-01-09', 200.00, 'cartão'),
	( 8, 4, '2024-01-10', 600.00, 'pix'),
	( 8, 5, '2024-01-11', 150.00, 'espécie'),
	( 7, 1, '2024-01-12', 200.00, 'pix'),
	( 7, 3, '2024-01-12', 200.00, 'pix');


/**Inserir procedimentos**/

INSERT INTO ifodonto.Procedimento(nomeprocedimento, idconsulta)
	VALUES('Raio-x', 1),
		('Obturação', 2),
		('Aparelho', 3),
		('Clareamento', 4),
		('Obturação', 5),
		('Aparelho', 5);
	

/**Selects**/

/**Listar pacientes**/
SELECT id, nome FROM ifodonto.Paciente;

/**Listar paciente específico pelo id**/

SELECT * FROM ifodonto.Paciente WHERE id = 1;

/**Listar Funcionarios**/
SELECT id, nome FROM ifodonto.Funcionario;

/**Listar Funcionario pelo id**/
SELECT * FROM ifodonto.Funcionario WHERE id = 6;

/**Listar quantidade de consultas realizadas no dia e mês**/

SELECT COUNT(*) AS consultas_no_dia
FROM ifodonto.Consulta
WHERE data = '2024-01-08';

SELECT COUNT(*) AS consultas_na_semana
FROM ifodonto.Consulta
WHERE  EXTRACT(MONTH FROM data) = '1'

/**Média das consultas do mês de janeiro:**/
SELECT ROUND(AVG(valor), 2) 
FROM ifodonto.Consulta
WHERE EXTRACT(MONTH FROM data) = '1'


/**Média de valor das consultas:**/
SELECT ROUND(AVG(valor), 2)
FROM ifodonto.Consulta
		
/**Nome de um procedimento realizado em uma consulta específica:**/
SELECT nomeprocedimento FROM ifodonto.Procedimento 
WHERE idconsulta = 1

/**Clínica:
Pagamento funcionários (total):**/
SELECT 
	SUM(salario) 
FROM ifodonto.Funcionario;		

/**Valor de entrada dia específico;**/
SELECT SUM(valor)
FROM ifodonto.Consulta
WHERE data =' 2024-01-08'

/**Média salarial**/

SELECT ROUND(AVG(salario), 2) 
FROM ifodonto.Funcionario



/**Mês:**/
SELECT SUM(valor) AS totalentradames
FROM ifodonto.Consulta
WHERE EXTRACT(MONTH FROM data) = '1'

/**Total de funcionários agrupados por cidade**/

SELECT cidade, COUNT(*) AS total_funcionarios
FROM ifodonto.Funcionario
GROUP BY cidade;

/**Total de funcionários pacientes por cidade**/

SELECT cidade, COUNT(*) AS total_pacientes
FROM ifodonto.Paciente
GROUP BY cidade;

/**Soma dos valores gastos por cada paciente, agrupados por id e em ordem ascendente de id**/

SELECT idPaciente, SUM(valor) AS gasto_paciente
FROM ifodonto.Consulta
GROUP BY idPaciente
ORDER BY idPaciente ASC


/**Update:**/

/**Pacientes
Atualizar informações de um paciente específico:**/

UPDATE ifodonto.Paciente
SET nome = 'Marquilene Medeiros Lucena', telefone = 83992738676
WHERE id = 2;

UPDATE ifodonto.Paciente
SET nome = 'Rodolfo Medeiros', telefone = 84987665035
WHERE id = 3;


/**Funcionários
Atualizar salário de um funcionário específico:**/

UPDATE ifodonto.Funcionario
SET salario = 200
WHERE id = 3;

UPDATE ifodonto.Funcionario
SET salario = 200
WHERE id = 1;


/**Consultas
Atualizar valor de uma consulta específica:**/

UPDATE ifodonto.Consulta
SET valor = 650
WHERE idConsulta = 4;

UPDATE ifodonto.Consulta
SET valor = 250.00
WHERE idConsulta = 6;

/**Delete:**/

/**Pacientes
Deletar um paciente específico:**/

DELETE FROM ifodonto.Paciente
WHERE id = 4;

/**Funcionários
Deletar um funcionário específico:**/

DELETE FROM ifodonto.Funcionario
WHERE id = 5;

/**Consultas
Deletar uma consulta específica:**/

DELETE FROM ifodonto.Consulta
WHERE idConsulta = 3;

/**Procedimentos
Deletar um procedimento específico:**/

DELETE FROM ifodonto.Procedimento
WHERE idConsulta = 5;

/**Subconsultas:**/

/**Selecionar o nome e id dos dentistas que não fizeram nenhuma consulta**/

SELECT id, nome
FROM ifodonto.Funcionario
WHERE id IN(
	SELECT idFuncionario
	FROM ifodonto.Dentista
	WHERE idFuncionario NOT IN(
		SELECT idFuncionario
		FROM ifodonto.Consulta
	)
);

/**Selecionar o nome e id dos dentistas que não fizeram consultas em uma data específica**/

SELECT id, nome
FROM ifodonto.Funcionario
WHERE id IN(
	SELECT idFuncionario
	FROM ifodonto.Dentista
	WHERE idFuncionario NOT IN(
		SELECT idFuncionario
		FROM ifodonto.Consulta
		WHERE data = '2024-01-12'
	)
)

/**Selecionar o nome e id dos pacientes que não receberam consultas**/ 

SELECT id, nome
FROM ifodonto.Paciente
WHERE id NOT IN(
	SELECT idPaciente
	FROM ifodonto.Consulta
);	

/**Selecionar o nome e id dos pacientes que se consultaram com um especialista em Ortodontia:**/

SELECT id, nome
FROM ifodonto.Paciente
WHERE id IN(
		SELECT idPaciente
		FROM ifodonto.Consulta
		WHERE idFuncionario IN(
			SELECT idFuncionario
			FROM ifodonto.Especialidades
			WHERE nomeEspecialidade = 'Ortodontia'		
		)	
);

/**Listar consultas que possuem valor maior que a média**/ 

SELECT idConsulta
FROM ifodonto.Consulta 
WHERE valor >(
	SELECT ROUND(AVG(valor), 2)
	FROM ifodonto.Consulta
)


/**Selecionar o id e nome dos funcionários que têm salário maior que a média**/

SELECT id, nome
FROM ifodonto.Funcionario
WHERE salario >(
	SELECT ROUND(AVG(salario), 2)
	FROM ifodonto.Funcionario
)



/**Dentista:
Listar dentistas;**/
SELECT * FROM ifodonto.FUNCIONARIO
WHERE id in(
	SELECT idfuncionario FROM ifodonto.Dentista
	);


/**Lucro mês.**/ 
SELECT total_entrada_mes - total_saida_mes AS lucro
FROM (
    SELECT COALESCE(SUM(valor), 0) AS total_entrada_mes
    FROM ifodonto.Consulta
    WHERE EXTRACT(MONTH FROM data) = 1
) AS entrada,
(
    SELECT COALESCE(SUM(salario), 0) AS total_saida_mes
    FROM ifodonto.Funcionario
) AS saida;

/**Dentista da consulta.**/
SELECT nome
FROM ifodonto.Funcionario
WHERE id in(
	SELECT idfuncionario 
	FROM ifodonto.Dentista
	WHERE idfuncionario in(
			SELECT idfuncionario
			FROM ifodonto.Consulta
			WHERE idconsulta = 1
		)
)






