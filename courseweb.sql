-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Creato il: Mag 30, 2018 alle 17:19
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
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `corsi`
--

INSERT INTO `corsi` (`id`, `codice`, `anno`, `nome`, `SSD`, `semestre`, `lingua`, `link_homepage`, `link_risorse`, `link_forum`) VALUES
(1, 'DT0002', '2017/2018', 'ANALISI MATEMATICA', 'MAT/05', 1, 'italiano', '', '', ''),
(2, 'F1I005', '2017/2018', 'ARCHITETTURA DEGLI ELABORATORI', 'INF/01', 1, 'italiano', '', '', ''),
(3, 'F0131', '2017/2018', '[modulo] ALGORITMI E STRUTTURE DATI', 'INF/01', 1, 'italiano', '', '', ''),
(4, 'F0132', '2017/2018', '[modulo] LABORATORIO DI ALGORITMI E STRUTTURE DATI', 'INF/01', 1, 'italiano', '', '', ''),
(5, 'F0137', '2017/2018', '[modulo] BASI DI DATI', 'INF/01', 2, 'italiano', '', '', ''),
(6, 'F0138', '2017/2018', '[modulo] BASI DI DATI CON LABORATORIO', 'INF/01', 2, 'italiano', '', '', ''),
(7, 'I0323', '2017/2018', 'COMBINATORIA E CRITTOGRAFIA', 'INF/01', 2, 'italiano', '', '', ''),
(8, 'DT0003', '2017/2018', 'CALCOLO DELLE PROBABILITA\' E STATISTICA MATEMATICA', 'MAT/06', 1, 'italiano', '', '', ''),
(9, 'F0633', '2017/2018', 'LINGUA INGLESE B1', 'L-LIN/12', 2, 'inglese', '', '', ''),
(10, 'F0143', '2017/2018', 'FISICA', 'FIS/02', 2, 'italiano', '', '', ''),
(11, 'F0050', '2017/2018', 'LABORATORIO DI PROGRAMMAZIONE I', 'INF/01', 1, 'italiano', '', '', ''),
(12, 'F0050', '2017/2018', 'FONDAMENTI DI PROGRAMMAZIONE', 'INF/01', 1, 'italiano', '', '', ''),
(13, 'F1I018', '2017/2018', 'INGEGNERIA DEL SOFTWARE', 'INF/01', 1, 'italiano', '', '', ''),
(14, 'F1I010', '2017/2018', 'LABORATORIO DI ARCHITETTURA DEGLI ELABORATORI', 'INF/01', 2, 'italiano', '', '', ''),
(15, 'F0151', '2017/2018', 'LINGUAGGI DI PROGRAMMAZIONE E COMPILATOTORI', 'INF/01', 1, 'italiano', '', '', ''),
(16, 'DT0096', '2017/2018', 'MATEMATICA DI BASE', 'MAT/01', 1, 'italiano', '', '', ''),
(17, 'F0123', '2017/2018', 'MATEMATICA DISCRETA I', 'MAT/02-03', 2, 'italiano', '', '', ''),
(18, 'F0123', '2017/2018', 'MATEMATICA DISCRETA II', 'MAT/02-03', 2, 'italiano', '', '', ''),
(19, 'DT0208', '2017/2018', 'OBJECT-ORIENTED SOFTWARE DESIGN', 'INF/01', 2, 'italiano', '', '', ''),
(20, 'DT0008', '2017/2018', 'PRINCIPI E PARADIGMI DI PROGRAMMAZIONE', 'INF/01', 2, 'italiano', '', '', ''),
(21, 'F0144', '2017/2018', 'RETI DI CALCOLATORI', 'INF/01', 2, 'italiano', '', '', ''),
(22, 'F0081', '2017/2018', 'RETI DI CALCOLATORI EVOLUTE: ARCHITETTURE', 'INF/01', 1, 'italiano', '', '', ''),
(23, 'F0081', '2017/2018', 'ADVANCED COMPUTER NETWORKS: INTERNETWORKING', 'INF/01', 2, 'inglese', '', '', ''),
(24, 'F0139', '2017/2018', 'RICERCA OPERATIVA', 'MAT/09', 2, 'italiano', '', '', ''),
(25, 'F0139', '2017/2018', 'OTTIMIZZAZIONE COMBINATORIA', 'MAT/09', 2, 'italiano', '', '', ''),
(26, 'DT0009', '2017/2018', 'SISTEMI OPERATIVI', 'INF/01', 1, 'italiano', '', '', ''),
(27, 'DT0009', '2017/2018', 'LABORATORIO DI SISTEMI OPERATIVI', 'INF/01', 1, 'italiano', '', '', ''),
(28, 'F0149', '2017/2018', 'TECNOLOGIE DEL WEB', 'INF/01', 1, 'italiano', '', '', ''),
(29, 'F0158', '2017/2018', 'TEORIA DELL\'INFORMAZIONE', 'INF/01', 2, 'italiano', '', '', ''),
(30, 'F0150', '2017/2018', 'TEORIA DELLA CALCOLABILITA\' E COMPLESSITA\'', 'INF/01', 2, 'italiano', '', '', ''),
(31, 'DT0180', '2017/2018', 'WEB ENGENEERING', 'INF/01', 2, 'italiano', '', '', ''),
(32, 'DT0002', '2016/2017', 'ANALISI MATEMATICA', 'MAT/05', 1, 'italiano', '', '', ''),
(33, 'DT0002', '2015/2016', 'ANALISI MATEMATICA', 'MAT/05', 1, 'italiano', '', '', ''),
(34, 'F0130', '2017/2018', 'ALGORITMI E STRUTTURE DATI CON LABORATORIO', 'INF/01', 1, 'italiano', '', '', ''),
(35, 'F0136', '2017/2018', 'BASI DI DATI CON LABORATORIO', 'INF/01', 2, 'italiano', '', '', '');

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `corsi_corsi_laurea`
--

