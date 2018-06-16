-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Creato il: Giu 16, 2018 alle 15:15
-- Versione del server: 5.7.19
-- Versione PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `courseweb`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi`
--

DROP TABLE IF EXISTS `corsi`;
CREATE TABLE IF NOT EXISTS `corsi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codice` varchar(250) NOT NULL,
  `anno` varchar(250) NOT NULL,
  `nome` text NOT NULL,
  `SSD` text NOT NULL,
  `semestre` int(11) NOT NULL,
  `lingua` text NOT NULL,
  `link_homepage` text NOT NULL,
  `link_risorse` text NOT NULL,
  `link_forum` text NOT NULL,
  PRIMARY KEY (`id`,`codice`,`anno`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `corsi`
--

INSERT INTO `corsi` (`id`, `codice`, `anno`, `nome`, `SSD`, `semestre`, `lingua`, `link_homepage`, `link_risorse`, `link_forum`) VALUES
(41, 'DT0004', '2017/2018', 'LINGUA INGLESE B1', 'MAT/05', 1, 'inglese', '', '', ''),
(40, 'DT0002', '2016/2017', 'ANALISI MATEMATICA', 'MAT/05', 1, 'italiano', '', '', ''),
(39, 'DT0002', '2017/2018', 'ANALISI MATEMATICA', 'MAT/05', 1, 'italiano', 'bbbbbbbbbbbbbbb', 'dsdsavdsavdsavdsa', 'fvdvfdabfsafsafsabfavfdsbfdsbfs'),
(38, 'F0132', '2017/2018', 'ALGORITMI E STRUTTURE DATI CON LABORATORIO', 'INF/01', 2, 'italiano', '', '', ''),
(37, 'F0131', '2017/2018', 'ALGORITMI E STRUTTURE DATI', 'INF/01', 1, 'italiano', 'AAA', 'AAAAAA', 'AAAAAAAAA'),
(36, 'F0130', '2017/2018', 'ALGORITMI E STRUTTURE DATI CON LABORATORIO', 'INF/01', 1, 'italiano', 'AAA', 'AAAA', 'AAAAAA');

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi_corsi_laurea`
--

DROP TABLE IF EXISTS `corsi_corsi_laurea`;
CREATE TABLE IF NOT EXISTS `corsi_corsi_laurea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_corso_laurea` int(11) NOT NULL,
  `id_corso` int(11) NOT NULL,
  `numero_cfu` int(11) NOT NULL,
  `tipo_cfu` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `corsi_corsi_laurea`
--

INSERT INTO `corsi_corsi_laurea` (`id`, `id_corso_laurea`, `id_corso`, `numero_cfu`, `tipo_cfu`) VALUES
(9, 1, 39, 9, 'A'),
(6, 1, 41, 3, 'D');

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi_corsi_mutuati`
--

DROP TABLE IF EXISTS `corsi_corsi_mutuati`;
CREATE TABLE IF NOT EXISTS `corsi_corsi_mutuati` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_corso` int(11) NOT NULL,
  `id_corso_mutuato` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `corsi_corsi_mutuati`
--

INSERT INTO `corsi_corsi_mutuati` (`id`, `id_corso`, `id_corso_mutuato`) VALUES
(3, 39, 41);

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi_corsi_propedeutici`
--

DROP TABLE IF EXISTS `corsi_corsi_propedeutici`;
CREATE TABLE IF NOT EXISTS `corsi_corsi_propedeutici` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_corso` int(11) NOT NULL,
  `id_corso_propedeutico` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi_docenti`
--

DROP TABLE IF EXISTS `corsi_docenti`;
CREATE TABLE IF NOT EXISTS `corsi_docenti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_corso` int(11) NOT NULL,
  `id_docente` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi_laurea`
--

DROP TABLE IF EXISTS `corsi_laurea`;
CREATE TABLE IF NOT EXISTS `corsi_laurea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `corsi_laurea`
--

INSERT INTO `corsi_laurea` (`id`, `nome`) VALUES
(1, 'Informatica'),
(2, 'Matematica');

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi_libri_testo`
--

DROP TABLE IF EXISTS `corsi_libri_testo`;
CREATE TABLE IF NOT EXISTS `corsi_libri_testo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_corso` int(11) NOT NULL,
  `id_libro_testo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi_materiali`
