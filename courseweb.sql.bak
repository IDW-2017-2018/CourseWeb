-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Creato il: Ott 06, 2017 alle 15:38
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
  `id` int(11) NOT NULL,
  `codice` varchar(250) NOT NULL,
  `anno` varchar(250) NOT NULL,
  `nome` text NOT NULL,
  `SSD` text NOT NULL,
  `semestre` int(11) NOT NULL,
  `lingua` text,
  `prerequisiti` text,
  `obiettivi` text,
  `mod_esame` text,
  `mod_insegnamento` text,
  `sillabo` text,
  `link_homepage` text,
  `link_risorse` text,
  `link_forum` text,
  `note` text,
  PRIMARY KEY (`id`,`codice`,`anno`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi_corsi_integrati`
--

DROP TABLE IF EXISTS `corsi_corsi_integrati`;
CREATE TABLE IF NOT EXISTS `corsi_corsi_integrati` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_corso` int(11) NOT NULL,
  `id_corso_integrato` int(11) NOT NULL,
  PRIMARY KEY (`id`)
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
  `nome` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
  `link` text,
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
-- Struttura della tabella `materiali_corsi`
--

DROP TABLE IF EXISTS `materiali_corsi`;
CREATE TABLE IF NOT EXISTS `materiali_corsi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_corso` int(11) NOT NULL,
  `id_materiale` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

DROP TABLE IF EXISTS `utenti`;
CREATE TABLE IF NOT EXISTS `utenti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(1000) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `tipo_utente` varchar(500) NOT NULL,
  `nome` varchar(500) DEFAULT NULL,
  `cognome` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