INSERT INTO `corsi_corsi_laurea` (`id`, `id_corso_laurea`, `id_corso`, `numero_cfu`, `tipo_cfu`) VALUES
(1, 1, 3, 6, 'A'),
(2, 1, 4, 6, 'A'),
(3, 1, 1, 9, 'A'),
(4, 2, 1, 12, 'A'),
(5, 1, 2, 15, 'A');

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `corsi_corsi_mutuati`
--

INSERT INTO `corsi_corsi_mutuati` (`id`, `id_corso`, `id_corso_mutuato`) VALUES
(1, 1, 8);

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `corsi_corsi_propedeutici`
--

INSERT INTO `corsi_corsi_propedeutici` (`id`, `id_corso`, `id_corso_propedeutico`) VALUES
(1, 3, 1),
(2, 4, 1);

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `corsi_docenti`
--

INSERT INTO `corsi_docenti` (`id`, `id_corso`, `id_docente`) VALUES
(1, 1, 2),
(2, 8, 2);

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `corsi_moduli`
--

INSERT INTO `corsi_moduli` (`id`, `id_corso_integrato`, `id_modulo`) VALUES
(1, 34, 3),
(2, 34, 4);

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
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `info_corsi`
--

INSERT INTO `info_corsi` (`id`, `prerequisiti`, `obiettivi`, `mod_esame`, `mod_insegnamento`, `descrittori_dublino`, `sillabo`, `note`, `lang`, `id_corso`) VALUES
(18, '', '', '', '', '', '', '', 'eng', 11),
(17, '', '', '', '', '', '', '', 'ita', 11),
(16, '', '', '', '', '', '', '', 'eng', 10),
(15, '', '', '', '', '', '', '', 'ita', 10),
(14, '', '', '', '', '', '', '', 'eng', 9),
(13, '', '', '', '', '', '', '', 'ita', 8),
(12, '', '', '', '', '', '', '', 'eng', 7),
(11, '', '', '', '', '', '', '', 'ita', 7),
(10, '', '', '', '', '', '', '', 'eng', 6),
(9, '', '', '', '', '', '', '', 'eng', 5),
(8, '', '', '', '', '', '', '', 'ita', 5),
(7, '', '', '', '', '', '', '', 'ita', 4),
(6, '', '', '', '', '', '', '', 'eng', 3),
(5, '', '', '', '', '', '', '', 'ita', 3),
(4, '', '', '', '', '', '', '', 'eng', 2),
(3, '', '', '', '', '', '', '', 'ita', 2),
(2, '', '', '', '', '', '', '', 'eng', 1),
(1, '', '', '', '', '', '', '', 'ita', 1),
(19, '', '', '', '', '', '', '', 'ita', 12),
(20, '', '', '', '', '', '', '', 'eng', 12),
(21, '', '', '', '', '', '', '', 'ita', 13),
(22, '', '', '', '', '', '', '', 'eng', 13),
(23, '', '', '', '', '', '', '', 'ita', 14),
(24, '', '', '', '', '', '', '', 'eng', 14),
(25, '', '', '', '', '', '', '', 'eng', 15),
(26, '', '', '', '', '', '', '', 'ita', 15),
(27, '', '', '', '', '', '', '', 'eng', 16),
(28, '', '', '', '', '', '', '', 'ita', 16),
(29, '', '', '', '', '', '', '', 'ita', 17),
(30, '', '', '', '', '', '', '', 'eng', 17),
(31, '', '', '', '', '', '', '', 'ita', 18),
(32, '', '', '', '', '', '', '', 'eng', 18),
(33, '', '', '', '', '', '', '', 'ita', 19),
(34, '', '', '', '', '', '', '', 'eng', 19),
(35, '', '', '', '', '', '', '', 'eng', 20),
(36, '', '', '', '', '', '', '', 'ita', 20),
(37, '', '', '', '', '', '', '', 'eng', 21),
(38, '', '', '', '', '', '', '', 'ita', 21),
(39, '', '', '', '', '', '', '', 'eng', 22),
(40, '', '', '', '', '', '', '', 'ita', 22),
(41, '', '', '', '', '', '', '', 'eng', 23),
(42, '', '', '', '', '', '', '', 'ita', 23),
(43, '', '', '', '', '', '', '', 'eng', 24),
(44, '', '', '', '', '', '', '', 'ita', 24),
(45, '', '', '', '', '', '', '', 'eng', 25),
(46, '', '', '', '', '', '', '', 'ita', 25),
(47, '', '', '', '', '', '', '', 'eng', 26),
(48, '', '', '', '', '', '', '', 'ita', 26),
(49, '', '', '', '', '', '', '', 'eng', 27),
(50, '', '', '', '', '', '', '', 'ita', 27),
(51, '', '', '', '', '', '', '', 'eng', 28),
(52, '', '', '', '', '', '', '', 'ita', 28),
(53, '', '', '', '', '', '', '', 'eng', 29),
(54, '', '', '', '', '', '', '', 'ita', 29),
(55, '', '', '', '', '', '', '', 'eng', 30),
(56, '', '', '', '', '', '', '', 'ita', 30),
(57, '', '', '', '', '', '', '', 'ita', 31),
(58, '', '', '', '', '', '', '', 'eng', 31),
(59, '', '', '', '', '', '', '', 'ita', 32),
(60, '', '', '', '', '', '', '', 'eng', 32),
(61, '', '', '', '', '', '', '', 'ita', 33),
(62, '', '', '', '', '', '', '', 'eng', 33),
(63, '', '', '', '', '', '', '', 'eng', 34),
(64, '', '', '', '', '', '', '', 'ita', 34),
(65, '', '', '', '', '', '', '', 'eng', 35),
(66, '', '', '', '', '', '', '', 'ita', 35);

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
-- Struttura della tabella `materiali`
--

DROP TABLE IF EXISTS `materiali`;
CREATE TABLE IF NOT EXISTS `materiali` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` text NOT NULL,
  `descrizione` text NOT NULL,
  `dimensione` text NOT NULL,
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
