-- --------------------------------------------------------
-- Host:                         5.255.90.119
-- Server versie:                10.3.31-MariaDB - MariaDB Server
-- Server OS:                    Linux
-- HeidiSQL Versie:              11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Structuur van  tabel termuidenmeos.aangifte wordt geschreven
CREATE TABLE IF NOT EXISTS `aangifte` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `aangever_voornaam` varchar(255) NOT NULL,
  `aangever_achternaam` varchar(255) NOT NULL,
  `aangever_geslacht` varchar(255) NOT NULL,
  `pleegplaats` varchar(255) NOT NULL,
  `pleegdatum` varchar(255) NOT NULL,
  `pleegtijd` varchar(255) NOT NULL,
  `verbalisant` varchar(255) NOT NULL,
  `verklaring` text NOT NULL,
  `opnamedatum` datetime NOT NULL DEFAULT current_timestamp(),
  `status` enum('open','closed','hold') NOT NULL DEFAULT 'open',
  `behandelaar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumpen data van tabel termuidenmeos.aangifte: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `aangifte` DISABLE KEYS */;
/*!40000 ALTER TABLE `aangifte` ENABLE KEYS */;

-- Structuur van  tabel termuidenmeos.aangifte_reacties wordt geschreven
CREATE TABLE IF NOT EXISTS `aangifte_reacties` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `aangifte` int(255) NOT NULL,
  `reactie` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumpen data van tabel termuidenmeos.aangifte_reacties: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `aangifte_reacties` DISABLE KEYS */;
/*!40000 ALTER TABLE `aangifte_reacties` ENABLE KEYS */;

-- Structuur van  tabel termuidenmeos.anotitie wordt geschreven
CREATE TABLE IF NOT EXISTS `anotitie` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) NOT NULL,
  `text` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumpen data van tabel termuidenmeos.anotitie: 0 rows
/*!40000 ALTER TABLE `anotitie` DISABLE KEYS */;
/*!40000 ALTER TABLE `anotitie` ENABLE KEYS */;

-- Structuur van  tabel termuidenmeos.app_activations wordt geschreven
CREATE TABLE IF NOT EXISTS `app_activations` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `userid` int(255) NOT NULL,
  `app_identifier` varchar(255) NOT NULL,
  `status` enum('active','banned') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumpen data van tabel termuidenmeos.app_activations: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `app_activations` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_activations` ENABLE KEYS */;

-- Structuur van  tabel termuidenmeos.beslaglog wordt geschreven
CREATE TABLE IF NOT EXISTS `beslaglog` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `agent` varchar(255) NOT NULL DEFAULT '0',
  `burger` varchar(255) NOT NULL DEFAULT '0',
  `kenteken` varchar(255) NOT NULL DEFAULT '0',
  `voertuig` varchar(255) NOT NULL DEFAULT '0',
  `datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `ip` varchar(255) NOT NULL DEFAULT '0',
  `updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumpen data van tabel termuidenmeos.beslaglog: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `beslaglog` DISABLE KEYS */;
/*!40000 ALTER TABLE `beslaglog` ENABLE KEYS */;

-- Structuur van  tabel termuidenmeos.cjib wordt geschreven
CREATE TABLE IF NOT EXISTS `cjib` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `steam` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `dob` varchar(255) NOT NULL,
  `open` varchar(255) NOT NULL,
  `job` varchar(255) NOT NULL,
  `term` varchar(255) NOT NULL,
  `last_contact` varchar(255) NOT NULL,
  `reminded` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `owned_stuff` text NOT NULL,
  `owned_properties` text NOT NULL,
  `status` enum('open','wanted','closed') NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumpen data van tabel termuidenmeos.cjib: 0 rows
/*!40000 ALTER TABLE `cjib` DISABLE KEYS */;
/*!40000 ALTER TABLE `cjib` ENABLE KEYS */;

-- Structuur van  tabel termuidenmeos.huiszoekinglog wordt geschreven
CREATE TABLE IF NOT EXISTS `huiszoekinglog` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `agent` varchar(255) NOT NULL DEFAULT '0',
  `burger` varchar(255) NOT NULL DEFAULT '0',
  `datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `ip` varchar(255) NOT NULL DEFAULT '0',
  `updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumpen data van tabel termuidenmeos.huiszoekinglog: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `huiszoekinglog` DISABLE KEYS */;