--

DROP TABLE IF EXISTS `corsi_materiali`;
CREATE TABLE IF NOT EXISTS `corsi_materiali` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_corso` int(11) NOT NULL,
  `id_materiale` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi_moduli`
--

DROP TABLE IF EXISTS `corsi_moduli`;
CREATE TABLE IF NOT EXISTS `corsi_moduli` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_corso_integrato` int(11) NOT NULL,
  `id_modulo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `info_corsi`
--

DROP TABLE IF EXISTS `info_corsi`;
CREATE TABLE IF NOT EXISTS `info_corsi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prerequisiti` text NOT NULL,
  `obiettivi` text NOT NULL,
  `mod_esame` text NOT NULL,
  `mod_insegnamento` text NOT NULL,
  `descrittori_dublino` text NOT NULL,
  `sillabo` text NOT NULL,
  `note` text NOT NULL,
  `lang` text NOT NULL,
  `id_corso` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `info_corsi`
--

INSERT INTO `info_corsi` (`id`, `prerequisiti`, `obiettivi`, `mod_esame`, `mod_insegnamento`, `descrittori_dublino`, `sillabo`, `note`, `lang`, `id_corso`) VALUES
(78, ' ', ' ', ' ', ' ', '', ' ', ' ', 'eng', 41),
(77, ' ', ' ', ' ', ' ', '', ' ', ' ', 'ita', 41),
(76, ' ', ' ', ' ', ' ', '', ' ', ' ', 'eng', 40),
(75, ' ', ' ', ' ', ' ', '', ' ', ' ', 'ita', 40),
(74, ' ', ' AA', ' ', ' ', '', ' ', ' ', 'eng', 39),
(73, ' ', ' ', ' ', ' ', '', ' ', ' ', 'ita', 39),
(72, ' ', ' ', ' ', ' ', '', ' ', ' ', 'eng', 38),
(71, ' AA', ' ', ' ', ' ', '', ' ', ' ', 'ita', 38),
(70, ' ', ' ', ' ', ' ', '', ' ', ' ', 'eng', 37),
(69, ' ', ' ', ' ', ' ', '', ' ', ' ', 'ita', 37),
(68, ' AAAAAAAAAAAAAAAAAAAAAA', ' AAAAAAAAAAAAAAAAA', ' AAAAAAAAAA', ' AAAAAAAAAAAA', 'AAAAAAAAAAAAAAAAAAAAA', ' AAAAAAAAAAAAAAAAAAA', ' AAAAAAAAAAAAAAAAAA', 'eng', 36),
(67, ' aaaaaaaaaa', ' aaaaaaaaaaaaaaaa', ' aaaaaaaaaaaaaaaaaaaaaaa', ' aaaaaaaaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', ' aaaaaaaaaaaaaaaaaaaaaaa', ' aaaaaaaaaaaaaaaaa', 'ita', 36);

-- --------------------------------------------------------

--
-- Struttura della tabella `libri_testo`
--

DROP TABLE IF EXISTS `libri_testo`;
CREATE TABLE IF NOT EXISTS `libri_testo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `autore` text NOT NULL,
  `titolo` text NOT NULL,
  `volume` text NOT NULL,
  `anno` text NOT NULL,
  `editore` text NOT NULL,
  `link` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messaggio` text NOT NULL,
  `timestamp` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `materiali`
--

DROP TABLE IF EXISTS `materiali`;
CREATE TABLE IF NOT EXISTS `materiali` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` text NOT NULL,
  `descrizione` text NOT NULL,
  `dimensione` bigint(20) NOT NULL,
  `percorso` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

DROP TABLE IF EXISTS `utenti`;
CREATE TABLE IF NOT EXISTS `utenti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `tipo_utente` text NOT NULL,
  `nome` text NOT NULL,
  `cognome` text NOT NULL,
  PRIMARY KEY (`id`,`email`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`id`, `email`, `password`, `tipo_utente`, `nome`, `cognome`) VALUES
(1, 'a@a', 'cc175b9c0f1b6a831c399e269772661', 'amministratore', 'a', 'a		'),
(2, 'b@b', '92eb5ffee6ae2fec3ad71c777531578f', 'docente', 'b', 'b		');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
