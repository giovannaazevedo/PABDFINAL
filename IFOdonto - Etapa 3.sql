CREATE TABLE ifodonto.Funcionario(
	id				SERIAL			PRIMARY KEY,
	cpf				BIGINT			UNIQUE,
	nome			VARCHAR(100)	NOT NULL,
	telefone		BIGINT			NOT NULL,
	rua				VARCHAR(100)	NOT NULL,
	numero			INT				NOT NULL,
	bairro			VARCHAR(100)	NOT NULL,
	cidade			VARCHAR(100)	NOT NULL,
	estado			VARCHAR(100)	NOT NULL,
	salario			DECIMAL (9,2)	NOT NULL CHECK (salario <= 20000),
	dataAdmissao	DATE			NOT NULL,
	dataNasc		DATE			NOT NULL 	CHECK (EXTRACT(YEAR FROM dataAdmissao) - EXTRACT(YEAR FROM dataNasc) >= 18),
	cnpjClinica		BIGINT			NOT NULL
);




CREATE TABLE ifodonto.Clinica(
	cnpj				BIGINT				PRIMARY KEY,
	nome				VARCHAR(100)		NOT NULL,
	telefone			BIGINT				NOT NULL,
	rua					VARCHAR(100)		NOT NULL,
	numero				INT					NOT NULL,
	bairro				VARCHAR(100)		NOT NULL,
	cidade				VARCHAR(100)		NOT NULL,
	estado				VARCHAR(100)		NOT NULL,
	idFunGerente		INT					NOT NULL,
	chaveAcesso			VARCHAR(10)			NOT NULL
);
	
ALTER TABLE ifodonto.Funcionario
ADD CONSTRAINT fk_Clinica
FOREIGN KEY (cnpjClinica)
REFERENCES ifodonto.Clinica(cnpj) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE ifodonto.Clinica
ADD CONSTRAINT fk_Funcionario
FOREIGN KEY (idFunGerente)
REFERENCES ifodonto.Funcionario(id) ON DELETE CASCADE ON UPDATE CASCADE;

DROP TABLE ifodonto.Clinica Cascade



CREATE TABLE ifodonto.Paciente(
	id				SERIAL				PRIMARY KEY,
	cpf				BIGINT				UNIQUE,
	nome			VARCHAR(100)		NOT NULL,
	telefone		BIGINT				NOT NULL,
	rua				VARCHAR(100)		NOT NULL,
	numero			INT					NOT NULL,
	bairro			VARCHAR(100)		NOT NULL,
	cidade			VARCHAR(100)		NOT NULL,
	estado			VARCHAR(100)		NOT NULL,
	dataCadastro	DATE				NOT NULL,
	dataNnasc		DATE				NOT NULL,
	indicacao		VARCHAR(100)
);


CREATE TABLE ifodonto.Consulta(
	idConsulta			SERIAL		PRIMARY KEY,
	idFuncionario		INT 		NOT NULL,
	idPaciente			INT			NOT NULL,
	data				DATE		NOT NULL,
	valor				DECIMAL		NOT NULL,
	formaPagamento		VARCHAR(30)	NOT NULL,
	FOREIGN KEY (idFuncionario) REFERENCES ifodonto.Funcionario(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (idPaciente) REFERENCES ifodonto.Paciente(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ifodonto.Procedimento(
	nomeProcedimento		VARCHAR(100)	NOT NULL,
	idConsulta				INT				NOT NULL,
	PRIMARY KEY(nomeProcedimento, idConsulta),
	FOREIGN KEY(idConsulta)	REFERENCES ifodonto.Consulta(idConsulta)  ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ifodonto.Dentista(
	idFuncionario	INT		PRIMARY KEY,
	idDentista		SERIAL	NOT NULL,
	CRO				BIGINT	UNIQUE,
	FOREIGN KEY(idFuncionario)	REFERENCES ifodonto.Funcionario(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ifodonto.Especialidades(
	nomeEspecialidade	VARCHAR(100)	NOT NULL,
	idFuncionario		INT 			NOT NULL,
	PRIMARY KEY(nomeEspecialidade, idFuncionario),
	FOREIGN KEY(idFuncionario) REFERENCES ifodonto.Funcionario(id) ON DELETE CASCADE ON UPDATE CASCADE
);