/*!40000 ALTER TABLE `huiszoekinglog` ENABLE KEYS */;

-- Structuur van  tabel termuidenmeos.i8 wordt geschreven
CREATE TABLE IF NOT EXISTS `i8` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `userid` int(255) NOT NULL,
  `datum_1` varchar(255) NOT NULL,
  `datum_2` varchar(255) NOT NULL,
  `plaats` varchar(255) NOT NULL,
  `omstandigheden` varchar(255) NOT NULL,
  `geweld_persoon` int(255) NOT NULL,
  `geweld_goed` int(255) NOT NULL,
  `letsel_betrokkene` int(255) NOT NULL,
  `letsel_betrokkene_onbekend` int(255) DEFAULT NULL,
  `letsel_betrokkene_gering` int(255) DEFAULT NULL,
  `letsel_betrokkene_ander` int(255) DEFAULT NULL,
  `ander_letsel` varchar(255) DEFAULT NULL,
  `andere_schade` varchar(255) DEFAULT NULL,
  `hovj_naam` varchar(255) DEFAULT NULL,
  `hovj_rang` varchar(255) DEFAULT NULL,
  `toegepast_traangas` int(255) DEFAULT NULL,
  `toegepast_diensthond` int(255) DEFAULT NULL,
  `toegepast_dienstvoertuig` int(255) DEFAULT NULL,
  `toegepast_fysiek` int(255) DEFAULT NULL,
  `toegepast_handboeien` int(255) DEFAULT NULL,
  `toegepast_stroomstootwapen` int(255) DEFAULT NULL,
  `toegepast_vuurwapen` int(255) DEFAULT NULL,
  `toegepast_wapenstok` int(255) DEFAULT NULL,
  `beoordeeld_door_id` int(255) DEFAULT NULL,
  `status` int(255) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumpen data van tabel termuidenmeos.i8: 0 rows
/*!40000 ALTER TABLE `i8` DISABLE KEYS */;
/*!40000 ALTER TABLE `i8` ENABLE KEYS */;

-- Structuur van  tabel termuidenmeos.informatie wordt geschreven
CREATE TABLE IF NOT EXISTS `informatie` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `gameid` int(255) NOT NULL,
  `verbalisant` varchar(255) NOT NULL,
  `datum` varchar(255) NOT NULL,
  `notitie` text NOT NULL,
  `sanctie` varchar(255) NOT NULL,
  `gesignaleerd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumpen data van tabel termuidenmeos.informatie: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `informatie` DISABLE KEYS */;
/*!40000 ALTER TABLE `informatie` ENABLE KEYS */;

-- Structuur van  tabel termuidenmeos.invorderlog wordt geschreven
CREATE TABLE IF NOT EXISTS `invorderlog` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `agent` varchar(255) NOT NULL DEFAULT '0',
  `burger` varchar(255) NOT NULL DEFAULT '0',
  `datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `ip` varchar(255) NOT NULL DEFAULT '0',
  `updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumpen data van tabel termuidenmeos.invorderlog: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `invorderlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `invorderlog` ENABLE KEYS */;

-- Structuur van  tabel termuidenmeos.kladblok wordt geschreven
CREATE TABLE IF NOT EXISTS `kladblok` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `userid` int(255) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumpen data van tabel termuidenmeos.kladblok: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `kladblok` DISABLE KEYS */;
/*!40000 ALTER TABLE `kladblok` ENABLE KEYS */;

-- Structuur van  tabel termuidenmeos.livelog wordt geschreven
CREATE TABLE IF NOT EXISTS `livelog` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `agent` varchar(255) NOT NULL,
  `burger` varchar(255) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `burgerid` int(255) NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumpen data van tabel termuidenmeos.livelog: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `livelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `livelog` ENABLE KEYS */;

-- Structuur van  tabel termuidenmeos.pagevisitlog wordt geschreven
CREATE TABLE IF NOT EXISTS `pagevisitlog` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `_SERVER` longtext NOT NULL,
  `_SESSION` longtext NOT NULL,
  `_POST` longtext NOT NULL,
  `_GET` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumpen data van tabel termuidenmeos.pagevisitlog: 0 rows
/*!40000 ALTER TABLE `pagevisitlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagevisitlog` ENABLE KEYS */;

-- Structuur van  tabel termuidenmeos.rdwlog wordt geschreven
CREATE TABLE IF NOT EXISTS `rdwlog` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `voertuigid` int(255) NOT NULL DEFAULT 0,
  `reason` text DEFAULT NULL,
  `plate` varchar(255) DEFAULT NULL,
  `action` varchar(255) NOT NULL DEFAULT '0',
  `ip` varchar(255) NOT NULL DEFAULT '0',
  `user` int(255) NOT NULL DEFAULT 0,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumpen data van tabel termuidenmeos.rdwlog: 0 rows
/*!40000 ALTER TABLE `rdwlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `rdwlog` ENABLE KEYS */;

