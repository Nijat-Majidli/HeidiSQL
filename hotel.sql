-- --------------------------------------------------------
-- Hôte :                        localhost
-- Version du serveur:           5.7.24 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour hotel
CREATE DATABASE IF NOT EXISTS `hotel` /*!40100 DEFAULT CHARACTER SET utf32 COLLATE utf32_turkish_ci */;
USE `hotel`;

-- Listage de la structure de la table hotel. chambre
CREATE TABLE IF NOT EXISTS `chambre` (
  `capacite_chambre` int(11) NOT NULL,
  `degre_confort` int(11) NOT NULL,
  `exposition` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `type_chambre` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `num_chambre` int(11) NOT NULL AUTO_INCREMENT,
  `num_hotel` int(11) NOT NULL,
  PRIMARY KEY (`num_chambre`),
  KEY `FK_chambre_hotel` (`num_hotel`),
  CONSTRAINT `FK_chambre_hotel` FOREIGN KEY (`num_hotel`) REFERENCES `hotel` (`num_hotel`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- Listage des données de la table hotel.chambre : ~0 rows (environ)
/*!40000 ALTER TABLE `chambre` DISABLE KEYS */;
/*!40000 ALTER TABLE `chambre` ENABLE KEYS */;

-- Listage de la structure de la table hotel. client
CREATE TABLE IF NOT EXISTS `client` (
  `adresse_client` varchar(50) COLLATE utf32_turkish_ci NOT NULL DEFAULT '',
  `nom_client` varchar(50) COLLATE utf32_turkish_ci NOT NULL DEFAULT '',
  `prenom_client` varchar(50) COLLATE utf32_turkish_ci NOT NULL DEFAULT '',
  `num_client` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`num_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- Listage des données de la table hotel.client : ~0 rows (environ)
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;

-- Listage de la structure de la table hotel. hotel
CREATE TABLE IF NOT EXISTS `hotel` (
  `capacite_hotel` int(11) NOT NULL,
  `catagorie_hotel` int(11) NOT NULL,
  `nom_hotel` varchar(50) COLLATE utf32_turkish_ci NOT NULL DEFAULT '',
  `adresse_hotel` varchar(50) COLLATE utf32_turkish_ci NOT NULL DEFAULT '',
  `num_hotel` int(11) NOT NULL AUTO_INCREMENT,
  `num_station` int(11) NOT NULL,
  PRIMARY KEY (`num_hotel`),
  KEY `FK_hotel_station` (`num_station`),
  CONSTRAINT `FK_hotel_station` FOREIGN KEY (`num_station`) REFERENCES `station` (`num_station`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- Listage des données de la table hotel.hotel : ~0 rows (environ)
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;

-- Listage de la structure de la table hotel. reservation
CREATE TABLE IF NOT EXISTS `reservation` (
  `num_chambre` int(11) NOT NULL,
  `num_client` int(11) NOT NULL AUTO_INCREMENT,
  `date_debut` int(11) NOT NULL,
  `date_fin` int(11) NOT NULL,
  `date_reservation` int(11) NOT NULL,
  `montant_arrhes` int(11) NOT NULL,
  `prix_total` int(11) NOT NULL,
  PRIMARY KEY (`num_client`),
  KEY `FK_reservation_chambre` (`num_chambre`),
  CONSTRAINT `FK_reservation_chambre` FOREIGN KEY (`num_chambre`) REFERENCES `chambre` (`num_chambre`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_reservation_client` FOREIGN KEY (`num_client`) REFERENCES `client` (`num_client`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- Listage des données de la table hotel.reservation : ~0 rows (environ)
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;

-- Listage de la structure de la table hotel. station
CREATE TABLE IF NOT EXISTS `station` (
  `num_station` int(11) NOT NULL AUTO_INCREMENT,
  `nom_station` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`num_station`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- Listage des données de la table hotel.station : ~1 rows (environ)
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station` (`num_station`, `nom_station`) VALUES
	(1, 'berc');
/*!40000 ALTER TABLE `station` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
