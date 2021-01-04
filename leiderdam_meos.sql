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
-- Tabelstructuur voor tabel `aangifte_old`
--

CREATE TABLE `aangifte_old` (
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

--
-- Gegevens worden geëxporteerd voor tabel `aangifte_reacties`
--

INSERT INTO `aangifte_reacties` (`id`, `aangifte`, `reactie`, `author`, `datetime`) VALUES
(1, 1, 'Huh? Verbalisant Jasper Verbeek\r\nhuhhh?', 'Jasper', '2020-04-10 20:37:30'),
(2, 1, 'persoon heeft 2x lood ontvangen tussen zijn schedel. Zaak afgesloten.', 'Jasper', '2020-04-12 16:50:03'),
(3, 3, 'Graag contact ovj (Lars Jansen) via 0639725170 wanneer er verdere stappen zijn gemaakt in onderzoek.', 'L. Jansen', '2020-06-07 23:47:16'),
(4, 3, 'Gesloten op basis van foutieve aangifte', 'L. Jansen', '2020-06-09 16:00:32'),
(5, 3, 'Dank @L. Jansen, volledig met uw mening eens.', 'SYSTEEM', '2020-06-10 06:37:11'),
(6, 5, 'Telefoonnummer slachtoffer: 0639770526\r\n\r\nMogelijke verdachte: Appie Meijer', 'K. Hollander', '2020-06-14 21:06:11'),
(7, 5, 'Schade: Kapotte helm en kneuzing in kaak', 'K. Hollander', '2020-06-14 21:06:30'),
(8, 5, 'Graag contact ovj voor aanhoudingsbevel, indien nodig.', 'L. Jansen', '2020-06-16 23:59:20'),
(9, 4, 'Graag contact ovj voor aanhoudingsbevel, indien nodig.', 'L. Jansen', '2020-06-16 23:59:28'),
(10, 6, 'Graag contact ovj voor aanhoudingsbevel, indien nodig.', 'L. Jansen', '2020-06-16 23:59:35'),
(11, 7, 'Graag contact ovj voor aanhoudingsbevel, indien nodig.', 'L. Jansen', '2020-06-16 23:59:42');

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

INSERT INTO `anotitie` (`id`, `user_id`, `text`, `date`) VALUES
(9, 195, 'Koen kan vrij weinig\r\n', '2020-04-05 16:56:55'),
(16, 226, 'Beste collega\'s,\r\nIn het vervolg graag signaleringen, aanhoudingen & grotere zaken bespreken met een ovj en deze goed vastleggen in het MEOS zodat iedereen duidelijk op de hoogte is.\r\nIk ben te bereiken via 0639725170 of Opzuigkapje#7910 via de discord app op jullie diensttelefoon.\r\nAlvast bedankt, Keep up the good work!', '2020-06-08 11:13:46'),
(18, 226, 'Beste Collega\'s, Het gebeurd te vaak dat mensen boetes krijgen, en hier geen notitie van wordt gemaakt, Dit is wel vereist! Op die manier kunnen wij bijhouden of er andere maatregelen moeten plaatsvinden, of er terecht is gehandeld, en of bijvoorbeeld het in beslag nemen van een voertuig legitiem is. Gebeurd dit te vaak zal een gesprek met je korpsleiding volgen.', '2020-06-10 18:56:23'),
(19, 15, 'OPSPORINGSBERICHT: Op grond van verdenkingen van het rijden zonder rijbewijs van de Clown-bussen (dat zijn journalisten die items maken over de politie) verzoek ik eenieder hen staande te houden bij aantreffen, op grond van verdenking van overtreden van art. 107 WvW - notitie gemaakt in overleg met operationele leiding (OVD) Mark, Commissaris van de politie.', '2020-06-11 22:04:06');

-- --------------------------------------------------------

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

--
-- Gegevens worden geëxporteerd voor tabel `beslaglog`
--

INSERT INTO `beslaglog` (`id`, `agent`, `burger`, `kenteken`, `voertuig`, `datetime`, `ip`, `updated`) VALUES
(1, 'L. Bouwman', 'steam:11000011129dcc8', 'FOC492', '1104234922', '2020-04-05 23:21:19', '89.220.185.99', '2020-04-05 23:21:19'),
(2, 'L. Bouwman', 'steam:11000011129dcc8', 'OHD731', '-1216765807', '2020-04-05 23:21:23', '89.220.185.99', '2020-04-05 23:21:23'),
(3, 'L. Bouwman', 'steam:11000011129dcc8', 'TVA546', '661493923', '2020-04-05 23:21:27', '89.220.185.99', '2020-04-05 23:21:27');

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

--
-- Gegevens worden geëxporteerd voor tabel `cjib`
--

INSERT INTO `cjib` (`id`, `number`, `name`, `steam`, `phone`, `dob`, `open`, `job`, `term`, `last_contact`, `reminded`, `user`, `owned_stuff`, `owned_properties`, `status`, `created_at`) VALUES
(1, 'CJIB-2020-1', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'K. Hollander', '-', '1 k-', 'closed', '2020-04-05 17:01:06');

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

--
-- Gegevens worden geëxporteerd voor tabel `huiszoekinglog`
--

INSERT INTO `huiszoekinglog` (`id`, `agent`, `burger`, `datetime`, `ip`, `updated`) VALUES
(1, 'khollander(K. Hollander)', 'steam:110000110641ce0', '2019-05-04 19:41:15', '212.187.66.79', '2019-05-04 19:41:15'),
(2, 'roque(R. Bon)', 'steam:11000010b6afb5f', '2019-05-04 19:50:13', '80.60.207.7', '2019-05-04 19:50:13'),
(3, 'roque(R. Bon)', 'steam:110000108afb71f', '2019-05-04 23:13:58', '80.60.207.7', '2019-05-04 23:13:58'),
(4, 'roque(R. Bon)', 'steam:110000108afb71f', '2019-05-04 23:15:00', '80.60.207.7', '2019-05-04 23:15:00'),
(5, 'mschwab(M. Schwab)', '', '2019-05-05 00:18:19', '77.249.192.16', '2019-05-05 00:18:19'),
(6, 'roque(R. Bon)', 'steam:11000013444703e', '2019-05-11 18:19:17', '80.60.207.7', '2019-05-11 18:19:17'),
(7, 'ffietstas(F. Fietstas)', 'steam:110000115438aa1', '2019-05-13 19:16:28', '62.194.151.158', '2019-05-13 19:16:28'),
(8, 'vnieuwlandt(V. Nieuwlandt)', 'steam:110000115438aa1', '2019-05-16 13:51:08', '77.249.192.16', '2019-05-16 13:51:08'),
(9, 'vnieuwlandt(V. Nieuwlandt)', 'steam:110000113f43a8f', '2019-05-16 22:04:33', '77.249.192.16', '2019-05-16 22:04:33'),
(10, 'rdelange(R. Lange de)', '', '2019-05-19 17:23:41', '24.132.139.84', '2019-05-19 17:23:41'),
(11, 'vnieuwlandt(V. Nieuwlandt)', '', '2019-06-28 12:24:44', '77.249.192.16', '2019-06-28 12:24:44'),
(12, 'symon(S. Janssen)', '', '2020-03-30 16:22:22', '86.89.195.36', '2020-03-30 16:22:22'),
(13, 'admin(SYSTEEM)', '', '2020-06-08 02:48:42', '86.89.195.36', '2020-06-08 02:48:42'),
(14, 'admin(SYSTEEM)', '', '2020-06-10 21:57:33', '86.89.195.36', '2020-06-10 21:57:33'),
(15, 'admin(SYSTEEM)', '9e267a8c53eb762e245a544aa877a04fc3bc104a', '2020-06-16 09:26:54', '86.89.195.36', '2020-06-16 09:26:54'),
(16, 'admin(SYSTEEM)', '2eba996286b1acbaaaf25826a85e38eb0c6111d7', '2020-06-18 11:05:16', '86.89.195.36', '2020-06-18 11:05:16'),
(17, 'larsjansen(L. Jansen)', '', '2020-06-21 20:40:48', '84.82.14.94', '2020-06-21 20:40:48'),
(18, 'yourisie1(Y. Sie)', '671d834ce6b100d3d3054d1fe1ad77349258772f', '2020-06-21 20:41:12', '109.38.130.139', '2020-06-21 20:41:12'),
(19, 'larsjansen(L. Jansen)', '671d834ce6b100d3d3054d1fe1ad77349258772f', '2020-06-21 20:41:22', '84.82.14.94', '2020-06-21 20:41:22'),
(20, 'larsjansen(L. Jansen)', '671d834ce6b100d3d3054d1fe1ad77349258772f', '2020-06-21 20:41:33', '84.82.14.94', '2020-06-21 20:41:33'),
(21, 'larsjansen(L. Jansen)', '', '2020-06-23 14:24:03', '84.82.14.94', '2020-06-23 14:24:03');

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

--
-- Gegevens worden geëxporteerd voor tabel `i8`
--

INSERT INTO `i8` (`id`, `userid`, `datum_1`, `datum_2`, `plaats`, `omstandigheden`, `geweld_persoon`, `geweld_goed`, `letsel_betrokkene`, `letsel_betrokkene_onbekend`, `letsel_betrokkene_gering`, `letsel_betrokkene_ander`, `ander_letsel`, `andere_schade`, `hovj_naam`, `hovj_rang`, `toegepast_traangas`, `toegepast_diensthond`, `toegepast_dienstvoertuig`, `toegepast_fysiek`, `toegepast_handboeien`, `toegepast_stroomstootwapen`, `toegepast_vuurwapen`, `toegepast_wapenstok`, `beoordeeld_door_id`, `status`) VALUES
(51, 235, '15-06-2020 ', '15-06-2020 16:20', 'Gemeente gebouw ', '1 personen die een kmar eenheid in het gezicht spuugde. Collega\'s daarop de persoon aangehouden', 1, 1, 0, 0, 0, 0, '', '0', 'Lars Jansen', 'OVJ', 0, 0, 0, 0, 1, 0, 0, 0, 226, 1),
(52, 240, '15-06-2020 ', '15-06-2020', 'Blokkepark in de regen', 'Verdachte geboeid voor transport naar HB.', 1, 1, 0, 0, 0, 0, '', '0', 'L Janssen', 'OVJ', 0, 0, 0, 0, 1, 0, 0, 0, 226, 1),
(50, 240, '14-06-2020 ', '14-06-2020', 'Blokken park aanhouding na mishandeling van een ambtenaar in functie.', 'Nadat ik ( wedding S ) een klap had gekregen van verdachten is hij aangehouden en zijn er handboeien aangeslagen bij hem.', 1, 1, 0, 0, 0, 0, '', '0', 'L Janssen', 'ovj', 0, 0, 0, 1, 1, 0, 0, 0, 226, 1),
(49, 15, '12-06-2020 ', '12-06-2020 20:15', 'Politiebureau, achteringang', 'Verdachte moest politiebureau verlaten, weigerde het, werd gevorderd terwijl er een stroomstootwapen gericht was op hem. Sloeg betrokken agent, waarop ik hem na drie keer aanroepen in zijn been schoot', 1, 0, 1, 1, 0, 0, '', '0', 'Lars', 'OVJ', 0, 0, 0, 0, 1, 0, 1, 0, 226, 1),
(48, 15, '12-06-2020 ', '12-04-2020 20:00', 'Voor het politiebureau', 'Verdachte mishandelde Achmed, (iemand van de Kmar buiten dienst), na meermaals aanspreken geen gehoor. Stroomstootwapen geen effect, liep toen op mij af', 1, 0, 1, 1, 0, 0, '', '0', 'Lars', 'OVJ', 0, 0, 0, 1, 1, 0, 1, 0, 226, 1),
(47, 227, '12-06-2020 ', '12-06-2020 20:30', 'Voor het hoofdbureau van politie, in de richting van het Blokkenpark. Op dit moment regende het en was het wegdek nat.', 'Tijdens een aanhouding van een verdachte door collega\'s was verdachte Sem Hoveling, geboren op 23-07-1990 te Leiderdam erg vervelend en recalcitrant aanwezig. Na meerdere vorderingen weigerde hij te vertrekken. Na het wegduwen bleef verdachte tot 5x toe t', 1, 0, 0, 0, 0, 0, '', '0', 'Youri Sie', '1e Hoofdcommissaris', 0, 0, 0, 1, 1, 1, 0, 1, 226, 1),
(45, 207, '06-06-2020 ', '06-06-2020 16:45', 'Naast het HB, op de openbare weg.', 'Meneer reed weg na staandehouding, en reed hierbij meerdere collega\'s aan', 1, 0, 1, 0, 1, 1, 'Schotwonden in been', '0', 'Kees', 'Brigadegeneraal', 0, 0, 0, 0, 1, 0, 1, 0, 190, 1),
(46, 227, '11-06-2020 ', '11-06-2020 19:10', 'Op de openbare weg', 'Na het negeren van het stopteken en meerdere keren aanrijdingen veroorzaakt te hebben vluchtte de verdachte te voet. Hierop waarschuwingsschoten gelost. Hieraan gaf de verdachte geen gehoor. Na een lange voet achtervolging de verdachte dmv het stroomstoot', 1, 1, 0, 0, 0, 0, '', '0', 'Youri Sie', '1e Hoofcommissaris', 0, 0, 0, 0, 1, 1, 1, 0, 196, 1),
(43, 15, '30-03-2020 ', '12-01-2025 12:00', 'Delft', 'Vuurwapengevaarlijke verdachte nam de benen', 1, 1, 1, 1, 0, 1, 'Vermoord', '1', 'Symon', 'Lieverd', 0, 0, 0, 0, 0, 0, 1, 0, 15, 1),
(44, 201, '10-04-2020 ', '10-04-2020', 'Symon\'s slaapkamer', 'Symon zou mij zuigen, maar hij wou even niet, had tenslotte al 30 BJ achter de rug, hierop dwong ik hem met mijn wapenstok.', 1, 0, 1, 0, 1, 1, 'Soa', '0', 'Mega Mindy', 'Superheld(in) (pijpen)', 0, 0, 0, 1, 1, 1, 0, 1, 201, 1);

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

--
-- Gegevens worden geëxporteerd voor tabel `informatie`
--

INSERT INTO `informatie` (`id`, `gameid`, `verbalisant`, `datum`, `notitie`, `sanctie`, `gesignaleerd`) VALUES
(1, 55, 'T. de Vroed', '2020-04-03', 'Op Vrijdag 3 april 2020 omstreeks 14:00,\r\nhoorden ik,\r\nDE VROED, TOBIAS\r\nCommissaris van politie Eenheid Leiderdam.\r\nin het politie bureau van Leiderdam\r\nals misdadiger een man die opgaf te zijn:\r\n\r\nJANSSEN, SYMON\r\ngeboren op 8 februari 1998 te Leiderdam\r\n\r\nTijdens het surveilleren kwam er een oranje gekleurde auto ons voorbij die door het rode verkeerslicht reed. Ik reed achter de persoon aan en zette mijn stop teken aan en de persoon stopte bij het CIJB op het terrein. Ik controleerde de persoon en de gegevens kwamen overeen met de persoon. Toen ik hem confronteerde dat hij een proces-verbaal zou krijgen ging de persoon er vandoor. De persoon maakt verschillende manoeuvres die binnen het artikel 5 WVW vielen en de persoon de veel verkeersregels overtrad. Na een achtervolging reed de persoon zich zelf vast en rende uit de auto. Na een korte voet achtervolging werd de persoon in de boeien geslagen en mee genomen naar het buro. rond 14:15 kwamen wij aan op het buro. De persoon werd daar voorgeleid en heeft een proces-verbaal gehad over artikel 5 WVW.\r\n\r\nTobias de Vroed,\r\nCommissaris politie Eenheid Leiderdam\r\n\r\n\r\n ', 'Proces-verbaal', NULL),
(3, 55, 'K. Hollander', '2020-04-05', 'Reed zonder rijbewijs op een motor zonder kenteken. Moet verder van mij lopen. Wanneer ik BE nogmaals tref onder dezelfde omstandigheden zal ik het voertuig in beslag nemen.', 'Melding', NULL),
(9, 54, 'L. Bouwman', '2020-02-04', 'Man aangehouden voor het dragen van wapen', 'Wapengevaarlijk ', NULL),
(10, 54, 'Jasper', '2020-04-10', 'Persoon heeft nog een bitchclap tegoed. Bij aantreffen graag uitdelen met de rechterhand.', 'Bitchclap', NULL),
(12, 55, 'S. Janssen', '2029-04-14', 'ffff', 'Signalering', NULL),
(13, 55, 'Jasper', '2020-04-14', 'Meneer op straat aangetroffen tijdens het uitlaten van zijn hondje. Dit zag er erg leuk uit, meneer hiervoor mijn dienstwapen gegeven.', 'Melding', NULL),
(17, 219, 'T. Bright', '2020-06-06', 'Rijden zonder rijbewijs en in een gestolen voertuig', 'PV', NULL),
(18, 242, 'L. Janssen', '2020-06-06', 'Meneer was burn-outs aan het trekken, hierop besloten staande te houden. Tijdens staandehouding is meneer weggereden & reed hierbij meerdere malen collega\'s aan. Besloten BTGV op te starten, hierop kwam geen reactie. Later reed meneer weg en heeft kees hem middels aanhoudingsvuur, neergeschoten.', '15mnd celstraf', ''),
(19, 229, 'Kees Bouwman', '2020-06-06', '5 x plaats te verlaten en daarna 5x gevorde te verlaten... na ongleuk bleef irritant in de weg lopen', 'boete 700', ''),
(20, 219, 'Kees Bouwman', '2020-06-06', 'meneer reed op ons in bij de garage op blokkenpark.. tevens stond het voeruti als gestolen opgegeven en mijn collega heeft meneer op heterdaad beptrapt daarna is meneer weggerend steegje in wordt nu nog gezocht voor diefstal/heling', 'boete rijden zonder rijbewijs en gestolen voerutig', NULL),
(21, 132, 'Luc B.', '2020-06-07', 'Roekeloos rijgedrag, neger stopteken en vluchten van politie', 'Gevangenisstraf', NULL),
(24, 199, 'D. Bouwman', '2020-06-07', 'Mogelijk betrokken drugsdeal', 'Drugsdeal', NULL),
(25, 112, 'K. Hollander', '2020-06-07', 'Persoon sprak met een verdachte van een drugsdeal in mogelijke codetaal dat niemand ergens achter zou komen en dat oma 1 of oma 2 enkele duizenden euro\'s. Hij sprak met Daniel en Diego Moreno.', 'Notitie', ''),
(26, 186, 'L. Jansen', '2004-06-07', 'Vanuit rol OVJ het volgende te horen gekregen: Meneer kreeg van een ander persoon 3 zakjes (Ã¡ 1 gram per stuk) in zijn handen gedrukt, hierop heeft meneer deze direct aan de politie & kmar gegeven. Meneer is aangehouden ivm de hennep, maar dit was te weinig om meneer aan te houden en de verklaring van meneer was zeer geloofwaardig.', 'Geen', ''),
(27, 199, 'K. Bouwman', '2020-06-08', 'rood verkeerslicht negeren', 'boet dooor rood rijden', NULL),
(28, 199, 'L. Jansen', '2020-06-08', 'Verdachte zou samen met Jan Henk Petersma & Daniel Moreno drugs hebben gehandeld (3 gr hennep), en hierna wegrennen bij controle. Graag aanhouden en contact opnemen met OVJ Lars Jansen (Zie dashboard MEOS voor gegevens)', 'Contact met ovj na aanhouding', NULL),
(29, 130, 'K. Hollander', '2020-06-08', 'BE stond bij een melding van voertuigdiefstal, kon het niet hard maken dat hij een poging gedaan had. Voertuig naast Be had geen braakschade, maar stond ook niet op zijn naam. Betrokken voertuig betrof 01HSI960.', 'Notitie', NULL),
(30, 108, 'Y. Sie', '2020-06-08', 'Heeft Tobias een agent van de KMar mishandeld terwijl deze agent bezig was met de uitvoering van zijn taak. Mishandeling betrof een klap in het gezicht. Eerste incident. Enkel bekeuring.', '500â‚¬ bekeuring', ''),
(31, 108, 'Y. Sie', '2020-06-08', 'Heeft Tobias een agent van de KMar mishandeld terwijl deze agent bezig was met de uitvoering van zijn taak. Mishandeling betrof een klap in het gezicht. Eerste incident. Enkel bekeuring.', '500â‚¬ bekeuring', ''),
(32, 130, 'Y. Sie', '2020-06-08', 'Na een melding in het voertuig een flinke hoeveelheid drugs (wiet) en contact geld aangetroffen. Beide in beslag genomen. Hoeveelheid was niet voldoende voor celstraf. Wel 1x verbaal voor witwassen â‚¬2500 (herkomst geld kon niet bewezen worden) en 1x verbaal van 650â‚¬ voor het bij zich hebben van drugs. Hierna in overleg met de hulpofficier heengezonden. ', '2x bekeuring', NULL),
(33, 213, 'Ahmed Bamischijf', '2020-06-08', 'Persoon reed roekeloos over de openbare weg. | REDEN: Zware voeten | RECHBIJSTAND: Neen |\r\nNa verder ondezeoek bleek het voertuig ook gestolen te zijn. | REDEN: Geleent van een vriend. | RECHBIJSTAND: Neen |', 'Bekeuringen | Art. 5 WVW', ''),
(34, 130, 'Ahmed Bamischijf', '2020-06-08', 'Spoed aanhouden!', 'Achtervolging, mogelijk drugs', NULL),
(35, 219, 'K. Hollander', '2020-06-08', 'Roodlicht overtreding', 'Bekeuring ', ''),
(36, 219, 'K. Hollander', '2020-06-08', 'Rijden zonder geldige kentekenplaat', 'Waarschuwing', ''),
(37, 301, 'Y. Belt', '2020-06-09', 'Wij kregen een melding van een voertuig diefstal eenmaal ter plaatse kregen wij met meneer een achtervolging. Wij hebben het gelaten bij een boete aangezien meneer in het verleden niks verkeerds heeft gedaan! Meneer had geen rijbewijs.', '2 boetes', ''),
(39, 219, 'D. Bouwman', '2020-06-10', 'Rijden zonder rijbewijs op zak / ID op zak.', 'Waarschuwing', ''),
(40, 124, 'L. Jansen', '2020-06-08', 'Verhoor 08-06-2020 13:25 door OVJ Lars Jansen in zaak verdenking drugshandel, plaatsgevonden in de avonduren van 07-06-2020:\r\nVerdachte reed met broer diego naar houthak, vlak voor kruispunt kwamen ze meneer (Jan Henk Petersma) tegen, later kwamen ze hem weer tegen, meneer stak over, mogelijk zelfdoding, Jan Henk is weggerend van verdachte, agent heeft ze later aangesproken en er is 6x gevraagd om id & gefouilleerd. Ook heeft verdachte zijn verhaal meerdere malen moeten doen, Jan Henk was met agent aan het praten, op die plek is toen drugs gevonden.', 'Notitie', NULL),
(41, 128, 'K. Hollander', '2020-06-10', 'Roodlicht overtreding ', 'Bekeuring ', ''),
(42, 108, 'K. Hollander', '2020-06-10', 'Had BE op 105 pieksnelheid, niet vastgezet of gemiddeld', 'Waarschuwing', ''),
(43, 308, 'L. Jansen', '2020-06-10', 'Verdachte heeft na een aanhouding wegens voertuig diefstal, tot 2x toe een agent mishandeld, een keer op plaats delict, waarvan hij heeft bekend, de 2e mishandeling is door mij, de officier van justitie, waargenomen in het cellencomplex. Zaak is afgedaan met 2x proces verbaal mishandeling, volgens de strafmaat die door de overheid is opgesteld.', '2x Boete Mishandeling', NULL),
(44, 308, 'L. Jansen', '2020-06-10', 'Verdachte stal bij het vliegveld, op heterdaad een voertuig, verdachte verklaarde hiervoor toestemming te hebben gehad van een marechaussee. Na onderzoek is dit niet bewezen gebleken, Hierna meneer vervolgd volgens de strafmaat opgesteld volgens de overheid van Leiderdam.', 'Boete diefstal van goederen', NULL),
(46, 308, 'D. Bouwman', '2020-06-10', 'Rijden zonder rijbewijs, negeren stopteken en het ligt mishandelen van een Ambtenaar. In overleg met OVJ 3 maanden vastzetten.', 'Celstraf', NULL),
(47, 124, 'K. Hollander', '2020-06-10', 'Illegale uturn', 'Waarschuwing', NULL),
(48, 308, 'L. Jansen', '2020-06-10', 'Art. 9 WVW (Rijden zonder rijbewijs), Art. 184 SR (Negeren stopteken/vordering), Art. 300SR (Mishandeling), graag wanneer straf toegewezen contact met ovj via bekende kanalen. Proces verbalen zijn al toegewezen.\r\n\r\n', '12 maanden cel', NULL),
(50, 124, 'L. Bouwman', '2020-06-11', 'Meneer schuurt vol door een kruispunt. Helaas geen meting kunnen maken van de snelheid. Maar zat er wel boven.', 'Waarschuwing', NULL),
(51, 219, 'L. Bouwman', '2020-06-11', 'Art. 9 WVW (Rijden zonder rijbewijs), Art. 184 SR (Negeren stopteken/vordering), en nog vluchten voor de politie (straf nergens te vinden).', 'Verbaal', ''),
(53, 308, 'Y. Belt', '2020-06-11', 'Meneer heeft geen rijbewijs en vluchten voor de politie 11-6-2020', 'vluchten', NULL),
(54, 314, 'K. Hollander', '2020-06-11', 'Rijden zonder rijbewijs ', 'Bekeuring ', ''),
(55, 314, 'K. Hollander', '2020-06-11', 'Rijden zonder rijbewijs, benoemd dat de auto volgende keer vatbaar is voor in inbeslagname ', 'Bekeuring ', ''),
(56, 128, 'Y. Sie', '2020-06-11', 'Op de stoep geparkeerd. Bekeuring gekregen.', 'Bekeuring', ''),
(57, 124, 'K. Hollander', '2020-06-11', 'Rijden door rood', 'Waarschuwing', NULL),
(58, 312, 'K. Hollander', '2020-06-11', 'Artikel 5', 'Bekeuring ', ''),
(59, 199, 'L. Jansen', '2020-06-11', 'Op 11-6-2020 kreeg collega Luc Bouwman tijdens zijn dienst een telefoontje vanaf het telefoonnummer van Diego Moreno, en hierbij is gedreigd met schieten. Later heeft de heer Luc Bouwman een sms bericht ontvangen met een locatie. Deze locatie is met toestemming van mij, Lars Jansen, doorzocht, hier is echter niks aangetroffen. Wanneer u meneer treft, graag aanhouden en contact met ovj via bekende kanalen!', 'Nvt', NULL),
(60, 219, 'K. Bouwman', '2020-06-11', 'poging doodslag ambtenaar in fucntie boete uitgedeeld', 'boete', ''),
(61, 219, 'K. Bouwman', '2020-06-11', 'Doodslag', 'celstraft', ''),
(62, 106, 'D. Bouwman', '2020-06-12', 'Artikel 5 WvW', 'Waarschuwing', ''),
(63, 199, 'D. Bouwman', '2020-06-12', 'Artikel 5 WvW & Niet tonen van ID op eerste vordering. Meneer ook aangetroffen bij drugs locatie.', 'Boete', NULL),
(64, 308, 'K. Bouwman', '2020-06-12', 'ik kreeg melding voertuig diefstal daarop ginge we controleren meneer zagen we recht voor onze neus 3x wheat plukken.. daarop meneer aangehouden meneer begon ons aardig te beledegen meneer bedreigde mijn collega de 31-42 achmed bamischijf', 'boete+celstraf', ''),
(65, 308, 'Y. Sie', '2020-06-12', 'Tijdens surveillance op genoemde dag en datum zag ik, verbalisant Sie, genoemde betrokkenen een rood verkeerslicht negeren. Ik gaf hierop de bestuurder van de motor een stopteken door middel van het stoptransparant in mijn dienstvoertuig. Ik zag dat betrokkene vervolgens weg reed. Na een achtervolging van ten minste 20 minuten de verdachte kunnen aanhouden. Verdachte was tijdens zijn aanhouding meewerkend. Heeft een 4-tal bekeuringen ontvangen voor: negeren rood verkeerslicht, negeren stopteken, rijden zonder rijbewijs (bleek hier niet van in bezit te zijn) en het veroorzaken van ernstig gevaar/hinder op de openbare weg. Hierna is de betrokkene heen gezonden. ', 'Diverse verbalen', ''),
(66, 308, 'Y. Sie', '2020-06-12', 'Betrokkene was hinderlijk aanwezig bij politieoptreden op straat. Negeerde vorderingen te vertrekken. Uit eindelijk aangehouden. I8 opgemaakt ivm gebruik wapenstok en taser. Bekeuring niet voldoen aan bevel/vordering opgemaakt.', 'Bekeuring', ''),
(67, 308, 'Y. Sie', '2020-06-12', 'Verdachte pleegde na heenzenden zware mishandeling van politieagent. Meerdere vuistslagen in het gezicht. Hiervoor bekeuring zware mishandeling gehad. ', 'Bekeuring', ''),
(69, 219, 'J. Giellissen', '2020-06-12', 'Meneer heeft artikel 5. veroorzaakt en reed zonder geldig rijbewijs.', 'Boete', ''),
(70, 219, 'J. Giellissen', '2020-06-13', 'Mishandeling agent, stelen van voertuig, vluchten van de politie vernieling auto', '20 maanden celstraf', ''),
(71, 124, 'Ahmed Bamischijf', '2020-06-14', 'Deze persoon met BTGV aanhouden, bedreigen van een ambt. in functie. Mogelijk vuurwapen\'s betrokken.', 'Spoed aanhouden', NULL),
(72, 199, 'Ahmed Bamischijf', '2020-06-14', 'Deze persoon met BTGV aanhouden, bedreigen van een ambt. in functie. Mogelijk vuurwapens betrokken.', 'Spoed aanhouden', NULL),
(74, 219, 'J. Giellissen', '2020-06-14', 'Meneer stond achter het bureau van HB en was in de papieren aant rondkijken. hiervoor Proces verbaal voor uitgeschreven', 'Bekeuring', ''),
(75, 132, 'Y. Sie', '2020-06-14', 'Reed betrokkene met een hoge snelheid van het parkeerterrein van de cardealer af. Reed zonder te kijken de openbare weg op. Botste hierdoor tegen een opvallend politievoertuig aan. Betrokkene 2 verbalen gegeven. Was erg vervelend en recalcitrant. Wilde ook dienstnmmr verbalisant hebben.', 'Bekeuringen', ''),
(76, 219, 'H. Kooikarper', '2020-06-14', 'Meneer   had geen id bewijs bij zich en heeft hiervoor een boeite gekregen voor de wet id ', 'boete', ''),
(77, 327, 'B. Vermaning', '2020-06-14', 'Negeren van stopteken, roekeloos rijgedrag en rijden door roos', 'PV', ''),
(78, 199, 'B. Vermaning', '2020-06-15', 'signalering afgesloten!!\r\n', 'Signalering uit', ''),
(79, 124, 'B. Vermaning', '2020-06-15', 'signalering afgesloten!!\r\n', 'signalering uit', ''),
(80, 341, 'D. Bouwman', '2020-06-15', 'Zware mishandeling & beledigen ambtenaar in functie.', 'Celstraf', ''),
(81, 327, 'S. Wedding', '2020-06-15', 'Meneer ging op het voorsorteervak staan voor linksafbuigend vekeer maar reed vervolgens rechtdoor, PV opgemaakt.', 'PV 140 euro', ''),
(82, 341, 'S. Wedding', '2020-06-15', 'Verdachte heeft bij de car dealer middels een scooter over de voeten gereden van Appie, hiervan doet Appie aangiften, volgens verdachten is er door Appie gezegd dat als hij geen drugs wou kopen hij hem zou slaan. hierop is verdachten op zijn scooter gestapt en is hierbij over de voeten van Appie gereden. \r\n\r\nVerdachten is ook door het rode verkeerslicht heen gereden en reed hij zonder juiste rijbewijs, hiervan is PV opgemaakt door Y sie. ', 'Celstraf', ''),
(83, 327, 'L. Bouwman', '2020-06-15', 'Persoon had 41 gram cannabis in zijn auto. ', 'Verbaal', ''),
(85, 346, 'SYSTEEM', '2020-06-16', 'Bij aantreffen van de verdachte: AANHOUDEN MIDDELS BTGV! Verdachte heeft agent Youri Sie zwaar mishandeld. Na aanhouding vast laten zitten en contact leggen met Youri Sie! Voertuig is afgekeurd en rijbewijs in beslag genomen. Daarnaast diverse bekeuringen gekregen. Alles op alles zetten om aan te houden! \r\n\r\nVANUIT Y. SIE', 'SIGNALERING', NULL),
(86, 341, 'J. Giellissen', '2020-06-16', 'Meneer staande door 05-04. Persoon reed zonder rijbewijs, collega 05-01 wou kijken hoe hard de scooter kan. Daarop rende de verdachte naar de auto van 05-01 en reed weg. Daarop aangehouden en richting HB gebracht.', 'Bekeuring ', ''),
(87, 108, 'S. Wedding', '2020-06-16', 'Voertuig had getinte ramen, gemeten op 3% lichtdoorlatendheid. bestuurder opdracht gegeven om dit te laten vervangen, word hij nog eens staande gehouden en is er niks aan gedaan volg PV.', 'Waarsh', ''),
(88, 314, 'S. Wedding', '2020-06-16', 'Meneer reed in voertuig Gekentekend Work 608, hierbij waren alle ruiten gebroken, deze asap laten maken.', 'waarsh', ''),
(89, 314, 'B. Vermaning', '2020-06-16', 'Meneer rijdt in op een ambtenaar voertuig bij de PV en onnnodige burnouts\r\n', 'PV', ''),
(90, 346, 'Y. Sie', '2020-06-20', 'Verdachte stond gesignaleerd voor poging doodslag van een agent. Is aangehouden middels BTGV. Bij aanhouding 68000 euro aan contant geld aangetroffen. Kon de herkomst hiervan niet verklaren. Is in beslag genomen. Ontkende alle betrokkenheid bij overige zaken. Bekeuringen aangezegd voor witwassen, Poging doodslag en rijden zonder rijbewijs. Dit is in beslag genomen na vluchten voor de politie. 2 uur hechtenis opgelegd.', 'Hechtenis en bekeuringen', ''),
(91, 199, 'L. Jansen', '2020-06-20', 'Agent Y. Sie trof verdachte aan in een veld met coca planten, hierna heeft Y. Sie op basis van opiumwet verdachte gefouilleerd, hierbij werd 74 cocaplanten aangetroffen. Hiervoor is verdachte aangehouden en heeft een boete ontvangen.', 'Boete Art. 2 OW (kleine hoeveelheid)', ''),
(93, 288, 'L. Jansen', '2020-07-21', 'wapengevaarlijk', 'Contact met ovj na aanhouding', '1');

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

--
-- Gegevens worden geëxporteerd voor tabel `invorderlog`
--

INSERT INTO `invorderlog` (`id`, `agent`, `burger`, `datetime`, `ip`, `updated`) VALUES
(1, 'khollander(K. Hollander)', 'steam:11000013cbffd74', '2020-04-05 16:53:30', '81.204.193.154', '2020-04-05 16:53:30'),
(2, 'symon(S. Janssen)', 'steam:11000013a4b0d07', '2020-04-07 07:53:58', '86.89.195.36', '2020-04-07 07:53:58'),
(3, 'bjornv(T. Bright)', 'ae06f51f694d4dc001d577a6e525e27f90fb93f3', '2020-05-22 18:59:16', '82.75.120.166', '2020-05-22 18:59:16'),
(4, 'kbouwman(Kees Bouwman)', '9e267a8c53eb762e245a544aa877a04fc3bc104a', '2020-05-23 00:51:13', '145.132.244.161', '2020-05-23 00:51:13'),
(5, 'damians(D. Bouwman)', '111a170d120d4ae1f86d6a3ba8d7c441edd88c49', '2020-06-10 13:32:04', '31.201.13.167', '2020-06-10 13:32:04'),
(6, 'bjornvermaning(B. Vermaning)', '671d834ce6b100d3d3054d1fe1ad77349258772f', '2020-06-12 09:33:27', '86.82.121.66', '2020-06-12 09:33:27'),
(7, 'abamischijf(Ahmed Bamischijf)', '111a170d120d4ae1f86d6a3ba8d7c441edd88c49', '2020-06-13 19:40:54', '81.165.114.148', '2020-06-13 19:40:54'),
(8, 'yourisie1(Y. Sie)', '9e267a8c53eb762e245a544aa877a04fc3bc104a', '2020-06-15 18:52:19', '109.36.131.177', '2020-06-15 18:52:19');

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

INSERT INTO `kladblok` (`id`, `userid`, `text`) VALUES
(1, 186, ''),
(2, 199, ''),
(3, 124, ''),
(4, 128, 'Officier van Justitie'),
(5, 308, 'Meneer vlucht en heeft geen rijbewijs\r\n'),
(6, 219, 'Persoon rijd vaker rond op de afgekeurde motor 9/10 gaat die ervandoor!'),
(7, 194, ''),
(8, 130, 'Meneer aangesproken op de hoeveelheid geld wat nog openstaat, hij geeft aan dat de gemeente ervan weet dat de f7 niet werkt\r\nVerhoor 14-06-2020 23:00 door Lars Jansen:\r\nVerdachte zegt niemand te hebben geslagen\r\nverdachte werd standehouden, er werden fotoÂ´s gemaakt van hem. agent werd in elkaar geslagen door hersenloze, verdachte sloeg hersenloze neer met reden `Je gaat toch niet die agent slaan`. Verdachte zag dat fotograaf op een scooter lastig deed tegen agent, toen verdachte erg dichtbij was, zag verdachte dat fotograaf de agent wou trappen, verdachte verklaart de fotograaf een trap te geven met zelfde reden als hierboven.\r\n\r\nOnterecht dat er in busje is gekeken, antecedent opium. Verdachte verklaart ongegrond.'),
(9, 346, '');

-- --------------------------------------------------------

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

INSERT INTO `livelog` (`id`, `agent`, `burger`, `datetime`, `burgerid`, `ip`) VALUES
(1, 'K. Jansen', 'Symon Janssen', '2020-04-03 10:39:05', 55, '86.89.195.36'),
(2, 'K. Jansen', 'Symon Janssen', '2020-04-03 10:39:37', 55, '86.89.195.36'),
(3, 'K. Jansen', 'Symon Janssen', '2020-04-03 10:39:48', 55, '86.89.195.36'),
(4, 'K. Jansen', 'Symon Janssen', '2020-04-03 10:39:57', 55, '86.89.195.36'),
(5, 'S. Janssen', 'Symon Janssen', '2020-04-03 10:40:28', 55, '86.89.195.36'),
(6, 'S. Janssen', 'Symon Janssen', '2020-04-03 10:40:32', 55, '86.89.195.36'),
(7, 'S. Janssen', 'Symon Janssen', '2020-04-03 13:27:34', 55, '86.89.195.36'),
(8, 'S. Janssen', 'Symon Janssen', '2020-04-03 13:47:31', 55, '86.89.195.36'),
(9, 'T. de Vroed', 'Symon Janssen', '2020-04-03 13:53:37', 55, '145.129.34.182'),
(10, 'T. de Vroed', 'Symon Janssen', '2020-04-03 13:58:10', 55, '145.129.34.182'),
(11, 'T. de Vroed', 'Symon Janssen', '2020-04-03 14:04:56', 55, '145.129.34.182'),
(12, 'T. de Vroed', 'Symon Janssen', '2020-04-03 14:06:09', 55, '145.129.34.182'),
(13, 'S. Janssen', 'Symon Janssen', '2020-04-03 14:06:27', 55, '86.89.195.36'),
(14, 'T. de Vroed', 'Symon Janssen', '2020-04-03 14:16:04', 55, '145.129.34.182'),
(15, 'S. Janssen', 'Symon Janssen', '2020-04-03 14:18:31', 55, '86.89.195.36'),
(16, 'T. de Vroed', 'Symon Janssen', '2020-04-03 14:19:20', 55, '145.129.34.182'),
(17, 'S. Janssen', 'Tobias De Vroed', '2020-04-03 14:22:10', 57, '86.89.195.36'),
(18, 'T. de Vroed', 'Symon Janssen', '2020-04-03 15:01:52', 55, '145.129.34.182'),
(19, 'T. de Vroed', 'Symon Janssen', '2020-04-03 15:01:52', 55, '145.129.34.182'),
(20, 'T. de Vroed', 'Tobias De Vroed', '2020-04-03 15:02:31', 57, '145.129.34.182'),
(21, 'S. Janssen', 'Tommy Shelby', '2020-04-03 18:27:34', 62, '86.89.195.36'),
(22, 'L. Bouwman', 'Luc Bouwman', '2020-04-03 20:10:48', 54, '89.220.185.99'),
(23, 'L. Bouwman', ' ', '2020-04-03 20:11:00', 0, '89.220.185.99'),
(24, 'L. Bouwman', 'Luc Bouwman', '2020-04-03 20:11:01', 54, '89.220.185.99'),
(25, 'B. Vermaning', 'Jasper Koonings', '2020-04-03 20:37:07', 64, '82.75.120.166'),
(26, 'B. Vermaning', 'Jasper Koonings', '2020-04-03 20:37:25', 64, '82.75.120.166'),
(27, 'B. Vermaning', 'Jasper Koonings', '2020-04-03 20:37:34', 64, '82.75.120.166'),
(28, 'L. Bouwman', 'Diego Moreno', '2020-04-03 22:36:19', 63, '89.220.185.99'),
(29, 'L. Bouwman', 'Kian Van Riel', '2020-04-03 22:40:46', 65, '89.220.185.99'),
(30, 'L. Bouwman', 'Damian Bouwman', '2020-04-03 22:41:01', 61, '89.220.185.99'),
(31, 'L. Bouwman', 'Bjorn Vermaning', '2020-04-03 22:41:51', 59, '89.220.185.99'),
(32, 'L. Bouwman', 'Bjorn Vermaning', '2020-04-03 22:42:07', 59, '89.220.185.99'),
(33, 'L. Bouwman', 'Symon Janssen', '2020-04-04 01:14:19', 55, '89.220.185.99'),
(34, 'L. Bouwman', 'Symon Janssen', '2020-04-04 01:19:35', 55, '89.220.185.99'),
(35, 'L. Bouwman', 'Symon Janssen', '2020-04-04 01:19:50', 55, '89.220.185.99'),
(36, 'L. Bouwman', 'Symon Janssen', '2020-04-04 01:20:11', 55, '89.220.185.99'),
(37, 'L. Bouwman', 'Symon Janssen', '2020-04-04 01:20:15', 55, '89.220.185.99'),
(38, 'L. Bouwman', 'Symon Janssen', '2020-04-04 02:25:09', 55, '89.220.185.99'),
(39, 'L. Bouwman', ' ', '2020-04-04 02:25:11', 0, '89.220.185.99'),
(40, 'L. Bouwman', 'Symon Janssen', '2020-04-04 02:25:12', 55, '89.220.185.99'),
(41, 'S. Janssen', 'Tommy Shelby', '2020-04-04 14:13:44', 62, '86.89.195.36'),
(42, 'S. Janssen', 'Tommy Shelby', '2020-04-04 15:56:12', 62, '86.89.195.36'),
(43, 'K. van Riel', 'Luc Bouwman', '2020-04-04 20:10:41', 54, '81.165.114.148'),
(44, 'K. van Riel', 'Luc Bouwman', '2020-04-04 20:11:14', 54, '81.165.114.148'),
(45, 'K. van Riel', 'Luc Bouwman', '2020-04-04 20:11:20', 54, '81.165.114.148'),
(46, 'K. van Riel', 'Luc Bouwman', '2020-04-04 20:11:23', 54, '81.165.114.148'),
(47, 'K. Hollander', 'Luc Bouwman', '2020-04-04 20:18:18', 54, '81.204.193.154'),
(48, 'K. Hollander', 'Luc Bouwman', '2020-04-04 20:18:33', 54, '81.204.193.154'),
(49, 'K. Hollander', 'Luc Bouwman', '2020-04-04 20:18:35', 54, '81.204.193.154'),
(50, 'K. Hollander', 'Luc Bouwman', '2020-04-04 20:18:43', 54, '81.204.193.154'),
(51, 'K. Hollander', 'Luc Bouwman', '2020-04-04 20:18:45', 54, '81.204.193.154'),
(52, 'K. Hollander', 'Luc Bouwman', '2020-04-04 20:19:07', 54, '81.204.193.154'),
(53, 'K. Hollander', 'Luc Bouwman', '2020-04-04 20:19:09', 54, '81.204.193.154'),
(54, 'K. Hollander', 'Luc Bouwman', '2020-04-04 20:19:59', 54, '81.204.193.154'),
(55, 'K. Hollander', 'Luc Bouwman', '2020-04-04 20:20:08', 54, '81.204.193.154'),
(56, 'K. Hollander', 'Luc Bouwman', '2020-04-04 20:20:09', 54, '81.204.193.154'),
(57, 'K. Hollander', 'Luc Bouwman', '2020-04-04 20:21:00', 54, '81.204.193.154'),
(58, 'K. van Riel', 'Luc Bouwman', '2020-04-04 21:08:54', 54, '81.165.114.148'),
(59, 'K. van Riel', 'Bjorn Vermaning', '2020-04-04 21:09:08', 59, '81.165.114.148'),
(60, 'S. Janssen', 'Tobias De Vroed', '2020-04-04 22:15:40', 57, '86.89.195.36'),
(61, 'T. de Vroed', 'Tobias De Vroed', '2020-04-04 23:43:41', 57, '145.129.34.182'),
(62, 'K. Hollander', 'Symon Janssen', '2020-04-05 11:49:15', 55, '81.204.193.154'),
(63, 'S. Janssen', 'Symon Janssen', '2020-04-05 11:51:03', 55, '86.89.195.36'),
(64, 'K. Hollander', 'Symon Janssen', '2020-04-05 11:53:18', 55, '81.204.193.154'),
(65, 'K. Hollander', 'Symon Janssen', '2020-04-05 11:53:18', 55, '81.204.193.154'),
(66, 'S. Janssen', 'Koen Hollander', '2020-04-05 14:31:26', 56, '86.89.195.36'),
(67, 'S. Janssen', 'Symon Janssen', '2020-04-05 14:31:37', 55, '86.89.195.36'),
(68, 'K. Hollander', 'Symon Janssen', '2020-04-05 14:32:53', 55, '81.204.193.154'),
(69, 'K. Hollander', ' ', '2020-04-05 14:33:21', 0, '81.204.193.154'),
(70, 'K. Hollander', 'Symon Janssen', '2020-04-05 14:33:21', 55, '81.204.193.154'),
(71, 'K. Hollander', 'Symon Janssen', '2020-04-05 14:33:50', 55, '81.204.193.154'),
(72, 'K. Hollander', 'Symon Janssen', '2020-04-05 14:33:50', 55, '81.204.193.154'),
(73, 'T. de Vroed', 'Tobias De Vroed', '2020-04-05 16:45:27', 57, '145.129.34.182'),
(74, 'K. Hollander', 'Bjorn Vermaning', '2020-04-05 16:52:38', 59, '81.204.193.154'),
(75, 'K. Hollander', ' ', '2020-04-05 16:53:30', 0, '81.204.193.154'),
(76, 'K. Hollander', 'Bjorn Vermaning', '2020-04-05 16:53:31', 59, '81.204.193.154'),
(77, 'K. Hollander', 'Bjorn Vermaning', '2020-04-05 16:54:10', 59, '81.204.193.154'),
(78, 'K. Hollander', 'Bjorn Vermaning', '2020-04-05 16:54:11', 59, '81.204.193.154'),
(79, 'Bjorn', 'Koen Hollander', '2020-04-05 16:58:51', 56, '82.75.120.166'),
(80, 'Bjorn', 'Koen Hollander', '2020-04-05 16:59:14', 56, '82.75.120.166'),
(81, 'Bjorn', 'Bjorn Vermaning', '2020-04-05 17:01:33', 59, '82.75.120.166'),
(82, 'Bjorn', 'Bjorn Vermaning', '2020-04-05 17:01:33', 59, '82.75.120.166'),
(83, 'Bjorn', 'Bjorn Vermaning', '2020-04-05 17:04:03', 59, '82.75.120.166'),
(84, 'T. de Vroed', 'Bjorn Vermaning', '2020-04-05 18:42:27', 59, '145.129.34.182'),
(85, 'L. Bouwman', 'Floris Smit', '2020-04-05 23:21:03', 60, '89.220.185.99'),
(86, 'L. Bouwman', ' ', '2020-04-05 23:21:19', 4, '89.220.185.99'),
(87, 'L. Bouwman', 'Floris Smit', '2020-04-05 23:21:20', 60, '89.220.185.99'),
(88, 'L. Bouwman', ' ', '2020-04-05 23:21:24', 20, '89.220.185.99'),
(89, 'L. Bouwman', 'Floris Smit', '2020-04-05 23:21:24', 60, '89.220.185.99'),
(90, 'L. Bouwman', ' ', '2020-04-05 23:21:27', 21, '89.220.185.99'),
(91, 'L. Bouwman', 'Floris Smit', '2020-04-05 23:21:27', 60, '89.220.185.99'),
(92, 'S. Janssen', 'Tommy Shelby', '2020-04-06 13:23:48', 62, '86.89.195.36'),
(93, 'L. Bouwman', 'Symon Janssen', '2020-04-06 18:03:39', 55, '89.220.185.99'),
(94, 'S. Janssen', 'Symon Janssen', '2020-04-07 07:53:34', 55, '86.89.195.36'),
(95, 'S. Janssen', ' ', '2020-04-07 07:53:58', 0, '86.89.195.36'),
(96, 'S. Janssen', 'Symon Janssen', '2020-04-07 07:53:59', 55, '86.89.195.36'),
(97, 'S. Janssen', 'Symon Janssen', '2020-04-07 07:54:20', 55, '86.89.195.36'),
(98, 'S. Janssen', 'Symon Janssen', '2020-04-07 07:55:01', 55, '86.89.195.36'),
(99, '', 'Symon Janssen', '2020-04-07 20:30:58', 55, '89.220.185.99'),
(100, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:08:08', 55, '81.204.193.154'),
(101, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:08:55', 55, '81.204.193.154'),
(102, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:09:23', 55, '81.204.193.154'),
(103, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:09:27', 55, '81.204.193.154'),
(104, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:12:05', 55, '81.204.193.154'),
(105, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:12:17', 55, '81.204.193.154'),
(106, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:12:17', 55, '81.204.193.154'),
(107, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:13:38', 55, '81.204.193.154'),
(108, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:13:45', 55, '81.204.193.154'),
(109, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:13:46', 55, '81.204.193.154'),
(110, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:13:53', 55, '81.204.193.154'),
(111, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:13:54', 55, '81.204.193.154'),
(112, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:14:55', 55, '81.204.193.154'),
(113, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:15:28', 55, '81.204.193.154'),
(114, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:15:52', 55, '81.204.193.154'),
(115, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:16:40', 55, '81.204.193.154'),
(116, 'K. Hollander', ' ', '2020-04-07 21:16:57', 0, '81.204.193.154'),
(117, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:16:57', 55, '81.204.193.154'),
(118, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:20:17', 55, '81.204.193.154'),
(119, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:20:27', 55, '81.204.193.154'),
(120, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:20:28', 55, '81.204.193.154'),
(121, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:20:31', 55, '81.204.193.154'),
(122, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:21:33', 55, '81.204.193.154'),
(123, 'K. Hollander', ' ', '2020-04-07 21:21:36', 0, '81.204.193.154'),
(124, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:21:36', 55, '81.204.193.154'),
(125, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:21:45', 55, '81.204.193.154'),
(126, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:21:45', 55, '81.204.193.154'),
(127, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:23:13', 55, '81.204.193.154'),
(128, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:23:50', 55, '81.204.193.154'),
(129, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:26:07', 55, '81.204.193.154'),
(130, 'K. Hollander', ' ', '2020-04-07 21:26:09', 0, '81.204.193.154'),
(131, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:26:09', 55, '81.204.193.154'),
(132, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:26:52', 55, '81.204.193.154'),
(133, 'K. Hollander', ' ', '2020-04-07 21:26:53', 0, '81.204.193.154'),
(134, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:26:54', 55, '81.204.193.154'),
(135, 'K. Hollander', ' ', '2020-04-07 21:27:04', 0, '81.204.193.154'),
(136, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:27:04', 55, '81.204.193.154'),
(137, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:34:25', 55, '81.204.193.154'),
(138, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:34:37', 55, '81.204.193.154'),
(139, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:34:37', 55, '81.204.193.154'),
(140, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:35:25', 55, '81.204.193.154'),
(141, 'K. Hollander', ' ', '2020-04-07 21:35:26', 0, '81.204.193.154'),
(142, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:35:27', 55, '81.204.193.154'),
(143, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:49:56', 55, '81.204.193.154'),
(144, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:50:18', 55, '81.204.193.154'),
(145, 'K. Hollander', 'Symon Janssen', '2020-04-07 21:50:18', 55, '81.204.193.154'),
(146, 'D. Bouwman', 'Symon Janssen', '2020-04-07 22:01:51', 55, '31.201.13.167'),
(147, 'D. Bouwman', 'Luc Bouwman', '2020-04-07 22:03:13', 54, '31.201.13.167'),
(148, 'L. Bouwman', 'Damian Bouwman', '2020-04-07 22:03:17', 61, '89.220.185.99'),
(149, 'L. Bouwman', 'Luc Bouwman', '2020-04-07 22:03:29', 54, '89.220.185.99'),
(150, 'D. Bouwman', 'Damian Bouwman', '2020-04-07 22:04:02', 61, '31.201.13.167'),
(151, 'K. Hollander', 'Symon Janssen', '2020-04-07 22:29:33', 55, '81.204.193.154'),
(152, 'S. Janssen', 'Symon Janssen', '2020-04-08 00:08:23', 55, '86.89.195.36'),
(153, 'L. Bouwman', 'Symon Janssen', '2020-04-08 04:06:16', 55, '89.220.185.99'),
(154, 'T. de Vroed', 'Symon Janssen', '2020-04-08 15:31:10', 55, '145.129.34.182'),
(155, 'T. de Vroed', 'Symon Janssen', '2020-04-09 12:43:21', 55, '145.129.34.182'),
(156, 'T. de Vroed', 'Tobias De Vroed', '2020-04-09 12:46:33', 57, '145.129.34.182'),
(157, 'T. de Vroed', 'Bjorn Vermaning', '2020-04-09 12:47:09', 59, '145.129.34.182'),
(158, 'Bjorn', 'Tobias De Vroed', '2020-04-09 13:53:08', 57, '82.75.120.166'),
(159, 'T. de Vroed', 'Bjorn Vermaning', '2020-04-09 13:53:12', 59, '145.129.34.182'),
(160, 'Bjorn', 'Tobias De Vroed', '2020-04-09 13:53:34', 57, '82.75.120.166'),
(161, 'Bjorn', 'Bjorn Vermaning', '2020-04-09 13:53:49', 59, '82.75.120.166'),
(162, 'S. Janssen', 'Symon Janssen', '2020-04-09 16:47:01', 55, '86.89.195.36'),
(163, 'S. Janssen', ' ', '2020-04-09 16:47:09', 0, '86.89.195.36'),
(164, 'S. Janssen', 'Symon Janssen', '2020-04-09 16:47:10', 55, '86.89.195.36'),
(165, 'S. Janssen', ' ', '2020-04-09 16:47:12', 0, '86.89.195.36'),
(166, 'S. Janssen', 'Symon Janssen', '2020-04-09 16:47:13', 55, '86.89.195.36'),
(167, 'Bjorn', 'Symon Janssen', '2020-04-09 16:56:41', 55, '82.75.120.166'),
(168, 'K. van Riel', 'Kian Van Riel', '2020-04-09 17:22:59', 65, '81.165.114.148'),
(169, 'K. van Riel', 'Kian Van Riel', '2020-04-09 17:23:10', 65, '81.165.114.148'),
(170, 'D. Bouwman', 'Luc Bouwman', '2020-04-10 00:39:19', 54, '31.201.13.167'),
(171, 'L. Bouwman', 'Luc Bouwman', '2020-04-10 00:39:33', 54, '89.220.185.99'),
(172, 'L. Bouwman', 'Luc Bouwman', '2020-04-10 01:01:56', 54, '89.220.185.99'),
(173, 'L. Bouwman', 'Luc Bouwman', '2020-04-10 01:02:20', 54, '89.220.185.99'),
(174, 'L. Bouwman', 'Luc Bouwman', '2020-04-10 01:03:03', 54, '89.220.185.99'),
(175, 'L. Bouwman', 'Luc Bouwman', '2020-04-10 01:03:03', 54, '89.220.185.99'),
(176, 'S. Janssen', 'Luc Bouwman', '2020-04-10 01:47:40', 54, '86.89.195.36'),
(177, 'K. van Riel', 'Symon Janssen', '2020-04-10 02:13:16', 55, '81.165.114.148'),
(178, 'K. van Riel', 'Kian Van Riel', '2020-04-10 02:28:40', 65, '81.165.114.148'),
(179, 'K. van Riel', 'Kian Van Riel', '2020-04-10 02:28:50', 65, '81.165.114.148'),
(180, 'K. van Riel', 'Symon Janssen', '2020-04-10 02:29:12', 55, '81.165.114.148'),
(181, 'S. Janssen', 'Luc Bouwman', '2020-04-10 15:47:13', 54, '86.89.195.36'),
(182, 'S. Janssen', 'Luc Bouwman', '2020-04-10 16:38:23', 54, '86.89.195.36'),
(183, '', 'Luc Bouwman', '2020-04-10 18:15:25', 54, '89.220.185.99'),
(184, 'K. van Riel', 'Kian Van Riel', '2020-04-10 18:42:11', 65, '81.165.114.148'),
(185, 'K. van Riel', 'Kian Van Riel', '2020-04-10 18:42:39', 65, '81.165.114.148'),
(186, 'Jasper', 'Luc Bouwman', '2020-04-10 20:28:51', 54, '84.30.205.18'),
(187, 'Jasper', 'Luc Bouwman', '2020-04-10 20:30:14', 54, '84.30.205.18'),
(188, 'Jasper', 'Luc Bouwman', '2020-04-10 20:30:14', 54, '84.30.205.18'),
(189, 'Jasper', 'Jasper Koonings', '2020-04-10 20:47:51', 64, '84.30.205.18'),
(190, 'Jasper', 'Jasper Koonings', '2020-04-10 20:48:08', 64, '84.30.205.18'),
(191, '', 'Luc Bouwman', '2020-04-10 22:22:11', 54, '31.201.13.167'),
(192, 'T. de Vroed', 'Luc Bouwman', '2020-04-10 22:27:27', 54, '145.129.34.182'),
(193, 'B. Vermaning', 'Luc Bouwman', '2020-04-10 22:30:18', 54, '82.75.120.166'),
(194, 'B. Vermaning', ' ', '2020-04-10 22:30:35', 0, '82.75.120.166'),
(195, 'B. Vermaning', 'Luc Bouwman', '2020-04-10 22:30:36', 54, '82.75.120.166'),
(196, 'T. de Vroed', 'Luc Bouwman', '2020-04-10 22:32:28', 54, '145.129.34.182'),
(197, 'Max. K', 'Luc Bouwman', '2020-04-11 00:41:57', 54, '84.87.84.32'),
(198, 'B. Vermaning', 'Tommy Bright', '2020-04-11 16:46:50', 59, '82.75.120.166'),
(199, 'K. Hollander', 'Koen Hollander', '2020-04-11 20:55:07', 56, '81.204.193.154'),
(200, 'K. Hollander', 'Koen Hollander', '2020-04-11 20:55:30', 56, '81.204.193.154'),
(201, 'K. Hollander', 'Koen Hollander', '2020-04-11 20:55:30', 56, '81.204.193.154'),
(202, 'K. Hollander', 'Koen Hollander', '2020-04-11 20:57:06', 56, '81.204.193.154'),
(203, 'K. Hollander', ' ', '2020-04-11 21:00:16', 0, '81.204.193.154'),
(204, 'K. Hollander', 'Koen Hollander', '2020-04-11 21:00:17', 56, '81.204.193.154'),
(205, 'K. Hollander', ' ', '2020-04-11 21:00:20', 0, '81.204.193.154'),
(206, 'K. Hollander', 'Koen Hollander', '2020-04-11 21:00:20', 56, '81.204.193.154'),
(207, 'S. Janssen', 'Symon Janssen', '2020-04-12 23:08:58', 55, '86.89.195.36'),
(208, 'S. Janssen', 'Symon Janssen', '2020-04-12 23:09:09', 55, '86.89.195.36'),
(209, 'S. Janssen', 'Symon Janssen', '2020-04-12 23:09:10', 55, '86.89.195.36'),
(210, 'S. Janssen', 'Symon Janssen', '2020-04-12 23:09:11', 55, '86.89.195.36'),
(211, 'S. Janssen', 'Symon Janssen', '2020-04-12 23:10:25', 55, '86.89.195.36'),
(212, 'Jasper', 'Symon Janssen', '2020-04-14 00:16:41', 55, '84.30.205.18'),
(213, 'Jasper', 'Symon Janssen', '2020-04-14 00:17:31', 55, '84.30.205.18'),
(214, 'Jasper', 'Symon Janssen', '2020-04-14 00:17:32', 55, '84.30.205.18'),
(215, 'L. Bouwman', 'Symon Janssen', '2020-04-14 18:50:38', 55, '89.220.185.99'),
(216, 'L. Bouwman', ' ', '2020-04-14 18:50:42', 0, '89.220.185.99'),
(217, 'L. Bouwman', 'Symon Janssen', '2020-04-14 18:50:42', 55, '89.220.185.99'),
(218, 'T. de Vroed', 'Max Bouwman', '2020-04-15 19:44:03', 71, '145.129.34.182'),
(219, 'T. de Vroed', 'Tommy Bright', '2020-04-15 19:44:48', 59, '145.129.34.182'),
(220, 'T. de Vroed', 'Tommy Bright', '2020-04-15 19:45:22', 59, '145.129.34.182'),
(221, 'T. de Vroed', 'Tobias De Vroed', '2020-04-15 19:45:37', 57, '145.129.34.182'),
(222, 'Max. K', 'Max Bouwman', '2020-04-15 20:19:48', 71, '84.87.84.32'),
(223, 'Max. K', 'Max Bouwman', '2020-04-15 20:21:24', 71, '84.87.84.32'),
(224, 'Max. K', 'Symon Janssen', '2020-04-15 20:24:41', 55, '84.87.84.32'),
(225, 'Max. K', 'Symon Janssen', '2020-04-15 20:24:56', 55, '84.87.84.32'),
(226, 'Max. K', 'Symon Janssen', '2020-04-15 20:25:13', 55, '84.87.84.32'),
(227, 'Max. K', 'Symon Janssen', '2020-04-15 20:26:15', 55, '84.87.84.32'),
(228, 'L. Bouwman', 'Jasper Koonings', '2020-04-15 22:12:28', 64, '89.220.185.99'),
(229, '', 'Jasper Koonings', '2020-04-16 16:19:29', 64, '89.220.185.99'),
(230, 'L. Bouwman', 'Luc Bouwman', '2020-04-16 18:29:40', 54, '89.220.185.99'),
(231, 'S. Janssen', 'Jurgen Limburg', '2020-05-02 19:21:39', 87, '86.89.195.36'),
(232, 'S. Janssen', 'Jurgen Limburg', '2020-05-02 19:21:48', 87, '86.89.195.36'),
(233, 'T. Bright', 'Jurgen Limburg', '2020-05-12 23:07:39', 114, '82.75.120.166'),
(234, 'T. Bright', 'Jurgen Limburg', '2020-05-12 23:07:49', 114, '82.75.120.166'),
(235, 'T. Bright', 'Karel Janssen', '2020-05-13 12:58:11', 118, '82.75.120.166'),
(236, 'T. Bright', 'Karel Janssen', '2020-05-13 12:58:25', 118, '82.75.120.166'),
(237, 'T. Bright', 'Karel Janssen', '2020-05-13 12:58:47', 118, '82.75.120.166'),
(238, 'S. Janssen', 'Karel Janssen', '2020-05-13 14:21:32', 118, '86.89.195.36'),
(239, 'T. de Vroed', 'Tobias De Vroed', '2020-05-14 15:24:32', 136, '145.129.34.182'),
(240, 'D. Bouwman', 'Liselot Van Velden', '2020-05-17 01:24:47', 98, '31.201.13.167'),
(241, 'D. Bouwman', 'Jason Rumle', '2020-05-17 01:37:40', 98, '31.201.13.167'),
(242, 'D. Bouwman', 'Jason Rumle', '2020-05-17 01:37:57', 98, '31.201.13.167'),
(243, 'D. Bouwman', 'Kees Bouwman', '2020-05-17 02:25:59', 101, '31.201.13.167'),
(244, 'S. Janssen', 'Jason Rumle', '2020-05-17 03:17:37', 98, '86.89.195.36'),
(245, 'Daan V.', 'Brigadier Pannenkoek', '2020-05-17 20:44:26', 117, '145.53.25.56'),
(246, 'Kees Bouwman', 'Kees Bouwman', '2020-05-18 00:38:27', 101, '145.132.244.161'),
(247, 'D. Bouwman', ' ', '2020-05-18 01:45:00', 61, '31.201.13.167'),
(248, 'Mario Gonzales', 'Karel Janssen', '2020-05-18 01:45:42', 98, '82.171.121.61'),
(249, 'D. Bouwman', 'Jason Bright', '2020-05-18 01:46:06', 85, '31.201.13.167'),
(250, 'D. Bouwman', 'Jason Bright', '2020-05-18 01:46:32', 85, '31.201.13.167'),
(251, 'D. Bouwman', ' ', '2020-05-18 01:46:40', 0, '31.201.13.167'),
(252, 'D. Bouwman', 'Jason Bright', '2020-05-18 01:46:40', 85, '31.201.13.167'),
(253, 'D. Bouwman', 'Kees Bouwman', '2020-05-18 10:27:58', 101, '31.201.13.167'),
(254, 'Kees Bouwman', 'Frits Joritsma', '2020-05-18 20:53:34', 89, '145.132.244.161'),
(255, 'Kees Bouwman', 'Frits Joritsma', '2020-05-18 20:53:41', 90, '145.132.244.161'),
(256, 'Mario Gonzales', 'Karel Janssen', '2020-05-18 21:09:28', 122, '82.171.121.61'),
(257, 'Kees Bouwman', 'Karel Janssen', '2020-05-18 21:09:51', 122, '145.132.244.161'),
(258, 'Mario Gonzales', 'Frits Joritsma', '2020-05-18 21:13:57', 89, '82.171.121.61'),
(259, 'Mario Gonzales', 'Frits Joritsma', '2020-05-18 21:14:12', 89, '82.171.121.61'),
(260, 'Mario Gonzales', 'Frits Joritsma', '2020-05-18 21:14:43', 90, '82.171.121.61'),
(261, 'Kees Bouwman', 'Frits Joritsma', '2020-05-18 21:17:43', 90, '145.132.244.161'),
(262, 'Kees Bouwman', 'Frits Joritsma', '2020-05-18 21:17:51', 89, '145.132.244.161'),
(263, 'Mario Gonzales', 'Frits Joritsma', '2020-05-18 21:39:18', 89, '82.171.121.61'),
(264, 'Mario Gonzales', 'Tobias De Vroed', '2020-05-18 22:16:35', 107, '82.171.121.61'),
(265, 'S. Janssen', 'Lars Jansen', '2020-05-20 16:31:48', 128, '86.89.195.36'),
(266, 'S. Janssen', 'Lars Jansen', '2020-05-20 16:32:18', 128, '86.89.195.36'),
(267, 'S. Janssen', 'Lars Jansen', '2020-05-20 16:32:18', 128, '86.89.195.36'),
(268, 'L. Janssen', 'Lars Jansen', '2020-05-20 16:38:54', 128, '84.82.14.94'),
(269, 'S. Janssen', 'Lars Jansen', '2020-05-20 16:39:34', 128, '86.89.195.36'),
(270, 'S. Janssen', 'Lars Jansen', '2020-05-20 16:39:38', 128, '86.89.195.36'),
(271, 'S. Janssen', 'Karel Janssen', '2020-05-20 16:40:12', 122, '86.89.195.36'),
(272, 'L. Janssen', 'Karel Janssen', '2020-05-20 16:40:15', 122, '84.82.14.94'),
(273, 'S. Janssen', 'Karel Janssen', '2020-05-20 16:40:17', 122, '86.89.195.36'),
(274, 'S. Janssen', 'Karel Janssen', '2020-05-20 16:40:28', 122, '86.89.195.36'),
(275, 'S. Janssen', 'Karel Janssen', '2020-05-20 16:40:29', 122, '86.89.195.36'),
(276, 'S. Janssen', 'Karel Janssen', '2020-05-20 16:40:30', 122, '86.89.195.36'),
(277, 'S. Janssen', 'Karel Janssen', '2020-05-20 16:40:30', 122, '86.89.195.36'),
(278, 'S. Janssen', 'Karel Janssen', '2020-05-20 16:40:30', 122, '86.89.195.36'),
(279, 'S. Janssen', 'Karel Janssen', '2020-05-20 16:40:31', 122, '86.89.195.36'),
(280, 'Daan V.', 'Lars Jansen', '2020-05-21 10:27:52', 128, '145.53.25.56'),
(281, 'Daan V.', 'Lars Jansen', '2020-05-21 10:28:40', 128, '145.53.25.56'),
(282, 'Daan V.', 'Lars Jansen', '2020-05-21 10:29:26', 128, '145.53.25.56'),
(283, 'T. de Vroed', 'Lars Jansen', '2020-05-21 11:48:42', 128, '145.129.34.182'),
(284, 'Mario Gonzales', 'Kees Bouwman', '2020-05-21 20:58:46', 101, '82.171.121.61'),
(285, 'Mario Gonzales', 'Kees Bouwman', '2020-05-21 20:59:11', 101, '82.171.121.61'),
(286, 'D. Bouwman', 'Karel Janssen', '2020-05-21 21:07:51', 122, '31.201.13.167'),
(287, 'D. Bouwman', 'Mario Gonzales', '2020-05-21 21:12:24', 104, '31.201.13.167'),
(288, 'D. Bouwman', ' ', '2020-05-21 21:12:27', 0, '31.201.13.167'),
(289, 'D. Bouwman', 'Mario Gonzales', '2020-05-21 21:12:27', 104, '31.201.13.167'),
(290, 'Mario Gonzales', 'Kees Bouwman', '2020-05-21 21:17:52', 101, '82.171.121.61'),
(291, 'Mario Gonzales', 'Kees Bouwman', '2020-05-21 21:23:06', 101, '82.171.121.61'),
(292, 'Mario Gonzales', 'Kees Bouwman', '2020-05-21 21:30:01', 101, '82.171.121.61'),
(293, 'Mario Gonzales', 'Tobias De Vroed', '2020-05-21 21:51:21', 107, '82.171.121.61'),
(294, 'Mario Gonzales', 'Tobias De Vroed', '2020-05-21 21:52:18', 107, '82.171.121.61'),
(295, 'Mario Gonzales', 'Tobias De Vroed', '2020-05-21 21:53:18', 107, '82.171.121.61'),
(296, 'Mario Gonzales', 'Tobias De Vroed', '2020-05-21 21:53:28', 107, '82.171.121.61'),
(297, 'Mario Gonzales', 'Tobias De Vroed', '2020-05-21 21:53:41', 107, '82.171.121.61'),
(298, 'Mario Gonzales', 'Karel Janssen', '2020-05-21 22:10:11', 122, '82.171.121.61'),
(299, 'Mario Gonzales', 'Karel Janssen', '2020-05-21 22:11:46', 122, '82.171.121.61'),
(300, 'Mario Gonzales', 'Karel Janssen', '2020-05-21 22:13:49', 122, '82.171.121.61'),
(301, 'Mario Gonzales', 'Karel Janssen', '2020-05-21 22:14:04', 122, '82.171.121.61'),
(302, 'Mario Gonzales', 'Mario Gonzales', '2020-05-21 23:17:40', 104, '82.171.121.61'),
(303, 'T. Bright', 'Lars Jansen', '2020-05-22 18:59:11', 128, '82.75.120.166'),
(304, 'T. Bright', ' ', '2020-05-22 18:59:14', 0, '82.75.120.166'),
(305, 'T. Bright', 'Lars Jansen', '2020-05-22 18:59:14', 128, '82.75.120.166'),
(306, 'T. Bright', ' ', '2020-05-22 18:59:16', 0, '82.75.120.166'),
(307, 'T. Bright', 'Lars Jansen', '2020-05-22 18:59:17', 128, '82.75.120.166'),
(308, 'Kees Bouwman', 'Kees Bouwman', '2020-05-23 00:48:13', 101, '145.132.244.161'),
(309, 'Kees Bouwman', 'Kees Bouwman', '2020-05-23 00:48:28', 102, '145.132.244.161'),
(310, 'Kees Bouwman', 'Kees Bouwman', '2020-05-23 00:48:36', 101, '145.132.244.161'),
(311, 'Kees Bouwman', 'Kees Bouwman', '2020-05-23 00:48:51', 101, '145.132.244.161'),
(312, 'Kees Bouwman', 'Kees Bouwman', '2020-05-23 00:50:38', 101, '145.132.244.161'),
(313, 'Kees Bouwman', 'Karel Janssen', '2020-05-23 00:50:46', 122, '145.132.244.161'),
(314, 'Kees Bouwman', 'Karel Janssen', '2020-05-23 00:51:07', 122, '145.132.244.161'),
(315, 'Kees Bouwman', ' ', '2020-05-23 00:51:13', 0, '145.132.244.161'),
(316, 'Kees Bouwman', 'Karel Janssen', '2020-05-23 00:51:13', 122, '145.132.244.161'),
(317, 'Kees Bouwman', 'Karel Janssen', '2020-05-23 00:51:31', 122, '145.132.244.161'),
(318, 'Kees Bouwman', 'Karel Janssen', '2020-05-23 00:52:19', 122, '145.132.244.161'),
(319, 'Kees Bouwman', 'Karel Janssen', '2020-05-23 00:52:19', 122, '145.132.244.161'),
(320, 'Kees Bouwman', 'Kees Bouwman', '2020-05-23 00:54:51', 101, '145.132.244.161'),
(321, 'S. Janssen', 'Kees Bouwman', '2020-05-23 01:49:36', 101, '81.165.114.148'),
(322, 'Mario Gonzales', 'Damian Strunk', '2020-05-23 12:55:22', 86, '82.171.121.61'),
(323, 'Mario Gonzales', 'Damian Strunk', '2020-05-23 12:57:46', 86, '82.171.121.61'),
(324, 'Mario Gonzales', 'Damian Strunk', '2020-05-23 13:04:40', 86, '82.171.121.61'),
(325, 'Mario Gonzales', 'Damian Strunk', '2020-05-23 13:04:48', 86, '82.171.121.61'),
(326, 'Mario Gonzales', 'Damian Strunk', '2020-05-23 13:04:58', 86, '82.171.121.61'),
(327, 'Mario Gonzales', 'Damian Strunk', '2020-05-23 13:05:11', 86, '82.171.121.61'),
(328, 'Mario Gonzales', 'Damian Strunk', '2020-05-23 13:05:13', 86, '82.171.121.61'),
(329, 'Kees Bouwman', 'John Bever', '2020-05-23 20:35:53', 122, '145.132.244.161'),
(330, 'Daan V.', 'John Bever', '2020-05-24 00:22:37', 122, '145.53.25.56'),
(331, 'Daan V.', 'Damian Strunk', '2020-05-24 00:37:18', 86, '145.53.25.56'),
(332, 'Daan V.', 'Henk  Boterham', '2020-05-24 00:37:39', 118, '145.53.25.56'),
(333, 'Daan V.', 'Henk  Boterham', '2020-05-24 22:23:26', 118, '145.53.25.56'),
(334, 'Daan V.', 'Henk  Boterham', '2020-05-24 23:15:17', 118, '145.53.25.56'),
(335, 'T. de Vroed', 'Tobias De Vroed', '2020-05-27 20:47:17', 107, '145.129.34.182'),
(336, 'T. de Vroed', 'Tobias De Vroed', '2020-05-27 20:47:24', 108, '145.129.34.182'),
(337, 'D. Bouwman', 'Damian Strunk', '2020-05-27 20:49:06', 86, '31.201.13.167'),
(338, 'Luc B.', 'John Bever', '2020-05-28 14:17:33', 122, '89.220.185.99'),
(339, 'T. de Vroed', 'John Bever', '2020-05-28 14:18:20', 122, '145.129.34.182'),
(340, 'D. Bouwman', 'Damian Strunk', '2020-06-01 11:47:30', 86, '31.201.13.167'),
(341, 'D. Bouwman', 'Jason Bright', '2020-06-01 11:47:40', 85, '31.201.13.167'),
(342, 'Daan V.', 'Henk  Boterham', '2020-06-01 14:59:14', 118, '145.53.25.56'),
(343, 'Daan V.', 'Henk  Boterham', '2020-06-01 15:12:12', 118, '145.53.25.56'),
(344, 'Daan V.', 'Henk  Boterham', '2020-06-01 20:23:18', 118, '145.53.25.56'),
(345, 'D. Bouwman', 'Tobias De Vroed', '2020-06-01 20:27:44', 107, '31.201.13.167'),
(346, 'T. Bright', 'Tobias De Vroed', '2020-06-01 20:27:53', 107, '82.75.120.166'),
(347, 'T. Bright', 'Tobias De Vroed', '2020-06-01 20:31:55', 108, '82.75.120.166'),
(348, 'Daan V.', 'Henk  Boterham', '2020-06-01 20:43:58', 118, '145.53.25.56'),
(349, 'D. Bouwman', 'Karel Janssen', '2020-06-01 21:03:32', 142, '31.201.13.167'),
(350, 'D. Bouwman', 'Karel Janssen', '2020-06-01 21:09:13', 142, '31.201.13.167'),
(351, 'Luc B.', ' ', '2020-06-01 21:41:24', 122, '89.220.185.99'),
(352, 'S. Janssen', ' ', '2020-06-01 21:43:02', 122, '86.89.195.36'),
(353, 'S. Janssen', ' ', '2020-06-01 21:43:05', 0, '86.89.195.36'),
(354, 'S. Janssen', ' ', '2020-06-01 21:43:05', 0, '86.89.195.36'),
(355, 'S. Janssen', 'Karel Janssen', '2020-06-01 21:43:11', 142, '86.89.195.36'),
(356, 'D. Bouwman', 'Jason Bright', '2020-06-04 22:17:45', 85, '31.201.13.167'),
(357, 'S. Soldaat', 'Jason Bright', '2020-06-04 22:33:11', 85, '83.84.194.25'),
(358, 'Kees Bouwman', 'Jason Bright', '2020-06-04 23:15:41', 85, '145.132.244.161'),
(359, 'Kees Bouwman', 'Karel Janssen', '2020-06-04 23:15:51', 186, '145.132.244.161'),
(360, 'Kees Bouwman', 'Kees Bouwman', '2020-06-04 23:16:00', 101, '145.132.244.161'),
(361, 'Kees Bouwman', 'Kees Bouwman', '2020-06-04 23:16:04', 102, '145.132.244.161'),
(362, 'Kees Bouwman', 'Jason Bright', '2020-06-04 23:16:28', 85, '145.132.244.161'),
(363, 'S. Janssen', 'Kees Bouwman', '2020-06-04 23:20:46', 102, '86.89.195.36'),
(364, 'S. Janssen', 'Frits Jorritsma', '2020-06-05 17:16:55', 90, '86.89.195.36'),
(365, 'S. Janssen', 'Frits Jorritsma', '2020-06-05 18:25:54', 90, '86.89.195.36'),
(366, 'S. Janssen', 'Ibrahim Tatlises', '2020-06-05 18:25:59', 188, '86.89.195.36'),
(367, 'S. Janssen', 'Ibrahim Tatlises', '2020-06-05 18:26:57', 188, '86.89.195.36'),
(368, 'S. Janssen', 'Ibrahim Tatlises', '2020-06-05 18:30:20', 188, '86.89.195.36'),
(369, 'S. Janssen', 'Ibrahim Tatlises', '2020-06-05 18:30:21', 188, '86.89.195.36'),
(370, 'S. Janssen', 'Ibrahim Tatlises', '2020-06-05 18:30:46', 188, '86.89.195.36'),
(371, 'S. Janssen', 'Ibrahim Tatlises', '2020-06-05 18:57:15', 188, '86.89.195.36'),
(372, 'S. Janssen', 'Ibrahim Tatlises', '2020-06-05 20:05:13', 188, '86.89.195.36'),
(373, 'S. Janssen', 'Ibrahim Tatlises', '2020-06-05 20:21:57', 188, '86.89.195.36'),
(374, 'Luc B.', 'Karel Janssen', '2020-06-06 00:22:49', 186, '89.220.185.99'),
(375, 'Luc B.', 'Karel Janssen', '2020-06-06 00:24:24', 186, '89.220.185.99'),
(376, 'Aiko', 'Aiko De Brabander', '2020-06-06 01:02:57', 112, '78.20.186.87'),
(377, 'Aiko', 'Aiko De Brabander', '2020-06-06 01:05:42', 112, '78.20.186.87'),
(378, 'Aiko', 'Jan Deurmat', '2020-06-06 01:06:19', 132, '78.20.186.87'),
(379, 'Aiko', 'Jan Deurmat', '2020-06-06 01:06:48', 132, '78.20.186.87'),
(380, 'Aiko', 'Jan Deurmat', '2020-06-06 01:07:36', 132, '78.20.186.87'),
(381, 'Aiko', 'Jan Deurmat', '2020-06-06 01:07:36', 132, '78.20.186.87'),
(382, 'S. Janssen', 'Karel Janssen', '2020-06-06 03:37:33', 186, '86.89.195.36'),
(383, 'S. Janssen', 'Karel Janssen', '2020-06-06 03:37:37', 186, '86.89.195.36'),
(384, 'S. Janssen', 'Karel Janssen', '2020-06-06 03:43:26', 186, '86.89.195.36'),
(385, 'L. Janssen', 'Frits Jorritsma', '2020-06-06 04:48:51', 90, '84.82.14.94'),
(386, 'L. Janssen', 'Jan Deurmat', '2020-06-06 04:52:11', 132, '84.82.14.94'),
(387, 'L. Janssen', ' ', '2020-06-06 04:52:19', 0, '84.82.14.94'),
(388, 'L. Janssen', 'Jan Deurmat', '2020-06-06 04:52:19', 132, '84.82.14.94'),
(389, 'L. Janssen', 'Lars Jansen', '2020-06-06 04:52:35', 128, '84.82.14.94'),
(390, 'L. Janssen', 'Lars Jansen', '2020-06-06 04:52:51', 128, '84.82.14.94'),
(391, 'L. Janssen', 'Lars Jansen', '2020-06-06 04:52:59', 128, '84.82.14.94'),
(392, 'S. Janssen', 'Karel Janssen', '2020-06-06 08:32:47', 186, '86.89.195.36'),
(393, 'S. Janssen', 'Karel Janssen', '2020-06-06 08:32:52', 186, '86.89.195.36'),
(394, '', 'Karel Janssen', '2020-06-06 11:25:12', 186, '86.89.195.36'),
(395, 'D. Bouwman', 'Jason Bright', '2020-06-06 12:49:28', 86, '31.201.13.167'),
(396, 'Dennis R.', 'Jason Bright', '2020-06-06 13:10:10', 86, '86.82.43.237'),
(397, 'D. Bouwman', 'Donnie Dalmau', '2020-06-06 13:29:27', 219, '31.201.13.167'),
(398, 'D. Bouwman', 'Donnie Dalmau', '2020-06-06 13:29:37', 219, '31.201.13.167'),
(399, 'Yoek B', 'Donnie Dalmau', '2020-06-06 13:29:41', 219, '5.199.158.46'),
(400, 'T. Bright', 'Donnie Dalmau', '2020-06-06 13:34:08', 219, '82.75.120.166'),
(401, 'T. Bright', 'Donnie Dalmau', '2020-06-06 13:34:52', 219, '82.75.120.166'),
(402, 'T. Bright', 'Donnie Dalmau', '2020-06-06 13:34:52', 219, '82.75.120.166'),
(403, 'T. Bright', 'Donnie Dalmau', '2020-06-06 13:35:28', 219, '82.75.120.166'),
(404, 'T. Bright', 'Donnie Dalmau', '2020-06-06 13:38:14', 219, '82.75.120.166'),
(405, 'L. Janssen', 'Ibrahim Tatlises', '2020-06-06 13:40:42', 188, '84.82.14.94'),
(406, 'Luc B.', 'Donnie Dalmau', '2020-06-06 13:44:50', 219, '89.220.185.99'),
(407, 'Max. K', 'Lars Jansen', '2020-06-06 13:49:33', 128, '84.87.84.32'),
(408, 'L. Janssen', 'Ibrahim Tatlises', '2020-06-06 13:52:53', 188, '84.82.14.94'),
(409, 'Luc B.', ' ', '2020-06-06 14:02:46', 219, '89.220.185.99'),
(410, 'L. Janssen', 'Ibrahim Tatlises', '2020-06-06 14:02:52', 188, '84.82.14.94'),
(411, 'L. Janssen', 'Lars Jansen', '2020-06-06 14:03:14', 128, '84.82.14.94'),
(412, 'Max. K', ' ', '2020-06-06 14:38:34', 0, '84.87.84.32'),
(413, 'Max. K', 'Lars Jansen', '2020-06-06 14:38:34', 128, '84.87.84.32'),
(414, 'D. Bouwman', 'Ryan Rodevalk', '2020-06-06 15:05:58', 106, '31.201.13.167'),
(415, 'Kees Bouwman', 'Ryan Rodevalk', '2020-06-06 15:06:01', 106, '145.132.244.161'),
(416, 'Kees Bouwman', 'Lars Jansen', '2020-06-06 15:49:10', 128, '145.132.244.161'),
(417, 'Kees Bouwman', 'Ryan Rodevalk', '2020-06-06 16:01:11', 106, '145.132.244.161'),
(418, 'Kees Bouwman', 'Abdelouhaid Elmourabit', '2020-06-06 16:36:56', 240, '145.132.244.161'),
(419, 'Dennis R.', 'Luc Bouwman', '2020-06-06 16:44:53', 190, '86.82.43.237'),
(420, 'Dennis R.', 'Luc Bouwman', '2020-06-06 16:45:24', 190, '86.82.43.237'),
(421, 'Luc B.', 'Luc Bouwman', '2020-06-06 16:46:24', 190, '89.220.185.99'),
(422, 'Luc B.', 'Symon Janssen', '2020-06-06 16:51:05', 186, '89.220.185.99'),
(423, 'Luc B.', 'Symon Janssen', '2020-06-06 16:51:53', 186, '89.220.185.99'),
(424, 'Dennis R.', 'Ahmed Bamischijf', '2020-06-06 16:51:55', 132, '86.82.43.237'),
(425, 'Luc B.', 'Ahmed Bamischijf', '2020-06-06 16:51:57', 132, '89.220.185.99'),
(426, 'Dennis R.', 'Ahmed Bamischijf', '2020-06-06 16:52:06', 132, '86.82.43.237'),
(427, 'Luc B.', 'Symon Janssen', '2020-06-06 16:52:35', 186, '89.220.185.99'),
(428, 'L. Janssen', 'Patrick Klaas', '2020-06-06 17:03:23', 242, '84.82.14.94'),
(429, 'L. Janssen', 'Patrick Klaas', '2020-06-06 17:03:46', 242, '84.82.14.94'),
(430, 'L. Janssen', 'Patrick Klaas', '2020-06-06 17:04:01', 242, '84.82.14.94'),
(431, 'Kees Bouwman', 'Luc Bouwman', '2020-06-06 17:04:28', 190, '145.132.244.161'),
(432, '', 'Ibrahim Tatlises', '2020-06-06 17:04:33', 188, '213.127.45.24'),
(433, 'Dennis R.', 'Ahmed Bamischijf', '2020-06-06 17:04:34', 132, '86.82.43.237'),
(434, 'Henk K.', 'Ahmed Bamischijf', '2020-06-06 17:04:41', 132, '213.127.45.24'),
(435, 'L. Janssen', 'Patrick Klaas', '2020-06-06 17:06:18', 242, '84.82.14.94'),
(436, 'L. Janssen', 'Patrick Klaas', '2020-06-06 17:06:18', 242, '84.82.14.94'),
(437, 'L. Janssen', 'Patrick Klaas', '2020-06-06 17:09:48', 242, '84.82.14.94'),
(438, 'Luc B.', 'Donnie Dalmau', '2020-06-06 17:39:04', 219, '89.220.185.99'),
(439, 'Luc B.', 'Donnie Dalmau', '2020-06-06 17:39:07', 219, '89.220.185.99'),
(440, 'Kees Bouwman', 'Hans Glock', '2020-06-06 18:06:18', 229, '145.132.244.161'),
(441, 'Kees Bouwman', 'Hans Glock', '2020-06-06 18:06:36', 229, '145.132.244.161'),
(442, 'Kees Bouwman', 'Hans Glock', '2020-06-06 18:07:27', 229, '145.132.244.161'),
(443, 'Kees Bouwman', 'Hans Glock', '2020-06-06 18:07:27', 229, '145.132.244.161'),
(444, 'Luc B.', 'Paul De Paaier', '2020-06-06 18:08:50', 130, '89.220.185.99'),
(445, 'Kees Bouwman', 'Donnie Dalmau', '2020-06-06 18:28:36', 219, '145.132.244.161'),
(446, 'Kees Bouwman', 'Donnie Dalmau', '2020-06-06 18:29:34', 219, '145.132.244.161'),
(447, 'Kees Bouwman', 'Donnie Dalmau', '2020-06-06 18:29:52', 219, '145.132.244.161'),
(448, 'Kees Bouwman', 'Donnie Dalmau', '2020-06-06 18:31:33', 219, '145.132.244.161'),
(449, 'Kees Bouwman', 'Donnie Dalmau', '2020-06-06 18:31:33', 219, '145.132.244.161'),
(450, 'D. Bouwman', 'Lars Jansen', '2020-06-06 22:11:22', 128, '31.201.13.167'),
(451, 'Y. Sie', 'Donnie Dalmau', '2020-06-07 00:04:59', 219, '77.160.150.93'),
(452, 'Y. Sie', 'Youri Sie', '2020-06-07 00:06:33', 194, '77.160.150.93'),
(453, 'Y. Sie', 'Youri Sie', '2020-06-07 00:07:42', 194, '77.160.150.93'),
(454, 'M. Tegelen', 'Mark Tegelen', '2020-06-07 12:19:53', 231, '84.25.211.35'),
(455, 'Yoek B', 'Yoek Beld', '2020-06-07 12:22:44', 248, '5.199.158.46'),
(456, 'Yoek B', 'Donnie Dalmau', '2020-06-07 12:26:35', 219, '5.199.158.46'),
(457, 'Yoek B', 'Yoek Beld', '2020-06-07 12:27:06', 248, '5.199.158.46'),
(458, 'T. Bright', 'Donnie Dalmau', '2020-06-07 12:59:18', 219, '82.75.120.166'),
(459, 'Luc B.', 'Donnie Dalmau', '2020-06-07 13:25:45', 219, '89.220.185.99'),
(460, 'Luc B.', ' ', '2020-06-07 13:25:47', 0, '89.220.185.99'),
(461, 'Luc B.', 'Donnie Dalmau', '2020-06-07 13:25:48', 219, '89.220.185.99'),
(462, 'Luc B.', 'Ahmed Bamischijf', '2020-06-07 17:43:22', 132, '89.220.185.99'),
(463, 'Luc B.', 'Ahmed Bamischijf', '2020-06-07 17:45:07', 132, '89.220.185.99'),
(464, 'Luc B.', 'Ahmed Bamischijf', '2020-06-07 17:45:07', 132, '89.220.185.99'),
(465, 'M. Lorriper', 'Aiko Chapo', '2020-06-07 18:05:09', 112, '94.226.142.47'),
(466, 'M. Lorriper', 'Aiko Chapo', '2020-06-07 18:06:35', 112, '94.226.142.47'),
(467, 'Y. Sie', 'Paul De Paaier', '2020-06-07 18:48:10', 130, '109.38.130.44'),
(468, 'Y. Sie', 'Paul De Paaier', '2020-06-07 18:49:15', 130, '109.38.130.44'),
(469, 'Y. Sie', 'Paul De Paaier', '2020-06-07 18:49:39', 130, '109.38.130.44'),
(470, 'Y. Sie', 'Paul De Paaier', '2020-06-07 18:53:18', 130, '109.38.130.44'),
(471, 'Y. Sie', 'Paul De Paaier', '2020-06-07 18:53:43', 130, '109.38.130.44'),
(472, 'S. Janssen', 'Paul De Paaier', '2020-06-07 19:02:06', 130, '86.89.195.36'),
(473, 'K. Hollander', 'Paul De Paaier', '2020-06-07 19:02:37', 130, '81.204.193.154'),
(474, 'S. Janssen', 'Ahmed Bamischijf', '2020-06-07 19:02:52', 132, '86.89.195.36'),
(475, 'K. Hollander', 'Paul De Paaier', '2020-06-07 19:06:30', 130, '81.204.193.154'),
(476, 'K. Hollander', 'Paul De Paaier', '2020-06-07 19:06:58', 130, '81.204.193.154'),
(477, 'S. Janssen', 'Jan Henk Petersma', '2020-06-07 19:07:16', 186, '86.89.195.36'),
(478, 'SYSTEEM', 'Ahmed Bamischijf', '2020-06-07 19:10:54', 132, '86.89.195.36'),
(479, 'K. Hollander', 'Ahmed Bamischijf', '2020-06-07 19:11:06', 132, '81.204.193.154'),
(480, 'K. Hollander', 'Ahmed Bamischijf', '2020-06-07 19:11:33', 132, '81.204.193.154'),
(481, 'SYSTEEM', 'Ahmed Bamischijf', '2020-06-07 19:11:34', 132, '86.89.195.36'),
(482, 'SYSTEEM', 'Ahmed Bamischijf', '2020-06-07 19:18:32', 132, '86.89.195.36'),
(483, 'SYSTEEM', ' ', '2020-06-07 19:18:44', 0, '86.89.195.36'),
(484, 'SYSTEEM', 'Ahmed Bamischijf', '2020-06-07 19:18:44', 132, '86.89.195.36'),
(485, 'SYSTEEM', 'Jan Henk Petersma', '2020-06-07 19:18:53', 186, '86.89.195.36'),
(486, 'M. Tegelen', 'Ahmed Bamischijf', '2020-06-07 19:19:53', 132, '84.25.211.35'),
(487, 'L. Jansen', 'Donnie Dalmau', '2020-06-07 20:38:43', 219, '84.82.14.94'),
(488, 'Y. Sie', 'Aiko Chapo', '2020-06-07 20:41:43', 112, '109.38.130.44'),
(489, 'Y. Sie', 'Paul De Paaier', '2020-06-07 20:42:02', 130, '109.38.130.44'),
(490, 'Y. Sie', 'Youri Sie', '2020-06-07 20:42:25', 194, '109.38.130.44'),
(491, 'L. Jansen', 'Donnie Dalmau', '2020-06-07 20:54:13', 219, '84.82.14.94'),
(492, 'B. Vermaning', 'Luc Bouwman', '2020-06-07 20:55:08', 190, '82.75.120.166'),
(493, 'K. Bouwman', 'Aiko Chapo', '2020-06-07 20:56:59', 112, '145.132.244.161'),
(494, 'L. Jansen', 'Lars Jansen', '2020-06-07 21:06:49', 128, '84.82.14.94'),
(495, 'K. Hollander', 'Jan Henk Petersma', '2020-06-07 21:25:05', 186, '81.204.193.154'),
(496, 'SYSTEEM', 'Lars Jansen', '2020-06-07 21:26:43', 128, '86.89.195.36'),
(497, 'L. Jansen', 'Lars Jansen', '2020-06-07 21:28:21', 128, '84.82.14.94'),
(498, 'K. Hollander', 'Lars Jansen', '2020-06-07 21:28:38', 128, '81.204.193.154'),
(499, '', 'Ahmed Bamischijf', '2020-06-07 21:38:24', 132, '89.220.185.99'),
(500, 'Y. Sie', 'Jan-Bert Kramer', '2020-06-07 21:38:50', 268, '109.38.130.44'),
(501, 'L. Bouwman', 'Jan-Bert Kramer', '2020-06-07 21:44:28', 268, '89.220.185.99'),
(502, 'Y. Sie', 'Jan-Bert Kramer', '2020-06-07 21:44:52', 268, '109.38.130.44'),
(503, 'K. Bouwman', 'Jan-Bert Kramer', '2020-06-07 21:45:26', 268, '145.132.244.161'),
(504, 'Y. Sie', 'Yoek Beld', '2020-06-07 22:00:54', 248, '109.38.130.44'),
(505, 'Y. Sie', 'Yoek Beld', '2020-06-07 22:01:45', 248, '109.38.130.44'),
(506, 'L. Bouwman', 'Jan-Bert Kramer', '2020-06-07 22:03:08', 268, '89.220.185.99'),
(507, 'L. Bouwman', 'Jan Henk Petersma', '2020-06-07 22:03:17', 186, '89.220.185.99'),
(508, 'K. Bouwman', 'Jan-Bert Kramer', '2020-06-07 22:15:44', 268, '145.132.244.161'),
(509, 'Y. Sie', 'Yoek Beld', '2020-06-07 22:15:44', 248, '109.38.130.44'),
(510, 'D. Bouwman', 'Jan-Bert Kramer', '2020-06-07 22:15:55', 268, '31.201.13.167'),
(511, 'K. Bouwman', 'Jan Henk Petersma', '2020-06-07 22:16:09', 186, '145.132.244.161'),
(512, 'Y. Sie', 'Yoek Beld', '2020-06-07 22:16:10', 248, '109.38.130.44'),
(513, 'Y. Sie', 'Yoek Beld', '2020-06-07 22:17:37', 248, '109.38.130.44'),
(514, 'Y. Sie', 'Yoek Beld', '2020-06-07 22:17:54', 248, '109.38.130.44'),
(515, 'Y. Sie', 'Yoek Beld', '2020-06-07 22:18:17', 248, '109.38.130.44'),
(516, 'Y. Sie', 'Yoek Beld', '2020-06-07 22:19:31', 248, '109.38.130.44'),
(517, 'Y. Sie', 'Yoek Beld', '2020-06-07 22:21:21', 248, '109.38.130.44'),
(518, 'Y. Sie', 'Yoek Beld', '2020-06-07 22:21:35', 248, '109.38.130.44'),
(519, 'K. Bouwman', 'Jan Henk Petersma', '2020-06-07 22:27:15', 186, '145.132.244.161'),
(520, 'K. Hollander', 'Jan Henk Petersma', '2020-06-07 22:31:25', 186, '81.204.193.154'),
(521, 'K. Bouwman', 'Daniel Moreno', '2020-06-07 22:33:36', 124, '145.132.244.161'),
(522, 'D. Bouwman', 'Daniel Moreno', '2020-06-07 22:42:51', 124, '31.201.13.167'),
(523, 'D. Bouwman', 'Daniel Moreno', '2020-06-07 22:43:31', 124, '31.201.13.167'),
(524, 'D. Bouwman', 'Daniel Moreno', '2020-06-07 22:43:32', 124, '31.201.13.167'),
(525, 'D. Bouwman', 'Daniel Moreno', '2020-06-07 23:05:27', 124, '31.201.13.167'),
(526, 'D. Bouwman', 'Daniel Moreno', '2020-06-07 23:05:40', 124, '31.201.13.167'),
(527, 'D. Bouwman', 'Daniel Moreno', '2020-06-07 23:05:54', 124, '31.201.13.167'),
(528, 'D. Bouwman', 'Daniel Moreno', '2020-06-07 23:05:55', 124, '31.201.13.167'),
(529, 'K. Bouwman', 'Daniel Moreno', '2020-06-07 23:08:40', 124, '145.132.244.161'),
(530, 'D. Bouwman', 'Diego Moreno', '2020-06-07 23:09:27', 199, '31.201.13.167'),
(531, 'D. Bouwman', 'Diego Moreno', '2020-06-07 23:09:42', 199, '31.201.13.167'),
(532, 'D. Bouwman', 'Diego Moreno', '2020-06-07 23:09:42', 199, '31.201.13.167'),
(533, 'L. Jansen', 'Ahmed Bamischijf', '2020-06-07 23:11:37', 132, '84.82.14.94'),
(534, 'L. Jansen', 'Daniel Moreno', '2020-06-07 23:13:06', 124, '84.82.14.94'),
(535, 'K. Bouwman', 'Jan Henk Petersma', '2020-06-07 23:19:43', 186, '145.132.244.161'),
(536, 'K. Hollander', 'Diego Moreno', '2020-06-07 23:25:39', 199, '81.204.193.154'),
(537, 'L. Jansen', 'Bratlie Jansen', '2020-06-07 23:26:08', 272, '84.82.14.94'),
(538, 'L. Jansen', 'Jan Henk Petersma', '2020-06-07 23:32:36', 186, '84.82.14.94'),
(539, 'K. Hollander', 'Aiko Chapo', '2020-06-07 23:35:10', 112, '81.204.193.154'),
(540, 'K. Hollander', 'Aiko Chapo', '2020-06-07 23:36:25', 112, '81.204.193.154'),
(541, 'D. Bouwman', 'Aiko Chapo', '2020-06-07 23:37:17', 112, '31.201.13.167'),
(542, 'K. Hollander', 'Aiko Chapo', '2020-06-07 23:37:42', 112, '81.204.193.154'),
(543, 'K. Hollander', 'Aiko Chapo', '2020-06-07 23:37:42', 112, '81.204.193.154'),
(544, 'L. Jansen', 'Jan Henk Petersma', '2020-06-07 23:42:43', 186, '84.82.14.94'),
(545, 'L. Jansen', 'Jan Henk Petersma', '2020-06-07 23:42:52', 186, '84.82.14.94'),
(546, 'L. Jansen', 'Jan Henk Petersma', '2020-06-07 23:45:28', 186, '84.82.14.94'),
(547, 'L. Jansen', 'Jan Henk Petersma', '2020-06-07 23:45:28', 186, '84.82.14.94'),
(548, 'L. Jansen', 'Ahmed Bamischijf', '2020-06-07 23:54:07', 132, '84.82.14.94'),
(549, 'D. Bouwman', 'Diego Moreno', '2020-06-08 00:18:45', 199, '31.201.13.167'),
(550, 'D. Bouwman', ' ', '2020-06-08 00:18:48', 0, '31.201.13.167'),
(551, 'D. Bouwman', 'Diego Moreno', '2020-06-08 00:18:48', 199, '31.201.13.167'),
(552, 'D. Bouwman', 'Diego Moreno', '2020-06-08 00:20:35', 199, '31.201.13.167'),
(553, 'K. Bouwman', 'Diego Moreno', '2020-06-08 00:36:28', 199, '145.132.244.161'),
(554, 'K. Bouwman', 'Diego Moreno', '2020-06-08 00:37:42', 199, '145.132.244.161'),
(555, 'K. Bouwman', 'Diego Moreno', '2020-06-08 00:38:14', 199, '145.132.244.161'),
(556, 'K. Bouwman', 'Diego Moreno', '2020-06-08 00:38:14', 199, '145.132.244.161'),
(557, 'D. Bouwman', 'Paul De Paaier', '2020-06-08 00:56:23', 130, '31.201.13.167'),
(558, 'D. Bouwman', 'Paul De Paaier', '2020-06-08 00:58:23', 130, '31.201.13.167'),
(559, 'L. Bouwman', 'Paul De Paaier', '2020-06-08 01:20:30', 130, '89.220.185.99'),
(560, 'SYSTEEM', 'Paul De Paaier', '2020-06-08 01:21:14', 130, '86.89.195.36'),
(561, 'SYSTEEM', 'Ahmed Bamischijf', '2020-06-08 02:46:42', 132, '86.89.195.36'),
(562, 'D. Bouwman', 'Ahmed Bamischijf', '2020-06-08 02:48:38', 132, '31.201.13.167'),
(563, 'K. Bouwman', 'Ahmed Bamischijf', '2020-06-08 02:48:42', 132, '145.132.244.161'),
(564, 'SYSTEEM', 'Ahmed Bamischijf', '2020-06-08 02:48:48', 132, '86.89.195.36'),
(565, 'SYSTEEM', 'Daniel Moreno', '2020-06-08 02:49:12', 124, '86.89.195.36'),
(566, 'D. Bouwman', ' ', '2020-06-08 02:49:20', 0, '31.201.13.167'),
(567, 'D. Bouwman', 'Ahmed Bamischijf', '2020-06-08 02:49:20', 132, '31.201.13.167'),
(568, 'D. Bouwman', 'Ahmed Bamischijf', '2020-06-08 02:49:28', 132, '31.201.13.167'),
(569, 'SYSTEEM', 'Daniel Moreno', '2020-06-08 02:49:35', 124, '86.89.195.36'),
(570, 'D. Bouwman', 'Ahmed Bamischijf', '2020-06-08 02:50:07', 132, '31.201.13.167'),
(571, 'D. Bouwman', 'Ahmed Bamischijf', '2020-06-08 02:50:38', 132, '31.201.13.167'),
(572, 'SYSTEEM', 'Diego Moreno', '2020-06-08 02:51:01', 199, '86.89.195.36'),
(573, 'K. Bouwman', ' ', '2020-06-08 02:51:15', 0, '145.132.244.161'),
(574, 'SYSTEEM', 'Diego Moreno', '2020-06-08 02:51:18', 199, '86.89.195.36'),
(575, 'SYSTEEM', 'Diego Moreno', '2020-06-08 02:51:21', 199, '86.89.195.36'),
(576, 'SYSTEEM', 'Diego Moreno', '2020-06-08 02:51:25', 199, '86.89.195.36'),
(577, 'SYSTEEM', 'Ahmed Bamischijf', '2020-06-08 02:56:10', 132, '86.89.195.36'),
(578, 'D. Bouwman', 'Ahmed Bamischijf', '2020-06-08 02:56:41', 132, '31.201.13.167'),
(579, 'D. Bouwman', 'Daniel Moreno', '2020-06-08 03:07:53', 124, '31.201.13.167'),
(580, 'D. Bouwman', ' ', '2020-06-08 03:07:55', 0, '31.201.13.167'),
(581, 'D. Bouwman', 'Daniel Moreno', '2020-06-08 03:07:56', 124, '31.201.13.167'),
(582, 'D. Bouwman', ' ', '2020-06-08 03:08:03', 0, '31.201.13.167'),
(583, 'D. Bouwman', 'Daniel Moreno', '2020-06-08 03:08:03', 124, '31.201.13.167'),
(584, 'D. Bouwman', ' ', '2020-06-08 03:08:05', 0, '31.201.13.167'),
(585, 'D. Bouwman', 'Daniel Moreno', '2020-06-08 03:08:05', 124, '31.201.13.167'),
(586, 'SYSTEEM', 'Aiko Chapo', '2020-06-08 03:52:32', 112, '86.89.195.36'),
(587, 'L. Jansen', 'Mathias Lorriper', '2020-06-08 10:43:00', 246, '84.82.14.94'),
(588, 'L. Jansen', 'Lars Jansen', '2020-06-08 10:45:51', 128, '84.82.14.94'),
(589, 'L. Jansen', 'Daniel Moreno', '2020-06-08 11:09:27', 124, '84.82.14.94'),
(590, 'L. Jansen', 'Diego Moreno', '2020-06-08 11:09:33', 199, '84.82.14.94'),
(591, 'L. Jansen', 'Ahmed Bamischijf', '2020-06-08 11:10:00', 132, '84.82.14.94'),
(592, 'L. Jansen', 'Koen Hollander', '2020-06-08 11:36:20', 280, '84.82.14.94'),
(593, 'L. Jansen', 'Daniel Moreno', '2020-06-08 11:42:46', 124, '84.82.14.94'),
(594, 'L. Jansen', 'Diego Moreno', '2020-06-08 11:42:53', 199, '84.82.14.94'),
(595, 'K. Hollander', 'Diego Moreno', '2020-06-08 11:42:55', 199, '81.204.193.154'),
(596, 'Y. Belt', 'Lars Jansen', '2020-06-08 12:03:25', 128, '5.199.158.46'),
(597, 'L. Jansen', 'Lars Jansen', '2020-06-08 12:03:27', 128, '84.82.14.94'),
(598, 'Y. Belt', 'Ryan Rodevalk', '2020-06-08 12:59:01', 106, '5.199.158.46'),
(599, 'Y. Belt', 'Donnie Dalmau', '2020-06-08 13:07:30', 219, '5.199.158.46'),
(600, 'Y. Belt', 'Tobias De Vroed', '2020-06-08 13:24:36', 108, '5.199.158.46'),
(601, 'L. Jansen', 'Mark Tegelen', '2020-06-08 13:26:30', 231, '84.82.14.94'),
(602, 'L. Jansen', 'Mark Tegelen', '2020-06-08 13:26:31', 231, '84.82.14.94'),
(603, 'L. Jansen', 'Daniel Moreno', '2020-06-08 13:28:45', 124, '84.82.14.94'),
(604, 'L. Jansen', 'Daniel Moreno', '2020-06-08 13:38:28', 124, '84.82.14.94'),
(605, 'L. Jansen', 'Lars Jansen', '2020-06-08 13:38:41', 128, '84.82.14.94'),
(606, 'L. Jansen', 'Daniel Moreno', '2020-06-08 13:38:54', 124, '84.82.14.94'),
(607, 'L. Jansen', 'Daniel Moreno', '2020-06-08 13:39:01', 124, '84.82.14.94'),
(608, 'L. Jansen', 'Daniel Moreno', '2020-06-08 13:40:18', 124, '84.82.14.94'),
(609, 'K. Hollander', 'Diego Moreno', '2020-06-08 14:21:18', 199, '62.133.101.165'),
(610, 'D. Bouwman', 'Donnie Peterson', '2020-06-08 14:27:51', 219, '31.201.13.167'),
(611, 'K. Hollander', 'Donnie Peterson', '2020-06-08 14:36:46', 219, '62.133.101.165'),
(612, 'Y. Belt', 'Donnie Peterson', '2020-06-08 14:39:17', 219, '5.199.158.46'),
(613, 'Y. Belt', 'Donnie Peterson', '2020-06-08 14:39:21', 219, '5.199.158.46'),
(614, 'D. Bouwman', 'Donnie Peterson', '2020-06-08 14:39:53', 219, '31.201.13.167'),
(615, 'K. Hollander', 'Donnie Peterson', '2020-06-08 14:45:01', 219, '62.133.101.165'),
(616, 'Y. Belt', 'Ryan Rodevalk', '2020-06-08 15:08:01', 106, '5.199.158.46'),
(617, 'Y. Belt', 'Ryan Rodevalk', '2020-06-08 15:08:01', 106, '5.199.158.46'),
(618, 'Y. Belt', 'Ryan Rodevalk', '2020-06-08 15:08:01', 106, '5.199.158.46'),
(619, 'Y. Belt', 'Jan Henk Petersma', '2020-06-08 15:38:08', 186, '5.199.158.46'),
(620, 'SYSTEEM', 'Jan Henk Petersma', '2020-06-08 15:42:15', 186, '86.89.195.36'),
(621, 'SYSTEEM', 'Jan Henk Petersma', '2020-06-08 15:42:26', 186, '86.89.195.36'),
(622, 'Y. Belt', 'Jan Henk Petersma', '2020-06-08 15:42:41', 186, '5.199.158.46'),
(623, 'Y. Belt', 'Donnie Peterson', '2020-06-08 16:04:10', 219, '5.199.158.46'),
(624, 'L. Jansen', 'Daniel Moreno', '2020-06-08 16:09:39', 124, '84.82.14.94'),
(625, 'L. Jansen', 'Diego Moreno', '2020-06-08 16:10:43', 199, '84.82.14.94'),
(626, 'L. Jansen', 'Diego Moreno', '2020-06-08 16:15:06', 199, '84.82.14.94'),
(627, 'L. Jansen', 'Diego Moreno', '2020-06-08 16:15:06', 199, '84.82.14.94'),
(628, 'L. Jansen', 'Daniel Moreno', '2020-06-08 16:15:44', 124, '84.82.14.94'),
(629, 'L. Jansen', 'Daniel Moreno', '2020-06-08 16:15:46', 124, '84.82.14.94');
INSERT INTO `livelog` (`id`, `agent`, `burger`, `datetime`, `burgerid`, `ip`) VALUES
(630, 'L. Jansen', 'Daniel Moreno', '2020-06-08 16:15:46', 124, '84.82.14.94'),
(631, 'L. Jansen', 'Daniel Moreno', '2020-06-08 16:16:25', 124, '84.82.14.94'),
(632, 'L. Jansen', 'Donnie Peterson', '2020-06-08 16:17:51', 219, '84.82.14.94'),
(633, 'L. Jansen', 'Diego Moreno', '2020-06-08 16:28:24', 199, '84.82.14.94'),
(634, 'L. Jansen', ' ', '2020-06-08 16:28:31', 0, '84.82.14.94'),
(635, 'L. Jansen', 'Diego Moreno', '2020-06-08 16:28:33', 199, '84.82.14.94'),
(636, 'L. Jansen', 'Jan Henk Petersma', '2020-06-08 16:29:07', 186, '84.82.14.94'),
(637, 'L. Jansen', 'Jan Henk Petersma', '2020-06-08 16:29:15', 186, '84.82.14.94'),
(638, 'D. Bouwman', 'Ahmed Bamischijf', '2020-06-08 17:57:13', 132, '31.201.13.167'),
(639, '', 'Donnie Peterson', '2020-06-08 18:01:55', 219, '62.133.101.165'),
(640, '', 'Donnie Peterson', '2020-06-08 18:02:41', 219, '62.133.101.165'),
(641, 'L. Bouwman', 'Donnie Peterson', '2020-06-08 18:22:29', 219, '89.220.185.99'),
(642, 'Y. Sie', 'Donnie Peterson', '2020-06-08 18:22:44', 219, '109.38.130.44'),
(643, 'Y. Sie', 'Donnie Peterson', '2020-06-08 18:23:13', 219, '109.38.130.44'),
(644, 'Y. Sie', 'Donnie Peterson', '2020-06-08 18:23:29', 219, '109.38.130.44'),
(645, 'Y. Sie', 'Donnie Peterson', '2020-06-08 18:24:10', 219, '109.38.130.44'),
(646, 'Y. Sie', 'Donnie Peterson', '2020-06-08 18:24:30', 219, '109.38.130.44'),
(647, 'Y. Sie', 'Donnie Peterson', '2020-06-08 18:25:01', 219, '109.38.130.44'),
(648, 'Y. Sie', 'Donnie Peterson', '2020-06-08 18:25:20', 219, '109.38.130.44'),
(649, 'L. Bouwman', 'Donnie Peterson', '2020-06-08 18:25:24', 219, '89.220.185.99'),
(650, 'L. Bouwman', 'Donnie Peterson', '2020-06-08 18:25:34', 219, '89.220.185.99'),
(651, 'K. Hollander', 'Paul De Paaier', '2020-06-08 18:27:25', 130, '62.133.101.165'),
(652, 'K. Hollander', 'Paul De Paaier', '2020-06-08 18:29:10', 130, '62.133.101.165'),
(653, 'K. Hollander', 'Paul De Paaier', '2020-06-08 18:29:11', 130, '62.133.101.165'),
(654, 'D. Bouwman', 'Paul De Paaier', '2020-06-08 18:52:15', 130, '31.201.13.167'),
(655, 'D. Bouwman', 'Paul De Paaier', '2020-06-08 18:55:19', 130, '31.201.13.167'),
(656, 'D. Bouwman', 'Paul De Paaier', '2020-06-08 18:55:30', 130, '31.201.13.167'),
(657, 'D. Bouwman', 'Frits Jorritsma', '2020-06-08 19:00:31', 90, '31.201.13.167'),
(658, 'D. Bouwman', 'Frits Jorritsma', '2020-06-08 19:01:44', 90, '31.201.13.167'),
(659, 'Y. Sie', 'Tobias De Vroed', '2020-06-08 19:35:24', 108, '109.38.130.44'),
(660, 'Y. Sie', 'Tobias De Vroed', '2020-06-08 19:36:56', 108, '109.38.130.44'),
(661, 'Y. Sie', 'Tobias De Vroed', '2020-06-08 19:40:04', 108, '109.38.130.44'),
(662, 'Y. Sie', 'Tobias De Vroed', '2020-06-08 19:40:04', 108, '109.38.130.44'),
(663, 'Y. Sie', 'Tobias De Vroed', '2020-06-08 19:40:04', 108, '109.38.130.44'),
(664, 'Ahmed Bamischijf', 'Henk De Visser', '2020-06-08 19:52:39', 186, '81.165.114.148'),
(665, 'Y. Sie', 'Paul De Paaier', '2020-06-08 19:55:43', 130, '109.38.130.44'),
(666, 'Y. Sie', 'Paul De Paaier', '2020-06-08 19:56:48', 130, '109.38.130.44'),
(667, 'Y. Sie', 'Paul De Paaier', '2020-06-08 19:57:19', 130, '109.38.130.44'),
(668, 'Ahmed Bamischijf', 'Henk De Visser', '2020-06-08 19:57:39', 186, '81.165.114.148'),
(669, 'Y. Sie', 'Paul De Paaier', '2020-06-08 20:01:02', 130, '109.38.130.44'),
(670, 'Y. Sie', 'Paul De Paaier', '2020-06-08 20:01:03', 130, '109.38.130.44'),
(671, 'Ahmed Bamischijf', 'Johannes Mananus', '2020-06-08 20:22:51', 213, '81.165.114.148'),
(672, 'Y. Sie', 'Tobias De Vroed', '2020-06-08 20:24:48', 108, '109.38.130.44'),
(673, 'Y. Sie', 'Tobias De Vroed', '2020-06-08 20:25:16', 108, '109.38.130.44'),
(674, 'Ahmed Bamischijf', 'Johannes Mananus', '2020-06-08 20:29:02', 213, '81.165.114.148'),
(675, 'Ahmed Bamischijf', 'Johannes Mananus', '2020-06-08 20:31:19', 213, '81.165.114.148'),
(676, 'Ahmed Bamischijf', 'Johannes Mananus', '2020-06-08 20:31:19', 213, '81.165.114.148'),
(677, 'Ahmed Bamischijf', 'Johannes Mananus', '2020-06-08 20:31:30', 213, '81.165.114.148'),
(678, 'Ahmed Bamischijf', 'Johannes Mananus', '2020-06-08 20:31:43', 213, '81.165.114.148'),
(679, 'Ahmed Bamischijf', 'Paul De Paaier', '2020-06-08 20:54:47', 130, '81.165.114.148'),
(680, 'Ahmed Bamischijf', 'Paul De Paaier', '2020-06-08 20:55:13', 130, '81.165.114.148'),
(681, 'Ahmed Bamischijf', 'Paul De Paaier', '2020-06-08 20:55:13', 130, '81.165.114.148'),
(682, 'K. Hollander', 'Donnie Peterson', '2020-06-08 21:52:08', 219, '62.133.101.165'),
(683, 'K. Hollander', 'Donnie Peterson', '2020-06-08 21:52:20', 219, '62.133.101.165'),
(684, 'K. Hollander', 'Donnie Peterson', '2020-06-08 21:53:32', 219, '62.133.101.165'),
(685, 'K. Hollander', 'Donnie Peterson', '2020-06-08 21:53:33', 219, '62.133.101.165'),
(686, 'K. Hollander', 'Donnie Peterson', '2020-06-08 21:54:13', 219, '62.133.101.165'),
(687, 'K. Hollander', 'Donnie Peterson', '2020-06-08 21:54:53', 219, '62.133.101.165'),
(688, 'K. Hollander', 'Donnie Peterson', '2020-06-08 21:55:40', 219, '62.133.101.165'),
(689, 'Y. Belt', 'Yoek Beld', '2020-06-09 13:21:41', 248, '5.199.158.46'),
(690, 'Y. Belt', 'Ron Jans', '2020-06-09 13:38:54', 301, '5.199.158.46'),
(691, 'L. Bouwman', 'Ron Jans', '2020-06-09 13:42:17', 301, '89.220.185.99'),
(692, 'Y. Belt', 'Ron Jans', '2020-06-09 13:43:36', 301, '5.199.158.46'),
(693, 'L. Bouwman', 'Ron Jans', '2020-06-09 13:45:57', 301, '89.220.185.99'),
(694, 'Y. Belt', 'Ron Jans', '2020-06-09 13:46:04', 301, '5.199.158.46'),
(695, 'Y. Belt', 'Ron Jans', '2020-06-09 13:49:17', 301, '5.199.158.46'),
(696, 'Y. Belt', 'Ron Jans', '2020-06-09 13:49:18', 301, '5.199.158.46'),
(697, 'Y. Belt', 'Ron Jans', '2020-06-09 13:52:32', 301, '5.199.158.46'),
(698, 'L. Jansen', 'Jante Gielissen', '2020-06-09 14:59:56', 209, '84.82.14.94'),
(699, 'L. Jansen', 'Fenna Visser', '2020-06-09 15:00:16', 288, '84.82.14.94'),
(700, 'L. Jansen', 'Jante Gielissen', '2020-06-09 15:15:06', 209, '84.82.14.94'),
(701, 'Y. Belt', 'Ron Jans', '2020-06-09 15:16:35', 301, '5.199.158.46'),
(702, 'L. Jansen', 'Ryan Rodevalk', '2020-06-09 15:27:08', 106, '84.82.14.94'),
(703, 'Ahmed Bamischijf', 'Ahmed Bamischijf', '2020-06-09 15:56:00', 132, '81.165.114.148'),
(704, 'L. Bouwman', 'Ron Jans', '2020-06-09 15:56:43', 301, '89.220.185.99'),
(705, 'L. Bouwman', 'Paul De Paaier', '2020-06-09 15:57:06', 130, '89.220.185.99'),
(706, 'L. Jansen', 'Paul De Paaier', '2020-06-09 16:16:29', 130, '84.82.14.94'),
(707, 'L. Jansen', 'Ahmed Bamischijf', '2020-06-09 16:16:54', 132, '84.82.14.94'),
(708, 'L. Jansen', 'Paul De Paaier', '2020-06-09 16:25:36', 130, '84.82.14.94'),
(709, 'L. Jansen', 'Paul De Paaier', '2020-06-09 16:26:33', 130, '84.82.14.94'),
(710, 'L. Jansen', ' ', '2020-06-09 16:33:26', 0, '84.82.14.94'),
(711, 'L. Jansen', 'Paul De Paaier', '2020-06-09 16:33:26', 130, '84.82.14.94'),
(712, 'Y. Sie', 'Aiko Chapo', '2020-06-09 18:25:05', 112, '77.160.150.93'),
(713, 'SYSTEEM', ' ', '2020-06-09 18:43:03', 0, '86.89.195.36'),
(714, 'SYSTEEM', 'Symon Janssen', '2020-06-09 18:43:14', 186, '86.89.195.36'),
(715, 'M. Tegelen', 'Tobias De Vroed', '2020-06-09 19:21:37', 108, '84.25.211.35'),
(716, '', 'Tobias De Vroed', '2020-06-10 09:56:45', 108, '62.133.210.140'),
(717, 'D. Bouwman', 'Ryan Rodevalk', '2020-06-10 11:49:46', 106, '31.201.13.167'),
(718, 'D. Bouwman', 'Jason Bright', '2020-06-10 11:50:57', 86, '31.201.13.167'),
(719, 'D. Bouwman', 'Ryan Rodevalk', '2020-06-10 12:10:59', 106, '31.201.13.167'),
(720, 'D. Bouwman', 'Donnie Peterson', '2020-06-10 13:12:02', 219, '31.201.13.167'),
(721, 'D. Bouwman', 'Donnie Peterson', '2020-06-10 13:16:47', 219, '31.201.13.167'),
(722, 'D. Bouwman', 'Donnie Peterson', '2020-06-10 13:16:47', 219, '31.201.13.167'),
(723, 'D. Bouwman', ' ', '2020-06-10 13:16:54', 0, '31.201.13.167'),
(724, 'D. Bouwman', 'Donnie Peterson', '2020-06-10 13:16:54', 219, '31.201.13.167'),
(725, 'D. Bouwman', 'Donnie Peterson', '2020-06-10 13:17:16', 219, '31.201.13.167'),
(726, 'D. Bouwman', 'Donnie Peterson', '2020-06-10 13:17:16', 219, '31.201.13.167'),
(727, 'D. Bouwman', 'Donnie Peterson', '2020-06-10 13:31:26', 219, '31.201.13.167'),
(728, 'D. Bouwman', 'Donnie Peterson', '2020-06-10 13:31:56', 219, '31.201.13.167'),
(729, 'D. Bouwman', ' ', '2020-06-10 13:32:05', 0, '31.201.13.167'),
(730, 'D. Bouwman', 'Donnie Peterson', '2020-06-10 13:32:05', 219, '31.201.13.167'),
(731, 'D. Bouwman', 'Aiko Chapo', '2020-06-10 13:53:11', 112, '31.201.13.167'),
(732, 'L. Jansen', 'Donnie Peterson', '2020-06-10 14:15:42', 219, '84.82.14.94'),
(733, 'L. Jansen', 'Ryan Rodevalk', '2020-06-10 14:34:30', 106, '84.82.14.94'),
(734, 'L. Jansen', 'Ryan Rodevalk', '2020-06-10 14:34:37', 106, '84.82.14.94'),
(735, 'L. Jansen', 'Aiko Chapo', '2020-06-10 14:34:44', 112, '84.82.14.94'),
(736, 'L. Jansen', 'Bart Van Wijk', '2020-06-10 14:36:53', 116, '84.82.14.94'),
(737, 'L. Jansen', 'Daniel Moreno', '2020-06-10 14:36:59', 124, '84.82.14.94'),
(738, 'L. Jansen', 'Daniel Moreno', '2020-06-10 14:37:25', 124, '84.82.14.94'),
(739, 'L. Jansen', 'Daniel Moreno', '2020-06-10 14:37:25', 124, '84.82.14.94'),
(740, 'L. Jansen', 'Daniel Moreno', '2020-06-10 14:37:30', 124, '84.82.14.94'),
(741, 'L. Jansen', 'Johannes Mananus', '2020-06-10 14:37:37', 213, '84.82.14.94'),
(742, 'L. Jansen', 'Mathias Lorriper', '2020-06-10 14:53:56', 246, '84.82.14.94'),
(743, 'L. Jansen', 'Inspecteur Henk Klaassen', '2020-06-10 14:54:04', 305, '84.82.14.94'),
(744, 'L. Jansen', 'Bratlie Jansen', '2020-06-10 14:54:23', 272, '84.82.14.94'),
(745, 'L. Jansen', 'Henk  Boterham', '2020-06-10 14:54:31', 118, '84.82.14.94'),
(746, 'L. Jansen', 'Max Bouwman', '2020-06-10 14:54:34', 110, '84.82.14.94'),
(747, 'L. Jansen', 'Abdelouhaid Elmourabit', '2020-06-10 15:01:04', 240, '84.82.14.94'),
(748, 'L. Jansen', 'Tobias De Vroed', '2020-06-10 15:01:10', 108, '84.82.14.94'),
(749, 'M. Tegelen', 'Diego Moreno', '2020-06-10 15:16:47', 199, '84.25.211.35'),
(750, 'M. Tegelen', 'Diego Moreno', '2020-06-10 15:17:39', 199, '84.25.211.35'),
(751, 'L. Jansen', 'Lars Jansen', '2020-06-10 15:38:00', 128, '84.82.14.94'),
(752, 'L. Jansen', 'Lars Jansen', '2020-06-10 15:38:13', 128, '84.82.14.94'),
(753, 'D. Bouwman', 'Daniel Moreno', '2020-06-10 15:58:00', 124, '31.201.13.167'),
(754, 'L. Jansen', 'Jante Gielissen', '2020-06-10 16:03:13', 209, '84.82.14.94'),
(755, 'M. Tegelen', 'Fenna Visser', '2020-06-10 16:11:02', 288, '84.25.211.35'),
(756, 'L. Jansen', 'Fenna Visser', '2020-06-10 16:36:13', 288, '84.82.14.94'),
(757, 'B. Vermaning', 'Lars Jansen', '2020-06-10 16:38:59', 128, '82.75.120.166'),
(758, 'M. Tegelen', 'Diego Moreno', '2020-06-10 18:20:45', 199, '84.25.211.35'),
(759, 'M. Tegelen', 'Diego Moreno', '2020-06-10 18:21:24', 199, '84.25.211.35'),
(760, 'M. Tegelen', 'Diego Moreno', '2020-06-10 18:21:44', 199, '84.25.211.35'),
(761, 'M. Tegelen', 'Diego Moreno', '2020-06-10 18:22:52', 199, '84.25.211.35'),
(762, 'M. Tegelen', 'Diego Moreno', '2020-06-10 18:29:21', 199, '84.25.211.35'),
(763, 'M. Tegelen', 'Daniel Moreno', '2020-06-10 18:29:32', 124, '84.25.211.35'),
(764, 'M. Tegelen', 'Daniel Moreno', '2020-06-10 18:29:52', 124, '84.25.211.35'),
(765, 'M. Tegelen', 'Daniel Moreno', '2020-06-10 18:30:24', 124, '84.25.211.35'),
(766, 'M. Tegelen', 'Daniel Moreno', '2020-06-10 18:33:54', 124, '84.25.211.35'),
(767, 'Y. Sie', 'Lars Jansen', '2020-06-10 19:14:08', 128, '62.140.132.51'),
(768, 'D. Bouwman', 'Fenna Visser', '2020-06-10 19:42:12', 288, '31.201.13.167'),
(769, 'K. Hollander', 'Fenna Visser', '2020-06-10 19:47:46', 288, '62.133.101.165'),
(770, 'K. Hollander', 'Lars Jansen', '2020-06-10 19:48:18', 128, '62.133.101.165'),
(771, 'K. Hollander', 'Lars Jansen', '2020-06-10 19:48:51', 128, '62.133.101.165'),
(772, 'K. Hollander', 'Lars Jansen', '2020-06-10 19:52:47', 128, '62.133.101.165'),
(773, 'K. Hollander', 'Lars Jansen', '2020-06-10 19:52:47', 128, '62.133.101.165'),
(774, 'K. Hollander', 'Tobias De Vroed', '2020-06-10 19:52:58', 108, '62.133.101.165'),
(775, 'K. Hollander', 'Tobias De Vroed', '2020-06-10 19:53:48', 108, '62.133.101.165'),
(776, 'K. Hollander', 'Tobias De Vroed', '2020-06-10 19:54:24', 108, '62.133.101.165'),
(777, 'K. Hollander', 'Tobias De Vroed', '2020-06-10 19:54:24', 108, '62.133.101.165'),
(778, 'Y. Sie', 'Tobias De Vroed', '2020-06-10 19:57:29', 108, '62.140.132.51'),
(779, 'L. Jansen', 'Tobias De Vroed', '2020-06-10 19:58:02', 108, '84.82.14.94'),
(780, 'Y. Sie', 'Tobias De Vroed', '2020-06-10 20:02:04', 108, '62.140.132.51'),
(781, 'Y. Sie', 'Tobias De Vroed', '2020-06-10 20:02:19', 108, '62.140.132.51'),
(782, 'B. Vermaning', 'Tobias De Vroed', '2020-06-10 20:03:55', 108, '82.75.120.166'),
(783, 'Y. Sie', 'Symon Janssen', '2020-06-10 20:18:04', 186, '62.140.132.51'),
(784, 'L. Jansen', 'Sem Hoveling', '2020-06-10 20:18:28', 308, '84.82.14.94'),
(785, 'D. Bouwman', 'Diego Moreno', '2020-06-10 20:19:51', 199, '31.201.13.167'),
(786, 'L. Jansen', 'Sem Hoveling', '2020-06-10 20:20:45', 308, '84.82.14.94'),
(787, 'L. Jansen', 'Sem Hoveling', '2020-06-10 20:21:28', 308, '84.82.14.94'),
(788, 'L. Jansen', 'Sem Hoveling', '2020-06-10 20:21:33', 308, '84.82.14.94'),
(789, 'L. Bouwman', 'Tobias De Vroed', '2020-06-10 20:26:43', 108, '89.220.185.99'),
(790, 'Y. Sie', 'Daniel Moreno', '2020-06-10 20:27:03', 124, '62.140.132.51'),
(791, 'B. Vermaning', 'Diego Moreno', '2020-06-10 20:27:14', 199, '82.75.120.166'),
(792, 'L. Jansen', 'Daniel Moreno', '2020-06-10 20:27:26', 124, '84.82.14.94'),
(793, 'L. Bouwman', 'Daniel Moreno', '2020-06-10 20:27:32', 124, '89.220.185.99'),
(794, 'D. Bouwman', 'Daniel Moreno', '2020-06-10 20:30:29', 124, '31.201.13.167'),
(795, 'L. Jansen', 'Sem Hoveling', '2020-06-10 20:42:21', 308, '84.82.14.94'),
(796, 'L. Jansen', 'Sem Hoveling', '2020-06-10 20:51:42', 308, '84.82.14.94'),
(797, 'L. Jansen', 'Sem Hoveling', '2020-06-10 20:51:42', 308, '84.82.14.94'),
(798, 'Ahmed Bamischijf', 'Diego Moreno', '2020-06-10 20:54:11', 199, '81.165.114.148'),
(799, 'L. Jansen', 'Sem Hoveling', '2020-06-10 20:58:46', 308, '84.82.14.94'),
(800, 'L. Jansen', 'Sem Hoveling', '2020-06-10 20:58:46', 308, '84.82.14.94'),
(801, 'L. Jansen', 'Diego Moreno', '2020-06-10 20:59:01', 199, '84.82.14.94'),
(802, 'L. Jansen', 'Lars Jansen', '2020-06-10 21:21:50', 128, '84.82.14.94'),
(803, 'D. Bouwman', 'Sem Hoveling', '2020-06-10 21:31:27', 308, '31.201.13.167'),
(804, 'L. Jansen', 'Sem Hoveling', '2020-06-10 21:33:30', 308, '84.82.14.94'),
(805, 'D. Bouwman', 'Sem Hoveling', '2020-06-10 21:35:33', 308, '31.201.13.167'),
(806, 'D. Bouwman', 'Sem Hoveling', '2020-06-10 21:35:33', 308, '31.201.13.167'),
(807, 'D. Bouwman', ' ', '2020-06-10 21:35:52', 0, '31.201.13.167'),
(808, 'D. Bouwman', 'Sem Hoveling', '2020-06-10 21:35:52', 308, '31.201.13.167'),
(809, 'D. Bouwman', 'Sem Hoveling', '2020-06-10 21:36:38', 308, '31.201.13.167'),
(810, 'D. Bouwman', 'Sem Hoveling', '2020-06-10 21:36:38', 308, '31.201.13.167'),
(811, 'K. Hollander', 'Daniel Moreno', '2020-06-10 21:41:53', 124, '62.133.101.165'),
(812, 'K. Hollander', 'Daniel Moreno', '2020-06-10 21:42:51', 124, '62.133.101.165'),
(813, 'K. Hollander', 'Daniel Moreno', '2020-06-10 21:43:10', 124, '62.133.101.165'),
(814, 'K. Hollander', 'Daniel Moreno', '2020-06-10 21:43:10', 124, '62.133.101.165'),
(815, 'K. Hollander', 'Diego Moreno', '2020-06-10 21:49:04', 199, '62.133.101.165'),
(816, 'K. Hollander', 'Diego Moreno', '2020-06-10 21:51:09', 199, '62.133.101.165'),
(817, 'K. Hollander', 'Diego Moreno', '2020-06-10 21:54:05', 199, '62.133.101.165'),
(818, 'K. Hollander', 'Diego Moreno', '2020-06-10 21:54:08', 199, '62.133.101.165'),
(819, 'K. Hollander', ' ', '2020-06-10 21:54:11', 426, '62.133.101.165'),
(820, 'K. Hollander', 'Diego Moreno', '2020-06-10 21:54:11', 199, '62.133.101.165'),
(821, 'SYSTEEM', 'Sem Hoveling', '2020-06-10 21:56:06', 308, '86.89.195.36'),
(822, 'SYSTEEM', 'Symon Janssen', '2020-06-10 21:57:10', 186, '86.89.195.36'),
(823, 'SYSTEEM', 'Symon Janssen', '2020-06-10 21:57:22', 186, '86.89.195.36'),
(824, 'SYSTEEM', 'Symon Janssen', '2020-06-10 21:57:36', 186, '86.89.195.36'),
(825, '', 'Diego Moreno', '2020-06-10 22:15:29', 199, '62.133.101.165'),
(826, 'L. Jansen', 'Sem Hoveling', '2020-06-10 22:43:09', 308, '84.82.14.94'),
(827, 'L. Jansen', ' ', '2020-06-10 22:45:16', 0, '84.82.14.94'),
(828, 'L. Jansen', 'Sem Hoveling', '2020-06-10 22:45:17', 308, '84.82.14.94'),
(829, 'L. Jansen', 'Sem Hoveling', '2020-06-10 22:49:52', 308, '84.82.14.94'),
(830, 'L. Jansen', 'Sem Hoveling', '2020-06-10 22:50:09', 308, '84.82.14.94'),
(831, 'L. Jansen', 'Sem Hoveling', '2020-06-10 22:54:34', 308, '84.82.14.94'),
(832, 'L. Jansen', 'Sem Hoveling', '2020-06-10 22:56:35', 308, '84.82.14.94'),
(833, 'L. Jansen', 'Sem Hoveling', '2020-06-10 22:56:35', 308, '84.82.14.94'),
(834, 'L. Jansen', 'Sem Hoveling', '2020-06-10 23:57:43', 308, '84.82.14.94'),
(835, 'L. Bouwman', 'Jason Bright', '2020-06-10 23:58:34', 86, '89.220.185.99'),
(836, 'L. Bouwman', 'Symon Janssen', '2020-06-11 00:32:30', 186, '89.220.185.99'),
(837, 'L. Bouwman', 'Symon Janssen', '2020-06-11 00:32:50', 186, '89.220.185.99'),
(838, 'L. Bouwman', 'Symon Janssen', '2020-06-11 00:34:32', 186, '89.220.185.99'),
(839, 'L. Bouwman', 'Symon Janssen', '2020-06-11 00:34:32', 186, '89.220.185.99'),
(840, 'L. Jansen', 'Symon Janssen', '2020-06-11 00:39:44', 186, '84.82.14.94'),
(841, 'SYSTEEM', 'Sem Hoveling', '2020-06-11 03:23:05', 308, '86.89.195.36'),
(842, 'SYSTEEM', 'Symon Janssen', '2020-06-11 03:23:24', 186, '86.89.195.36'),
(843, 'SYSTEEM', ' ', '2020-06-11 03:23:36', 430, '86.89.195.36'),
(844, 'SYSTEEM', 'Symon Janssen', '2020-06-11 03:23:36', 186, '86.89.195.36'),
(845, 'SYSTEEM', ' ', '2020-06-11 03:23:40', 0, '86.89.195.36'),
(846, 'SYSTEEM', 'Symon Janssen', '2020-06-11 03:23:41', 186, '86.89.195.36'),
(847, 'SYSTEEM', ' ', '2020-06-11 04:24:43', 430, '86.89.195.36'),
(848, 'SYSTEEM', ' ', '2020-06-11 04:24:52', 430, '86.89.195.36'),
(849, 'SYSTEEM', ' ', '2020-06-11 04:24:56', 0, '86.89.195.36'),
(850, 'D. Bouwman', 'Jason Bright', '2020-06-11 10:53:56', 86, '31.201.13.167'),
(851, 'D. Bouwman', 'Bart Van Wijk', '2020-06-11 10:54:02', 116, '31.201.13.167'),
(852, '', 'Ryan Rodevalk', '2020-06-11 10:57:33', 106, '31.201.13.167'),
(853, 'L. Bouwman', 'Tobias De Vroed', '2020-06-11 13:07:13', 108, '89.220.185.99'),
(854, 'L. Bouwman', 'Tobias De Vroed', '2020-06-11 13:07:47', 108, '89.220.185.99'),
(855, 'D. Bouwman', 'Ryan Rodevalk', '2020-06-11 13:51:03', 106, '31.201.13.167'),
(856, 'L. Bouwman', 'Donnie Peterson', '2020-06-11 14:30:05', 219, '89.220.185.99'),
(857, 'L. Bouwman', 'Daniel Moreno', '2020-06-11 14:33:49', 124, '89.220.185.99'),
(858, 'L. Bouwman', 'Daniel Moreno', '2020-06-11 14:35:25', 124, '89.220.185.99'),
(859, 'L. Bouwman', 'Daniel Moreno', '2020-06-11 14:35:25', 124, '89.220.185.99'),
(860, 'D. Bouwman', 'Diego Moreno', '2020-06-11 15:25:06', 199, '31.201.13.167'),
(861, 'L. Bouwman', 'Sem Hoveling', '2020-06-11 17:34:48', 308, '89.220.185.99'),
(862, 'L. Bouwman', 'Donnie Peterson', '2020-06-11 17:42:08', 219, '89.220.185.99'),
(863, 'L. Bouwman', 'Donnie Peterson', '2020-06-11 17:44:13', 219, '89.220.185.99'),
(864, 'L. Bouwman', 'Donnie Peterson', '2020-06-11 17:44:26', 219, '89.220.185.99'),
(865, 'L. Bouwman', 'Donnie Peterson', '2020-06-11 17:45:39', 219, '89.220.185.99'),
(866, 'L. Bouwman', 'Sem Hoveling', '2020-06-11 17:53:32', 308, '89.220.185.99'),
(867, 'L. Bouwman', 'Donnie Peterson', '2020-06-11 17:53:46', 219, '89.220.185.99'),
(868, 'L. Bouwman', 'Donnie Peterson', '2020-06-11 17:54:31', 219, '89.220.185.99'),
(869, 'L. Bouwman', 'Donnie Peterson', '2020-06-11 17:54:32', 219, '89.220.185.99'),
(870, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-11 18:58:34', 132, '77.160.150.93'),
(871, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-11 18:59:12', 132, '77.160.150.93'),
(872, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-11 18:59:20', 132, '77.160.150.93'),
(873, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-11 18:59:32', 132, '77.160.150.93'),
(874, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-11 18:59:43', 132, '77.160.150.93'),
(875, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-11 19:00:09', 132, '77.160.150.93'),
(876, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-11 19:00:19', 132, '77.160.150.93'),
(877, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-11 19:00:40', 132, '77.160.150.93'),
(878, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-11 19:01:01', 132, '77.160.150.93'),
(879, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-11 19:01:13', 132, '77.160.150.93'),
(880, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-11 19:01:41', 132, '77.160.150.93'),
(881, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-11 19:02:04', 132, '77.160.150.93'),
(882, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-11 19:02:19', 132, '77.160.150.93'),
(883, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-11 19:21:19', 132, '77.160.150.93'),
(884, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-11 19:28:03', 132, '77.160.150.93'),
(885, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-11 19:28:03', 132, '77.160.150.93'),
(886, 'K. Bouwman', 'Henk Kooikarper', '2020-06-11 19:28:16', 201, '145.132.244.161'),
(887, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-11 19:30:57', 132, '77.160.150.93'),
(888, 'K. Bouwman', 'Sem Hoveling', '2020-06-11 19:31:07', 308, '145.132.244.161'),
(889, 'SYSTEEM', 'Ahmed Bamischijf', '2020-06-11 19:32:29', 132, '86.89.195.36'),
(890, 'M. Bouwman', 'Sem Hoveling', '2020-06-11 19:39:02', 308, '84.87.84.32'),
(891, 'M. Bouwman', 'Sem Hoveling', '2020-06-11 19:56:49', 308, '84.87.84.32'),
(892, 'Y. Belt', 'Sem Hoveling', '2020-06-11 20:42:17', 308, '5.199.158.46'),
(893, 'SYSTEEM', 'Peter Hansma', '2020-06-11 20:44:59', 186, '86.89.195.36'),
(894, 'Y. Belt', 'Sem Hoveling', '2020-06-11 20:49:18', 308, '5.199.158.46'),
(895, 'Y. Belt', 'Sem Hoveling', '2020-06-11 20:49:19', 308, '5.199.158.46'),
(896, 'Y. Belt', 'Sem Hoveling', '2020-06-11 20:49:55', 308, '5.199.158.46'),
(897, 'Y. Belt', 'Sem Hoveling', '2020-06-11 20:50:01', 308, '5.199.158.46'),
(898, '', 'Daniel Moreno', '2020-06-11 20:50:08', 124, '62.140.132.51'),
(899, 'Y. Sie', 'Donnie Peterson', '2020-06-11 20:50:20', 219, '62.140.132.51'),
(900, 'K. Hollander', 'Peter Post', '2020-06-11 21:07:08', 314, '188.207.117.25'),
(901, 'Y. Belt', 'Sem Hoveling', '2020-06-11 21:10:53', 308, '5.199.158.46'),
(902, 'K. Hollander', 'Peter Post', '2020-06-11 21:11:02', 314, '188.207.117.25'),
(903, 'Y. Belt', 'Yoek Beld', '2020-06-11 21:11:19', 248, '5.199.158.46'),
(904, 'K. Hollander', 'Peter Post', '2020-06-11 21:11:37', 314, '188.207.117.25'),
(905, 'K. Hollander', 'Peter Post', '2020-06-11 21:11:38', 314, '188.207.117.25'),
(906, '', 'Peter Hansma', '2020-06-11 21:14:02', 186, '84.82.14.94'),
(907, 'Y. Belt', 'Tijn Jutstra', '2020-06-11 21:15:14', 316, '5.199.158.46'),
(908, 'L. Jansen', 'Sem Hoveling', '2020-06-11 21:22:37', 308, '84.82.14.94'),
(909, 'Y. Belt', 'Tijn Jutstra', '2020-06-11 21:25:39', 316, '5.199.158.46'),
(910, 'Y. Belt', 'Tijn Jutstra', '2020-06-11 21:25:41', 316, '5.199.158.46'),
(911, 'K. Hollander', 'Peter Post', '2020-06-11 21:25:50', 314, '188.207.117.25'),
(912, 'K. Hollander', 'Peter Post', '2020-06-11 21:27:57', 314, '188.207.117.25'),
(913, 'K. Hollander', 'Peter Post', '2020-06-11 21:27:57', 314, '188.207.117.25'),
(914, 'L. Bouwman', 'Diego Moreno', '2020-06-11 21:30:55', 199, '89.220.185.99'),
(915, 'L. Bouwman', 'Diego Moreno', '2020-06-11 21:31:09', 199, '89.220.185.99'),
(916, 'K. Hollander', 'Pieter Post', '2020-06-11 21:34:48', 312, '188.207.117.25'),
(917, 'K. Hollander', 'Daniel Moreno', '2020-06-11 21:37:04', 124, '188.207.117.25'),
(918, 'Y. Sie', 'Lars Jansen', '2020-06-11 21:37:12', 128, '62.140.132.51'),
(919, 'Y. Sie', 'Lars Jansen', '2020-06-11 21:37:33', 128, '62.140.132.51'),
(920, 'Y. Sie', 'Lars Jansen', '2020-06-11 21:37:53', 128, '62.140.132.51'),
(921, 'Y. Sie', 'Lars Jansen', '2020-06-11 21:37:53', 128, '62.140.132.51'),
(922, 'K. Hollander', 'Daniel Moreno', '2020-06-11 21:38:05', 124, '188.207.117.25'),
(923, 'K. Hollander', 'Daniel Moreno', '2020-06-11 21:38:05', 124, '188.207.117.25'),
(924, 'K. Hollander', 'Tijn Jutstra', '2020-06-11 21:45:34', 316, '188.207.117.25'),
(925, 'K. Hollander', 'Tijn Jutstra', '2020-06-11 21:45:41', 316, '188.207.117.25'),
(926, 'K. Hollander', 'Paul De Paaier', '2020-06-11 21:52:28', 130, '188.207.117.25'),
(927, 'L. Jansen', 'Jante Gielissen', '2020-06-11 21:57:40', 209, '84.82.14.94'),
(928, 'K. Hollander', 'Aiko Chapo', '2020-06-11 21:59:29', 112, '188.207.117.25'),
(929, 'K. Hollander', 'Pieter Post', '2020-06-11 22:27:20', 312, '188.207.117.25'),
(930, 'K. Hollander', 'Pieter Post', '2020-06-11 22:28:41', 312, '188.207.117.25'),
(931, 'K. Hollander', 'Pieter Post', '2020-06-11 22:28:53', 312, '188.207.117.25'),
(932, 'K. Hollander', 'Pieter Post', '2020-06-11 22:28:53', 312, '188.207.117.25'),
(933, 'SYSTEEM', 'Ahmed Bamischijf', '2020-06-11 22:34:54', 132, '86.89.195.36'),
(934, 'L. Jansen', 'Diego Moreno', '2020-06-11 22:40:22', 199, '84.82.14.94'),
(935, 'L. Jansen', 'Peter Post', '2020-06-11 22:41:23', 314, '84.82.14.94'),
(936, 'L. Jansen', 'Peter Post', '2020-06-11 22:41:34', 314, '84.82.14.94'),
(937, 'L. Jansen', 'Pieter Post', '2020-06-11 22:43:04', 312, '84.82.14.94'),
(938, 'L. Jansen', 'Diego Moreno', '2020-06-11 22:58:03', 199, '84.82.14.94'),
(939, 'L. Jansen', 'Diego Moreno', '2020-06-11 23:01:23', 199, '84.82.14.94'),
(940, 'L. Jansen', 'Diego Moreno', '2020-06-11 23:01:23', 199, '84.82.14.94'),
(941, 'L. Jansen', 'Donnie Peterson', '2020-06-11 23:05:56', 219, '84.82.14.94'),
(942, 'K. Bouwman', 'Donnie Peterson', '2020-06-11 23:18:04', 219, '145.132.244.161'),
(943, 'K. Bouwman', 'Donnie Peterson', '2020-06-11 23:18:45', 219, '145.132.244.161'),
(944, 'K. Bouwman', 'Donnie Peterson', '2020-06-11 23:19:17', 219, '145.132.244.161'),
(945, 'K. Bouwman', 'Donnie Peterson', '2020-06-11 23:19:47', 219, '145.132.244.161'),
(946, 'K. Bouwman', 'Donnie Peterson', '2020-06-11 23:19:47', 219, '145.132.244.161'),
(947, 'L. Jansen', 'Donnie Peterson', '2020-06-11 23:22:49', 219, '84.82.14.94'),
(948, 'L. Bouwman', 'Pieter Post', '2020-06-11 23:22:54', 312, '89.220.185.99'),
(949, 'L. Jansen', 'Donnie Peterson', '2020-06-11 23:23:50', 219, '84.82.14.94'),
(950, 'K. Bouwman', 'Donnie Peterson', '2020-06-11 23:24:33', 219, '145.132.244.161'),
(951, 'K. Bouwman', 'Donnie Peterson', '2020-06-11 23:24:33', 219, '145.132.244.161'),
(952, 'L. Jansen', 'Diego Moreno', '2020-06-12 00:51:39', 199, '84.82.14.94'),
(953, 'L. Jansen', 'Donnie Peterson', '2020-06-12 00:51:55', 219, '84.82.14.94'),
(954, 'L. Bouwman', 'Lars Jansen', '2020-06-12 01:01:21', 128, '89.220.185.99'),
(955, 'L. Bouwman', 'Fenna Visser', '2020-06-12 01:07:36', 288, '89.220.185.99'),
(956, 'L. Bouwman', 'Fenna Visser', '2020-06-12 01:07:42', 288, '89.220.185.99'),
(957, 'B. Vermaning', 'Youri Sie', '2020-06-12 09:32:36', 194, '86.82.121.66'),
(958, 'B. Vermaning', 'Youri Sie', '2020-06-12 09:33:11', 194, '86.82.121.66'),
(959, 'B. Vermaning', ' ', '2020-06-12 09:33:28', 0, '86.82.121.66'),
(960, 'B. Vermaning', 'Youri Sie', '2020-06-12 09:33:28', 194, '86.82.121.66'),
(961, 'B. Vermaning', 'Youri Sie', '2020-06-12 09:34:05', 194, '86.82.121.66'),
(962, 'B. Vermaning', 'Tommy Bright', '2020-06-12 09:34:20', 134, '86.82.121.66'),
(963, '', 'Tommy Bright', '2020-06-12 10:25:57', 134, '86.82.121.66'),
(964, 'D. Bouwman', 'Ahmed Bamischijf', '2020-06-12 12:12:29', 132, '31.201.13.167'),
(965, 'D. Bouwman', ' ', '2020-06-12 12:13:30', 0, '31.201.13.167'),
(966, 'D. Bouwman', 'Ahmed Bamischijf', '2020-06-12 12:13:30', 132, '31.201.13.167'),
(967, 'D. Bouwman', ' ', '2020-06-12 12:13:36', 0, '31.201.13.167'),
(968, 'D. Bouwman', 'Ahmed Bamischijf', '2020-06-12 12:13:36', 132, '31.201.13.167'),
(969, 'K. Bouwman', 'Daniel Moreno', '2020-06-12 12:34:18', 124, '145.132.244.161'),
(970, 'D. Bouwman', 'Ryan Rodevalk', '2020-06-12 12:38:43', 106, '31.201.13.167'),
(971, 'K. Bouwman', 'Ryan Rodevalk', '2020-06-12 12:38:54', 106, '145.132.244.161'),
(972, 'D. Bouwman', 'Ryan Rodevalk', '2020-06-12 12:39:31', 106, '31.201.13.167'),
(973, 'D. Bouwman', 'Ryan Rodevalk', '2020-06-12 12:39:31', 106, '31.201.13.167'),
(974, 'K. Bouwman', 'Diego Moreno', '2020-06-12 12:43:18', 199, '145.132.244.161'),
(975, 'D. Bouwman', 'Diego Moreno', '2020-06-12 12:44:30', 199, '31.201.13.167'),
(976, 'K. Bouwman', 'Diego Moreno', '2020-06-12 12:44:54', 199, '145.132.244.161'),
(977, 'K. Bouwman', 'Diego Moreno', '2020-06-12 12:48:39', 199, '145.132.244.161'),
(978, 'K. Bouwman', 'Diego Moreno', '2020-06-12 12:49:52', 199, '145.132.244.161'),
(979, 'D. Bouwman', 'Diego Moreno', '2020-06-12 12:52:26', 199, '31.201.13.167'),
(980, 'Ahmed Bamischijf', 'Ahmed Bamischijf', '2020-06-12 12:54:52', 132, '81.165.114.148'),
(981, 'Ahmed Bamischijf', 'Youri Sie', '2020-06-12 12:55:03', 194, '81.165.114.148'),
(982, 'L. Jansen', 'Fenna Visser', '2020-06-12 13:27:06', 288, '84.82.14.94'),
(983, 'L. Bouwman', 'Sem Hoveling', '2020-06-12 13:31:14', 308, '109.36.141.152'),
(984, 'L. Bouwman', 'Sem Hoveling', '2020-06-12 13:34:46', 308, '109.36.141.152'),
(985, '', 'Lars Jansen', '2020-06-12 13:52:11', 128, '62.140.132.28'),
(986, 'K. Bouwman', 'Lars Jansen', '2020-06-12 14:23:47', 128, '145.132.244.161'),
(987, 'Ahmed Bamischijf', 'Diego Moreno', '2020-06-12 14:57:25', 199, '81.165.114.148'),
(988, 'K. Bouwman', 'Diego Moreno', '2020-06-12 15:45:10', 199, '145.132.244.161'),
(989, 'Ahmed Bamischijf', 'Daniel Moreno', '2020-06-12 15:47:00', 124, '81.165.114.148'),
(990, 'K. Bouwman', 'Lars Jansen', '2020-06-12 15:47:35', 128, '145.132.244.161'),
(991, 'L. Jansen', 'Diego Moreno', '2020-06-12 15:48:33', 199, '84.82.14.94'),
(992, 'K. Bouwman', 'Daniel Moreno', '2020-06-12 15:53:09', 124, '145.132.244.161'),
(993, 'D. Bouwman', 'Diego Moreno', '2020-06-12 16:04:03', 199, '31.201.13.167'),
(994, 'D. Bouwman', 'Diego Moreno', '2020-06-12 16:04:16', 199, '31.201.13.167'),
(995, 'D. Bouwman', 'Diego Moreno', '2020-06-12 16:04:25', 199, '31.201.13.167'),
(996, 'D. Bouwman', 'Diego Moreno', '2020-06-12 16:06:11', 199, '31.201.13.167'),
(997, 'D. Bouwman', 'Diego Moreno', '2020-06-12 16:06:12', 199, '31.201.13.167'),
(998, 'K. Bouwman', 'Tijn Jutstra', '2020-06-12 16:08:48', 316, '145.132.244.161'),
(999, 'L. Jansen', 'Diego Moreno', '2020-06-12 16:18:15', 199, '84.82.14.94'),
(1000, 'L. Jansen', 'Tijn Jutstra', '2020-06-12 16:19:14', 316, '84.82.14.94'),
(1001, 'L. Jansen', 'Sem Hoveling', '2020-06-12 16:21:30', 308, '84.82.14.94'),
(1002, 'M. Tegelen', 'Sem Hoveling', '2020-06-12 16:23:10', 308, '84.25.211.35'),
(1003, 'K. Bouwman', 'Sem Hoveling', '2020-06-12 16:54:43', 308, '145.132.244.161'),
(1004, 'K. Bouwman', 'Sem Hoveling', '2020-06-12 16:55:35', 308, '145.132.244.161'),
(1005, 'K. Bouwman', ' ', '2020-06-12 16:55:37', 0, '145.132.244.161'),
(1006, 'K. Bouwman', 'Sem Hoveling', '2020-06-12 16:55:37', 308, '145.132.244.161'),
(1007, 'K. Bouwman', 'Sem Hoveling', '2020-06-12 16:58:33', 308, '145.132.244.161'),
(1008, 'K. Bouwman', 'Sem Hoveling', '2020-06-12 16:58:33', 308, '145.132.244.161'),
(1009, 'K. Bouwman', 'Sem Hoveling', '2020-06-12 17:01:59', 308, '145.132.244.161'),
(1010, 'K. Bouwman', 'Sem Hoveling', '2020-06-12 17:02:22', 308, '145.132.244.161'),
(1011, 'D. Bouwman', 'Donnie Peterson', '2020-06-12 18:18:01', 219, '31.201.13.167'),
(1012, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-12 18:51:24', 132, '77.160.150.93'),
(1013, 'Y. Sie', 'Frits Jorritsma', '2020-06-12 19:38:21', 90, '77.160.150.93'),
(1014, 'Y. Sie', 'Frits Jorritsma', '2020-06-12 19:38:43', 90, '77.160.150.93'),
(1015, 'Y. Sie', 'Frits Jorritsma', '2020-06-12 19:39:00', 90, '77.160.150.93'),
(1016, 'Y. Sie', 'Donny Meijer', '2020-06-12 19:41:45', 219, '77.160.150.93'),
(1017, 'Y. Sie', 'Donny Meijer', '2020-06-12 19:43:10', 219, '77.160.150.93'),
(1018, 'Y. Sie', 'Donny Meijer', '2020-06-12 19:43:25', 219, '77.160.150.93'),
(1019, 'SYSTEEM', 'Frits Jorritsma', '2020-06-12 19:44:48', 90, '86.89.195.36'),
(1020, 'M. Tegelen', 'Mark Tegelen', '2020-06-12 19:53:17', 231, '84.25.211.35'),
(1021, 'M. Tegelen', 'Diego Moreno', '2020-06-12 19:57:16', 199, '84.25.211.35'),
(1022, 'K. Hollander', 'Donny Meijer', '2020-06-12 19:59:58', 219, '188.206.66.47'),
(1023, 'Y. Sie', 'Sem Hoveling', '2020-06-12 20:00:22', 308, '77.160.150.93'),
(1024, 'Y. Sie', 'Sem Hoveling', '2020-06-12 20:00:37', 308, '77.160.150.93'),
(1025, 'Y. Sie', 'Sem Hoveling', '2020-06-12 20:00:46', 308, '77.160.150.93'),
(1026, 'Y. Sie', 'Sem Hoveling', '2020-06-12 20:01:01', 308, '77.160.150.93'),
(1027, 'Y. Sie', 'Sem Hoveling', '2020-06-12 20:01:26', 308, '77.160.150.93'),
(1028, 'Y. Sie', 'Sem Hoveling', '2020-06-12 20:01:42', 308, '77.160.150.93'),
(1029, 'K. Hollander', 'Donny Meijer', '2020-06-12 20:04:20', 219, '188.206.66.47'),
(1030, 'Y. Sie', 'Sem Hoveling', '2020-06-12 20:05:09', 308, '77.160.150.93'),
(1031, 'Y. Sie', 'Sem Hoveling', '2020-06-12 20:07:08', 308, '77.160.150.93'),
(1032, 'Y. Sie', 'Sem Hoveling', '2020-06-12 20:07:08', 308, '77.160.150.93'),
(1033, 'Y. Sie', 'Sem Hoveling', '2020-06-12 20:22:43', 308, '62.140.132.28'),
(1034, 'Y. Sie', 'Sem Hoveling', '2020-06-12 20:28:41', 308, '62.140.132.28'),
(1035, 'Y. Sie', 'Sem Hoveling', '2020-06-12 20:28:41', 308, '62.140.132.28'),
(1036, 'Y. Sie', 'Sem Hoveling', '2020-06-12 20:34:10', 308, '62.140.132.28'),
(1037, 'Y. Sie', 'Sem Hoveling', '2020-06-12 20:35:24', 308, '62.140.132.28'),
(1038, 'Y. Sie', 'Sem Hoveling', '2020-06-12 20:35:24', 308, '62.140.132.28'),
(1039, 'SYSTEEM', 'Sem Hoveling', '2020-06-12 20:45:43', 308, '86.89.195.36'),
(1040, 'J. Giellissen', 'Kian Van Riel', '2020-06-12 21:48:01', 132, '212.120.114.152'),
(1041, 'J. Giellissen', 'Ahmed Bamischijf', '2020-06-12 21:51:00', 132, '212.120.114.152'),
(1042, 'H. Kooikarper', 'Ahmed Bamischijf', '2020-06-12 21:51:05', 132, '217.122.58.81'),
(1043, 'J. Giellissen', 'Ahmed Bamischijf', '2020-06-12 21:51:55', 132, '212.120.114.152'),
(1044, 'H. Kooikarper', 'Ahmed Bamischijf', '2020-06-12 21:52:05', 132, '217.122.58.81'),
(1045, 'J. Giellissen', 'Ahmed Bamischijf', '2020-06-12 21:52:26', 132, '212.120.114.152'),
(1046, 'J. Giellissen', 'Ahmed Bamischijf', '2020-06-12 21:52:31', 132, '212.120.114.152'),
(1047, 'H. Kooikarper', 'Ahmed Bamischijf', '2020-06-12 21:57:51', 132, '217.122.58.81'),
(1048, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-12 22:03:46', 132, '62.140.132.28'),
(1049, 'H. Kooikarper', 'Donny Meijer', '2020-06-12 22:07:23', 219, '217.122.58.81'),
(1050, 'SYSTEEM', 'Ahmed Bamischijf', '2020-06-12 22:19:53', 132, '86.89.195.36'),
(1051, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-12 22:19:53', 132, '62.140.132.28'),
(1052, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-12 22:20:40', 132, '62.140.132.28'),
(1053, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-12 22:20:48', 132, '62.140.132.28'),
(1054, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-12 22:21:01', 132, '62.140.132.28'),
(1055, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-12 22:21:14', 132, '62.140.132.28'),
(1056, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-12 22:21:34', 132, '62.140.132.28'),
(1057, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-12 22:21:48', 132, '62.140.132.28'),
(1058, 'SYSTEEM', 'Ahmed Bamischijf', '2020-06-12 22:21:53', 132, '86.89.195.36'),
(1059, 'SYSTEEM', 'Ahmed Bamischijf', '2020-06-12 22:22:02', 132, '86.89.195.36'),
(1060, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-12 22:22:27', 132, '62.140.132.28'),
(1061, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-12 22:22:38', 132, '62.140.132.28'),
(1062, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-12 22:22:52', 132, '62.140.132.28'),
(1063, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-12 22:22:59', 132, '62.140.132.28'),
(1064, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-12 22:23:17', 132, '62.140.132.28'),
(1065, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-12 22:23:32', 132, '62.140.132.28'),
(1066, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-12 22:23:46', 132, '62.140.132.28'),
(1067, 'SYSTEEM', 'Ahmed Bamischijf', '2020-06-12 22:29:03', 132, '86.89.195.36'),
(1068, 'L. Bouwman', 'Ahmed Bamischijf', '2020-06-12 22:29:08', 132, '89.220.185.99'),
(1069, 'K. Hollander', 'Ahmed Bamischijf', '2020-06-12 22:30:00', 132, '81.204.193.154'),
(1070, 'Y. Sie', 'Diego Moreno', '2020-06-12 22:34:56', 199, '62.140.132.28'),
(1071, 'Y. Sie', ' ', '2020-06-12 22:35:36', 0, '62.140.132.28'),
(1072, 'Y. Sie', 'Diego Moreno', '2020-06-12 22:35:36', 199, '62.140.132.28'),
(1073, 'K. Hollander', 'Ahmed Bamischijf', '2020-06-12 22:37:51', 132, '81.204.193.154'),
(1074, 'K. Hollander', 'Ahmed Bamischijf', '2020-06-12 22:37:52', 132, '81.204.193.154'),
(1075, 'K. Hollander', ' ', '2020-06-12 22:37:56', 0, '81.204.193.154'),
(1076, 'K. Hollander', 'Ahmed Bamischijf', '2020-06-12 22:37:56', 132, '81.204.193.154'),
(1077, 'J. Giellissen', 'Donny Meijer', '2020-06-12 22:48:52', 219, '212.120.114.152'),
(1078, 'J. Giellissen', 'Donny Meijer', '2020-06-12 22:49:29', 219, '212.120.114.152'),
(1079, 'J. Giellissen', 'Donny Meijer', '2020-06-12 22:50:23', 219, '212.120.114.152'),
(1080, 'K. Hollander', 'Donny Meijer', '2020-06-12 22:50:59', 219, '188.206.66.47'),
(1081, 'J. Giellissen', 'Donny Meijer', '2020-06-12 22:51:12', 219, '212.120.114.152'),
(1082, 'J. Giellissen', 'Donny Meijer', '2020-06-12 22:52:31', 219, '212.120.114.152'),
(1083, 'J. Giellissen', 'Donny Meijer', '2020-06-12 22:52:31', 219, '212.120.114.152'),
(1084, 'Y. Sie', 'Donny Meijer', '2020-06-12 23:07:28', 219, '62.140.132.28'),
(1085, 'Y. Sie', 'Donny Meijer', '2020-06-12 23:08:04', 219, '62.140.132.28'),
(1086, 'Y. Sie', 'Donny Meijer', '2020-06-12 23:08:15', 219, '62.140.132.28'),
(1087, 'K. Bouwman', 'Donny Meijer', '2020-06-12 23:08:21', 219, '145.132.244.161'),
(1088, 'K. Bouwman', ' ', '2020-06-12 23:08:56', 0, '145.132.244.161'),
(1089, 'K. Bouwman', 'Ahmed Bamischijf', '2020-06-12 23:09:24', 132, '145.132.244.161'),
(1090, 'Y. Sie', 'Peter Hansma', '2020-06-12 23:21:38', 186, '62.140.132.28'),
(1091, 'Y. Sie', 'Peter Hansma', '2020-06-12 23:22:09', 186, '62.140.132.28'),
(1092, 'K. Hollander', 'Donny Meijer', '2020-06-12 23:29:30', 219, '188.206.66.47'),
(1093, 'K. Hollander', 'Donny Meijer', '2020-06-12 23:29:56', 219, '188.206.66.47'),
(1094, 'J. Giellissen', 'Donny Meijer', '2020-06-12 23:57:02', 219, '212.120.114.152'),
(1095, 'J. Giellissen', 'Donny Meijer', '2020-06-13 00:22:13', 219, '212.120.114.152'),
(1096, 'L. Bouwman', 'Donny Meijer', '2020-06-13 00:22:16', 219, '89.220.185.99'),
(1097, 'J. Giellissen', 'Donny Meijer', '2020-06-13 00:23:52', 219, '212.120.114.152'),
(1098, 'J. Giellissen', 'Donny Meijer', '2020-06-13 00:23:52', 219, '212.120.114.152'),
(1099, 'Ahmed Bamischijf', 'Ahmed Bamischijf', '2020-06-13 00:45:43', 132, '81.165.114.148'),
(1100, 'Ahmed Bamischijf', 'Ahmed Bamischijf', '2020-06-13 00:46:03', 132, '81.165.114.148'),
(1101, 'Ahmed Bamischijf', 'Ahmed Bamischijf', '2020-06-13 03:56:13', 132, '81.165.114.148'),
(1102, 'Ahmed Bamischijf', 'Ahmed Bamischijf', '2020-06-13 03:56:32', 132, '81.165.114.148'),
(1103, '', 'Ahmed Bamischijf', '2020-06-13 08:29:48', 132, '77.160.150.93'),
(1104, 'Ahmed Bamischijf', 'Ahmed Bamischijf', '2020-06-13 13:42:07', 132, '81.165.114.148'),
(1105, 'Ahmed Bamischijf', 'Paul De Paaier', '2020-06-13 13:42:31', 130, '81.165.114.148'),
(1106, 'Ahmed Bamischijf', 'Diego Moreno', '2020-06-13 13:44:49', 199, '81.165.114.148'),
(1107, 'Ahmed Bamischijf', 'Diego Moreno', '2020-06-13 13:45:17', 199, '81.165.114.148'),
(1108, 'Ahmed Bamischijf', 'Daniel Moreno', '2020-06-13 13:45:31', 124, '81.165.114.148'),
(1109, 'Ahmed Bamischijf', 'Donny Meijer', '2020-06-13 13:45:45', 219, '81.165.114.148'),
(1110, 'Ahmed Bamischijf', 'Youri Sie', '2020-06-13 13:46:56', 194, '81.165.114.148'),
(1111, 'Ahmed Bamischijf', 'Ahmed Bamischijf', '2020-06-13 13:47:10', 132, '81.165.114.148'),
(1112, 'Ahmed Bamischijf', 'Paul De Paaier', '2020-06-13 13:47:14', 130, '81.165.114.148'),
(1113, 'Ahmed Bamischijf', 'Diego Moreno', '2020-06-13 13:47:20', 199, '81.165.114.148'),
(1114, 'Ahmed Bamischijf', 'Daniel Moreno', '2020-06-13 13:47:26', 124, '81.165.114.148'),
(1115, 'K. Hollander', 'Frits Jorritsma', '2020-06-13 15:32:37', 90, '188.206.66.47'),
(1116, 'K. Hollander', 'Appie Meijer', '2020-06-13 16:00:41', 327, '188.206.66.47'),
(1117, 'Ahmed Bamischijf', 'Daniel Moreno', '2020-06-13 16:45:23', 124, '81.165.114.148'),
(1118, 'Ahmed Bamischijf', 'Diego Moreno', '2020-06-13 16:51:14', 199, '81.165.114.148'),
(1119, 'Ahmed Bamischijf', 'Donny Meijer', '2020-06-13 17:01:47', 219, '81.165.114.148'),
(1120, 'Ahmed Bamischijf', 'Donny Meijer', '2020-06-13 17:01:57', 219, '81.165.114.148'),
(1121, 'Ahmed Bamischijf', 'Donny Meijer', '2020-06-13 17:02:18', 219, '81.165.114.148'),
(1122, 'Ahmed Bamischijf', 'Donny Meijer', '2020-06-13 17:02:37', 219, '81.165.114.148'),
(1123, 'H. Kooikarper', 'Appie Meijer', '2020-06-13 18:12:26', 327, '217.122.58.81'),
(1124, 'Ahmed Bamischijf', 'Donny Meijer', '2020-06-13 19:06:06', 219, '81.165.114.148'),
(1125, 'Ahmed Bamischijf', ' ', '2020-06-13 19:40:54', 0, '81.165.114.148'),
(1126, 'Ahmed Bamischijf', 'Donny Meijer', '2020-06-13 19:40:55', 219, '81.165.114.148'),
(1127, 'Ahmed Bamischijf', 'Donny Meijer', '2020-06-13 19:41:02', 219, '81.165.114.148'),
(1128, 'Ahmed Bamischijf', 'Donny Meijer', '2020-06-13 19:41:13', 219, '81.165.114.148'),
(1129, 'Ahmed Bamischijf', 'Donny Meijer', '2020-06-13 19:41:38', 219, '81.165.114.148'),
(1130, 'Ahmed Bamischijf', 'Karel Petersma', '2020-06-13 20:05:07', 186, '81.165.114.148'),
(1131, 'J. Giellissen', 'Appie Meijer', '2020-06-13 21:10:21', 327, '212.120.114.152'),
(1132, 'J. Giellissen', 'Appie Meijer', '2020-06-13 21:11:15', 327, '212.120.114.152'),
(1133, 'Y. Sie', 'Paul De Paaier', '2020-06-13 21:21:24', 130, '62.140.132.28'),
(1134, 'Y. Sie', 'Youri Sie', '2020-06-13 21:52:23', 194, '62.140.132.28'),
(1135, 'B. Vermaning', 'Frits Jorritsma', '2020-06-13 22:50:02', 90, '86.82.121.66'),
(1136, 'L. Bouwman', 'Diego Moreno', '2020-06-13 23:36:19', 199, '89.220.185.99'),
(1137, 'Ahmed Bamischijf', 'Youri Sie', '2020-06-14 00:21:36', 194, '81.165.114.148'),
(1138, 'Ahmed Bamischijf', 'Donny Meijer', '2020-06-14 00:24:29', 219, '81.165.114.148'),
(1139, 'Ahmed Bamischijf', 'Daniel Moreno', '2020-06-14 00:32:20', 124, '81.165.114.148'),
(1140, 'Ahmed Bamischijf', 'Daniel Moreno', '2020-06-14 00:34:32', 124, '81.165.114.148'),
(1141, 'Ahmed Bamischijf', 'Daniel Moreno', '2020-06-14 00:34:32', 124, '81.165.114.148'),
(1142, 'Ahmed Bamischijf', 'Diego Moreno', '2020-06-14 00:34:40', 199, '81.165.114.148'),
(1143, 'Ahmed Bamischijf', 'Diego Moreno', '2020-06-14 00:34:52', 199, '81.165.114.148'),
(1144, 'Ahmed Bamischijf', 'Diego Moreno', '2020-06-14 00:34:52', 199, '81.165.114.148'),
(1145, 'M. Tegelen', 'Mark Tegelen', '2020-06-14 12:06:01', 231, '84.25.211.35'),
(1146, 'M. Tegelen', 'Sander Wedding', '2020-06-14 12:07:16', 322, '84.25.211.35'),
(1147, 'K. Bouwman', 'Donny Meijer', '2020-06-14 12:09:48', 219, '145.132.244.161'),
(1148, 'M. Tegelen', 'Diego Moreno', '2020-06-14 12:10:30', 199, '84.25.211.35'),
(1149, 'K. Bouwman', 'Daniel Moreno', '2020-06-14 12:13:26', 124, '145.132.244.161'),
(1150, 'K. Bouwman', 'Diego Moreno', '2020-06-14 12:13:47', 199, '145.132.244.161'),
(1151, 'K. Bouwman', 'Diego Moreno', '2020-06-14 12:14:07', 199, '145.132.244.161'),
(1152, 'K. Bouwman', 'Mark Tegelen', '2020-06-14 12:14:16', 231, '145.132.244.161'),
(1153, 'Ahmed Bamischijf', 'Daniel Moreno', '2020-06-14 13:00:54', 124, '81.165.114.148'),
(1154, 'Ahmed Bamischijf', 'Diego Moreno', '2020-06-14 13:56:25', 199, '81.165.114.148'),
(1155, 'Ahmed Bamischijf', 'Youri Sie', '2020-06-14 14:04:37', 194, '81.165.114.148'),
(1156, 'Y. Sie', 'Youri Sie', '2020-06-14 14:05:38', 194, '77.160.150.93'),
(1157, 'J. Giellissen', 'Youri Sie', '2020-06-14 14:06:50', 194, '212.120.114.152'),
(1158, 'Ahmed Bamischijf', 'Youri Sie', '2020-06-14 14:08:13', 194, '81.165.114.148'),
(1159, 'Ahmed Bamischijf', 'Youri Sie', '2020-06-14 14:08:31', 194, '81.165.114.148'),
(1160, 'Ahmed Bamischijf', 'Youri Sie', '2020-06-14 14:10:56', 194, '81.165.114.148'),
(1161, 'Y. Sie', 'Youri Sie', '2020-06-14 14:11:57', 194, '77.160.150.93'),
(1162, 'Ahmed Bamischijf', 'Youri Sie', '2020-06-14 14:14:25', 194, '81.165.114.148'),
(1163, 'Ahmed Bamischijf', 'Youri Sie', '2020-06-14 14:14:25', 194, '81.165.114.148'),
(1164, 'J. Giellissen', 'Donny Meijer', '2020-06-14 14:20:18', 219, '212.120.114.152'),
(1165, 'J. Giellissen', 'Donny Meijer', '2020-06-14 14:21:49', 219, '212.120.114.152'),
(1166, 'J. Giellissen', 'Donny Meijer', '2020-06-14 14:22:53', 219, '212.120.114.152'),
(1167, 'J. Giellissen', 'Donny Meijer', '2020-06-14 14:22:53', 219, '212.120.114.152'),
(1168, 'Ahmed Bamischijf', 'Youri Sie', '2020-06-14 14:29:35', 194, '81.165.114.148'),
(1169, 'Ahmed Bamischijf', 'Youri Sie', '2020-06-14 14:35:02', 194, '81.165.114.148'),
(1170, 'Ahmed Bamischijf', 'Youri Sie', '2020-06-14 14:46:40', 194, '81.165.114.148'),
(1171, 'Ahmed Bamischijf', 'Youri Sie', '2020-06-14 14:48:01', 194, '81.165.114.148'),
(1172, 'Ahmed Bamischijf', 'Youri Sie', '2020-06-14 14:55:19', 194, '81.165.114.148'),
(1173, 'Ahmed Bamischijf', 'Diego Moreno', '2020-06-14 14:56:05', 199, '81.165.114.148'),
(1174, 'Y. Sie', 'Youri Sie', '2020-06-14 14:57:13', 194, '77.160.150.93'),
(1175, 'Y. Sie', ' ', '2020-06-14 14:58:24', 0, '77.160.150.93'),
(1176, 'Y. Sie', 'Youri Sie', '2020-06-14 14:58:24', 194, '77.160.150.93'),
(1177, 'Y. Sie', 'Youri Sie', '2020-06-14 14:58:43', 194, '77.160.150.93'),
(1178, 'Y. Sie', ' ', '2020-06-14 15:00:45', 0, '77.160.150.93'),
(1179, 'Y. Sie', 'Youri Sie', '2020-06-14 15:00:45', 194, '77.160.150.93'),
(1180, 'Y. Sie', 'Youri Sie', '2020-06-14 15:00:53', 194, '77.160.150.93'),
(1181, 'Y. Sie', 'Henk Hamburger', '2020-06-14 15:07:09', 132, '77.160.150.93'),
(1182, 'Y. Sie', 'Henk Hamburger', '2020-06-14 15:07:39', 132, '77.160.150.93'),
(1183, 'Y. Sie', 'Henk Hamburger', '2020-06-14 15:08:08', 132, '77.160.150.93'),
(1184, 'Y. Sie', ' ', '2020-06-14 15:11:35', 132, '77.160.150.93'),
(1185, 'Y. Sie', ' ', '2020-06-14 15:11:35', 132, '77.160.150.93'),
(1186, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-14 15:11:45', 132, '77.160.150.93'),
(1187, 'Y. Sie', 'Henk  Boterham', '2020-06-14 15:12:11', 118, '77.160.150.93'),
(1188, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-14 15:12:28', 132, '77.160.150.93'),
(1189, 'Ahmed Bamischijf', 'Ahmed Bamischijf', '2020-06-14 15:13:38', 132, '81.165.114.148'),
(1190, 'Ahmed Bamischijf', 'Youri Sie', '2020-06-14 15:14:03', 194, '81.165.114.148'),
(1191, 'Ahmed Bamischijf', 'Youri Sie', '2020-06-14 15:25:19', 194, '81.165.114.148'),
(1192, 'Y. Sie', 'Youri Sie', '2020-06-14 15:50:18', 194, '77.160.150.93'),
(1193, 'Y. Sie', 'Ahmed Bamischijf', '2020-06-14 15:50:28', 132, '77.160.150.93'),
(1194, 'H. Kooikarper', 'Donny Meijer', '2020-06-14 15:54:25', 219, '217.122.58.81'),
(1195, 'H. Kooikarper', 'Donny Meijer', '2020-06-14 15:55:27', 219, '217.122.58.81'),
(1196, 'H. Kooikarper', 'Donny Meijer', '2020-06-14 15:56:51', 219, '217.122.58.81'),
(1197, 'H. Kooikarper', 'Donny Meijer', '2020-06-14 15:56:51', 219, '217.122.58.81'),
(1198, 'B. Vermaning', 'Donny Meijer', '2020-06-14 15:58:38', 219, '86.82.121.66'),
(1199, 'B. Vermaning', 'Diego Moreno', '2020-06-14 16:11:08', 199, '86.82.121.66'),
(1200, 'H. Kooikarper', 'Daniel Moreno', '2020-06-14 16:12:27', 124, '217.122.58.81'),
(1201, 'Ahmed Bamischijf', 'Donny Meijer', '2020-06-14 16:21:55', 219, '81.165.114.148'),
(1202, 'Ahmed Bamischijf', 'Donny Meijer', '2020-06-14 16:25:15', 219, '81.165.114.148'),
(1203, 'Ahmed Bamischijf', ' ', '2020-06-14 16:30:04', 219, '81.165.114.148'),
(1204, 'Ahmed Bamischijf', ' ', '2020-06-14 16:36:50', 219, '81.165.114.148'),
(1205, 'B. Vermaning', 'Daniel Moreno', '2020-06-14 16:37:03', 124, '86.82.121.66'),
(1206, 'J. Giellissen', 'Appie Meijer', '2020-06-14 16:44:06', 327, '212.120.114.152'),
(1207, 'SYSTEEM', 'Daniel Moreno', '2020-06-14 16:44:42', 124, '86.89.195.36'),
(1208, 'J. Giellissen', 'Appie Meijer', '2020-06-14 16:46:18', 327, '212.120.114.152'),
(1209, 'SYSTEEM', 'Youri Sie', '2020-06-14 16:48:48', 194, '86.89.195.36'),
(1210, 'B. Vermaning', 'Henk Kooikarper', '2020-06-14 16:49:42', 201, '86.82.121.66'),
(1211, 'Ahmed Bamischijf', 'Ahmed Bamischijf', '2020-06-14 16:50:23', 132, '81.165.114.148'),
(1212, 'B. Vermaning', 'Sander Wedding', '2020-06-14 16:51:12', 322, '86.82.121.66'),
(1213, 'Y. Sie', 'Karel Petersma', '2020-06-14 16:53:49', 186, '77.160.150.93'),
(1214, 'S. Wedding', 'Sander Wedding', '2020-06-14 17:15:22', 322, '84.25.224.156'),
(1215, 'SYSTEEM', 'Youri Sie', '2020-06-14 17:21:58', 194, '86.89.195.36'),
(1216, 'SYSTEEM', 'Youri Sie', '2020-06-14 17:23:19', 194, '86.89.195.36'),
(1217, 'J. Giellissen', 'Diego Moreno', '2020-06-14 17:31:19', 199, '212.120.114.152'),
(1218, 'K. Hollander', 'Appie Meijer', '2020-06-14 17:44:01', 327, '188.206.96.24'),
(1219, 'K. Hollander', 'Appie Meijer', '2020-06-14 17:49:34', 327, '188.206.96.24'),
(1220, 'Y. Sie', 'Karel Petersma', '2020-06-14 18:21:39', 186, '77.160.150.93'),
(1221, 'Y. Sie', 'Appie Meijer', '2020-06-14 18:24:13', 327, '77.160.150.93'),
(1222, 'Y. Sie', 'Dimma Meyer ', '2020-06-14 18:33:25', 341, '77.160.150.93'),
(1223, 'Y. Sie', 'Tijn Jutstra', '2020-06-14 18:38:49', 316, '77.160.150.93'),
(1224, 'B. Vermaning', 'Appie Meijer', '2020-06-14 18:41:22', 327, '143.179.77.30'),
(1225, 'B. Vermaning', 'Appie Meijer', '2020-06-14 18:42:45', 327, '143.179.77.30'),
(1226, 'B. Vermaning', 'Appie Meijer', '2020-06-14 18:42:45', 327, '143.179.77.30'),
(1227, 'B. Vermaning', 'Appie Meijer', '2020-06-14 18:43:02', 327, '143.179.77.30'),
(1228, 'B. Vermaning', 'Appie Meijer', '2020-06-14 18:43:16', 327, '143.179.77.30'),
(1229, 'L. Bouwman', 'Appie Meijer', '2020-06-14 19:00:28', 327, '89.220.185.99'),
(1230, '', 'Appie Meijer', '2020-06-14 20:03:54', 327, '188.206.96.24'),
(1231, '', 'Appie Meijer', '2020-06-14 20:03:58', 327, '188.206.96.24'),
(1232, 'K. Hollander', 'Appie Meijer', '2020-06-14 20:05:30', 327, '188.206.96.24'),
(1233, 'K. Hollander', 'Dimma Meyer ', '2020-06-14 20:05:46', 341, '188.206.96.24'),
(1234, 'K. Hollander', 'Diego Moreno', '2020-06-14 20:11:59', 199, '188.206.96.24'),
(1235, 'Y. Sie', 'Karel Petersma', '2020-06-14 20:15:01', 186, '77.160.150.93'),
(1236, 'S. Wedding', 'Karel Petersma', '2020-06-14 20:50:07', 186, '84.25.224.156'),
(1237, 'Y. Sie', 'Henk Hamburger', '2020-06-14 20:57:23', 132, '77.160.150.93'),
(1238, 'Y. Sie', 'Youri Sie', '2020-06-14 20:57:38', 194, '77.160.150.93'),
(1239, 'L. Jansen', 'Daniel Moreno', '2020-06-14 21:05:18', 124, '143.179.40.138'),
(1240, 'L. Jansen', 'Diego Moreno', '2020-06-14 21:05:43', 199, '143.179.40.138'),
(1241, 'L. Jansen', 'Daniel Moreno', '2020-06-14 21:05:47', 124, '143.179.40.138'),
(1242, 'Y. Sie', 'Karel Petersma', '2020-06-14 21:09:45', 186, '77.160.150.93'),
(1243, 'K. Hollander', 'Youri Sie', '2020-06-14 21:14:18', 194, '188.206.96.24'),
(1244, 'K. Hollander', 'Youri Sie', '2020-06-14 21:14:22', 194, '188.206.96.24'),
(1245, '', 'Appie Meijer', '2020-06-14 21:18:20', 327, '86.82.121.66'),
(1246, 'K. Hollander', 'Youri Sie', '2020-06-14 21:20:18', 194, '188.206.96.24'),
(1247, 'K. Hollander', 'Dimma Meyer ', '2020-06-14 21:20:29', 341, '188.206.96.24'),
(1248, 'Y. Sie', 'Youri Sie', '2020-06-14 21:30:19', 194, '77.160.150.93');
INSERT INTO `livelog` (`id`, `agent`, `burger`, `datetime`, `burgerid`, `ip`) VALUES
(1249, '', 'Youri Sie', '2020-06-14 21:30:34', 194, '35.227.62.178'),
(1250, '', 'Appie Meijer', '2020-06-14 21:34:13', 327, '86.82.121.66'),
(1251, 'Ahmed Bamischijf', 'Frits Jorritsma', '2020-06-14 21:45:50', 90, '81.165.114.148'),
(1252, 'K. Bouwman', 'Dimma Meyer ', '2020-06-14 22:18:58', 341, '145.132.244.161'),
(1253, 'S. Wedding', 'Paul De Paaier', '2020-06-14 22:26:04', 130, '84.25.224.156'),
(1254, 'S. Wedding', 'Paul De Paaier', '2020-06-14 22:31:11', 130, '84.25.224.156'),
(1255, 'L. Jansen', 'Paul De Paaier', '2020-06-14 22:52:33', 130, '143.179.40.138'),
(1256, 'L. Jansen', 'Dimma Meyer ', '2020-06-14 23:11:23', 341, '143.179.40.138'),
(1257, 'S. Wedding', 'Paul De Paaier', '2020-06-14 23:14:24', 130, '84.25.224.156'),
(1258, 'S. Wedding', 'Paul De Paaier', '2020-06-14 23:19:32', 130, '84.25.224.156'),
(1259, 'L. Jansen', 'Paul De Paaier', '2020-06-14 23:20:14', 130, '143.179.40.138'),
(1260, 'L. Jansen', 'Paul De Paaier', '2020-06-14 23:20:49', 130, '143.179.40.138'),
(1261, 'L. Jansen', 'Dimma Meyer ', '2020-06-14 23:20:58', 341, '143.179.40.138'),
(1262, 'L. Jansen', 'Dimma Meyer ', '2020-06-14 23:21:23', 341, '143.179.40.138'),
(1263, 'D. Bouwman', 'Paul De Paaier', '2020-06-14 23:49:50', 130, '31.201.13.167'),
(1264, 'K. Bouwman', 'Daniel Moreno', '2020-06-15 00:39:19', 124, '145.132.244.161'),
(1265, 'K. Bouwman', 'Paul De Paaier', '2020-06-15 00:40:15', 130, '145.132.244.161'),
(1266, 'M. Tegelen', 'Daniel Moreno', '2020-06-15 00:58:34', 124, '84.25.211.35'),
(1267, 'M. Tegelen', 'Mark Tegelen', '2020-06-15 01:28:21', 231, '84.25.211.35'),
(1268, 'M. Tegelen', 'Diego Moreno', '2020-06-15 01:28:53', 199, '84.25.211.35'),
(1269, 'M. Tegelen', 'Diego Moreno', '2020-06-15 01:31:24', 199, '84.25.211.35'),
(1270, 'M. Tegelen', 'Diego Moreno', '2020-06-15 01:31:37', 199, '84.25.211.35'),
(1271, '', 'Paul De Paaier', '2020-06-15 01:37:01', 130, '84.25.224.156'),
(1272, 'S. Wedding', 'Paul De Paaier', '2020-06-15 01:37:30', 130, '84.25.224.156'),
(1273, 'D. Bouwman', 'Daniel Moreno', '2020-06-15 11:51:40', 124, '31.201.13.167'),
(1274, 'B. Vermaning', 'Daniel Moreno', '2020-06-15 11:52:00', 124, '82.75.120.166'),
(1275, 'B. Vermaning', 'Daniel Moreno', '2020-06-15 11:52:36', 124, '82.75.120.166'),
(1276, 'D. Bouwman', 'Daniel Moreno', '2020-06-15 12:07:22', 124, '31.201.13.167'),
(1277, 'B. Vermaning', ' ', '2020-06-15 12:08:07', 0, '82.75.120.166'),
(1278, 'B. Vermaning', 'Daniel Moreno', '2020-06-15 12:08:07', 124, '82.75.120.166'),
(1279, 'B. Vermaning', 'Diego Moreno', '2020-06-15 12:08:11', 199, '82.75.120.166'),
(1280, 'B. Vermaning', ' ', '2020-06-15 12:08:13', 0, '82.75.120.166'),
(1281, 'B. Vermaning', 'Diego Moreno', '2020-06-15 12:08:13', 199, '82.75.120.166'),
(1282, 'B. Vermaning', 'Diego Moreno', '2020-06-15 12:09:10', 199, '82.75.120.166'),
(1283, 'B. Vermaning', 'Diego Moreno', '2020-06-15 12:09:10', 199, '82.75.120.166'),
(1284, 'B. Vermaning', 'Daniel Moreno', '2020-06-15 12:09:23', 124, '82.75.120.166'),
(1285, 'B. Vermaning', 'Daniel Moreno', '2020-06-15 12:09:50', 124, '82.75.120.166'),
(1286, 'B. Vermaning', 'Daniel Moreno', '2020-06-15 12:09:50', 124, '82.75.120.166'),
(1287, 'D. Bouwman', 'Ryan Rodevalk', '2020-06-15 13:18:05', 106, '31.201.13.167'),
(1288, 'J. Giellissen', 'Diego Moreno', '2020-06-15 13:28:16', 199, '212.120.114.152'),
(1289, 'K. Bouwman', 'Tobias De Vroed', '2020-06-15 14:02:11', 108, '145.132.244.161'),
(1290, 'D. Bouwman', 'Tobias De Vroed', '2020-06-15 14:03:44', 108, '31.201.13.167'),
(1291, 'D. Bouwman', 'Tobias De Vroed', '2020-06-15 14:04:07', 108, '31.201.13.167'),
(1292, 'J. Giellissen', 'Dimma Meyer ', '2020-06-15 14:30:59', 341, '212.120.114.152'),
(1293, 'J. Giellissen', 'Dimma Meyer ', '2020-06-15 14:32:26', 341, '212.120.114.152'),
(1294, 'J. Giellissen', 'Dimma Meyer ', '2020-06-15 14:32:44', 341, '212.120.114.152'),
(1295, 'J. Giellissen', 'Dimma Meyer ', '2020-06-15 14:33:47', 341, '212.120.114.152'),
(1296, 'K. Bouwman', 'Dimma Meyer ', '2020-06-15 14:35:02', 341, '145.132.244.161'),
(1297, 'K. Bouwman', 'Dimma Meyer ', '2020-06-15 14:36:03', 341, '145.132.244.161'),
(1298, 'K. Bouwman', 'Dimma Meyer ', '2020-06-15 14:36:37', 341, '145.132.244.161'),
(1299, 'D. Bouwman', 'Henk Hamburger', '2020-06-15 14:42:40', 132, '31.201.13.167'),
(1300, 'D. Bouwman', 'Dimma Meyer ', '2020-06-15 14:42:49', 341, '31.201.13.167'),
(1301, 'D. Bouwman', 'Dimma Meyer ', '2020-06-15 14:55:48', 341, '31.201.13.167'),
(1302, 'D. Bouwman', 'Dimma Meyer ', '2020-06-15 14:55:49', 341, '31.201.13.167'),
(1303, 'D. Bouwman', 'Dimma Meyer ', '2020-06-15 14:56:10', 341, '31.201.13.167'),
(1304, 'D. Bouwman', 'Dimma Meyer ', '2020-06-15 15:08:23', 341, '31.201.13.167'),
(1305, 'D. Bouwman', 'Dimma Meyer ', '2020-06-15 15:08:45', 341, '31.201.13.167'),
(1306, 'Y. Belt', 'Ryan Rodevalk', '2020-06-15 15:23:48', 106, '5.199.158.46'),
(1307, 'K. Hollander', 'Tobias De Vroed', '2020-06-15 15:25:44', 108, '188.206.96.24'),
(1308, 'J. Giellissen', 'Diego Moreno', '2020-06-15 15:41:49', 199, '212.120.114.152'),
(1309, 'K. Hollander', 'Appie Meijer', '2020-06-15 15:50:27', 327, '188.206.96.24'),
(1310, 'Mario Gonzales', 'Appie Meijer', '2020-06-15 16:20:14', 327, '82.171.121.61'),
(1311, 'K. Hollander', 'Appie Meijer', '2020-06-15 16:29:31', 327, '188.206.96.24'),
(1312, 'S. Wedding', 'Appie Meijer', '2020-06-15 16:29:39', 327, '84.25.224.156'),
(1313, 'Mario Gonzales', 'Appie Meijer', '2020-06-15 16:38:23', 327, '82.171.121.61'),
(1314, 'Mario Gonzales', 'Appie Meijer', '2020-06-15 16:38:46', 327, '82.171.121.61'),
(1315, 'Mario Gonzales', 'Dimma Meyer ', '2020-06-15 16:41:15', 341, '82.171.121.61'),
(1316, 'J. Giellissen', 'Appie Meijer', '2020-06-15 16:42:01', 327, '212.120.114.152'),
(1317, 'Mario Gonzales', 'Dimma Meyer ', '2020-06-15 16:42:32', 341, '82.171.121.61'),
(1318, 'K. Hollander', 'Kees Bouwman', '2020-06-15 16:47:00', 102, '188.206.96.24'),
(1319, 'K. Hollander', 'Kees Bouwman', '2020-06-15 16:55:05', 102, '188.206.96.24'),
(1320, 'S. Wedding', 'Appie Meijer', '2020-06-15 17:12:36', 327, '84.25.224.156'),
(1321, 'S. Wedding', 'Appie Meijer', '2020-06-15 17:15:22', 327, '84.25.224.156'),
(1322, 'S. Wedding', 'Appie Meijer', '2020-06-15 17:22:07', 327, '84.25.224.156'),
(1323, 'S. Wedding', 'Appie Meijer', '2020-06-15 17:23:58', 327, '84.25.224.156'),
(1324, 'S. Wedding', 'Appie Meijer', '2020-06-15 17:23:58', 327, '84.25.224.156'),
(1325, 'L. Bouwman', 'Inspecteur Henk Klaassen', '2020-06-15 17:32:37', 305, '89.220.185.99'),
(1326, 'Y. Sie', 'Dimma Meyer ', '2020-06-15 17:34:39', 341, '109.36.131.177'),
(1327, 'Y. Sie', 'Dimma Meyer ', '2020-06-15 17:35:49', 341, '109.36.131.177'),
(1328, 'Y. Sie', 'Dimma Meyer ', '2020-06-15 17:35:58', 341, '109.36.131.177'),
(1329, 'S. Wedding', 'Dimma Meyer ', '2020-06-15 17:48:09', 341, '84.25.224.156'),
(1330, 'S. Wedding', 'Dimma Meyer ', '2020-06-15 17:55:57', 341, '84.25.224.156'),
(1331, 'S. Wedding', 'Dimma Meyer ', '2020-06-15 17:55:57', 341, '84.25.224.156'),
(1332, 'S. Wedding', 'Dimma Meyer ', '2020-06-15 17:59:47', 341, '84.25.224.156'),
(1333, 'S. Wedding', 'Appie Meijer', '2020-06-15 18:05:08', 327, '84.25.224.156'),
(1334, 'L. Bouwman', 'Appie Meijer', '2020-06-15 18:15:41', 327, '89.220.185.99'),
(1335, 'B. Vermaning', 'Dimma Meyer ', '2020-06-15 18:18:18', 341, '82.75.120.166'),
(1336, 'L. Bouwman', 'Appie Meijer', '2020-06-15 18:19:13', 327, '89.220.185.99'),
(1337, 'L. Bouwman', 'Appie Meijer', '2020-06-15 18:19:39', 327, '89.220.185.99'),
(1338, 'L. Bouwman', 'Appie Meijer', '2020-06-15 18:19:39', 327, '89.220.185.99'),
(1339, 'Y. Sie', 'Karel Petersma', '2020-06-15 18:45:55', 186, '109.36.131.177'),
(1340, 'Y. Sie', ' ', '2020-06-15 18:52:19', 0, '109.36.131.177'),
(1341, 'Y. Sie', 'Karel Petersma', '2020-06-15 18:52:20', 186, '109.36.131.177'),
(1342, 'Y. Sie', 'Karel Petersma', '2020-06-15 18:54:55', 186, '109.36.131.177'),
(1343, 'Y. Sie', 'Karel Petersma', '2020-06-15 18:55:04', 186, '109.36.131.177'),
(1344, 'Y. Sie', 'Karel Petersma', '2020-06-15 18:55:16', 186, '109.36.131.177'),
(1345, 'Y. Sie', 'Karel Petersma', '2020-06-15 18:55:24', 186, '109.36.131.177'),
(1346, 'Y. Sie', 'Karel Petersma', '2020-06-15 18:55:36', 186, '109.36.131.177'),
(1347, 'Y. Sie', 'Karel Petersma', '2020-06-15 18:55:50', 186, '109.36.131.177'),
(1348, 'Y. Sie', 'Karel Petersma', '2020-06-15 18:56:09', 186, '109.36.131.177'),
(1349, 'Y. Sie', 'Karel Petersma', '2020-06-15 18:56:25', 186, '109.36.131.177'),
(1350, 'Y. Sie', 'Karel Petersma', '2020-06-15 18:57:10', 186, '109.36.131.177'),
(1351, 'Y. Sie', 'Karel Petersma', '2020-06-15 18:59:45', 186, '109.36.131.177'),
(1352, 'Y. Sie', 'Karel Petersma', '2020-06-15 18:59:45', 186, '109.36.131.177'),
(1353, 'Y. Belt', 'Tobias De Vroed', '2020-06-15 20:24:49', 108, '5.199.158.46'),
(1354, 'L. Bouwman', 'Fenna Visser', '2020-06-15 22:59:55', 288, '89.220.185.99'),
(1355, 'M. Tegelen', 'Paul De Paaier', '2020-06-15 23:18:31', 130, '84.25.211.35'),
(1356, 'M. Tegelen', 'Youri Sie', '2020-06-16 00:03:03', 194, '84.25.211.35'),
(1357, '', 'Appie Meijer', '2020-06-16 00:18:30', 327, '84.25.224.156'),
(1358, 'S. Wedding', 'Paul De Paaier', '2020-06-16 01:08:14', 130, '84.25.224.156'),
(1359, 'S. Wedding', 'Appie Meijer', '2020-06-16 01:08:45', 327, '84.25.224.156'),
(1360, '', 'Appie Meijer', '2020-06-16 01:57:03', 327, '84.25.224.156'),
(1361, 'SYSTEEM', ' ', '2020-06-16 07:37:28', 186, '86.89.195.36'),
(1362, 'SYSTEEM', 'Karel Petersma', '2020-06-16 07:37:48', 346, '86.89.195.36'),
(1363, 'SYSTEEM', 'Karel Petersma', '2020-06-16 07:38:12', 346, '86.89.195.36'),
(1364, 'SYSTEEM', 'Karel Petersma', '2020-06-16 07:38:12', 346, '86.89.195.36'),
(1365, 'SYSTEEM', ' ', '2020-06-16 07:38:18', 186, '86.89.195.36'),
(1366, 'SYSTEEM', ' ', '2020-06-16 07:38:21', 0, '86.89.195.36'),
(1367, 'SYSTEEM', ' ', '2020-06-16 07:38:21', 0, '86.89.195.36'),
(1368, 'SYSTEEM', 'Karel Petersma', '2020-06-16 07:38:33', 346, '86.89.195.36'),
(1369, 'SYSTEEM', 'Karel Petersma', '2020-06-16 07:38:46', 346, '86.89.195.36'),
(1370, 'SYSTEEM', 'Karel Petersma', '2020-06-16 09:26:52', 346, '86.89.195.36'),
(1371, 'Y. Belt', 'Tobias De Vroed', '2020-06-16 11:51:44', 108, '5.199.158.46'),
(1372, 'Y. Belt', 'Tobias De Vroed', '2020-06-16 11:51:58', 108, '5.199.158.46'),
(1373, '', 'Diego Moreno', '2020-06-16 12:53:30', 199, '212.120.114.152'),
(1374, 'J. Giellissen', 'Tobias De Vroed', '2020-06-16 13:25:24', 108, '212.120.114.152'),
(1375, 'J. Giellissen', 'Karel Petersma', '2020-06-16 13:26:59', 346, '212.120.114.152'),
(1376, 'S. Wedding', 'Sander Wedding', '2020-06-16 13:27:05', 322, '84.25.224.156'),
(1377, 'J. Giellissen', 'Karel Petersma', '2020-06-16 13:34:08', 346, '212.120.114.152'),
(1378, 'S. Wedding', 'Karel Petersma', '2020-06-16 13:34:29', 346, '84.25.224.156'),
(1379, 'Y. Sie', 'Peter Post', '2020-06-16 16:39:07', 314, '77.160.150.93'),
(1380, 'Y. Sie', 'Pieter Post', '2020-06-16 16:39:57', 312, '77.160.150.93'),
(1381, 'Y. Sie', 'Peter Post', '2020-06-16 16:45:49', 314, '77.160.150.93'),
(1382, 'Y. Sie', 'Peter Post', '2020-06-16 16:46:37', 314, '77.160.150.93'),
(1383, 'Y. Sie', 'Peter Post', '2020-06-16 16:46:44', 314, '77.160.150.93'),
(1384, '', 'Karel Petersma', '2020-06-16 18:23:33', 346, '212.120.114.152'),
(1385, 'Y. Sie', 'Peter Post', '2020-06-16 19:43:06', 314, '109.36.131.177'),
(1386, 'Y. Sie', 'Dimma Meyer ', '2020-06-16 19:51:39', 341, '109.36.131.177'),
(1387, 'J. Giellissen', 'Dimma Meyer ', '2020-06-16 19:51:44', 341, '212.120.114.152'),
(1388, 'S. Wedding', 'Dimma Meyer ', '2020-06-16 19:51:55', 341, '84.25.224.156'),
(1389, 'J. Giellissen', 'Dimma Meyer ', '2020-06-16 19:52:31', 341, '212.120.114.152'),
(1390, 'B. Vermaning', 'Sander Wedding', '2020-06-16 19:52:59', 322, '82.75.120.166'),
(1391, 'B. Vermaning', 'Youri Sie', '2020-06-16 19:53:07', 194, '82.75.120.166'),
(1392, 'B. Vermaning', 'Tommy Bright', '2020-06-16 19:53:14', 134, '82.75.120.166'),
(1393, 'B. Vermaning', 'Jante Gielissen', '2020-06-16 19:53:24', 209, '82.75.120.166'),
(1394, 'B. Vermaning', 'Karel Petersma', '2020-06-16 19:53:32', 346, '82.75.120.166'),
(1395, 'J. Giellissen', 'Dimma Meyer ', '2020-06-16 20:07:53', 341, '212.120.114.152'),
(1396, 'J. Giellissen', 'Dimma Meyer ', '2020-06-16 20:11:03', 341, '212.120.114.152'),
(1397, 'J. Giellissen', 'Dimma Meyer ', '2020-06-16 20:11:03', 341, '212.120.114.152'),
(1398, 'S. Wedding', 'Tobias De Vroed', '2020-06-16 20:33:28', 108, '84.25.224.156'),
(1399, 'B. Vermaning', 'Tobias De Vroed', '2020-06-16 20:35:19', 108, '82.75.120.166'),
(1400, 'S. Wedding', 'Tobias De Vroed', '2020-06-16 20:41:23', 108, '84.25.224.156'),
(1401, 'S. Wedding', 'Tobias De Vroed', '2020-06-16 20:41:23', 108, '84.25.224.156'),
(1402, 'S. Wedding', 'Tobias De Vroed', '2020-06-16 20:41:32', 108, '84.25.224.156'),
(1403, 'Y. Sie', 'Tobias De Vroed', '2020-06-16 20:43:41', 108, '109.36.131.177'),
(1404, 'Y. Belt', 'Peter Post', '2020-06-16 20:51:15', 314, '5.199.158.46'),
(1405, 'S. Wedding', 'Peter Post', '2020-06-16 21:03:28', 314, '84.25.224.156'),
(1406, 'S. Wedding', 'Fenna Visser', '2020-06-16 21:07:21', 288, '84.25.224.156'),
(1407, 'S. Wedding', 'Peter Post', '2020-06-16 21:09:57', 314, '84.25.224.156'),
(1408, 'S. Wedding', 'Peter Post', '2020-06-16 21:11:06', 314, '84.25.224.156'),
(1409, 'S. Wedding', 'Peter Post', '2020-06-16 21:11:06', 314, '84.25.224.156'),
(1410, 'K. Hollander', 'Jante Gielissen', '2020-06-16 21:23:13', 209, '81.204.193.154'),
(1411, 'Y. Sie', 'Peter Post', '2020-06-16 21:27:11', 314, '109.36.131.177'),
(1412, 'Y. Sie', 'Peter Post', '2020-06-16 21:27:21', 314, '109.36.131.177'),
(1413, 'B. Vermaning', 'Peter Post', '2020-06-16 22:00:41', 314, '82.75.120.166'),
(1414, 'B. Vermaning', 'Peter Post', '2020-06-16 22:01:51', 314, '82.75.120.166'),
(1415, 'B. Vermaning', 'Peter Post', '2020-06-16 22:02:37', 314, '82.75.120.166'),
(1416, 'B. Vermaning', 'Peter Post', '2020-06-16 22:02:37', 314, '82.75.120.166'),
(1417, 'B. Vermaning', 'Peter Post', '2020-06-16 22:03:42', 314, '82.75.120.166'),
(1418, 'L. Jansen', 'Karel Petersma', '2020-06-16 23:51:05', 346, '143.179.7.197'),
(1419, 'L. Jansen', 'Lars Jansen', '2020-06-16 23:51:32', 128, '143.179.7.197'),
(1420, 'L. Jansen', 'Lars Jansen', '2020-06-16 23:53:23', 128, '143.179.7.197'),
(1421, 'D. Bouwman', 'Karel Petersma', '2020-06-17 00:42:05', 346, '31.201.13.167'),
(1422, 'SYSTEEM', 'Lars Jansen', '2020-06-17 13:06:51', 128, '86.89.195.36'),
(1423, 'SYSTEEM', 'Lars Jansen', '2020-06-17 13:07:12', 128, '86.89.195.36'),
(1424, 'Y. Belt', 'Karel Petersma', '2020-06-17 15:24:55', 346, '5.199.158.46'),
(1425, 'L. Jansen', 'Diego Moreno', '2020-06-17 16:53:48', 199, '84.82.14.94'),
(1426, 'L. Jansen', 'Diego Moreno', '2020-06-17 17:02:10', 199, '84.82.14.94'),
(1427, 'L. Jansen', 'Daniel Moreno', '2020-06-17 17:02:18', 124, '84.82.14.94'),
(1428, 'L. Jansen', 'Johnny Volkenwaard', '2020-06-17 17:26:40', 294, '84.82.14.94'),
(1429, 'L. Jansen', 'Paul De Paaier', '2020-06-17 17:51:08', 130, '84.82.14.94'),
(1430, 'L. Jansen', 'Diego Moreno', '2020-06-17 17:55:30', 199, '84.82.14.94'),
(1431, 'D. Bouwman', 'Lars Jansen', '2020-06-17 18:15:16', 128, '31.201.13.167'),
(1432, 'L. Jansen', 'Diego Moreno', '2020-06-17 18:15:36', 199, '84.82.14.94'),
(1433, 'L. Jansen', 'Karel Petersma', '2020-06-17 18:16:15', 346, '84.82.14.94'),
(1434, 'L. Jansen', 'Kees Bouwman', '2020-06-17 18:16:23', 102, '84.82.14.94'),
(1435, 'Y. Sie', 'Fenna Visser', '2020-06-17 18:24:40', 288, '77.160.150.93'),
(1436, 'L. Jansen', 'Michiel Zwinkels', '2020-06-17 18:42:32', 128, '84.82.14.94'),
(1437, 'Y. Sie', 'Youri Sie', '2020-06-17 18:45:30', 194, '77.160.150.93'),
(1438, 'Y. Sie', 'Jason Bright', '2020-06-17 18:45:43', 86, '77.160.150.93'),
(1439, 'L. Jansen', ' ', '2020-06-17 19:09:08', 128, '84.82.14.94'),
(1440, 'L. Jansen', 'Michiel Zwinkels', '2020-06-17 19:10:31', 345357, '84.82.14.94'),
(1441, 'L. Jansen', 'Karel Petersma', '2020-06-17 22:41:35', 346, '84.82.14.94'),
(1442, 'L. Jansen', ' ', '2020-06-17 22:41:54', 128, '84.82.14.94'),
(1443, 'L. Jansen', 'Gerard Wessel', '2020-06-17 22:42:32', 225, '84.82.14.94'),
(1444, 'L. Jansen', 'Lars Jansen', '2020-06-17 23:18:05', 345357, '84.82.14.94'),
(1445, 'D. Bouwman', 'Lars Jansen', '2020-06-17 23:24:10', 345357, '31.201.13.167'),
(1446, 'SYSTEEM', 'Daniel Moreno', '2020-06-18 11:05:14', 124, '86.89.195.36'),
(1447, 'SYSTEEM', 'Frits Jorritsma', '2020-06-18 12:09:05', 90, '86.89.195.36'),
(1448, 'D. Bouwman', 'Frits Jorritsma', '2020-06-18 12:58:33', 90, '31.201.13.167'),
(1449, 'L. Jansen', 'Karel Petersma', '2020-06-18 13:13:23', 346, '84.82.14.94'),
(1450, 'L. Jansen', 'Frits Jorritsma', '2020-06-18 13:14:43', 90, '84.82.14.94'),
(1451, 'Sjaak Soldaat', 'Sjaak Soldaat', '2020-06-18 16:20:59', 114, '83.84.194.25'),
(1452, 'L. Jansen', 'Karel Petersma', '2020-06-18 21:48:46', 346, '84.82.14.94'),
(1453, 'SYSTEEM', 'Dimma Meyer ', '2020-06-20 21:15:06', 341, '143.179.15.79'),
(1454, 'Y. Sie', 'Daniel Moreno', '2020-06-20 21:28:57', 124, '77.160.150.93'),
(1455, 'Y. Sie', 'Daniel Moreno', '2020-06-20 21:29:45', 124, '77.160.150.93'),
(1456, 'Y. Sie', 'Karel Petersma', '2020-06-20 21:45:20', 346, '77.160.150.93'),
(1457, 'Y. Sie', ' ', '2020-06-20 21:54:00', 0, '77.160.150.93'),
(1458, 'Y. Sie', 'Karel Petersma', '2020-06-20 21:54:00', 346, '77.160.150.93'),
(1459, 'L. Bouwman', 'Karel Petersma', '2020-06-20 21:54:05', 346, '89.220.185.99'),
(1460, 'L. Bouwman', 'Karel Petersma', '2020-06-20 21:54:14', 346, '89.220.185.99'),
(1461, 'Y. Sie', 'Karel Petersma', '2020-06-20 21:54:32', 346, '77.160.150.93'),
(1462, 'Y. Sie', 'Karel Petersma', '2020-06-20 21:55:23', 346, '77.160.150.93'),
(1463, 'Y. Sie', 'Karel Petersma', '2020-06-20 21:55:51', 346, '77.160.150.93'),
(1464, 'L. Bouwman', 'Karel Petersma', '2020-06-20 22:00:59', 346, '89.220.185.99'),
(1465, 'L. Jansen', 'Karel Petersma', '2020-06-20 22:04:09', 346, '84.82.14.94'),
(1466, 'Y. Sie', 'Karel Petersma', '2020-06-20 22:07:10', 346, '77.160.150.93'),
(1467, 'Y. Sie', 'Karel Petersma', '2020-06-20 22:07:10', 346, '77.160.150.93'),
(1468, 'L. Jansen', 'Karel Petersma', '2020-06-20 22:07:17', 346, '84.82.14.94'),
(1469, 'SYSTEEM', 'Karel Petersma', '2020-06-20 22:07:25', 346, '86.89.195.36'),
(1470, 'SYSTEEM', 'Karel Petersma', '2020-06-20 22:22:53', 346, '86.89.195.36'),
(1471, 'Y. Sie', 'Diego Moreno', '2020-06-20 22:25:47', 199, '77.160.150.93'),
(1472, 'L. Bouwman', 'Daniel Moreno', '2020-06-20 22:31:20', 124, '89.220.185.99'),
(1473, 'L. Jansen', 'Diego Moreno', '2020-06-20 22:37:12', 199, '84.82.14.94'),
(1474, 'L. Jansen', 'Diego Moreno', '2020-06-20 23:06:39', 199, '84.82.14.94'),
(1475, 'L. Jansen', 'Diego Moreno', '2020-06-20 23:30:46', 199, '84.82.14.94'),
(1476, 'L. Jansen', 'Diego Moreno', '2020-06-20 23:30:46', 199, '84.82.14.94'),
(1477, 'SYSTEEM', 'Karel Petersma', '2020-06-20 23:52:36', 346, '86.89.195.36'),
(1478, 'SYSTEEM', 'Karel Petersma', '2020-06-20 23:52:44', 346, '86.89.195.36'),
(1479, 'L. Jansen', 'Diego Moreno', '2020-06-21 00:01:28', 199, '84.82.14.94'),
(1480, 'L. Jansen', 'Diego Moreno', '2020-06-21 00:19:45', 199, '84.82.14.94'),
(1481, 'L. Jansen', 'Diego Moreno', '2020-06-21 00:19:58', 199, '84.82.14.94'),
(1482, '', 'Diego Moreno', '2020-06-21 00:34:09', 199, '77.160.150.93'),
(1483, '', 'Jason Bright', '2020-06-21 00:45:20', 86, '77.160.150.93'),
(1484, 'L. Jansen', 'Lars Jansen', '2020-06-21 18:13:29', 345357, '84.82.14.94'),
(1485, 'L. Jansen', 'Lars Jansen', '2020-06-21 18:13:41', 345357, '84.82.14.94'),
(1486, 'L. Jansen', ' ', '2020-06-21 18:13:44', 572, '84.82.14.94'),
(1487, 'L. Jansen', 'Lars Jansen', '2020-06-21 18:13:45', 345357, '84.82.14.94'),
(1488, 'L. Jansen', 'Lars Jansen', '2020-06-21 18:13:58', 345357, '84.82.14.94'),
(1489, 'L. Jansen', 'Lars Jansen', '2020-06-21 18:13:59', 345357, '84.82.14.94'),
(1490, 'L. Jansen', ' ', '2020-06-21 18:14:02', 0, '84.82.14.94'),
(1491, 'L. Jansen', 'Lars Jansen', '2020-06-21 18:14:02', 345357, '84.82.14.94'),
(1492, 'L. Jansen', 'Kees Bouwman', '2020-06-21 18:57:15', 102, '84.82.14.94'),
(1493, 'L. Jansen', 'Youri Sie', '2020-06-21 20:40:23', 194, '84.82.14.94'),
(1494, 'L. Jansen', 'Lars Jansen', '2020-06-21 20:40:46', 345357, '84.82.14.94'),
(1495, 'Y. Sie', 'Youri Sie', '2020-06-21 20:41:10', 194, '109.38.130.139'),
(1496, 'L. Jansen', 'Youri Sie', '2020-06-21 20:41:20', 194, '84.82.14.94'),
(1497, 'L. Jansen', 'Youri Sie', '2020-06-21 20:41:31', 194, '84.82.14.94'),
(1498, 'L. Jansen', 'Youri Sie', '2020-06-21 20:41:35', 194, '84.82.14.94'),
(1499, 'L. Jansen', 'Karel Petersma', '2020-06-21 20:41:49', 346, '84.82.14.94'),
(1500, 'L. Jansen', 'Inspecteur Henk Klaassen', '2020-06-21 20:42:47', 305, '84.82.14.94'),
(1501, 'L. Jansen', 'Bratlie Jansen', '2020-06-21 20:42:59', 272, '84.82.14.94'),
(1502, 'L. Jansen', 'Frits Jorritsma', '2020-06-21 20:43:00', 90, '84.82.14.94'),
(1503, 'L. Jansen', 'Christopher Haywood', '2020-06-21 20:43:19', 215, '84.82.14.94'),
(1504, 'L. Jansen', 'Barrie  Butsers', '2020-06-21 20:43:27', 92, '84.82.14.94'),
(1505, '', 'Youri Sie', '2020-06-21 21:03:56', 194, '109.38.130.139'),
(1506, 'L. Jansen', 'Michiel Peterse', '2020-06-23 14:24:00', 345357, '84.82.14.94'),
(1507, 'L. Jansen', 'Michiel Peterse', '2020-06-23 14:24:05', 345357, '84.82.14.94'),
(1508, 'L. Jansen', 'Michiel Peterse', '2020-06-24 19:08:29', 345357, '143.179.93.207'),
(1509, 'S. Wedding', 'Sander Wedding', '2020-06-28 16:49:31', 322, '84.25.224.156'),
(1510, 'L. Jansen', 'Sander Wedding', '2020-06-29 22:51:01', 322, '143.179.103.53'),
(1511, 'L. Bouwman', 'Dimma Meyer ', '2020-07-21 00:47:55', 341, '89.220.185.99'),
(1512, 'L. Bouwman', 'Sander Wedding', '2020-07-21 00:48:58', 322, '89.220.185.99'),
(1513, 'L. Bouwman', 'Sander Wedding', '2020-07-21 00:49:04', 322, '89.220.185.99'),
(1514, 'L. Jansen', 'Fenna Visser', '2020-07-21 19:13:16', 288, '84.241.192.133'),
(1515, 'L. Jansen', 'Fenna Visser', '2020-07-21 19:13:43', 288, '84.241.192.133'),
(1516, 'L. Jansen', 'Fenna Visser', '2020-07-21 19:13:49', 288, '84.241.192.133'),
(1517, 'L. Jansen', 'Fenna Visser', '2020-07-21 19:14:01', 288, '84.241.192.133'),
(1518, 'L. Jansen', 'Fenna Visser', '2020-07-21 19:14:27', 288, '84.241.192.133'),
(1519, 'L. Jansen', 'Fenna Visser', '2020-07-21 19:14:27', 288, '84.241.192.133'),
(1520, 'L. Jansen', 'Sander Wedding', '2020-07-21 19:14:51', 322, '84.241.192.133'),
(1521, 'S. Wedding', 'Sander Wedding', '2020-07-23 19:00:06', 322, '212.241.56.227');

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

--
-- Gegevens worden geëxporteerd voor tabel `rdwlog`
--

INSERT INTO `rdwlog` (`id`, `voertuigid`, `reason`, `plate`, `action`, `ip`, `user`, `date`) VALUES
(1, 0, NULL, NULL, 'afkeuren', '81.165.114.148', 189, '2020-04-04 20:11:07'),
(2, 13, NULL, NULL, 'afkeuren', '81.204.193.154', 15, '2020-04-04 20:18:32'),
(3, 13, NULL, NULL, 'goedkeuren', '81.204.193.154', 15, '2020-04-04 20:18:50'),
(4, 13, NULL, NULL, 'afkeuren', '81.204.193.154', 15, '2020-04-04 20:18:59'),
(5, 13, NULL, NULL, 'goedkeuren', '81.204.193.154', 15, '2020-04-04 20:20:06'),
(6, 5, NULL, NULL, 'afkeuren', '81.204.193.154', 15, '2020-04-05 16:54:07'),
(7, 5, NULL, NULL, 'goedkeuren', '82.75.120.166', 194, '2020-04-09 13:53:57'),
(8, 37, NULL, NULL, 'afkeuren', '84.82.14.94', 207, '2020-05-20 16:40:46'),
(9, 37, NULL, NULL, 'goedkeuren', '84.82.14.94', 207, '2020-05-20 16:40:56'),
(10, 57, NULL, NULL, 'afkeuren', '89.220.185.99', 229, '2020-06-08 01:22:28'),
(11, 57, NULL, NULL, 'goedkeuren', '31.201.13.167', 196, '2020-06-08 18:53:15'),
(12, 61, NULL, NULL, 'afkeuren', '89.220.185.99', 229, '2020-06-11 14:30:31'),
(13, 49, NULL, NULL, 'afkeuren', '109.36.131.177', 239, '2020-06-15 18:52:53'),
(14, 78, NULL, NULL, 'afkeuren', '84.241.192.133', 226, '2020-07-21 19:13:34');

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

INSERT INTO `rdwwok` (`id`, `voertuigid`, `date`, `reason`) VALUES
(3, 61, '2020-06-11 14:30:31', 'Voertuig heeft geen kenteken plaat.'),
(4, 49, '2020-06-15 18:52:53', 'Voertuig is in beslag genomen. Ter waarheidsvinding, verdachte is erna echter weggevlucht. '),
(5, 78, '2020-07-21 19:13:34', '.');

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
(1, 'admin', '$2y$10$4YbMjrQfZGvwdc2/f7x18.QlaGT1KYnrvfLDffoY3N/aDWIlTtI/K', 'active', 'admin', 'admin', 'SYSTEEM', '', '20-06-2020', NULL, '', 1, 1, NULL, '0', NULL),
(15, 'khollander', '$2y$10$4YbMjrQfZGvwdc2/f7x18.QlaGT1KYnrvfLDffoY3N/aDWIlTtI/K', 'active', 'admin', 'Agent', 'K. Hollander', '', '30-07-2020', '', '5d064f4713a2e', 1, 1, NULL, '1', '1550864052627xR3TLmKW4InpMyeQzeFxhclKp492GciZ'),
(192, 'tobiasv', '$2y$10$2dtCqraWWSv2EGuEObc9K.RJhGpGaimGe4UhXk2LGSt7JavrYTgq6', 'inactive', 'admin', '1e Hoofd Commissaris', 'T. de Vroed', '', '07-06-2020', NULL, NULL, 1, 1, NULL, '0', NULL),
(196, 'damians', '$2y$10$WpwO5itNVAH1t2Cikn78WO.a1Eq2tIbE5uYNtGq4tN8N0GHRufFj2', 'active', 'admin', '1e Hoofd Commissaris', 'D. Bouwman', NULL, '18-06-2020', NULL, NULL, 1, 0, NULL, '0', NULL),
(224, 'marktegelen', '$2y$10$sJc4mRO.LFw7Z/YyTo4ewuDaKrcQZenkHcjuuQRZPdY123f5PZejO', 'inactive', 'user', 'Commissaris', 'M. Tegelen', NULL, '16-06-2020', NULL, NULL, 1, 0, NULL, '0', NULL),
(225, 'bjornvermaning', '$2y$10$r6AGen/GEWawyDgJ3N6cy.iNlW1Fbe6DYBaixnDhl2KI00WNjRY5W', 'active', 'user', 'Commissaris', 'B. Vermaning', NULL, '16-06-2020', NULL, NULL, 0, 0, NULL, '0', NULL),
(226, 'larsjansen', '$2y$10$beJCCoW8BQZScTnXO3MFr./KxoV0N.3d4pgKNVEI4f8Mvt3Zfx95G', 'active', 'admin', 'Aspirant', 'L. Jansen', NULL, '21-07-2020', NULL, '5edf9278e8a35', 0, 0, NULL, '0', NULL),
(227, 'yourisie', '$2y$10$RguzYxl8afpNl.DK.aXGp.8zuVtAvgkv4us1LzUPrJbyqqde4Dtr2', 'inactive', 'user', '1e Hoofd Commissaris', 'Y. Sie', NULL, '12-06-2020', NULL, NULL, 0, 0, NULL, '0', NULL),
(228, 'keesbouwman', '$2y$10$3OK1NJ4Do8INK2UL0dqxremzzeLw36wrrH6ODUmqthFxV6ba0EhAG', 'inactive', 'user', 'Commissaris', 'K. Bouwman', NULL, '15-06-2020', NULL, NULL, 0, 0, NULL, '0', NULL),
(229, 'lucbouwman', '$2y$10$ZiOTdJ8T3iFcXKjd77h6puwxb/rOmi5rv2sJm58fi4dvhxi3RmcN2', 'active', 'user', 'Surveillant', 'L. Bouwman', NULL, '21-07-2020', NULL, NULL, 0, 0, NULL, '0', NULL),
(230, 'yoekbelt', '$2y$10$XS9lO6LrKvdwakOG.UmsGuWFu6ja7S9PHi3a2LJMDECSutLud1uKq', 'active', 'user', 'Agent', 'Y. Belt', NULL, '17-06-2020', NULL, NULL, 0, 0, NULL, '0', NULL),
(231, 'mariogonzales', '$2y$10$PRXS/oXCwcRlErO8suCnmeM9ti2BaBy7Y9pHWL3XOw1pmEpBZQyV6', 'active', 'user', 'Surveillant', 'M. Gonzales', NULL, '08-06-2020', NULL, NULL, 0, 0, NULL, '0', NULL),
(232, 'abamischijf', '$2y$10$SfPLIGecwr6PGVwTpleCFO8X9R2vyCo3ZEJ.98rXGLWOshbI5y6iS', 'inactive', 'user', 'Hoofd Agent', 'Ahmed Bamischijf', NULL, '16-06-2020', NULL, NULL, 0, 0, NULL, '0', NULL),
(233, 'maxbouwman', '$2y$10$Z4nL3.jeFMpC2flYlgc9ZOKHRERFmGXIscp0J.mfTc1c/qd9ZDIZa', 'active', 'user', 'Inspecteur', 'M. Bouwman', NULL, '11-06-2020', NULL, NULL, 0, 0, NULL, '0', NULL),
(234, 'henkkooikarper', '$2y$10$a24LXOMBJ8.OTAImlAQ2VOFzb84vq/mHr3yYzZUS9d96P/m2CpICq', 'active', 'user', 'Surveillant', 'H. Kooikarper', NULL, '14-06-2020', NULL, NULL, 0, 0, NULL, '0', NULL),
(235, 'jantegiellissen', '$2y$10$jcEDn6fGGMv.voTvkqiBleI2ePVY1CfpGQ2HL3Tpq75K1TDi7t6Ie', 'active', 'user', 'Aspirant', 'J. Giellissen', NULL, '16-06-2020', NULL, NULL, 0, 0, NULL, '0', NULL),
(239, 'yourisie1', '$2y$10$LASwr4Q0UbyJG3tVWcD3zuAh0Mt7f88teI7sF8gV7QKWGoh4xIfca', 'active', 'admin', '1e Hoofd Commissaris', 'Y. Sie', NULL, '21-06-2020', NULL, NULL, 0, 0, NULL, '0', NULL),
(240, 'sanderwedding', '$2y$10$L2Vd/h4tmbQwJXQhxVeF6.3QSUo3f88wL3kIQVYdtRuqGfKUC38ne', 'active', 'user', 'Aspirant', 'S. Wedding', NULL, '23-07-2020', NULL, NULL, 0, 0, NULL, '0', NULL),
(241, 'mgonzales', '$2y$10$HAMlT0TeaDQfoMNc2mfKSuRRI7Wr2AZXNuzTKL/twFjn.JckQucFq', 'active', 'user', 'Brigadier', 'Mario Gonzales', NULL, '15-06-2020', NULL, NULL, 0, 0, NULL, '0', NULL),
(242, 'ssoldaat', '$2y$10$fRomi9kdTzwm0Os.pa7IjOtU0KZmFHEH0Z3Kb1eur9hjVElVA.0Zq', 'inactive', 'user', 'Surveillant', 'Sjaak Soldaat', NULL, '18-06-2020', NULL, NULL, 0, 0, NULL, '0', NULL),
(243, 'boyke', '$2y$10$wHvMAHOjFg7PG4/y7W8AiOMUP0jV1aJ6UQjWPPPGdjGXUN4WT8cMm', 'active', 'admin', 'Aspirant', 'boyke', NULL, '30-07-2020', NULL, NULL, 0, 0, NULL, '0', NULL);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `aangifte`
--
ALTER TABLE `aangifte`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT voor een tabel `anotitie`
--
ALTER TABLE `anotitie`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT voor een tabel `app_activations`
--
ALTER TABLE `app_activations`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `beslaglog`
--
ALTER TABLE `beslaglog`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `cjib`
--
ALTER TABLE `cjib`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `huiszoekinglog`
--
ALTER TABLE `huiszoekinglog`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT voor een tabel `i8`
--
ALTER TABLE `i8`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT voor een tabel `informatie`
--
ALTER TABLE `informatie`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT voor een tabel `invorderlog`
--
ALTER TABLE `invorderlog`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT voor een tabel `kladblok`
--
ALTER TABLE `kladblok`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT voor een tabel `livelog`
--
ALTER TABLE `livelog`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1522;

--
-- AUTO_INCREMENT voor een tabel `pagevisitlog`
--
ALTER TABLE `pagevisitlog`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `rdwlog`
--
ALTER TABLE `rdwlog`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT voor een tabel `rdwwok`
--
ALTER TABLE `rdwwok`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT voor een tabel `recherche`
--
ALTER TABLE `recherche`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `specialisaties`
--
ALTER TABLE `specialisaties`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

--
-- AUTO_INCREMENT voor een tabel `specialisatie_aanmeldingen`
--
ALTER TABLE `specialisatie_aanmeldingen`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT voor een tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=244;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
