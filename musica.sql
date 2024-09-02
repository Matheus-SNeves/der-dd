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
