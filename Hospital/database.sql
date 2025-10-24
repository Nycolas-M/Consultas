CREATE DATABASE ClinicaSimples;
USE ClinicaSimples;

CREATE TABLE Usuarios (
    Id INT PRIMARY KEY IDENTITY,
    Nome NVARCHAR(100),
    Email NVARCHAR(100),
    Senha NVARCHAR(100),
    CPF NVARCHAR(20),
    Telefone NVARCHAR(20),
    DataNascimento DATE,
    Genero NVARCHAR(20),
    Endereco NVARCHAR(200),
    Numero NVARCHAR(10),
    Bairro NVARCHAR(100),
    Cidade NVARCHAR(100),
    Estado NVARCHAR(50),
    CEP NVARCHAR(15),
    Cargo NVARCHAR(50),
    NivelAcesso NVARCHAR(50),
    UltimoLogin DATETIME,
    DataCadastro DATETIME DEFAULT GETDATE(),
    Ativo BIT DEFAULT 1,
    Observacoes NVARCHAR(255)
);

INSERT INTO Usuarios (Nome, Email, Senha, Cargo, NivelAcesso)
VALUES ('Administrador', 'admin@clinica.com', '12345', 'Admin', 'Total');

CREATE TABLE Pacientes (
    Id INT PRIMARY KEY IDENTITY,
    Nome NVARCHAR(100),
    CPF NVARCHAR(20),
    RG NVARCHAR(20),
    DataNascimento DATE,
    Genero NVARCHAR(20),
    Telefone NVARCHAR(20),
    Email NVARCHAR(100),
    Endereco NVARCHAR(200),
    Numero NVARCHAR(10),
    Bairro NVARCHAR(100),
    Cidade NVARCHAR(100),
    Estado NVARCHAR(50),
    CEP NVARCHAR(15),
    Convenio NVARCHAR(100),
    NumeroCarteirinha NVARCHAR(50),
    TipoSanguineo NVARCHAR(5),
    Alergias NVARCHAR(255),
    DoencasCronicas NVARCHAR(255),
    ContatoEmergencia NVARCHAR(100),
    Observacoes NVARCHAR(255)
);

CREATE TABLE Medicos (
    Id INT PRIMARY KEY IDENTITY,
    Nome NVARCHAR(100),
    CRM NVARCHAR(20),
    Especialidade NVARCHAR(100),
    Telefone NVARCHAR(20),
    Email NVARCHAR(100),
    Endereco NVARCHAR(200),
    Numero NVARCHAR(10),
    Bairro NVARCHAR(100),
    Cidade NVARCHAR(100),
    Estado NVARCHAR(50),
    CEP NVARCHAR(15),
    DataAdmissao DATE,
    Salario DECIMAL(10,2),
    Plantonista BIT,
    CargaHorariaSemanal INT,
    Experiencia NVARCHAR(255),
    Formacao NVARCHAR(255),
    InstituicaoFormacao NVARCHAR(255),
    Observacoes NVARCHAR(255),
    Ativo BIT DEFAULT 1
);

CREATE TABLE Consultas (
    Id INT PRIMARY KEY IDENTITY,
    PacienteId INT,
    MedicoId INT,
    DataConsulta DATETIME,
    HoraConsulta NVARCHAR(10),
    TipoConsulta NVARCHAR(100),
    Diagnostico NVARCHAR(255),
    Prescricao NVARCHAR(255),
    Sintomas NVARCHAR(255),
    PressaoArterial NVARCHAR(20),
    TemperaturaCorporal DECIMAL(4,1),
    Peso DECIMAL(5,2),
    Altura DECIMAL(4,2),
    IMC AS (Peso / (Altura * Altura)),
    Status NVARCHAR(50),
    DataCriacao DATETIME DEFAULT GETDATE(),
    UltimaAtualizacao DATETIME,
    ValorConsulta DECIMAL(10,2),
    FormaPagamento NVARCHAR(50),
    RetornoAgendado BIT DEFAULT 0,
    Observacoes NVARCHAR(255),
    FOREIGN KEY (PacienteId) REFERENCES Pacientes(Id),
    FOREIGN KEY (MedicoId) REFERENCES Medicos(Id)
);

CREATE TABLE Exames (
    Id INT PRIMARY KEY IDENTITY,
    PacienteId INT,
    MedicoId INT,
    TipoExame NVARCHAR(100),
    DataSolicitacao DATETIME,
    DataRealizacao DATETIME,
    Laboratorio NVARCHAR(100),
    Resultado NVARCHAR(255),
    ArquivoResultado NVARCHAR(200),
    ValorExame DECIMAL(10,2),
    Metodo NVARCHAR(100),
    UnidadeMedida NVARCHAR(50),
    IntervaloReferencia NVARCHAR(100),
    Status NVARCHAR(50),
    Responsavel NVARCHAR(100),
    Observacoes NVARCHAR(255),
    Urgente BIT DEFAULT 0,
    DataCadastro DATETIME DEFAULT GETDATE(),
    RevisadoPor NVARCHAR(100),
    DataRevisao DATETIME,
    FOREIGN KEY (PacienteId) REFERENCES Pacientes(Id),
    FOREIGN KEY (MedicoId) REFERENCES Medicos(Id)
);