-- Structuur van  tabel termuidenmeos.rdwwok wordt geschreven
CREATE TABLE IF NOT EXISTS `rdwwok` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `voertuigid` int(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reason` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumpen data van tabel termuidenmeos.rdwwok: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `rdwwok` DISABLE KEYS */;
/*!40000 ALTER TABLE `rdwwok` ENABLE KEYS */;

-- Structuur van  tabel termuidenmeos.recherche wordt geschreven
CREATE TABLE IF NOT EXISTS `recherche` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `rechercheur` varchar(255) NOT NULL,
  `notitie` text NOT NULL,
  `datum` datetime NOT NULL DEFAULT current_timestamp(),
  `burger` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumpen data van tabel termuidenmeos.recherche: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `recherche` DISABLE KEYS */;
/*!40000 ALTER TABLE `recherche` ENABLE KEYS */;

-- Structuur van  tabel termuidenmeos.shadow_rijbewijzen wordt geschreven
CREATE TABLE IF NOT EXISTS `shadow_rijbewijzen` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `rijbewijzen` text NOT NULL,
  `user_id` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumpen data van tabel termuidenmeos.shadow_rijbewijzen: 0 rows
/*!40000 ALTER TABLE `shadow_rijbewijzen` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_rijbewijzen` ENABLE KEYS */;

-- Structuur van  tabel termuidenmeos.specialisaties wordt geschreven
CREATE TABLE IF NOT EXISTS `specialisaties` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '0',
  `short` varchar(255) NOT NULL DEFAULT '0',
  `docent` varchar(255) NOT NULL DEFAULT '0',
  `toelatingsrangen` text DEFAULT NULL,
  `beloningspromotie` text DEFAULT NULL,
  `created_by` varchar(255) NOT NULL DEFAULT '0',
  `ip` varchar(255) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_on` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumpen data van tabel termuidenmeos.specialisaties: 0 rows
/*!40000 ALTER TABLE `specialisaties` DISABLE KEYS */;
/*!40000 ALTER TABLE `specialisaties` ENABLE KEYS */;

-- Structuur van  tabel termuidenmeos.specialisatie_aanmeldingen wordt geschreven
CREATE TABLE IF NOT EXISTS `specialisatie_aanmeldingen` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `specialisatie` int(255) NOT NULL,
  `user` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumpen data van tabel termuidenmeos.specialisatie_aanmeldingen: 0 rows
/*!40000 ALTER TABLE `specialisatie_aanmeldingen` DISABLE KEYS */;
/*!40000 ALTER TABLE `specialisatie_aanmeldingen` ENABLE KEYS */;

-- Structuur van  tabel termuidenmeos.users wordt geschreven
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('inactive','active') NOT NULL,
  `role` enum('admin','om','anwb','user') NOT NULL,
  `rang` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `specialisaties` text DEFAULT NULL,
  `last_login` varchar(255) DEFAULT NULL,
  `2fa` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `trainer` tinyint(1) NOT NULL DEFAULT 0,
  `cjib` tinyint(1) NOT NULL DEFAULT 0,
  `pin` int(6) DEFAULT NULL,
  `app` enum('0','1') NOT NULL DEFAULT '0',
  `secKey` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index 2` (`secKey`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumpen data van tabel termuidenmeos.users: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password`, `status`, `role`, `rang`, `name`, `specialisaties`, `last_login`, `2fa`, `salt`, `trainer`, `cjib`, `pin`, `app`, `secKey`) VALUES
	(1, 'admin', '$2y$10$kxpXZ8boxuNzuIk4awyVQeMzPU11klDGGaj/JxtpG7GrVq8qAy09O', 'active', 'admin', 'Aspirant', 'K. Hollander', NULL, NULL, NULL, NULL, 0, 0, NULL, '0', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
