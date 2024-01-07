INSERT INTO Clinica (cnpj, nome, telefone, rua, numero, bairro, cidade, estado, idgerente, chaveacesso, idfuncionario)
VALUES(01234567891011, 'IF Odonto', 84998340987, 'Dr. Mauro Duarte', 366, 'José Clóvis', 'Parelhas', 'RN', 1, 'CGV3', 1 )

INSERT INTO Funcionario(cpf, nome, telefone, rua, numero, bairro, cidade, estado, salario, dataadmissao, datanasc, cnpjclinica) 
VALUES (12745387809, 'Maria das Vitórias', 84996107967, 'Aldo Evaristo', 11, 'Maria Terceira', 'Parelhas', 'RN', 150.00, '2024-07-01', '2005-07-01', 01234567891011),
(11341617432, 'Giovanna Azevedo', 84996717881, 'Francisca de Medeiros Brito', 82, 'Bela Vista', 'Jardim do Seridó', 'RN', 270.50,  '2024-01-02', '2005-08-28', 01234567891011),
(11277898909,  'Cybelly Batista', 84992173593, 'Heráclio Pires', 24, 'Alto Baixo',  'Jardim do Seridó', 'RN', 150.50, '2024-01-02', '2005-03-29', 01234567891011),
(12358687423,  'Débora Chianca', 84998563214, 'Inácio Gomes', 12,  'Bela Vista', 'Jardim do Seridó', 'RN', 220.00, '2024-01-07', '2005-11-11', 01234567891011),
(14785296323, 'Kauan Santos', 84997456123, 'Mauro Medeiros', 13, 'Ivan Bezerra', 'Parelhas', 'RN', 150.00, '2024-01-07', '2005-03-15', 01234567891011)	


INSERT INTO Dentista(idfuncionario, idDentista, cro)
VALUES(2, 1, 12345),
	  (3, 2, 67890),
      (4, 3, 11121)

INSERT INTO Especialidades(nomeespecialidade, idfuncionario)
VALUES('Ortodontia', 2),
    ('Implantodontia', 3),
    ('Odontopediatria', 3),
    ('Periodontia', 4)

INSERT INTO Paciente(cpf, nome, telefone, rua, numero, bairro, cidade, estado, datacadastro, datannasc, indicacao)
VALUES(1875553423, 'Andouglas Gonçalves', 84998764020, 'Celso Gomes', 121, 'Centro', 'Currais Novos', 'RN', '2024-01-06', '1989-08-02', 'Instagram'),
(27899975646, 'Marquilene Lucena', 83996735666, 'Carlos Medeiros', 75, 'Boa Passagem', 'Remígio', 'PB', '2024-01-03', '1987-09-10', 'Instagram'),
(70324261472, 'Rodolfo Medeiro', 84997863560, 'Pedro Cândido de Macedo', 28, 'Dinarte Mariz', 'Parelhas', 'RN', '2024-01-03', '1989-11-26', 'WhatsApp'),
(70621436791, 'Marçal Morais', 84987403003, 'Felino Ivo Bezerra', 46, 'Maria Terceira', 'Parelhas', 'RN', '2024-01-02', '1983-06-03', 'Instagram'),
(08248023975, 'Renata Callipo', 84988382107, 'Senador Salgado Filho', 64, 'Lagoa Nova',' Natal', 'RN', '2024-01-02', '1975-05-12', 'Instagram'),
(83409811260, 'Rosa Maria da Silva', 83988456721, 'Cônego João Borges', 109, 'Liberdade', 'Campina Grande', 'PB', '2024-01-05', '1980-07-01', 'Facebook'),
(58978922345, 'José Hélio Henrique de Lacerda', 83987665035, 'Ney Câmara', 235, 'Dinamérica', 'Campina Grande', 'PB', '2024-01-02', '1983-12-06', 'Facebook'),
(44289754682, 'Jeremias Alves', 84997043387, 'Vital Gomes de Araújo', 118, 'Centro', 'Parelhas', 'RN', '2024-01-05', '1983-10-26', 'Instagram')


INSERT INTO Consulta(idfuncionario, idpaciente, data, valor, formapagamento)
VALUES( 2, 1, '2024-01-08', 300.00, 'Pix'),
( 3, 2, '2024-01-08', 150.00, 'Espécie'),
( 2, 3, '2024-01-09', 200.00, 'Cartão'),
( 3, 4, '2024-01-10', 600.00, 'Pix'),
( 3, 5, '2024-01-11', 150.00, 'Espécie'),
( 2, 1, '2024-01-12', 200.00, 'Pix'),
( 2, 3, '2024-01-12', 200.00, 'Pix');

INSERT INTO Procedimento(nomeprocedimento, idconsulta)
VALUES('Raio-x', 1),
	  ('Obturação', 2),
	  ('Aparelho', 3),
	  ('Clareamento', 4),
	  ('Obturação', 5),
	  ('Aparelho', 5);

SELECT id, nome FROM Paciente 

SELECT * FROM Paciente WHERE id = 1

SELECT id, nome FROM Funcionario

SELECT * FROM Funcionario WHERE id = 5

SELECT SUM(valor)
FROM Consulta
WHERE EXTRACT(MONTH FROM data) = 1

SELECT SUM(valor)
FROM Consulta
WHERE data = '2024-01-08'

SELECT ROUND(AVG(valor), 2)
FROM Consulta

SELECT ROUND(AVG(salario), 2) 
FROM Funcionario

SELECT ROUND(AVG(valor), 2) 
FROM Consulta
WHERE EXTRACT(MONTH FROM data) = 1

SELECT id, nome
FROM Paciente
WHERE id IN(
		SELECT idPaciente
		FROM Consulta
		WHERE idFuncionario IN(
			SELECT idFuncionario
			FROM Especialidades
			WHERE nomeEspecialidade = 'Ortodontia'			
		)	
)
	
SELECT idConsulta
FROM Consulta 
WHERE valor >(
	SELECT ROUND(AVG(valor), 2)
	FROM Consulta
)
	
SELECT id, nome
FROM Funcionario
GROUP BY cidade
	

SELECT idPaciente, SUM(valor) AS gasto_paciente
FROM Consulta
GROUP BY idPaciente
ORDER BY idPaciente ASC

SELECT id, nome
FROM Funcionario
WHERE salario >(
	SELECT ROUND(AVG(salario), 2)
	FROM Funcionario
)

