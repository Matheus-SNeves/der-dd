DROP DATABASE IF EXISTS Mercadinho;
CREATE DATABASE Mercadinho CHARACTER SET utf8 COLLATE utf8_general_ci;
USE Mercadinho;

CREATE TABLE Cliente (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,    
    documento VARCHAR(11) NOT NULL UNIQUE,
    endereco VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    data_de_nascimento DATETIME NOT NULL,
    telefone VARCHAR(15) NOT NULL
);

CREATE TABLE Produto (
    codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade INT NOT NULL
);

CREATE TABLE Compra (
    numero_compra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    data_compra DATETIME NOT NULL DEFAULT NOW(),
    saldo DECIMAL(10, 2) NOT NULL,
    cliente_id INT NOT NULL,
    produto_codigo INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id),
    FOREIGN KEY (produto_codigo) REFERENCES Produto(codigo)
);

SHOW TABLES;

-- Inserir 10 produtos
INSERT INTO Produto (nome_produto, preco, quantidade) VALUES
('Produto A', 10.99, 100),
('Produto B', 20.49, 150),
('Produto C', 30.00, 200),
('Produto D', 40.75, 250),
('Produto E', 50.10, 300),
('Produto F', 60.25, 350),
('Produto G', 70.80, 400),
('Produto H', 80.90, 450),
('Produto I', 90.00, 500),
('Produto J', 100.50, 550);

-- Inserir 5 clientes
INSERT INTO Cliente (nome, documento, endereco, email, data_de_nascimento, telefone) VALUES
('João Silva', '12345678901', 'Rua A, 123', 'joao.silva@example.com', '1980-01-15 08:30:00', '11987654321'),
('Maria Oliveira', '23456789012', 'Rua B, 456', 'maria.oliveira@example.com', '1990-05-20 09:00:00', '11987654322'),
('Carlos Santos', '34567890123', 'Rua C, 789', 'carlos.santos@example.com', '1985-07-30 10:15:00', '11987654323'),
('Ana Costa', '45678901234', 'Rua D, 101', 'ana.costa@example.com', '1992-11-10 11:45:00', '11987654324'),
('Pedro Almeida', '56789012345', 'Rua E, 202', 'pedro.almeida@example.com', '1988-03-25 14:00:00', '11987654325');

-- Inserir 7 compras
INSERT INTO Compra (data_compra, saldo, cliente_id, produto_codigo) VALUES
('2024-09-01 15:00:00', 100.00, 1, 1),
('2024-09-02 16:30:00', 150.00, 2, 2),
('2024-09-03 10:45:00', 200.00, 3, 3),
('2024-09-04 11:00:00', 250.00, 4, 4),
('2024-09-05 12:30:00', 300.00, 5, 5),
('2024-09-06 13:15:00', 350.00, 1, 6),
('2024-09-07 14:00:00', 400.00, 2, 7);
