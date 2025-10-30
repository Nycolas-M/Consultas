CREATE DATABASE sistema_consultas;
USE sistema_consultas;

-- Tabela 1: Usuários (20 campos)
CREATE TABLE usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    cpf VARCHAR(14) UNIQUE,
    data_nascimento DATE,
    endereco VARCHAR(200),
    cidade VARCHAR(100),
    estado VARCHAR(2),
    cep VARCHAR(9),
    tipo ENUM('medico', 'paciente', 'admin') DEFAULT 'paciente',
    especialidade VARCHAR(100),
    crm VARCHAR(20),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ultimo_login TIMESTAMP NULL,
    ativo BOOLEAN DEFAULT TRUE,
    foto_perfil VARCHAR(255),
    genero ENUM('M', 'F', 'Outro'),
    observacoes TEXT
);

-- Tabela 2: Consultas (20 campos)
CREATE TABLE consultas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    paciente_id INT NOT NULL,
    medico_id INT NOT NULL,
    data_consulta DATETIME NOT NULL,
    data_agendamento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    especialidade VARCHAR(100) NOT NULL,
    valor_consulta DECIMAL(10,2),
    status ENUM('agendada', 'realizada', 'cancelada', 'confirmada') DEFAULT 'agendada',
    sintomas TEXT,
    diagnostico TEXT,
    prescricao TEXT,
    observacoes TEXT,
    duracao INT DEFAULT 30,
    sala VARCHAR(50),
    convenio VARCHAR(100),
    numero_carteira VARCHAR(50),
    urgencia ENUM('baixa', 'media', 'alta') DEFAULT 'baixa',
    retorno BOOLEAN DEFAULT FALSE,
    data_retorno DATE,
    avaliacao INT,
    FOREIGN KEY (paciente_id) REFERENCES usuarios(id),
    FOREIGN KEY (medico_id) REFERENCES usuarios(id)
);

-- Tabela 3: Prontuários (20 campos)
CREATE TABLE prontuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    paciente_id INT NOT NULL,
    medico_id INT NOT NULL,
    consulta_id INT,
    data_prontuario TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    altura DECIMAL(4,2),
    peso DECIMAL(5,2),
    pressao_arterial VARCHAR(10),
    temperatura DECIMAL(4,2),
    alergias TEXT,
    medicamentos_uso TEXT,
    historico_familiar TEXT,
    queixa_principal TEXT,
    exame_fisico TEXT,
    exames_solicitados TEXT,
    resultado_exames TEXT,
    conduta TEXT,
    encaminhamentos TEXT,
    atestado TEXT,
    vacinas TEXT,
    observacoes_gerais TEXT,
    FOREIGN KEY (paciente_id) REFERENCES usuarios(id),
    FOREIGN KEY (medico_id) REFERENCES usuarios(id),
    FOREIGN KEY (consulta_id) REFERENCES consultas(id)
);

-- Tabela 4: Agenda (20 campos)
CREATE TABLE agenda (
    id INT PRIMARY KEY AUTO_INCREMENT,
    medico_id INT NOT NULL,
    data DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fim TIME NOT NULL,
    disponivel BOOLEAN DEFAULT TRUE,
    paciente_id INT,
    consulta_id INT,
    tipo_consulta ENUM('particular', 'convenio', 'retorno'),
    duracao INT DEFAULT 30,
    sala VARCHAR(50),
    observacoes TEXT,
    data_bloqueio TIMESTAMP NULL,
    motivo_bloqueio VARCHAR(200),
    recorrente BOOLEAN DEFAULT FALSE,
    dias_recorrencia VARCHAR(50),
    data_fim_recorrencia DATE,
    criado_por INT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ultima_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (medico_id) REFERENCES usuarios(id),
    FOREIGN KEY (paciente_id) REFERENCES usuarios(id)
);

-- Tabela 5: Convênios (20 campos)
CREATE TABLE convenios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(150),
    site VARCHAR(200),
    contato_nome VARCHAR(100),
    contato_telefone VARCHAR(20),
    endereco VARCHAR(200),
    cidade VARCHAR(100),
    estado VARCHAR(2),
    cep VARCHAR(9),
    ativo BOOLEAN DEFAULT TRUE,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    valor_repasse DECIMAL(5,2),
    tempo_pagamento INT,
    observacoes TEXT,
    coberturas TEXT,
    numero_registro VARCHAR(50),
    data_validade DATE,
    tipo_convenio ENUM('empresarial', 'individual', 'familiar')
);

-- Inserir dados de exemplo
INSERT INTO usuarios (nome, email, senha, tipo, especialidade, crm) VALUES 
('Dr. João Silva', 'joao@clinica.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'medico', 'Cardiologia', 'CRM/SP 123456'),
('Maria Santos', 'maria@paciente.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'paciente', NULL, NULL);

INSERT INTO consultas (paciente_id, medico_id, data_consulta, especialidade, status) VALUES 
(2, 1, '2024-12-15 14:00:00', 'Cardiologia', 'agendada');