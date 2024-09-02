DROP DATABASE IF EXISTS RedeSocialMusica;
CREATE DATABASE IF NOT EXISTS RedeSocialMusica CHARACTER SET utf8 COLLATE utf8_general_ci;
USE RedeSocialMusica;

DROP TABLE IF EXISTS Curtida;
DROP TABLE IF EXISTS PlaylistMusica;
DROP TABLE IF EXISTS Playlist;
DROP TABLE IF EXISTS Usuario;
DROP TABLE IF EXISTS Musica;
DROP TABLE IF EXISTS Usuarios;

CREATE TABLE Usuario (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    idade INT,
    foto VARCHAR(255),
    data_nascimento DATE
);

CREATE TABLE Playlist (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    data_criacao DATE,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id)
);
CREATE TABLE Musica (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    duracao INT NOT NULL
);

CREATE TABLE PlaylistMusica (
    playlist_id INT NOT NULL,
    musica_id INT NOT NULL,
    PRIMARY KEY (playlist_id, musica_id),
    FOREIGN KEY (playlist_id) REFERENCES Playlist(id),
    FOREIGN KEY (musica_id) REFERENCES Musica(id)
);

CREATE TABLE Curtida (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    data DATE,
    playlist_id INT NOT NULL,
    usuario_id INT NOT NULL,
    FOREIGN KEY (playlist_id) REFERENCES Playlist(id),
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id)
);

SHOW TABLES;

INSERT INTO Usuario (nome, idade, foto, data_nascimento) VALUES
('Alice', 25, 'alice.jpg', '1999-03-15'),
('Bob', 30, 'bob.jpg', '1994-07-22'),
('Carol', 28, 'carol.jpg', '1996-12-05');

INSERT INTO Musica (titulo, duracao) VALUES
('Song 1', 180),
('Song 2', 210),
('Song 3', 200),
('Song 4', 240),
('Song 5', 190);

INSERT INTO Playlist (usuario_id, data_criacao) VALUES
(1, '2024-09-01'),
(2, '2024-09-01'),
(3, '2024-09-01');

INSERT INTO PlaylistMusica (playlist_id, musica_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 2),
(2, 3),
(2, 4),
(3, 3),
(3, 4),
(3, 5);

