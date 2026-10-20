
CREATE DATABASE IF NOT EXISTS locadora;
USE locadora;


CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    endereco TEXT
);


CREATE TABLE funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    data_admissao DATE
);


CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT
);


CREATE TABLE filme (
    id_filme INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    ano_lancamento INT,
    classificacao_indicativa VARCHAR(10),
    duracao_minutos INT,
    id_categoria INT NOT NULL,
    CONSTRAINT fk_filme_categoria FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);


CREATE TABLE copia (
    id_copia INT AUTO_INCREMENT PRIMARY KEY,
    id_filme INT NOT NULL,
    codigo_barras VARCHAR(50) NOT NULL UNIQUE,
    estado_conservacao VARCHAR(50),
    status VARCHAR(50) NOT NULL, -- Ex: 'disponivel', 'alugada', 'manutencao'
    CONSTRAINT fk_copia_filme FOREIGN KEY (id_filme) REFERENCES filme(id_filme)
);


CREATE TABLE locacao (
    id_locacao INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_funcionario INT NOT NULL,
    data_locacao DATETIME NOT NULL,
    data_prevista_devolucao DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    CONSTRAINT fk_locacao_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    CONSTRAINT fk_locacao_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);


CREATE TABLE item_locacao (
    id_item_locacao INT AUTO_INCREMENT PRIMARY KEY,
    id_locacao INT NOT NULL,
    id_copia INT NOT NULL,
    valor_diaria DECIMAL(10, 2) NOT NULL,
    data_devolucao DATETIME,
    CONSTRAINT fk_item_locacao FOREIGN KEY (id_locacao) REFERENCES locacao(id_locacao),
    CONSTRAINT fk_item_copia FOREIGN KEY (id_copia) REFERENCES copia(id_copia)
);


CREATE TABLE pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_locacao INT NOT NULL,
    data_pagamento DATETIME NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    forma_pagamento VARCHAR(50) NOT NULL,
    status VARCHAR(50) NOT NULL,
    CONSTRAINT fk_pagamento_locacao FOREIGN KEY (id_locacao) REFERENCES locacao(id_locacao)
);


INSERT INTO categoria (nome, descricao) VALUES ('Ação', 'Filmes de ação e aventura');
INSERT INTO filme (titulo, ano_lancamento, classificacao_indicativa, duracao_minutos, id_categoria) 
VALUES ('Matrix', 1999, '14', 136, 1);
INSERT INTO copia (id_filme, codigo_barras, estado_conservacao, status) 
VALUES (1, '7891234567890', 'Excelente', 'disponível');
INSERT INTO cliente (nome, cpf, telefone, endereco) VALUES ('Beatriz Costa', '123.456.789-00', '(11) 99888-7766', 'Av. Central, 456');
INSERT INTO funcionario (nome, cargo, data_admissao) VALUES ('Lucas Mendes', 'Atendente', '2024-01-15');

INSERT INTO locacao (id_cliente, id_funcionario, data_locacao, data_prevista_devolucao, status) 
VALUES (1, 1, '2026-06-07 15:00:00', '2026-06-14', 'Ativa');
INSERT INTO item_locacao (id_locacao, id_copia, valor_diaria) 
VALUES (1, 1, 5.00);

INSERT INTO pagamento (id_locacao, data_pagamento, valor, forma_pagamento, status) 
VALUES (1, '2026-06-07 15:05:00', 35.00, 'Cartão de Crédito', 'Pago');

select * from categoria;
select * from filme;
select * from copia;
select * from cliente;
select * from funcionario;
select * from locacao;
select * from item_locacao;
select * from pagamento;