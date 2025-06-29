-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           11.4.5-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour bondepaiement
CREATE DATABASE IF NOT EXISTS `bondepaiement` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `bondepaiement`;

-- Listage de la structure de table bondepaiement. bons_paiement
CREATE TABLE IF NOT EXISTS `bons_paiement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `montant` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `reference` varchar(50) NOT NULL,
  `code_qr` text DEFAULT NULL,
  `statut` enum('en attente','validé','annulé') DEFAULT 'en attente',
  `date_creation` timestamp NULL DEFAULT current_timestamp(),
  `nom_etudiant` varchar(100) DEFAULT NULL,
  `prenom_etudiant` varchar(100) DEFAULT NULL,
  `matricule_etudiant` varchar(50) DEFAULT NULL,
  `promotion_etudiant` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference` (`reference`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_type_id` (`type_id`),
  KEY `idx_statut` (`statut`),
  KEY `idx_reference` (`reference`),
  KEY `idx_date` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Listage des données de la table bondepaiement.bons_paiement : ~0 rows (environ)

-- Listage de la structure de table bondepaiement. bons_types
CREATE TABLE IF NOT EXISTS `bons_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `montant` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Listage des données de la table bondepaiement.bons_types : ~3 rows (environ)
INSERT INTO `bons_types` (`id`, `nom`, `montant`) VALUES
	(1, 'Frais academiques', 925.00),
	(2, 'Frais cisnet', 20.00),
	(3, 'Attestation de fréquentation', 10.00);

-- Listage de la structure de table bondepaiement. etudiants_valides
CREATE TABLE IF NOT EXISTS `etudiants_valides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matricule` varchar(50) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `postnom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mot_de_passe_temporaire` varchar(255) NOT NULL,
  `est_utilise` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matricule` (`matricule`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Listage des données de la table bondepaiement.etudiants_valides : ~16 rows (environ)
INSERT INTO `etudiants_valides` (`id`, `matricule`, `nom`, `postnom`, `prenom`, `email`, `mot_de_passe_temporaire`, `est_utilise`) VALUES
	(7, 'SI003823', 'BAKASWA', 'KALOMBO', 'GEORGES', NULL, '$2b$12$wkcomUx2CtigSuqkhetZ.ODikKzUsEEe76jddk.euiNNhCksQmV9W', 0),
	(8, 'SI006323', 'BAKILA', 'LUYEYE', 'MERVEDI', NULL, '$2b$12$h90xwSBrPAfwtco0yp0tQeCXhvOvfx0P.xffNkeIb5l5R8H4onUOe', 0),
	(22, 'SI003423', 'BAM', 'BAMUELA', 'RAMEL', NULL, '$2b$12$ApT76PWl7.jrfYR6r7UtZ.0q/54GFImsUb49di5Dfoejxziu45E9u', 0),
	(23, 'SI013223', 'BAMPENDA', 'WA', 'MICHAEL', NULL, '$2b$12$kQ5pazdyATa.b7nnYMXke.tcG5GOcY9wsFPLHFixtVzc5/SbDNt/u', 0),
	(24, 'SI035423', 'BANYI', 'BANTU', 'GEDEON', NULL, '$2b$12$G4DZtNpERSmjJPWWsCo2SudWY2P4iLA4NVdMNK8LVkkuEa6ucfQuC', 0),
	(25, 'SI001723', 'BANZE', 'NKULU', 'JOEL', NULL, '$2b$12$7Cm4epjqaEMMTQQHGV9T.eDD0b.zLLYEh4hpzOTgL/w.Hyw4LRRXu', 0),
	(26, 'SI008223', 'BATUAMA', 'NLANDU', 'ISRAEL', NULL, '$2b$12$.xDGpxxGu7EK689lZrHcUue3LHV6xZV/CrEXtELiIMW5UEq4YzKEW', 0),
	(27, 'SI010723', 'BEKANGA', 'BAKONGA', 'DANIELLA', NULL, '$2b$12$PWoM4tN/fsoRTsQn9ETImO3B28GrG1MX89LWVUPsvQbh2xx0N.IJe', 0),
	(28, 'SI053324', 'BEMBE', 'GERALDO', 'JULIA', NULL, '$2b$12$Aaavk3bQW6tnKTml1O4/n.PjiXlDnQL1/fLoChjmm/dJ/aw8GXUTK', 0),
	(29, 'SI033623', 'BETU', 'SUPRADI', 'SUPRADI', NULL, '$2b$12$RfIgqPcI/fB2OvYzvzvSS.vp6oDALmyBtAMepSh1F8RV22VwgXzY6', 0),
	(30, 'SI038023', 'BIAYA', 'KATENDA', 'HENOCK', NULL, '$2b$12$lv7xVeXAbMmTY47PulGWFOApcEmnNIBy.cKAWoHM.92OAAPwqV72W', 0),
	(31, 'SI008723', 'BIDUAYA', 'ISHAKO', 'DORCAS', NULL, '$2b$12$Uotv0gevkc44fZkhLeU0MOosednYkBTRYkH63kzWNiWH2beBDUPKi', 0),
	(34, 'SI006123', 'BILENGE', 'MWANANGOMB', 'YONI', NULL, '$2b$12$XXr3IMCp5YnhTTpZtMCYme8/XineFdZhFeC8ydRLiI1TR5i5Zsw6.', 0);

-- Listage de la structure de table bondepaiement. facultés
CREATE TABLE IF NOT EXISTS `facultés` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Listage des données de la table bondepaiement.facultés : ~0 rows (environ)
INSERT INTO `facultés` (`id`, `nom`) VALUES
	(1, 'sciences informatiques');

-- Listage de la structure de table bondepaiement. promotions
CREATE TABLE IF NOT EXISTS `promotions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Listage des données de la table bondepaiement.promotions : ~0 rows (environ)
INSERT INTO `promotions` (`id`, `nom`) VALUES
	(1, 'L2 LMD');

-- Listage de la structure de table bondepaiement. roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Listage des données de la table bondepaiement.roles : ~2 rows (environ)
INSERT INTO `roles` (`id`, `nom`) VALUES
	(1, 'administrateur'),
	(2, 'étudiant');

-- Listage de la structure de table bondepaiement. users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matricule` varchar(50) DEFAULT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `postnom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mot_de_passe` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT current_timestamp(),
  `actif` tinyint(1) DEFAULT 1,
  `doit_changer_mot_de_passe` tinyint(1) DEFAULT 1,
  `id_facultés` int(11) DEFAULT NULL,
  `id_promotions` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `matricule` (`matricule`),
  UNIQUE KEY `email_2` (`email`),
  KEY `role_id` (`role_id`),
  KEY `id_facultés` (`id_facultés`),
  KEY `id_promotions` (`id_promotions`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`id_facultés`) REFERENCES `facultés` (`id`),
  CONSTRAINT `users_ibfk_3` FOREIGN KEY (`id_promotions`) REFERENCES `promotions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Listage des données de la table bondepaiement.users : ~9 rows (environ)
INSERT INTO `users` (`id`, `matricule`, `nom`, `postnom`, `prenom`, `email`, `mot_de_passe`, `role_id`, `date_creation`, `actif`, `doit_changer_mot_de_passe`, `id_facultés`, `id_promotions`) VALUES
	(3, 'ADM001', 'Admin', NULL, 'Principal', 'admin@example.com', '$2b$10$5MM1FL2UJz2wMPr7yLTnmu2wPL8WsSM0f87LA9sYpeKNKCqWz7YSy', 1, '2025-06-09 17:57:26', 1, 0, NULL, 1),
	(4, 'SI001122', 'Etudiant', NULL, 'Test', 'etudiant@example.com', '$2b$10$/xFlbW/h0vnHjzU9j1u.tualoAvgSG7mclkSz7k7X0u4Oe5ra067W', 2, '2025-06-09 17:57:26', 1, 1, NULL, 1),
	(7, 'SI007123', NULL, NULL, NULL, NULL, '$2b$10$c9v8E8goZw/wjimn.kC6V..MnAo/ux7kw9ZSWHtomHTDZwObKkLZq', NULL, '2025-06-21 01:50:04', 1, 0, NULL, 1),
	(8, 'SI003923', NULL, NULL, NULL, NULL, '$2b$10$jRQOyapkx5i41141/CWWkOP9wUH.wTZnemY3xvyogM9O92zK5D/AC', NULL, '2025-06-21 02:06:28', 1, 0, NULL, 1),
	(9, 'SI012345', 'Wise', NULL, 'Mokoya', 'wise@example.com', '$2b$10$8epDmkVEoq3StWxTljCUzOxQWDo4WrEqWE1w9aLqFMwWmePZ6bnny', 2, '2025-06-21 02:14:12', 1, 0, 1, 1),
	(10, 'SI2024001', 'MUKENDI', 'KABONGO', 'Jean', 'jean.mukendi@upc.ac.cd', '$2b$10$rQZ8kJQy5F2QjQZ8kJQy5O7QZ8kJQy5F2QjQZ8kJQy5F2QjQZ8kJ', 2, '2025-06-22 22:49:56', 1, 1, 1, 1),
	(11, 'ADMIN001', 'ADMIN', 'SYSTEM', 'Administrateur', 'admin@upc.ac.cd', '$2b$10$XYZ123ABC456DEF789GHI012JKL345MNO678PQR901STU234VWX567', 1, '2025-06-22 22:49:56', 1, 0, 1, 1),
	(12, 'SI2024002', 'TSHIMANGA', 'MBUYI', 'Marie', 'marie.tshimanga@upc.ac.cd', '$2b$10$ABC123DEF456GHI789JKL012MNO345PQR678STU901VWX234YZA567', 2, '2025-06-22 22:49:56', 1, 1, 1, 1),
	(13, 'SI008823', 'BAHEKWA', NULL, 'SEPHORA', NULL, '$2b$10$5Oyy4JiPvvg.nL9Ps5bwIu0kBmLaE8FvUinnFFbXf1aGGsnWSBmF2', 2, '2025-06-22 23:44:11', 1, 0, NULL, 1),
	(14, 'SI018723', 'BIENVENU', NULL, 'DAVID', NULL, '$2b$10$7iM3SARBEbYv8XEre2MTJuc/7mi/KAXJMaSWM2TFLtLo.bK56DD.u', 2, '2025-06-23 00:39:51', 1, 0, NULL, 1),
	(15, 'SI028621', 'BIEMBONKOYI', NULL, 'AMINATA', NULL, '$2b$10$qXGiPRMBl5qe/GWny/eUceFxpP9rqTl.G/sIUoD8CHYhIS1ZdjEaS', 2, '2025-06-24 19:22:15', 1, 0, NULL, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
