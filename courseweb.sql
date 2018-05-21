-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 21, 2018 alle 16:32
-- Versione del server: 5.7.14
-- Versione PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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

CREATE TABLE `corsi` (
  `id` int(11) NOT NULL,
  `codice` varchar(250) NOT NULL,
  `anno` varchar(250) NOT NULL,
  `lang` varchar(250) NOT NULL,
  `nome` text NOT NULL,
  `SSD` text,
  `semestre` int(11) DEFAULT NULL,
  `lingua` text,
  `prerequisiti` text,
  `obiettivi` text,
  `mod_esame` text,
  `mod_insegnamento` text,
  `descrittori_dublino` text,
  `sillabo` text,
  `link_homepage` text,
  `link_risorse` text,
  `link_forum` text,
  `note` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `corsi`
--

INSERT INTO `corsi` (`id`, `codice`, `anno`, `lang`, `nome`, `SSD`, `semestre`, `lingua`, `prerequisiti`, `obiettivi`, `mod_esame`, `mod_insegnamento`, `descrittori_dublino`, `sillabo`, `link_homepage`, `link_risorse`, `link_forum`, `note`) VALUES
(12, 'F0050', '2017/2018', 'ita		', 'FONDAMENTI DI PROGRAMMAZIONE', 'INF/01', 1, 'italiano', '', '', '', '', NULL, '', '', '', '', ''),
(13, 'F1I018', '2017/2018', 'ita	', 'INGEGNERIA DEL SOFTWARE', 'INF/01', 1, 'italiano', '', '', '', '', NULL, '', '', '', '', ''),
(14, 'F1I010', '2017/2018', 'ita	', 'LABORATORIO DI ARCHITETTURA DEGLI ELABORATORI', 'INF/01', 2, 'italiano', '', '', '', '', NULL, '', '', '', '', ''),
(15, 'F0151', '2017/2018', 'ita', 'LINGUAGGI DI PROGRAMMAZIONE E COMPILATOTORI', 'INF/01', 1, 'italiano', '', '', '', '', NULL, '', '', '', '', ''),
(25, 'F0139', '2017/2018', 'ita		', 'OTTIMIZZAZIONE COMBINATORIA', 'MAT/09', 2, 'italiano', '', '', '', '', NULL, '', '', '', '', ''),
(24, 'F0139', '2017/2018', 'ita		', 'RICERCA OPERATIVA', 'MAT/09', 2, 'italiano', '', '', '', '', NULL, '', '', '', '', ''),
(23, 'F0081', '2017/2018', 'eng	', 'ADVANCED COMPUTER NETWORKS: INTERNETWORKING', 'INF/01', 2, 'inglese', '', '', '', '', NULL, '', '', '', '', ''),
(22, 'F0081', '2017/2018', 'ita	', 'RETI DI CALCOLATORI EVOLUTE: ARCHITETTURE', 'INF/01', 1, 'italiano', '', '', '', '', NULL, '', '', '', '', ''),
(21, 'F0144', '2017/2018', 'ita		', 'RETI DI CALCOLATORI', 'INF/01', 2, 'italiano', '', '', '', '', NULL, '', '', '', '', ''),
(20, 'DT0008', '2017/2018', 'ita	', 'PRINCIPI E PARADIGMI DI PROGRAMMAZIONE', 'INF/01', 2, 'italiano', '', '', '', '', NULL, '', '', '', '', ''),
(19, 'DT0208', '2017/2018', 'ita	', 'OBJECT-ORIENTED SOFTWARE DESIGN', 'INF/01', 2, 'italiano', '', '', '', '', NULL, '', '', '', '', ''),
(18, 'F0123', '2017/2018', 'ita		', 'MATEMATICA DISCRETA II', 'MAT/02-03', 2, 'italiano', '', '', '', '', NULL, '', '', '', '', ''),
(16, 'DT0096', '2017/2018', 'ita				', 'MATEMATICA DI BASE', 'MAT/01', 1, 'italiano', '', '', '', '', NULL, '', '', '', '', ''),
(17, 'F0123', '2017/2018', 'ita		', 'MATEMATICA DISCRETA I', 'MAT/02-03', 2, 'italiano', '', '', '', '', NULL, '', '', '', '', ''),
(11, 'F0050', '2017/2018', 'ita		', 'LABORATORIO DI PROGRAMMAZIONE I', 'INF/01', 1, 'italiano', '', '', '', '', NULL, '', '', '', '', ''),
(10, 'F0143', '2017/2018', 'ita			', 'FISICA', 'FIS/02', 2, 'italiano', '', '', '', '', NULL, '', '', '', '', ''),
(9, 'F0633', '2017/2018', 'eng			', 'LINGUA INGLESE B1', 'L-LIN/12', 2, 'inglese', '', '', '', '', NULL, '', '', '', '', ''),
(8, 'DT0003', '2017/2018', 'ita', 'CALCOLO DELLE PROBABILITA\' E STATISTICA MATEMATICA', 'MAT/06', 1, 'italiano', '', '', '', '', NULL, '', '', '', '', ''),
(7, 'I0323', '2017/2018', 'ita		', 'COMBINATORIA E CRITTOGRAFIA', 'INF/01', 2, 'italiano', '', '', '', '', NULL, '', '', '', '', ''),
(6, 'F0136', '2017/2018', 'ita			', 'BASI DI DATI CON LABORATORIO', 'INF/01', 2, 'italiano', '', '', '', '', NULL, '', '', '', '', ''),
(5, 'F0136', '2017/2018', 'ita			', 'BASI DI DATI', 'INF/01', 2, 'italiano', '', '', '', '', NULL, '', '', '', '', ''),
(4, 'F0130', '2017/2018', 'ita	', 'LABORATORIO DI ALGORITMI E STRUTTURE DATI', 'INF/01', 1, 'italiano', '', '', '', '', NULL, '', '', '', '', ''),
(3, 'F0130', '2017/2018', 'ita	', 'ALGORITMI E STRUTTURE DATI', 'INF/01', 1, 'italiano', '', '', '', '', NULL, '', '', '', '', ''),
(2, 'F1I005', '2017/2018', 'ita				', 'ARCHITETTURA DEGLI ELABORATORI', 'INF/01', 1, 'italiano', '', '', '', '', NULL, '', '', '', '', ''),
(1, 'DT0002', '2017/2018', 'ita				', 'ANALISI MATEMATICA', 'MAT/05', 1, 'italiano', '', '', '', '', NULL, '', '', '', '', ''),
(26, 'DT0009', '2017/2018', 'ita		', 'SISTEMI OPERATIVI', 'INF/01', 1, 'italiano', '', '', '', '', NULL, '', '', '', '', ''),
(27, 'DT0009', '2017/2018', 'ita		', 'LABORATORIO DI SISTEMI OPERATIVI', 'INF/01', 1, 'italiano', '', '', '', '', NULL, '', '', '', '', ''),
(28, 'F0149', '2017/2018', 'ita			', 'TECNOLOGIE DEL WEB', 'INF/01', 1, 'italiano', '', '', '', '', NULL, '', '', '', '', ''),
(29, 'F0158', '2017/2018', 'ita', 'TEORIA DELL\'INFORMAZIONE', 'INF/01', 2, 'italiano', '', '', '', '', NULL, '', '', '', '', ''),
(30, 'F0150', '2017/2018', 'ita', 'TEORIA DELLA CALCOLABILITA\' E COMPLESSITA\'', 'INF/01', 2, 'italiano', '', '', '', '', NULL, '', '', '', '', ''),
(31, 'DT0180', '2017/2018', 'ita			', 'WEB ENGENEERING', 'INF/01', 2, 'italiano', '', '', '', '', NULL, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi_corsi_integrati`
--

CREATE TABLE `corsi_corsi_integrati` (
  `id` int(11) NOT NULL,
  `id_corso` int(11) NOT NULL,
  `id_corso_integrato` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi_corsi_laurea`
--

CREATE TABLE `corsi_corsi_laurea` (
  `id` int(11) NOT NULL,
  `id_corso_laurea` int(11) NOT NULL,
  `id_corso` int(11) NOT NULL,
  `numero_cfu` int(11) NOT NULL,
  `tipo_cfu` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi_corsi_mutuati`
--

CREATE TABLE `corsi_corsi_mutuati` (
  `id` int(11) NOT NULL,
  `id_corso` int(11) NOT NULL,
  `id_corso_mutuato` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi_corsi_propedeutici`
--

CREATE TABLE `corsi_corsi_propedeutici` (
  `id` int(11) NOT NULL,
  `id_corso` int(11) NOT NULL,
  `id_corso_propedeutico` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi_docenti`
--

CREATE TABLE `corsi_docenti` (
  `id` int(11) NOT NULL,
  `id_corso` int(11) NOT NULL,
  `id_docente` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi_laurea`
--

CREATE TABLE `corsi_laurea` (
  `id` int(11) NOT NULL,
  `nome` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi_libri_testo`
--

CREATE TABLE `corsi_libri_testo` (
  `id` int(11) NOT NULL,
  `id_corso` int(11) NOT NULL,
  `id_libro_testo` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi_materiali`
--

CREATE TABLE `corsi_materiali` (
  `id` int(11) NOT NULL,
  `id_corso` int(11) NOT NULL,
  `id_materiale` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `libri_testo`
--

CREATE TABLE `libri_testo` (
  `id` int(11) NOT NULL,
  `autore` text NOT NULL,
  `titolo` text NOT NULL,
  `volume` text NOT NULL,
  `anno` text NOT NULL,
  `editore` text NOT NULL,
  `link` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `materiali`
--

CREATE TABLE `materiali` (
  `id` int(11) NOT NULL,
  `nome` text NOT NULL,
  `descrizione` text NOT NULL,
  `dimensione` text NOT NULL,
  `percorso` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `id` int(11) NOT NULL,
  `email` varchar(1000) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `tipo_utente` varchar(500) NOT NULL,
  `nome` varchar(500) DEFAULT NULL,
  `cognome` varchar(500) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`id`, `email`, `password`, `tipo_utente`, `nome`, `cognome`) VALUES
(2, 'b@b', '92eb5ffee6ae2fec3ad71c777531578f', 'amministratore', 'b', 'b'),
(1, 'a@a', 'cc175b9c0f1b6a831c399e269772661', 'docente', 'a', 'a');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `corsi`
--
ALTER TABLE `corsi`
  ADD PRIMARY KEY (`id`,`codice`,`anno`,`lang`);

--
-- Indici per le tabelle `corsi_corsi_integrati`
--
ALTER TABLE `corsi_corsi_integrati`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `corsi_corsi_laurea`
--
ALTER TABLE `corsi_corsi_laurea`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `corsi_corsi_mutuati`
--
ALTER TABLE `corsi_corsi_mutuati`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `corsi_corsi_propedeutici`
--
ALTER TABLE `corsi_corsi_propedeutici`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `corsi_docenti`
--
ALTER TABLE `corsi_docenti`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `corsi_laurea`
--
ALTER TABLE `corsi_laurea`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `corsi_libri_testo`
--
ALTER TABLE `corsi_libri_testo`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `corsi_materiali`
--
ALTER TABLE `corsi_materiali`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `libri_testo`
--
ALTER TABLE `libri_testo`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `materiali`
--
ALTER TABLE `materiali`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `corsi_corsi_integrati`
--
ALTER TABLE `corsi_corsi_integrati`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `corsi_corsi_laurea`
--
ALTER TABLE `corsi_corsi_laurea`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `corsi_corsi_mutuati`
--
ALTER TABLE `corsi_corsi_mutuati`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `corsi_corsi_propedeutici`
--
ALTER TABLE `corsi_corsi_propedeutici`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `corsi_docenti`
--
ALTER TABLE `corsi_docenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `corsi_laurea`
--
ALTER TABLE `corsi_laurea`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `corsi_libri_testo`
--
ALTER TABLE `corsi_libri_testo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `corsi_materiali`
--
ALTER TABLE `corsi_materiali`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `libri_testo`
--
ALTER TABLE `libri_testo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `materiali`
--
ALTER TABLE `materiali`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `utenti`
--
ALTER TABLE `utenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
