CREATE DATABASE TP_annonces_corrige;

USE TP_annonces_corrige;

CREATE TABLE utilisateur(
    id_utilisateur INT(11) PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(70) NOT NULL,
    prenom VARCHAR(70) NOT NULL,
    email VARCHAR(70) NOT NULL UNIQUE,
    passwd VARCHAR(70) NOT NULL
)ENGINE=INNODB;

CREATE TABLE categorie(
    id_categorie INT(11) PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(150) NOT NULL
)ENGINE=INNODB;

CREATE TABLE annonce(
    id_annonce INT(11) PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(150) NOT NULL,
    contenu TEXT NOT NULL,
    date_publication DATETIME NOT NULL,
    id_utilisateur INT(11) NOT NULL,
    id_categorie INT(11) NOT NULL,
    CONSTRAINT fk_utilisateur FOREIGN KEY (id_utilisateur) REFERENCES utilisateur (id_utilisateur),
    CONSTRAINT fk_categorie FOREIGN KEY (id_categorie) REFERENCES categorie (id_categorie)
)ENGINE=INNODB;