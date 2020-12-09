DROP DATABASE exo1;

CREATE DATABASE exo1;

USE exo1;

CREATE TABLE `client` (
  `cli_num` int NOT NULL,
  `cli_nom` varchar(50) NOT NULL,
  `cli_adresse` varchar(50) NOT NULL,
  `cli_tel` varchar(30) NOT NULL,
  PRIMARY KEY (`cli_num`)
);


CREATE TABLE `produit` (
  `pro_num` int NOT NULL,
  `pro_libelle` varchar(50) NOT NULL,
  `pro_description` varchar(50) NOT NULL,
  PRIMARY KEY (`pro_num`)
);


CREATE TABLE `commande` (
   `com_num` INT NOT NULL,
   `cli_num` INT NOT NULL,
   `com_date` DATETIME NOT NULL,
   `com_obs` VARCHAR(50) NULL DEFAULT,
    PRIMARY KEY (`com_num`),
    CONSTRAINT `FK_commande_client` FOREIGN KEY (`cli_num`) REFERENCES `client` (`cli_num`),
);


CREATE TABLE `est_compose` (
   `com_num` INT NOT NULL,
   `pro_num` INT NOT NULL,
   `est_qte` INT NOT NULL,
    PRIMARY KEY (`com_num`, `pro_num`),
    CONSTRAINT `FK_est_compose_commande` FOREIGN KEY (`com_num`) REFERENCES `commande` (`com_num`),
    CONSTRAINT `FK_est_compose_produit` FOREIGN KEY (`pro_num`) REFERENCES `produit` (`pro_num`),
);


CREATE INDEX index_client ON CLIENT(cli_nom);
SHOW INDEX FROM CLIENT;
