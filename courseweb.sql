-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 29, 2018 alle 16:21
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
  `nome` text NOT NULL,
  `SSD` text NOT NULL,
  `semestre` int(11) NOT NULL,
  `lingua` text NOT NULL,
  `link_homepage` text NOT NULL,
  `link_risorse` text NOT NULL,
  `link_forum` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `corsi`
--

INSERT INTO `corsi` (`id`, `codice`, `anno`, `nome`, `SSD`, `semestre`, `lingua`, `link_homepage`, `link_risorse`, `link_forum`) VALUES
(1, 'DT0002', '2017/2018', 'ANALISI MATEMATICA', 'MAT/05', 1, 'italiano', '', '', ''),
(2, 'F1I005', '2017/2018', 'ARCHITETTURA DEGLI ELABORATORI', 'INF/01', 1, 'italiano', '', '', ''),
(3, 'F0130', '2017/2018', '[modulo] ALGORITMI E STRUTTURE DATI', 'INF/01', 1, 'italiano', '', '', ''),
(4, 'F0130', '2017/2018', '[modulo] LABORATORIO DI ALGORITMI E STRUTTURE DATI', 'INF/01', 1, 'italiano', '', '', ''),
(5, 'F0136', '2017/2018', '[modulo] BASI DI DATI', 'INF/01', 2, 'italiano', '', '', ''),
(6, 'F0136', '2017/2018', '[modulo] BASI DI DATI CON LABORATORIO', 'INF/01', 2, 'italiano', '', '', ''),
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
-- Struttura della tabella `corsi_corsi_integrati`
--

CREATE TABLE `corsi_corsi_integrati` (
  `id` int(11) NOT NULL,
  `id_corso` int(11) NOT NULL,
  `id_corso_integrato` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `corsi_corsi_integrati`
--

INSERT INTO `corsi_corsi_integrati` (`id`, `id_corso`, `id_corso_integrato`) VALUES
(1, 3, 34),
(2, 4, 34);

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

--
-- Dump dei dati per la tabella `corsi_corsi_laurea`
--

INSERT INTO `corsi_corsi_laurea` (`id`, `id_corso_laurea`, `id_corso`, `numero_cfu`, `tipo_cfu`) VALUES
(1, 1, 3, 6, 'A'),
(2, 1, 4, 6, 'A'),
(3, 1, 1, 9, 'A'),
(4, 2, 1, 12, 'A');

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi_corsi_mutuati`
--

CREATE TABLE `corsi_corsi_mutuati` (
  `id` int(11) NOT NULL,
  `id_corso` int(11) NOT NULL,
  `id_corso_mutuato` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `corsi_corsi_mutuati`
--

INSERT INTO `corsi_corsi_mutuati` (`id`, `id_corso`, `id_corso_mutuato`) VALUES
(1, 1, 8);

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi_corsi_propedeutici`
--

CREATE TABLE `corsi_corsi_propedeutici` (
  `id` int(11) NOT NULL,
  `id_corso` int(11) NOT NULL,
  `id_corso_propedeutico` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
  `nome` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
-- Struttura della tabella `info_corsi`
--

CREATE TABLE `info_corsi` (
  `id` int(11) NOT NULL,
  `prerequisiti` text NOT NULL,
  `obiettivi` text NOT NULL,
  `mod_esame` text NOT NULL,
  `mod_insegnamento` text NOT NULL,
  `descrittori_dublino` text NOT NULL,
  `sillabo` text NOT NULL,
  `note` text NOT NULL,
  `lang` text NOT NULL,
  `id_corso` int(11) NOT NULL
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
  `link` text NOT NULL
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
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `tipo_utente` text NOT NULL,
  `nome` text NOT NULL,
  `cognome` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`id`, `email`, `password`, `tipo_utente`, `nome`, `cognome`) VALUES
(1, 'a@a', '0cc175b9c0f1b6a831c399e269772661', 'amministratore', 'a', 'a		'),
(2, 'b@b', '92eb5ffee6ae2fec3ad71c777531578f', 'docente', 'b', 'b		');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `corsi`
--
ALTER TABLE `corsi`
  ADD PRIMARY KEY (`id`,`codice`,`anno`);

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
-- Indici per le tabelle `info_corsi`
--
ALTER TABLE `info_corsi`
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
  ADD PRIMARY KEY (`id`,`email`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `corsi`
--
ALTER TABLE `corsi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT per la tabella `corsi_corsi_integrati`
--
ALTER TABLE `corsi_corsi_integrati`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT per la tabella `corsi_corsi_laurea`
--
ALTER TABLE `corsi_corsi_laurea`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT per la tabella `corsi_corsi_mutuati`
--
ALTER TABLE `corsi_corsi_mutuati`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `corsi_corsi_propedeutici`
--
ALTER TABLE `corsi_corsi_propedeutici`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT per la tabella `corsi_docenti`
--
ALTER TABLE `corsi_docenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `corsi_laurea`
--
ALTER TABLE `corsi_laurea`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
-- AUTO_INCREMENT per la tabella `info_corsi`
--
ALTER TABLE `info_corsi`
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
