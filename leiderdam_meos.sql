-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Gegenereerd op: 04 jan 2021 om 16:12
-- Serverversie: 5.6.45
-- PHP-versie: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leiderdam_meos`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `aangifte`
--

CREATE TABLE `aangifte` (
  `id` int(255) NOT NULL,
  `aangever_voornaam` varchar(255) NOT NULL,
  `aangever_achternaam` varchar(255) NOT NULL,
  `aangever_geslacht` varchar(255) NOT NULL,
  `pleegplaats` varchar(255) NOT NULL,
  `pleegdatum` varchar(255) NOT NULL,
  `pleegtijd` varchar(255) NOT NULL,
  `verbalisant` varchar(255) NOT NULL,
  `verklaring` text NOT NULL,
  `opnamedatum` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('open','closed','hold') NOT NULL DEFAULT 'open',
  `behandelaar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `aangifte_reacties`
--

CREATE TABLE `aangifte_reacties` (
  `id` int(255) NOT NULL,
  `aangifte` int(255) NOT NULL,
  `reactie` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `anotitie`
--

CREATE TABLE `anotitie` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `text` text NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `anotitie`
--


--
-- Tabelstructuur voor tabel `app_activations`
--

CREATE TABLE `app_activations` (
  `id` int(255) NOT NULL,
  `userid` int(255) NOT NULL,
  `app_identifier` varchar(255) NOT NULL,
  `status` enum('active','banned') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `beslaglog`
--

CREATE TABLE `beslaglog` (
  `id` int(255) NOT NULL,
  `agent` varchar(255) NOT NULL DEFAULT '0',
  `burger` varchar(255) NOT NULL DEFAULT '0',
  `kenteken` varchar(255) NOT NULL DEFAULT '0',
  `voertuig` varchar(255) NOT NULL DEFAULT '0',
  `datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(255) NOT NULL DEFAULT '0',
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `cjib`
--

CREATE TABLE `cjib` (
  `id` int(255) NOT NULL,
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
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `huiszoekinglog`
--

CREATE TABLE `huiszoekinglog` (
  `id` int(255) NOT NULL,
  `agent` varchar(255) NOT NULL DEFAULT '0',
  `burger` varchar(255) NOT NULL DEFAULT '0',
  `datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(255) NOT NULL DEFAULT '0',
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `i8`
--

CREATE TABLE `i8` (
  `id` int(255) NOT NULL,
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
  `status` int(255) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `informatie`
--

CREATE TABLE `informatie` (
  `id` int(255) NOT NULL,
  `gameid` int(255) NOT NULL,
  `verbalisant` varchar(255) NOT NULL,
  `datum` varchar(255) NOT NULL,
  `notitie` text NOT NULL,
  `sanctie` varchar(255) NOT NULL,
  `gesignaleerd` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `invorderlog`
--

CREATE TABLE `invorderlog` (
  `id` int(255) NOT NULL,
  `agent` varchar(255) NOT NULL DEFAULT '0',
  `burger` varchar(255) NOT NULL DEFAULT '0',
  `datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(255) NOT NULL DEFAULT '0',
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `kladblok`
--

CREATE TABLE `kladblok` (
  `id` int(255) NOT NULL,
  `userid` int(255) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `kladblok`
--



--
-- Tabelstructuur voor tabel `livelog`
--

CREATE TABLE `livelog` (
  `id` int(255) NOT NULL,
  `agent` varchar(255) NOT NULL,
  `burger` varchar(255) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `burgerid` int(255) NOT NULL,
  `ip` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `livelog`
--



-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pagevisitlog`
--

CREATE TABLE `pagevisitlog` (
  `id` int(255) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `_SERVER` longtext NOT NULL,
  `_SESSION` longtext NOT NULL,
  `_POST` longtext NOT NULL,
  `_GET` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `rdwlog`
--

CREATE TABLE `rdwlog` (
  `id` int(255) NOT NULL,
  `voertuigid` int(255) NOT NULL DEFAULT '0',
  `reason` text,
  `plate` varchar(255) DEFAULT NULL,
  `action` varchar(255) NOT NULL DEFAULT '0',
  `ip` varchar(255) NOT NULL DEFAULT '0',
  `user` int(255) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `rdwwok`
--

CREATE TABLE `rdwwok` (
  `id` int(255) NOT NULL,
  `voertuigid` int(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `rdwwok`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `recherche`
--

CREATE TABLE `recherche` (
  `id` int(255) NOT NULL,
  `rechercheur` varchar(255) NOT NULL,
  `notitie` text NOT NULL,
  `datum` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `burger` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `shadow_rijbewijzen`
--

CREATE TABLE `shadow_rijbewijzen` (
  `id` int(255) NOT NULL,
  `rijbewijzen` text NOT NULL,
  `user_id` int(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `specialisaties`
--

CREATE TABLE `specialisaties` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '0',
  `short` varchar(255) NOT NULL DEFAULT '0',
  `docent` varchar(255) NOT NULL DEFAULT '0',
  `toelatingsrangen` text,
  `beloningspromotie` text,
  `created_by` varchar(255) NOT NULL DEFAULT '0',
  `ip` varchar(255) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `specialisatie_aanmeldingen`
--

CREATE TABLE `specialisatie_aanmeldingen` (
  `id` int(255) NOT NULL,
  `specialisatie` int(255) NOT NULL,
  `user` int(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('inactive','active') NOT NULL,
  `role` enum('admin','om','anwb','user') NOT NULL,
  `rang` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `specialisaties` text,
  `last_login` varchar(255) DEFAULT NULL,
  `2fa` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `trainer` tinyint(1) NOT NULL DEFAULT '0',
  `cjib` tinyint(1) NOT NULL DEFAULT '0',
  `pin` int(6) DEFAULT NULL,
  `app` enum('0','1') NOT NULL DEFAULT '0',
  `secKey` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `status`, `role`, `rang`, `name`, `specialisaties`, `last_login`, `2fa`, `salt`, `trainer`, `cjib`, `pin`, `app`, `secKey`) VALUES
(1, 'admin', '$2y$10$MMcDXDdapaqJzeMH/EL.a.vC0z/sC7MURJ3SUTfRJdhWTEd0BQpRe', 'active', 'admin', 'admin', 'SYSTEEM', '', '20-06-2020', NULL, '', 1, 1, NULL, '0', NULL),

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `aangifte`
--


--
-- Indexen voor tabel `aangifte_old`
--
ALTER TABLE `aangifte_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `aangifte_reacties`
--
ALTER TABLE `aangifte_reacties`
  ADD KEY `Index 1` (`id`);

--
-- Indexen voor tabel `anotitie`
--
ALTER TABLE `anotitie`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `app_activations`
--
ALTER TABLE `app_activations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `app_identifier` (`app_identifier`);

--
-- Indexen voor tabel `beslaglog`
--
ALTER TABLE `beslaglog`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `cjib`
--
ALTER TABLE `cjib`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`);

--
-- Indexen voor tabel `huiszoekinglog`
--
ALTER TABLE `huiszoekinglog`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `i8`
--
ALTER TABLE `i8`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `informatie`
--
ALTER TABLE `informatie`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `invorderlog`
--
ALTER TABLE `invorderlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `kladblok`
--
ALTER TABLE `kladblok`
  ADD KEY `Index 1` (`id`);

--
-- Indexen voor tabel `livelog`
--
ALTER TABLE `livelog`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `pagevisitlog`
--
ALTER TABLE `pagevisitlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `rdwlog`
--
ALTER TABLE `rdwlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `rdwwok`
--
ALTER TABLE `rdwwok`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Index 2` (`voertuigid`);

--
-- Indexen voor tabel `recherche`
--
ALTER TABLE `recherche`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `shadow_rijbewijzen`
--
ALTER TABLE `shadow_rijbewijzen`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `specialisaties`
--
ALTER TABLE `specialisaties`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Index 2` (`short`);

--
-- Indexen voor tabel `specialisatie_aanmeldingen`
--
ALTER TABLE `specialisatie_aanmeldingen`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`name`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `aangifte`
--
ALTER TABLE `aangifte`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `aangifte_old`
--
ALTER TABLE `aangifte_old`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `aangifte_reacties`
--
ALTER TABLE `aangifte_reacties`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT voor een tabel `anotitie`
--
ALTER TABLE `anotitie`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT voor een tabel `app_activations`
--
ALTER TABLE `app_activations`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `beslaglog`
--
ALTER TABLE `beslaglog`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT voor een tabel `cjib`
--
ALTER TABLE `cjib`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT voor een tabel `huiszoekinglog`
--
ALTER TABLE `huiszoekinglog`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT voor een tabel `i8`
--
ALTER TABLE `i8`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT voor een tabel `informatie`
--
ALTER TABLE `informatie`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT voor een tabel `invorderlog`
--
ALTER TABLE `invorderlog`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT voor een tabel `kladblok`
--
ALTER TABLE `kladblok`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT voor een tabel `livelog`
--
ALTER TABLE `livelog`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT voor een tabel `pagevisitlog`
--
ALTER TABLE `pagevisitlog`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `rdwlog`
--
ALTER TABLE `rdwlog`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT voor een tabel `rdwwok`
--
ALTER TABLE `rdwwok`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT voor een tabel `recherche`
--
ALTER TABLE `recherche`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `specialisaties`
--
ALTER TABLE `specialisaties`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT voor een tabel `specialisatie_aanmeldingen`
--
ALTER TABLE `specialisatie_aanmeldingen`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT voor een tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

ALTER TABLE `aangifte`
  ADD PRIMARY KEY (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
