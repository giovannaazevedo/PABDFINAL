CREATE TABLE Funcionario(
	id				SERIAL			PRIMARY KEY,
	cpf				BIGINT			UNIQUE,
	nome			VARCHAR(100)	NOT NULL,
	telefone		BIGINT			NOT NULL,
	rua				VARCHAR(100)	NOT NULL,
	numero			INT				NOT NULL,
	bairro			VARCHAR(100)	NOT NULL,
	cidade			VARCHAR(100)	NOT NULL,
	estado			VARCHAR(100)	NOT NULL,
	salario			MONEY			NOT NULL,
	dataNasc		DATE			NOT NULL,
	dataAdmissao	DATE			NOT NULL,
	cnpjClinica		BIGINT			NOT NULL
);

CREATE TABLE Clinica(
	cnpj			BIGINT			PRIMARY KEY,
	nome			VARCHAR(100)	NOT NULL,
	telefone		BIGINT			NOT NULL,
	rua				VARCHAR(100)	NOT NULL,
	numero			INT				NOT NULL,
	bairro			VARCHAR(100)	NOT NULL,
	cidade			VARCHAR(100)	NOT NULL,
	estado			VARCHAR(100)	NOT NULL,
	idFuncionario	SERIAL			NOT NULL,
	idGerente		SERIAL			NOT NULL,
	chaveAcesso		VARCHAR(10)		NOT NULL
);

ALTER TABLE Funcionario
	ADD COLUMN cnpjClinica BIGINT NOT NULL
	
ALTER TABLE public.Funcionario
ADD CONSTRAINT fk_Clinica
FOREIGN KEY (cnpjClinica)
REFERENCES public.Clinica(cnpj) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE public.Clinica
ADD CONSTRAINT fk_Funcionario
FOREIGN KEY (idFuncionario)
REFERENCES public.Funcionario(id) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE Paciente(
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


CREATE TABLE Funcionario(
	id				SERIAL			PRIMARY KEY,
	cpf				BIGINT			UNIQUE,
	nome			VARCHAR(100)	NOT NULL,
	telefone		BIGINT			NOT NULL,
	rua				VARCHAR(100)	NOT NULL,
	numero			INT				NOT NULL,
	bairro			VARCHAR(100)	NOT NULL,
	cidade			VARCHAR(100)	NOT NULL,
	estado			VARCHAR(100)	NOT NULL,
	salario			MONEY			NOT NULL,
	dataAdmissao	DATE			NOT NULL,
	dataNasc		DATE			NOT NULL 	CHECK (EXTRACT(YEAR FROM dataAdmissao) - EXTRACT(YEAR FROM dataNasc) >= 18),
	cnpjClinica		BIGINT			NOT NULL
);

DROP TABLE FUNCIONARIO cascade

CREATE TABLE Consulta(
	idConsulta			SERIAL		PRIMARY KEY,
	idFuncionario		INT 		NOT NULL,
	idPaciente			INT			NOT NULL,
	data				DATE		NOT NULL,
	valor				DECIMAL		NOT NULL,
	formaPagamento		VARCHAR(30)	NOT NULL,
	FOREIGN KEY (idFuncionario) REFERENCES Funcionario(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (idPaciente) REFERENCES Paciente(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Procedimento(
	nomeProcedimento		VARCHAR(100)	NOT NULL,
	idConsulta				INT				NOT NULL,
	PRIMARY KEY(nomeProcedimento, idConsulta),
	FOREIGN KEY(idConsulta)	REFERENCES Consulta(idConsulta) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Dentista(
	idFuncionario	INT		PRIMARY KEY,
	idDentista		SERIAL	NOT NULL,
	CRO				BIGINT	UNIQUE,
	FOREIGN KEY(idFuncionario)	REFERENCES Funcionario(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Especialidades(
	nomeEspecialidade	VARCHAR(100)	NOT NULL,
	idFuncionario		INT 			NOT NULL,
	PRIMARY KEY(nomeEspecialidade, idFuncionario),
	FOREIGN KEY(idFuncionario) REFERENCES Funcionario(id) ON DELETE CASCADE ON UPDATE CASCADE
);