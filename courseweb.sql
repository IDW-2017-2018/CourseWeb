-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Creato il: Giu 18, 2018 alle 22:22
-- Versione del server: 5.7.21
-- Versione PHP: 5.6.35

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi_laurea`
--

DROP TABLE IF EXISTS `corsi_laurea`;
CREATE TABLE IF NOT EXISTS `corsi_laurea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `corsi_laurea`
--

INSERT INTO `corsi_laurea` (`id`, `nome`) VALUES
(1, 'Informatica'),
(2, 'Matematica'),
(3, 'Chimica'),
(4, 'Biologia'),
(5, 'Ingegneria Informatica'),
(6, 'Ingegneria Elettronica');

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `log`
--

INSERT INTO `log` (`id`, `messaggio`, `timestamp`) VALUES
(1, 'L\'utente flavio@admin.it ha aggiunto il docente riccardo@admin.it', '2018-06-18 21:51:01'),
(2, 'L\'utente flavio@admin.it ha aggiunto il docente valentino@admin.it', '2018-06-18 21:51:26'),
(3, 'L\'utente flavio@admin.it ha aggiunto il docente dellapenna@docente.it', '2018-06-18 21:52:05'),
(4, 'L\'utente flavio@admin.it ha aggiunto il docente engel@docente.it', '2018-06-18 21:52:23'),
(5, 'L\'utente flavio@admin.it ha aggiunto il docente proietti@docente.it', '2018-06-18 21:53:21'),
(6, 'L\'utente flavio@admin.it ha modificato l\'utente ', '2018-06-18 21:54:06'),
(7, 'L\'utente flavio@admin.it ha modificato l\'utente ', '2018-06-18 21:59:26'),
(8, 'L\'utente flavio@admin.it ha modificato l\'utente ', '2018-06-18 21:59:37'),
(9, 'L\'utente flavio@admin.it ha aggiunto il docente vellante@docente.it', '2018-06-18 22:00:10'),
(10, 'L\'utente flavio@admin.it ha modificato l\'utente ', '2018-06-18 22:00:20'),
(11, 'L\'utente flavio@admin.it ha modificato l\'utente vellante@docente.com', '2018-06-18 22:00:34'),
(12, 'L\'utente flavio@admin.it ha aggiunto il docente pierantonio@docente.it', '2018-06-18 22:01:11'),
(13, 'L\'utente flavio@admin.it ha aggiunto il docente scoppola@docente.it', '2018-06-18 22:01:49'),
(14, 'L\'utente flavio@admin.it ha aggiunto il docente tozzi@docente.it', '2018-06-18 22:02:06'),
(15, 'L\'utente flavio@admin.it ha modificato l\'utente ', '2018-06-18 22:03:53'),
(16, 'L\'utente flavio@admin.it ha modificato l\'utente ', '2018-06-18 22:04:17'),
(17, 'L\'utente riccardo@admin.it ha modificato l\'utente ', '2018-06-18 22:04:32'),
(18, 'L\'utente flavio@admin.it ha modificato l\'utente ', '2018-06-18 22:05:13'),
(19, 'L\'utente flavio@admin.it ha modificato l\'utente ', '2018-06-18 22:06:44'),
(20, 'L\'utente flavio@admin.it ha modificato l\'utente ', '2018-06-18 22:07:58');

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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`id`, `email`, `password`, `tipo_utente`, `nome`, `cognome`) VALUES
(1, 'flavio@admin.it', 'f76405ac130dac085b2a6249073b213b', 'amministratore', 'Flavio', 'Furia'),
(3, 'riccardo@admin.it', '9667aacee4c11ab5cb1aee39cb183599', 'amministratore', 'Riccardo', 'Di Prinzio'),
(4, 'valentino@admin.it', '50b483d799f6b531772078e9cd0fa509', 'amministratore', 'Valentino', 'Di Giosaffatte'),
(5, 'dellapenna@docente.it', 'ac99fecf6fcb8c25d18788d14a5384ee', 'docente', 'Giuseppe', 'Della Penna'),
(6, 'engel@docente.it', 'ac99fecf6fcb8c25d18788d14a5384ee', 'docente', 'Klaus', 'Engel'),
(7, 'proietti@docente.it', 'ac99fecf6fcb8c25d18788d14a5384ee', 'docente', 'Guido', 'Proietti'),
(8, 'vellante@docente.com', 'ac99fecf6fcb8c25d18788d14a5384ee', 'docente', 'Massimo', 'Vellante'),
(9, 'pierantonio@docente.it', 'ac99fecf6fcb8c25d18788d14a5384ee', 'docente', 'Alfonso', 'Pierantonio'),
(10, 'scoppola@docente.it', 'ac99fecf6fcb8c25d18788d14a5384ee', 'docente', 'Carlo Maria', 'Scoppola'),
(11, 'tozzi@docente.it', 'ac99fecf6fcb8c25d18788d14a5384ee', 'docente', 'Anna', 'Tozzi');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
