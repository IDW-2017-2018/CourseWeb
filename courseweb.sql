-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Creato il: Lug 02, 2018 alle 15:28
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
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `corsi`
--

INSERT INTO `corsi` (`id`, `codice`, `anno`, `nome`, `SSD`, `semestre`, `lingua`, `link_homepage`, `link_risorse`, `link_forum`) VALUES
(1, 'F0130', '2017/2018', 'ALGORITMI E STRUTTURE DATI CON LABORATORIO', 'INF/01', 1, 'italiano', 'www.algoritmi.it', 'www.algoritmi.it', 'www.algoritmi.it'),
(12, 'DT0002', '2016/2017', 'ANALISI MATEMATICA', 'MAT/05', 1, 'italiano', '', '', 'www.analisi.it'),
(11, 'F0132', '2017/2018', 'LABORATORIO DI ALGORITMI E STRUTTURE DATI', 'INF/01', 1, 'italiano', 'www.labalg.it', 'www.labalg.it', 'www.labalg.edu'),
(10, 'F0130', '2017/2018', 'ALGORITMI E STRUTTURE DATI', 'INF/01', 1, 'italiano', 'www.algoritmi.it', '', ''),
(18, 'DT0002', '2017/2018', 'ANALISI MATEMATICA', 'MAT/05', 1, 'italiano', 'www.analisi.it', '', ''),
(19, 'F0143', '2016/2017', 'FISICA', 'FIS/02', 1, 'italiano', 'www.fisica.it', 'www.risorse-fisica.it', 'www.forum-fisica.it'),
(20, 'F1I020', '2017/2018', 'SISTEMI OPERATIVI I', 'INF/01', 1, 'italiano', '', '', ''),
(21, 'DT0009', '2017/2018', 'SISTEMI OPERATIVI CON LABORATORIO', 'INF/01', 1, 'italiano', '', '', ''),
(22, 'F1I021', '2017/2018', 'SISTEMI OPERATIVI', 'INF/01', 1, 'italiano', 'www.sistemioperativi.it', 'http://www.di.univaq.it/cortelle/index.php?pageId=teaching', ''),
(23, 'F1I022', '2017/2018', 'LABORATORIO DI SISTEMI OPERATIVI', 'INF/01', 2, 'inglese', 'www.sistemioperativi.it', '', ''),
(24, 'DT0021', '2017/2018', 'ANALISI NUMERICA', 'MAT/08', 2, 'italiano', '', '', ''),
(25, 'F0106', '2017/2018', 'ISTOLOGIA', 'BIO/06', 1, 'italiano', '', '', '');

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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `corsi_corsi_laurea`
--

INSERT INTO `corsi_corsi_laurea` (`id`, `id_corso_laurea`, `id_corso`, `numero_cfu`, `tipo_cfu`) VALUES
(1, 1, 1, 12, 'A'),
(2, 1, 10, 6, 'A'),
(3, 1, 12, 9, 'A'),
(4, 1, 11, 6, 'A'),
(5, 1, 19, 6, 'A'),
(6, 1, 20, 6, 'A'),
(7, 1, 22, 6, 'A'),
(8, 1, 23, 6, 'A'),
(9, 1, 21, 12, 'A'),
(10, 1, 18, 9, 'A'),
(11, 2, 24, 9, 'B'),
(12, 4, 25, 3, 'B');

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `corsi_corsi_mutuati`
--

INSERT INTO `corsi_corsi_mutuati` (`id`, `id_corso`, `id_corso_mutuato`) VALUES
(5, 22, 20);

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `corsi_corsi_propedeutici`
--

INSERT INTO `corsi_corsi_propedeutici` (`id`, `id_corso`, `id_corso_propedeutico`) VALUES
(1, 10, 12),
(3, 11, 12);

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
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `corsi_docenti`
--

INSERT INTO `corsi_docenti` (`id`, `id_corso`, `id_docente`) VALUES
(1, 1, 7),
(2, 1, 12),
(3, 2, 7),
(4, 3, 7),
(5, 4, 7),
(6, 5, 7),
(7, 6, 7),
(8, 7, 7),
(9, 8, 7),
(10, 9, 7),
(11, 10, 7),
(12, 11, 12),
(13, 12, 6),
(14, 13, 6),
(15, 14, 6),
(16, 15, 6),
(17, 16, 6),
(18, 17, 6),
(19, 18, 6),
(20, 19, 8),
(21, 20, 13),
(22, 21, 13),
(23, 22, 13),
(24, 23, 14),
(25, 21, 14),
(26, 24, 15),
(27, 25, 16);

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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `corsi_libri_testo`
--

INSERT INTO `corsi_libri_testo` (`id`, `id_corso`, `id_libro_testo`) VALUES
(1, 1, 1),
(2, 10, 1),
(3, 12, 2),
(4, 11, 1),
(5, 12, 3),
(6, 22, 4),
(7, 21, 4),
(8, 18, 2),
(9, 18, 3);

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `corsi_moduli`
--

INSERT INTO `corsi_moduli` (`id`, `id_corso_integrato`, `id_modulo`) VALUES
(1, 1, 10),
(2, 21, 23),
(3, 21, 22);

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
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `info_corsi`
--

INSERT INTO `info_corsi` (`id`, `prerequisiti`, `obiettivi`, `mod_esame`, `mod_insegnamento`, `descrittori_dublino`, `sillabo`, `note`, `lang`, `id_corso`) VALUES
(1, 'Modulo Algoritmi e Strutture Dati: Conoscere: - strutture dati elementari (array, liste, ?) - concetto di ricorsione - sommatorie, dimostrazione per induzione e calcolo infinitesimale.\r\n\r\nModulo Laboratorio di Algoritmi e Strutture Dati: Si assume che lo studente abbia acquisito una conoscenza di base dei principi della programmazione ed in particolare del linguaggio di programmazione Java.', 'Modulo Algoritmi e Strutture Dati: L\\\'obiettivo del corso è quello di fornire allo studente competenze di base sui metodi di rappresentazione delle principali strutture di dati, sui rispettivi algoritmi fondamentali per la loro gestione e sulla valutazione della complessità computazionale di un algoritmo e di un problema. Infine, mira a sviluppare un?intuizione finalizzata alla soluzione efficiente di problemi computazionali.\r\nModulo Laboratorio di Algoritmi e Strutture Dati: A partire dalle conoscenze acquisite nel corso di Fondamenti di Programmazione con Laboratorio, il modulo si concentra sullo studio di algoritmi e strutture dati fondamentali, stimolandone la comprensione attraverso la sperimentazione diretta in linguaggio Java. Il modulo illustra le principali tecniche di progettazione e le principali metodologie di analisi di algoritmi e strutture dati. Le lezioni sono svolte in linguaggio Java di cui si assume una conoscenza di base.', 'La prova d\\\'esame prevede il superamento di: - Una prova scritta (integrata) della durata di 2:30 ore e strutturata nelle seguenti due parti: (i) una prova scritta di teoria sui contenuti del modulo di ASD che consiste in 10 test ragionati a risposta multipla; (ii) una prova scritta di laboratorio che consiste in 3 o 4 esercizi da svolgere utilizzando il linguaggio di programmazione JAVA basati sui contenuti del modulo di Laboratorio. Gli scritti di teoria e laboratorio possono essere svolti disgiuntamente purché all?interno dello stesso anno solare (gennaio-novembre). Se respinti all?esame orale di teoria, è necessario ripetere la prova scritta di teoria. Se respinti all?esame orale di laboratorio, è necessario ripetere la prova scritta di laboratorio. - Una prova orale obbligatoria di teoria sui contenuti del modulo di ASD (la prova orale di teoria può essere svolta solo dopo aver superato sia lo scritto di teoria che lo scritto di laboratorio) - Un\\\'eventuale prova orale sui contenuti del modulo di Laboratorio a discrezione della docente o su richiesta dello studente. In sostituzione della prova scritta finale, è possibile sostenere due prove scritte intermedie della durata di 2 ore ciascuna. L\\\'idoneità alla prima prova è condizione necessaria per accedere alla seconda. La prima prova intermedia ha un unico appello a Novembre, mentre la seconda ha due appelli nel mese di Febbraio. La modalità è riservata agli studenti iscritti al II anno, o che non hanno mai sostenuto una prova intermedia in passato. La prova orale di teoria deve essere svolta all\\\'interno della sessione invernale.\r\nModulo Algoritmi e Strutture Dati: L?esame va svolto congiuntamente con la parte di laboratorio e consiste in: una prova scritta e una prova orale di teoria, da svolgersi obbligatoriamente una prova scritta di laboratorio, seguita da un?eventuale prova orale da svolgersi a discrezione della docente o su richiesta dello studente. Entrambe le parti prevedono la possibilità di svolgere una prova parziale, somministrata a metà del ciclo di lezioni.\r\n\r\nModulo Laboratorio di Algoritmi e Strutture Dati: Pre-Assessment: Non è prevista nessuna valutazione preliminare. I prerequisiti del modulo sono chiaramente descritti sulla pagina del modulo. Formative Assessment: Durante lo svolgimento delle lezioni gli studenti sono invitati ad interagire con la docente, a porre domande e a discutere su argomenti proposti in classe. Summative Assessment: L\\\'esame consiste in una prova scritta e in un eventuale colloquio orale (a discrezione della docente in presenza di errori significativi nell?elaborato scritto, o su richiesta dello studente per migliorare il voto conseguito allo scritto). Il colloquio deve essere svolto nell?ambito della stessa sessione d?esame della prova scritta e, a partire dalla discussione della prova scritta, verte sugli argomenti in programma. Per aiutare gli studenti a dividere il carico di lavoro, è data la possibilità di svolgere una prova scritta intermedia sugli argomenti svolti nella prima parte del corso. La prova scritta consiste nello svolgimento di esercizi di programmazione in Java volti a valutare il livello di conoscenza e comprensione degli argomenti e l?abilità pratica. Il voto finale del Corso di Algoritmi e Strutture Dati (12 CFU) si ottiene come voto medio conseguito nei due Moduli di Algoritmi e Strutture Dati (6 CFU) e Laboratorio di Algoritmi e Strutture Dati (6 CFU).', ' Modulo Algoritmi e Strutture Dati: Lezioni frontali\r\n\r\nModulo Laboratorio di Algoritmi e Strutture Dati: Lezioni frontali ed esercitazioni.', '- By the end of this module students will be able to: 1) understand the importance of designing efficient algorithms; 2) analyze the resources (space and time) needed by an algorithm; 3) known efficient algorithms for basic computational problems (sorting, searching, graph problems, etc.).\r\n\r\n- The aim is to make the student capable of abstracting models and formal algorithmic problems from real computational problems, and designing efficient algorithmic solutions.\r\n\r\n- Through the presentation and the comparison of different solutions to a given probelm, students will be guided to learn and to identify independently their most efficient solution.\r\n\r\n- The course will encourage the development of the following skills of the student: capability of formally presenting and modelling concrete problems, focusing on their main features and discarding the inessential ones.\r\n\r\n- The course aims to develop in undergraduate students competencies and abilities necessary in their future studies, especially with respect to advanced algorithmic courses.\r\n         ', ' Modulo Algoritmi e Strutture Dati\r\nAnalisi della complessità di un algoritmo\r\nAlgoritmi di ordinamento (insertion-sort, selection-sort, merge-sort).\r\nCode di priorità. heap binari, heap binomiali, heap-sort.\r\nIl problema del dizionario: ricerca, inserimento, cancellazione. Gestione di dizionari: alberi AVL, tabelle hash.\r\nGrafi: rappresentazioni, algoritmi di visita e connessione.\r\nAlgoritmi elementari su grafi: cammino minimo, minimo albero ricoprente.\r\n\r\nModulo Laboratorio di Algoritmi e Strutture Dati\r\nIl Linguaggio Java: richiami sui concetti fondamentali; interfacce e classi astratte; Generics; classi e interfacce del Java Collection Framework.\r\nStrutture dati elementari e loro implementazione in Java: liste, stack e code. Implementazione delle liste mediante array e liste collegate semplici. Uso delle classi standard (client code perspective).\r\nAlgoritmi di ricerca ed ordinamento e loro implementazione in Java: ricerca sequenziale e binaria; bubble-sort, insertion-sort, selection-sort, merge-sort, quick-sort.\r\nStrutture dati avanzate e loro implementazione in Java: alberi binari, visite BFS e DFS; alberi binari di ricerca (BST), BST bilanciati, alberi red-black, strutture dati union-find.\r\nCode con priorità e loro implementazione in Java: heap binari, code con priorità implementate mediante heap binari; algoritmo di ordinamento basato sulle code con priorità, implementazione Java dell\\\'algoritmo heap-sort.\r\nGrafi: rappresentazione dei modelli di grafo orientato/non orientato ed etichettato/non etichettato; implementazione in Java delle visite BFS e DFS; implementazione in Java dei classici algoritmi per i problemi della ricerca del cammino minimo da sorgente singola e della ricerca del minimo albero ricoprente.', ' Gli studenti immatricolati nell\\\'A.A. 2013/2014 devono necessariamente sostenere l\\\'esame di Fondamenti di Programmazione con Laboratorio prima di poter sostenere l\\\'esame di questo corso. Gli studenti immatricolati prima fino all\\\'A.A. 2012/2013 devono necessariamente sostenere l\\\'esame di Laboratorio di Programmazione II prima di poter sostenere l\\\'esame di questo corso.', 'ita', 1),
(2, '', '', '', '', '', '', '', 'eng', 1),
(10, 'Conoscere: - strutture dati elementari (array, liste, ?) - concetto di ricorsione - sommatorie, dimostrazione per induzione e calcolo infinitesimale.', 'L\\\'obiettivo del corso è quello di fornire allo studente competenze di base sui metodi di rappresentazione delle principali strutture di dati, sui rispettivi algoritmi fondamentali per la loro gestione e sulla valutazione della complessità computazionale di un algoritmo e di un problema. Infine, mira a sviluppare un?intuizione finalizzata alla soluzione efficiente di problemi computazionali', 'L\\\'esame va svolto congiuntamente con la parte di laboratorio e consiste in: una prova scritta e una prova orale di teoria, da svolgersi obbligatoriamente una prova scritta di laboratorio, seguita da un?eventuale prova orale da svolgersi a discrezione della docente o su richiesta dello studente. Entrambe le parti prevedono la possibilità di svolgere una prova parziale, somministrata a metà del ciclo di lezioni.', 'Lezioni frontali', '- By the end of this module students will be able to: 1) understand the importance of designing efficient algorithms; 2) analyze the resources (space and time) needed by an algorithm; 3) known efficient algorithms for basic computational problems (sorting, searching, graph problems, etc.).\r\n\r\n- The aim is to make the student capable of abstracting models and formal algorithmic problems from real computational problems, and designing efficient algorithmic solutions.\r\n\r\n- Through the presentation and the comparison of different solutions to a given probelm, students will be guided to learn and to identify independently their most efficient solution.\r\n\r\n- The course will encourage the development of the following skills of the student: capability of formally presenting and modelling concrete problems, focusing on their main features and discarding the inessential ones.\r\n\r\n- The course aims to develop in undergraduate students competencies and abilities necessary in their future studies, especially with respect to advanced algorithmic courses.\r\n', '- Analisi della complessità di un algoritmo.\r\n- Algoritmi di ordinamento (insertion-sort, selection-sort, merge-sort).\r\n- Code di priorità. heap binari, heap binomiali, heap-sort.\r\n- Il problema del dizionario: ricerca, inserimento, cancellazione. Gestione di dizionari: alberi AVL, tabelle hash.\r\n- Grafi: rappresentazioni, algoritmi di visita e connessione.\r\n- Algoritmi elementari su grafi: cammino minimo, minimo albero ricoprente.', 'informazioni varie', 'ita', 10),
(11, 'Students have to know: - elementary data structures (array, list, ?) - recursion - summation, proof by induction, calculus', 'To provide the students with competences about main data structures and algorithms, and to make them learn how to analyze the computational complexity of algorithms and problems. Finally, to develop an intuition about how to solve efficiently a computational problem.', 'The exam should be completed jointly with the lab module. It consists of: - a written and oral examination on the theory module: - a written (mandatory) and oral (optional) examination on the lab module. Both parts provides also an (optional) intermediate written examination.', 'Lectures', '- By the end of this module students will be able to: 1) understand the importance of designing efficient algorithms; 2) analyze the resources (space and time) needed by an algorithm; 3) known efficient algorithms for basic computational problems (sorting, searching, graph problems, etc.).\r\n\r\n- The aim is to make the student capable of abstracting models and formal algorithmic problems from real computational problems, and designing efficient algorithmic solutions.\r\n\r\n- Through the presentation and the comparison of different solutions to a given probelm, students will be guided to learn and to identify independently their most efficient solution.\r\n\r\n- The course will encourage the development of the following skills of the student: capability of formally presenting and modelling concrete problems, focusing on their main features and discarding the inessential ones.\r\n\r\n- The course aims to develop in undergraduate students competencies and abilities necessary in their future studies, especially with respect to advanced algorithmic courses.', '- Algorithms and problems. Complexity analysis of an algorithm. Lower and upper bound.\r\n- Sorting algorithms: insertion-sort, selection-sort, merge-sort, quick-sort.\r\n- Priority queues: binary heaps, binomial heaps, heap-sort.\r\n- The dictionary problem: searching, inserting, deleting. Hast tables and AVL trees.\r\n- Graphs: definitions, memory representations, DFS and BFS.', 'various info', 'eng', 10),
(12, '', '', '', '', '', '', '', 'ita', 11),
(13, 'A basic understanding of programming in Java and a background in discrete mathematics are necessary prerequisites to this module.', 'This module invites students to study and implement the most important algorithms and data structures for information processing. The module focuses on techniques for the design and analysis of efficient algorithms, emphasizing methods useful in practice. Topics include lists, stacks, queues, trees, heaps and priority queues, binary search trees (including red-black), union-find for disjoint sets and graphs and evaluation of classic algorithms that use these structures for tasks such as sorting and searching. The module encourages students to develop implementations using the Java language, understand their performance characteristics, and estimate their potential effectiveness in applications using lectures and exercises.', 'Pre-Assessment: There is no formal pre-assessment, but Course pre-requisites are clearly stated on the Module website. Formative Assessment: The formative assessment is performed via interaction between teacher and students during lectures. Students are involved in questioning and discussion, by means of open oral questions to the entire class. Summative Assessment: Written test followed by an optional oral exam. The oral exam can be required either by the student, to improve grades, or by the teacher, in presence of significant mistakes/misunderstandings in the written exam. The oral exam will occur within the same exam session of the written test and will typically cover the areas of the written answers that need clarification plus, possibly, additional subjects proposed by the teacher. An optional mid-term written test will also be provided, which is meant to cover the first part of the course, in order to help the students to split the workload. The written exam consists of a set of exercises to assess: (i) whether the student knows, can motivate and can compare the concepts, the implementation and the time and memory requirements of the data structures and algorithms; (ii) a student\\\\\\\'s general knowledge and understanding on the module material; (iii) a student\\\\\\\'s practical skills in selecting and applying suitable data structures and algorithms in software development and general problem solving. This involves writing program code with pen and paper. Criteria of evaluation will be the level of knowledge and understanding, and practical ability. The final marks of the Algorithms and Data Structures with Laboratory 12 CFU Course are roughly obtained as the average among the marks of the Algorithms and Data Structures and the Laboratory of Algorithms and Data Structures 6 CFU modules.', 'Lectures and exercises will be held two times a week. The main goal is to present and discuss the content that is covered in this module, and illustrate the concepts using specific code examples.', '- Know classical algorithms and data structures for information processing and their implementations, with particular focus on computational complexity aspects, and be aware of the effects of data organization and algorithms on program efficiency; Be familiar with standard techniques for designing algorithms, including the techniques of recursion, divide-and-conquer, and greedy and understand how apply them to design efficient algorithms for different kinds of problems.\r\n- Be able to apply their knowledge of data structures and algorithmic techniques to design efficient algorithms that correctly satisfy a given specification and write more efficient programs in Java; Be able to rigorously analyze the relative time and space efficiency of competing algorithms and carry out a comparative evaluation of merits in terms of efficiency and applicability of standard data structure.\r\n\r\n- Be able to identify efficient solutions to a given problem and choose appropriate data structures that effectively model the information in a problem; Judge efficiency tradeoffs among alternative data structure implementations or combinations.\r\n\r\n- Demonstrate the capability of formally presenting and modeling concrete problems and explain the most important characteristics concerning the standard data structures, their analyses, and their Java implementations.\r\n\r\n- Have an understanding of the role and characteristics of data structures and of the importance of time and space efficiency in designing algorithms and writing programs; To be able to recognize and look up variations of the material studied in the literature.\r\n', '- Java review. Interfaces and abstract classes. Generics. The Java Collection Framework Interfaces and classes.\r\n- Elementary data structures and their implementation in Java: lists, stacks and queues. Array and singly linked list implementations of lists, stacks and queues. Use of the standard classes from a client code perspective.\r\n-Searching and sorting algorithms and their implementation in Java: sequential and binary search; bubble-sort, insertion-sort, selection-sort, merge-sort, quick-sort.\r\n-Graphs: representations for both directed/undirected and weighted/unweighted models; Java implementation of breadth-first search and depth-first search; Java implementation of classical graph algorithms for solving the single-source shortest path problem and the minimum spanning tree problem.', 'other info', 'eng', 11),
(14, 'metodi e nozioni matematiche di base insegnate al liceo', 'Acquisire conoscenze fondamentali e raggiungere un uso consapevole di metodi di base dell\\\'analisi matematica', 'Prova scritta ed orale', 'Lezione ed esercitazioni', '', '- Successioni numeriche\r\n- Serie numeriche\r\n- Limiti e continuità per funzioni reali di una variabile reale\r\n- Calcolo differenziale ed integrale per funzioni di una variabile reale\r\n- Limiti, continuità e calcolo differenziale per funzioni reali di più variabili\r\n- Calcolo integrale per funzioni di più variabili\r\n- Integration (basic properties, the Riemann definition, the Fundamental Theorem of Calculus, integration by parts and substitution, improper integrals)', '', 'ita', 12),
(15, 'Basic mathematical notions and methods as learnt at high school', 'To give students a rigorous understanding of the theory of real- and vector-valued functions. Students will acquire an understanding of basic properties of the field of real numbers, concepts of infinity, limits of functions and methods for calculating them, continuity, differentiation, integration and Taylor series.', 'Written and oral exam', 'Lectures and exercise classes', '- have a good knowledge and understanding of basic properties of real numbers, functions; demonstrate an understanding of basic topics in the analysis of functions, including limits, continuity, differentiation, Taylor-MacLaurin series, and integration;\r\n\r\n- be able to apply his knowledge and understanding to tackle basic problems from applied mathematics and engineering; understand formal mathematical definitions and theorems, and apply them to prove statements about functions;\r\n\r\n- demonstrate skills in mathematical reasoning and ability to conceive a proof;\r\n\r\n- be able to explain the main notions and results of mathematical analysis;\r\n\r\n- demonstrate capacity to read and understand advanced texts.', '- Set theory (basic notations and concepts), real numbers (basic properties, order, completeness), mathematical induction\r\n- Sequences and series (convergence, divergence and irregularity, convergence criteria)\r\n- Functions (injectivity, surjectivity, invertibility, composition)\r\n- Limits (basic definitions, the Sandwich Rule, boundedness)\r\n- Continuity (basic definitions, the Intermediate Value Theorem, numerical methods for solving equations)\r\n- Differentiation (basic definitions, rules and properties, Rolle?s Theorem, the Mean Value Theorem), L?Hopital?s Rule (techniques and applications), Taylor?s Theorem (polynomial approximations to functions, convergence criteria for Taylor series)\r\n- Integration (basic properties, the Riemann definition, the Fundamental Theorem of Calculus, integration by parts and substitution, improper integrals)', '', 'eng', 12),
(22, 'Antonello', '', '', '', '', '', '', 'ita', 17),
(23, '', '', '', '', '', '', '', 'eng', 17),
(24, 'metodi e nozioni matematiche di base insegnate al liceo', 'Acquisire conoscenze fondamentali e raggiungere un uso consapevole di metodi di base dell\\\'analisi matematica', 'Prova scritta ed orale', 'Lezione ed esercitazioni', '', '- Successioni numeriche\r\n- Serie numeriche\r\n- Limiti e continuità per funzioni reali di una variabile reale\r\n- Calcolo differenziale ed integrale per funzioni di una variabile reale\r\n- Limiti, continuità e calcolo differenziale per funzioni reali di più variabili\r\n- Calcolo integrale per funzioni di più variabili\r\n- Integration (basic properties, the Riemann definition, the Fundamental Theorem of Calculus, integration by parts and substitution, improper integrals)', '', 'ita', 18),
(25, 'Basic mathematical notions and methods as learnt at high school', 'To give students a rigorous understanding of the theory of real- and vector-valued functions. Students will acquire an understanding of basic properties of the field of real numbers, concepts of infinity, limits of functions and methods for calculating them, continuity, differentiation, integration and Taylor series.', 'Written and oral exam', 'Lectures and exercise classes', '- have a good knowledge and understanding of basic properties of real numbers, functions; demonstrate an understanding of basic topics in the analysis of functions, including limits, continuity, differentiation, Taylor-MacLaurin series, and integration;\r\n\r\n- be able to apply his knowledge and understanding to tackle basic problems from applied mathematics and engineering; understand formal mathematical definitions and theorems, and apply them to prove statements about functions;\r\n\r\n- demonstrate skills in mathematical reasoning and ability to conceive a proof;\r\n\r\n- be able to explain the main notions and results of mathematical analysis;\r\n\r\n- demonstrate capacity to read and understand advanced texts.', '- Set theory (basic notations and concepts), real numbers (basic properties, order, completeness), mathematical induction\r\n- Sequences and series (convergence, divergence and irregularity, convergence criteria)\r\n- Functions (injectivity, surjectivity, invertibility, composition)\r\n- Limits (basic definitions, the Sandwich Rule, boundedness)\r\n- Continuity (basic definitions, the Intermediate Value Theorem, numerical methods for solving equations)\r\n- Differentiation (basic definitions, rules and properties, Rolle?s Theorem, the Mean Value Theorem), L?Hopital?s Rule (techniques and applications), Taylor?s Theorem (polynomial approximations to functions, convergence criteria for Taylor series)\r\n- Integration (basic properties, the Riemann definition, the Fundamental Theorem of Calculus, integration by parts and substitution, improper integrals)', '', 'eng', 18),
(26, 'Calcolo algebrico, trigonometria, analisi matematica (funzioni, derivate ed integrali).', 'Il corso intende fornire allo studente le seguenti conoscenze e competenze: conoscenza dei principi di base della meccanica con particolare riguardo ai concetti di forza, energia e propagazione ondosa; capacità (da acquisire attraverso esercitazioni in aula e a casa) di schematizzare un fenomeno naturale, di applicare correttamente le leggi fisiche che lo descrivono, e valutare l\\\'attendibilità dei risultati ottenuti.', 'L\\\'esame prevede una PROVA SCRITTA (o due prove parziali di esonero della prova scritta) e una PROVA ORALE.', 'Lezioni ed esercitazioni alla lavagna. Verifiche di apprendimento mediante esercizi da svolgere autonomamente in classe e a casa.', 'Alla fine del corso, lo studente dovrebbe:\r\n- aver acquisito: una buona conoscenza e comprensione dei concetti fondamentali della fisica, e un metodo di ragionamento logico e rigoroso nell\\\'approcciare un problema fisico.\r\n- essere in grado di schematizzare un fenomeno naturale e di applicare correttamente le leggi fondamentali della fisica per risolvere semplici problemi di meccanica. La mentalità acquisita in questo corso potrà risultare utile anche nell\\\'affrontare problemi relativi ad altri campi della scienza.\r\n- essere capace di scegliere il modello più appropriato per descrivere un fenomeno fisico ed essere consapevole dei livelli di approssimazione adottati.\r\n- essere in grado di comunicare in maniera semplice, e allo stesso tempo rigorosa, le conoscenze acquisite in Fisica ad altri colleghi ed anche a non esperti del settore.\r\n- essere in grado di comprendere altri argomenti di Fisica Generale non svolti in questo corso.', '- Cinematica del punto materiale: moti ad una e più dimensioni, moti relativi, composizione vettoriale delle velocità.\r\n- Dinamica del punto materiale: le leggi di Newton, concetto di forza, forza peso, reazioni vincolari, attrito radente, attrito viscoso, forza elastica, moto armonico, pendolo semplice, sistemi di riferimento inerziali e non inerziali, forze apparenti.\r\n- Lavoro, energia, momenti: definizione di lavoro, teorema dell\\\'energia cinetica, lavoro della forza peso e della forza elastica, forze conservative, energia potenziale, energia meccanica, quantità di moto e impulso, momento di una forza, momento angolare.\r\n- Dinamica di un sistema di particelle: forze esterne e forze interne, quantità di moto del sistema, prima equazione cardinale della dinamica, sistema isolato e conservazione della quantità di moto, moto del centro di massa, urti.\r\n- Gravitazione: leggi di Keplero, legge di gravitazione universale, esperimento di Cavendish, energia potenziale gravitazionale, campo gravitazionale, moto di un satellite in orbita circolare, velocità di fuga.\r\n- Onde in mezzi elastici: onde longitudinali e trasversali, descrizione matematica della propagazione ondosa, onde armoniche, equazione di D\\\'Alembert, corda vibrante, onde elastiche in una sbarra e in un gas, interferenza, battimenti, onde stazionarie, effetto Doppler.', 'informazioni agguntive', 'ita', 19),
(27, 'Algebraic calculus, trigonometry, mathematical analysis (functions, derivatives and integrals).', 'The goal of the course is to provide the students with knowledge of basic principles of the mechanics with particular regard to the concepts of force, energy and wave propagation; and with the  ability (through classroom excercises and homeworks) to schematize a natural phenomenon, to apply the proper physical laws, and to critically evaluate the results.', 'The exam consists in a written test (or two intermediate written tests) and an oral examination.', 'Lectures and exercises on blackboard. Learning checks with exercises to be solved in class or at home.', 'On successful completion of this course, the student should:\r\n- have acquired a good knowledge and understanding of the fundamental concepts in Physics and a method of logical and rigorous approach to a physical problem.\r\n- be able to schematize a natural phenomenon and to apply correctly basic physical laws to solve simple problems in mechanics. \r\n- be able to choose the proper model to describe a physical phenomenon and be aware of the degree of approximation adopted.\r\n- be able to communicate in a simple but rigorous way the acquired knowledge in Physics to other colleagues as well as to non-experts.\r\n- be able to understand other topics in General Physics not covered in this course.', '- Kinematics of a point particle: motion in one and more dimensions, relative motions, vectorial composition of velocities.\r\n- Dynamics of a point particle: Newton?s laws, concept of force, weight force, constraint reaction forces, sliding friction, viscous friction, elastic force, harmonic motion, the simple pendulum, inertial and non-inertial frames of reference, fictitious forces.\r\n- Work, energy, momentum: definition of work, theorem of kinetic energy, work of the weight, work of the elastic force, conservative forces, potential energy, mechanical energy, momentum and impulse, torque, angular momentum.\r\n- Dynamics of a system of particles: external and internal forces, momentum of the system, first cardinal equation of the dynamics, isolated system and conservation of momentum, motion of the center of mass, collisions.\r\n- Gravitation: Kepler?s laws, law of universal gravitation, Cavendish experiment, gravitational potential energy, gravitational field, motion of a satellite in circular orbit, escape velocity.\r\n- Waves in elastic media: longitudinal and transverse waves, mathematical description of wave propagation, harmonic waves, D\\\\\\\'Alembert equation, vibrating string, elastic waves in a bar and in a gas, interference, beats, standing waves, Doppler effect.', 'other info', 'eng', 19),
(28, '', '', '', '', '', '', 'corso mutuato da sistemi operativi', 'ita', 20),
(29, '', '', '', '', '', '', '', 'eng', 20),
(30, '- Modulo Laboratorio di Sistemi Operativi: Argomenti trattati nel modulo di Sistemi Operativi, algoritmi e strutture dati, architetture degli elaboratori, progettazione e programmazione di semplici soluzioni software per problemi elementari, programmazione in linguaggio C. Capacità di integrazione dello studio di aula con lo studio di personale. Lettura e comprensione della lingua inglese.\r\n\r\n- Modulo Sistemi Operativi: Le conoscenze acquisite al corso di Lab. Programmazione II sono fortemente consigliate al fine di sostenere tale esame. CONOSCENZE : fondamenti di programmazione, algoritmi e strutture dati, architetture degli elaboratori, lettura e comprensione in lingua inglese CAPACITA\\\' : capacita? di integrazione dello studio in aula con lo studio personale, capacita? di esprimere in aula perplessita? e dubbi in modo da originare momenti comuni di confronto.', '- Modulo Laboratorio di Sistemi Operativi: L\\\'obiettivo di questo corso è quello di fornire un\\\'introduzione completa ai sistemi operativi Unix-like. I contenuti del corso sono organizzati come segue: PARTE I ? Architettura di Sistemi UNIX PARTE II - Linea di comando (shell Bash) PARTE III - Bash Scripting PARTE IV - Programmazione in ambienti Unix-like Il corso offre una conoscenza di base, ma comunque completa, dei seguenti aspetti pratici: architettura di sistemi Unix-like, interazione da riga di comando, scripting di shell, files and directories, chiamate di sistema, programmazione di sistema, gestione dei processi e programmazione concorrente.\r\n\r\n- Modulo Sistemi Operativi: CONOSCENZE : concetti di base comuni a tutti i sistemi operativi, meccanismi e strategie dei sistemi operativi, tradeoff tra overhead di sistema ed efficienza delle soluzioni CAPACITA\\\' : capacita? di mettere in relazione contenuti di argomenti differenti; capacita? di risoluzione di esercizi che propongono modelli mai affrontati in teoria, ma risolvibili mediante deduzioni logiche e conoscenze di base (i.e., analisi e sintesi di concetti); capacita? di lavorare durante lo svolgimento del corso, e di non rinviare il raffinamento ed il consolidamento della conoscenza; migliorata capacita? di esprimere in aula perplessita? e dubbi COMPORTAMENTI ATTESI : interesse per una conoscenza integrata dei differenti aspetti dell?informatica; consapevolezza delle inter-relazioni tra le diverse parti di un elaboratore, e quindi del fatto che il suo corretto funzionamento deriva dalla combinazione di fattori molto differenti, ed a volte inattesi.', '- Modulo Laboratorio di Sistemi Operativi: Per la prima sessione, la prova di esame consiste in (1) una prova intermedia scritta (I Parziale) + una prova conclusiva scritta (II Parziale) oppure (2) una sola prova totale scritta. L\\\'esame è superato se il voto della prova totale scritta oppure il voto finale come media dei due parziali è maggiore o uguale a 18. Per le sessione seguenti, la prova di esame consiste di una sola prova totale scritta.\r\n\r\n- Modulo Sistemi Operativi: Pre-Assessment There is no formal pre-assessment, but Course pre-requisites are clearly stated on the Module website. Fulfilment of such pre-requisites is verified by formative assessment. Formative Assessment The formative assessment is performed via interactive interaction beteween teacher and students during lectures. Students are aware since the beginning of the Course that they will be involved (in turns) in: - Questioning and discussion, by means of open oral questions to the class or to single students. Summative Assessment Written test followed by an optional oral exam. An optional mid-term written test is also be provided, which is meant to cover the first part of the course, in order to help the students to split the workload. The written test is aimed at: (1) verification of theoretical competences, and in particular of knowledge and comprehension of Course contents; (2) verification of skills in understanding and solving significant exercises, and in explaining the proposed solutions. This in order to verify the ability of application of techniques learnt during the Course, of analysis of problems and synthesis of suitable solutions, and of evaluation of alternative solutions. Criteria of evaluation will be: the level of knowledge and practical ability; the property of use of the technical/mathematical language; the clarity and completeness of explanations. The oral exam will occur within one week of the written test and will typically cover the areas of the written answers that need clarification plus additional subjects proposed by the teacher. The oral test can be required: (i) by the student, to improve final marks; (ii) by the teacher, in presence of significant mistakes/misunderstandings in the written test. Assessment breakdown: 100% mid-term plus end-of-semester summative assessment. The written test (2 hours) consists, in general, in: (a)	Three exercises to solve; (b)	A list of about 3-4 questions to answer. The oral test (max 1 hour) consists of questions on the written exam and extra ones. The final marks of the Operating Systems with Laboratory 12 CFU Module are obtained as the average among the marks of the Operating Systems and Operating Systems Laboratory 6 CFU Modules.', '- Modulo Sistemi Operativi: Pre-Assessment There is no formal pre-assessment, but Course pre-requisites are clearly stated on the Module website. Fulfilment of such pre-requisites is verified by formative assessment. Formative Assessment The formative assessment is performed via interactive interaction beteween teacher and students during lectures. Students are aware since the beginning of the Course that they will be involved (in turns) in: - Questioning and discussion, by means of open oral questions to the class or to single students. Summative Assessment Written test followed by an optional oral exam. An optional mid-term written test is also be provided, which is meant to cover the first part of the course, in order to help the students to split the workload. The written test is aimed at: (1) verification of theoretical competences, and in particular of knowledge and comprehension of Course contents; (2) verification of skills in understanding and solving significant exercises, and in explaining the proposed solutions. This in order to verify the ability of application of techniques learnt during the Course, of analysis of problems and synthesis of suitable solutions, and of evaluation of alternative solutions. Criteria of evaluation will be: the level of knowledge and practical ability; the property of use of the technical/mathematical language; the clarity and completeness of explanations. The oral exam will occur within one week of the written test and will typically cover the areas of the written answers that need clarification plus additional subjects proposed by the teacher. The oral test can be required: (i) by the student, to improve final marks; (ii) by the teacher, in presence of significant mistakes/misunderstandings in the written test. Assessment breakdown: 100% mid-term plus end-of-semester summative assessment. The written test (2 hours) consists, in general, in: (a)	Three exercises to solve; (b)	A list of about 3-4 questions to answer. The oral test (max 1 hour) consists of questions on the written exam and extra ones. The final marks of the Operating Systems with Laboratory 12 CFU Module are obtained as the average among the marks of the Operating Systems and Operating Systems Laboratory 6 CFU Modules.\r\n\r\n- Modulo Sistemi Operativi: The module includes 54 hours of frontal lectures plus 30 hours of on-demand clarifications in the teacher\\\'s office. The frontal lectures are partitioned in theory and exercises.', 'Alla fine del corso, lo studente dovrebbe\r\n\r\nMODULO LABORATORIO DI SISTEMI OPERATIVI:\r\n- aver acquisito le conoscenze teoriche necessarie per comprendere come i sistemi operativi possono offrire le loro principali funzionalità;\r\n- aver acquisto le capacità pratiche necessarie per sviluppare programmi di sistema e script bash in ambienti Unix-like;\r\n- essere in grado di sviluppare programmi concorrenti che utilizzano semafori, mutex e variabili condizionali per la sincronizzazione;\r\n- aver acquisito le metodologie per valutare i diversi sistemi operativi integrando tutte le nozioni acquisite durante il corso;\r\n\r\nMODULO DI SISTEMI OPERATIVI\r\n- Gli studenti dovranno conoscere i concetti di base che sono comuni a tutti i sistemi operativi general-purpose, in particolare quelli relativi alla gestione di CPU e memoria centrale. Gli studenti devono anche essere in grado di mettere in relazione questi concetti al fine di sintetizzare i tradeoffs intrinseci che sono alla base di una macchina virtuale (intesa come un computer più il suo sistema operativo).\r\n- Gli studenti dovranno sicuramente essere in grado di risolvere problemi complessi legati alla sincronizzazione tra processi concorrenti. Inoltre essi dovranno essere in grado di applicare le strategie di sistema operativo studiate nel corso (come scheduler della CPU, paginazione della memoria, ecc) a esempi specifici.\r\n- Gli studenti dovranno essere in grado di selezionare le soluzioni migliori (tra quelle studiate nel corso) per esempi specifici.\r\n- Gli studenti dovranno essere in grado di spiegare in modo critico perché i sistemi operativi esistenti funzionano nel modo attuale, basandosi anche sulle nozioni storiche che hanno ricevuto nel corso e che aiutano a capire lo stato dell\\\'arte nel settore.', 'Modulo Laboratorio di Sistemi Operativi:\r\n- PARTE I - Architettura di Sistemi UNIX\r\n- PARTE II - Linea di comando (shell Bash)\r\n- PARTE III - Bash Scripting\r\n\r\nModulo Sistemi Operativi:\r\n- Concetti generali, strutture dei sistemi di calcolo e dei sistemi operativi\r\n- I processi e lo scheduling della CPU\r\n- Sincronizzazione tra processi e la gestione del deadlock\r\n- Gestione della memoria principale\r\n- La memoria virtuale\r\nIl file system', 'informazioni aggiuntive', 'ita', 21),
(31, 'Module Laboratorio di Sistemi Operativi: Topics treated by the Operating Systems module, algorithms and data structures, computer architecture, design and programming of simple software solutions to elementary problems, programming in the C language. Ability to integrate classroom study room with personal study. Reading comprehension of English.\r\n\r\nModule Sistemi Operativi: KNOWLEDGE : fundamentals of programming, algorithms and data structures, computer architecture, reading and understanding english language SKILLS : ability to integrate classroom and homework study, ability to pose questions in the classroome to originate discussion.', 'Module Laboratorio di Sistemi Operativi:\r\nThe objective of this course is to provide a complete introduction to Unix-like systems. Contents are organized as follow: PART I - UNIX System Architecture PART II - Command Line (Bash shell) PART III - Bash Scripting PART IV - Programming in UNIX-like Environment The course offers a basic, yet complete, knowledge of the following practical aspects: Unix-like systems architecture, command line interaction, shell scripting, files and directories, system calls, system-programming, process management, and concurrent programming.\r\n\r\nModule Sistemi Operativi:\r\n KNOWLEDGE: basic concepts common to all the operating systems, mechanisms and policies of operating systems, system overhead vs solution efficiency tradeoff SKILLS : ability to relate different topics, ability to solve problems never faced in classroom, but solvable through logic deductions and reasoning (i.e., ability to analyze and synthesize concepts), ability to work during the course time and do not delaying the refinement of the knowledge, improved ability to pose questions in the classroome to originate discussion EXPECTED BEHAVIORS : interest for an integrated knowledge of different aspects of computer science, awareness of relationships among computer subsystems, hence awareness of the fact that a satisfactory behavior of a computer may derive from the combination of very different (sometimes unexpected) factors.', 'Module Laboratorio di Sistemi Operativi: For the 1st session, the exam consists of (1) a midterm written exam + a final written exam or (2) a total written exam. The exam is passed if the score of the total written exam or the final score as the average of the midterm written exam + the final written exam is greater or equal to 18. For later sessions, the exam consists of only a total written exam.\r\n\r\nModule Sistemi Operativi: Pre-Assessment There is no formal pre-assessment, but Course pre-requisites are clearly stated on the Module website. Fulfilment of such pre-requisites is verified by formative assessment. Formative Assessment The formative assessment is performed via interactive interaction beteween teacher and students during lectures. Students are aware since the beginning of the Course that they will be involved (in turns) in: - Questioning and discussion, by means of open oral questions to the class or to single students. Summative Assessment Written test followed by an optional oral exam. An optional mid-term written test is also be provided, which is meant to cover the first part of the course, in order to help the students to split the workload. The written test is aimed at: (1) verification of theoretical competences, and in particular of knowledge and comprehension of Course contents; (2) verification of skills in understanding and solving significant exercises, and in explaining the proposed solutions. This in order to verify the ability of application of techniques learnt during the Course, of analysis of problems and synthesis of suitable solutions, and of evaluation of alternative solutions. Criteria of evaluation will be: the level of knowledge and practical ability; the property of use of the technical/mathematical language; the clarity and completeness of explanations. The oral exam will occur within one week of the written test and will typically cover the areas of the written answers that need clarification plus additional subjects proposed by the teacher. The oral test can be required: (i) by the student, to improve final marks; (ii) by the teacher, in presence of significant mistakes/misunderstandings in the written test. Assessment breakdown: 100% mid-term plus end-of-semester summative assessment. The written test (2 hours) consists, in general, in: (a)	Three exercises to solve; (b)	A list of about 3-4 questions to answer. The oral test (max 1 hour) consists of questions on the written exam and extra ones. The final marks of the Operating Systems with Laboratory 12 CFU Module are obtained as the average among the marks of the Operating Systems and Operating Systems Laboratory 6 CFU Modules.', 'Module Laboratorio di Sistemi Operativi: Lectures and exercises\r\n\r\nModule Sistemi Operativi: The module includes 54 hours of frontal lectures plus 30 hours of on-demand clarifications in the teacher\\\\\\\'s office. The frontal lectures are partitioned in theory and exercises.', 'On successful completion of this course, the student should\r\n\r\nMODULE LABORATORIO DI SISTEMI OPERATIVI\r\n- acquire the theoretical knowledge necessary to understand how operating systems can implement their main functionalities;\r\n- acquire the practical capabilities necessary to develop system programs and bash scripts in Unix-like environments;\r\n- will be able to develop concurrent programs using semaphores, mutex and condition variables for synchronization;\r\n- acquire methodologies to evaluate different operating systems bny integrating all the notions acquired during the course;\r\n- be able to communicate with competence and correctness of language the issues related with operating systems and systems programming;\r\n\r\nMODULE SISTEMI OPERATIVI\r\n- Students shall know the basic concepts that are common to all general-purpose operating systems, in particular the ones related to the management of CPU and central memory. Students shall also be able to relate these concepts in order to synthesize the intrinsic tradeoffs that underlie a virtual machine (i.e. a computer plus its operating system).\r\n- Students shall definitely be able to solve complex problems related to the synchronization among concurrent processes. Beside, they shall also be able to apply the operating system policies studied in the course (such as CPU schedulers, pagers, etc.) to specific examples.\r\n- Students shall be able to select the best solutions (among those studied in the course) for specific examples.\r\n- Students shall be able to critically explain why the existing operating systems operate in their ways, basing also on the historical notions that they have received in the course and that help to understand the current state-of-art.\r\n- On the basis of the knowledge and capacities acquired in this course, the students shall be able in the future to tackle any actual operating system, by just studying its handbook. This is expected because their knowledge is independent on any specific existing system in this course module, with the goal of providing general instruments suitable for a continuous learning in this domain.', 'Module Laboratorio di Sistemi Operativi:\r\n- PART I - UNIX System Architecture\r\n- PART II - Command Line (Bash shell)\r\n- PART III - Bash Scripting\r\n- PART IV - Programming in UNIX-like Environment\r\n\r\nModule Sistemi Operativi:\r\n- General concepts, computer system and operating system structures\r\n- Processes and CPU scheduling\r\n- Process synchronization and deadlock management\r\n- Memory management', 'other info', 'eng', 21);
INSERT INTO `info_corsi` (`id`, `prerequisiti`, `obiettivi`, `mod_esame`, `mod_insegnamento`, `descrittori_dublino`, `sillabo`, `note`, `lang`, `id_corso`) VALUES
(32, 'Le conoscenze acquisite al corso di Lab. Programmazione II sono fortemente consigliate al fine di sostenere tale esame. CONOSCENZE : fondamenti di programmazione, algoritmi e strutture dati, architetture degli elaboratori, lettura e comprensione in lingua inglese CAPACITA\\\' : capacita? di integrazione dello studio in aula con lo studio personale, capacita? di esprimere in aula perplessita? e dubbi in modo da originare momenti comuni di confronto.', 'CONOSCENZE : concetti di base comuni a tutti i sistemi operativi, meccanismi e strategie dei sistemi operativi, tradeoff tra overhead di sistema ed efficienza delle soluzioni CAPACITA\\\' : capacita? di mettere in relazione contenuti di argomenti differenti; capacita? di risoluzione di esercizi che propongono modelli mai affrontati in teoria, ma risolvibili mediante deduzioni logiche e conoscenze di base (i.e., analisi e sintesi di concetti); capacita? di lavorare durante lo svolgimento del corso, e di non rinviare il raffinamento ed il consolidamento della conoscenza; migliorata capacita? di esprimere in aula perplessita? e dubbi COMPORTAMENTI ATTESI : interesse per una conoscenza integrata dei differenti aspetti dell?informatica; consapevolezza delle inter-relazioni tra le diverse parti di un elaboratore, e quindi del fatto che il suo corretto funzionamento deriva dalla combinazione di fattori molto differenti, ed a volte inattesi.', 'Pre-Assessment There is no formal pre-assessment, but Course pre-requisites are clearly stated on the Module website. Fulfilment of such pre-requisites is verified by formative assessment. Formative Assessment The formative assessment is performed via interactive interaction beteween teacher and students during lectures. Students are aware since the beginning of the Course that they will be involved (in turns) in: - Questioning and discussion, by means of open oral questions to the class or to single students. Summative Assessment Written test followed by an optional oral exam. An optional mid-term written test is also be provided, which is meant to cover the first part of the course, in order to help the students to split the workload. The written test is aimed at: (1) verification of theoretical competences, and in particular of knowledge and comprehension of Course contents; (2) verification of skills in understanding and solving significant exercises, and in explaining the proposed solutions. This in order to verify the ability of application of techniques learnt during the Course, of analysis of problems and synthesis of suitable solutions, and of evaluation of alternative solutions. Criteria of evaluation will be: the level of knowledge and practical ability; the property of use of the technical/mathematical language; the clarity and completeness of explanations. The oral exam will occur within one week of the written test and will typically cover the areas of the written answers that need clarification plus additional subjects proposed by the teacher. The oral test can be required: (i) by the student, to improve final marks; (ii) by the teacher, in presence of significant mistakes/misunderstandings in the written test. Assessment breakdown: 100% mid-term plus end-of-semester summative assessment. The written test (2 hours) consists, in general, in: (a)	Three exercises to solve; (b)	A list of about 3-4 questions to answer. The oral test (max 1 hour) consists of questions on the written exam and extra ones. The final marks of the Operating Systems with Laboratory 12 CFU Module are obtained as the average among the marks of the Operating Systems and Operating Systems Laboratory 6 CFU Modules.', 'The module includes 54 hours of frontal lectures plus 30 hours of on-demand clarifications in the teacher\\\'s office. The frontal lectures are partitioned in theory and exercises.', 'Alla fine del corso, lo studente dovrebbe\r\n\r\n- Gli studenti dovranno conoscere i concetti di base che sono comuni a tutti i sistemi operativi general-purpose, in particolare quelli relativi alla gestione di CPU e memoria centrale. Gli studenti devono anche essere in grado di mettere in relazione questi concetti al fine di sintetizzare i tradeoffs intrinseci che sono alla base di una macchina virtuale (intesa come un computer più il suo sistema operativo).\r\n- Gli studenti dovranno sicuramente essere in grado di risolvere problemi complessi legati alla sincronizzazione tra processi concorrenti. Inoltre essi dovranno essere in grado di applicare le strategie di sistema operativo studiate nel corso (come scheduler della CPU, paginazione della memoria, ecc) a esempi specifici.\r\n- Gli studenti dovranno essere in grado di selezionare le soluzioni migliori (tra quelle studiate nel corso) per esempi specifici.\r\n- Gli studenti dovranno essere in grado di spiegare in modo critico perché i sistemi operativi esistenti funzionano nel modo attuale, basandosi anche sulle nozioni storiche che hanno ricevuto nel corso e che aiutano a capire lo stato dell\\\'arte nel settore.\r\n- Sulla base delle conoscenze e capacità acquisite in questo corso, gli studenti dovranno essere in grado in futuro di affrontare qualsiasi sistema operativo reale, semplicemente studiando il suo manuale. Questo in quanto la conoscenza acquisita in questo modulo del corso è indipendente da qualunque sistema esistente specifico, ed ha l\\\'obiettivo di fornire strumenti generali adatti per un apprendimento continuo in questo settore.', '- Concetti generali, strutture dei sistemi di calcolo e dei sistemi operativi\r\n- I processi e lo scheduling della CPU\r\n- Sincronizzazione tra processi e la gestione del deadlock\r\n- Gestione della memoria principale\r\n- La memoria virtuale\r\n- Il file system', 'informazioni aggiuntive', 'ita', 22),
(33, 'KNOWLEDGE : fundamentals of programming, algorithms and data structures, computer architecture, reading and understanding english language SKILLS : ability to integrate classroom and homework study, ability to pose questions in the classroome to originate discussion.', 'KNOWLEDGE: basic concepts common to all the operating systems, mechanisms and policies of operating systems, system overhead vs solution efficiency tradeoff SKILLS : ability to relate different topics, ability to solve problems never faced in classroom, but solvable through logic deductions and reasoning (i.e., ability to analyze and synthesize concepts), ability to work during the course time and do not delaying the refinement of the knowledge, improved ability to pose questions in the classroome to originate discussion EXPECTED BEHAVIORS : interest for an integrated knowledge of different aspects of computer science, awareness of relationships among computer subsystems, hence awareness of the fact that a satisfactory behavior of a computer may derive from the combination of very different (sometimes unexpected) factors.', 'Pre-Assessment There is no formal pre-assessment, but Course pre-requisites are clearly stated on the Module website. Fulfilment of such pre-requisites is verified by formative assessment. Formative Assessment The formative assessment is performed via interactive interaction beteween teacher and students during lectures. Students are aware since the beginning of the Course that they will be involved (in turns) in: - Questioning and discussion, by means of open oral questions to the class or to single students. Summative Assessment Written test followed by an optional oral exam. An optional mid-term written test is also be provided, which is meant to cover the first part of the course, in order to help the students to split the workload. The written test is aimed at: (1) verification of theoretical competences, and in particular of knowledge and comprehension of Course contents; (2) verification of skills in understanding and solving significant exercises, and in explaining the proposed solutions. This in order to verify the ability of application of techniques learnt during the Course, of analysis of problems and synthesis of suitable solutions, and of evaluation of alternative solutions. Criteria of evaluation will be: the level of knowledge and practical ability; the property of use of the technical/mathematical language; the clarity and completeness of explanations. The oral exam will occur within one week of the written test and will typically cover the areas of the written answers that need clarification plus additional subjects proposed by the teacher. The oral test can be required: (i) by the student, to improve final marks; (ii) by the teacher, in presence of significant mistakes/misunderstandings in the written test. Assessment breakdown: 100% mid-term plus end-of-semester summative assessment. The written test (2 hours) consists, in general, in: (a)	Three exercises to solve; (b)	A list of about 3-4 questions to answer. The oral test (max 1 hour) consists of questions on the written exam and extra ones. The final marks of the Operating Systems with Laboratory 12 CFU Module are obtained as the average among the marks of the Operating Systems and Operating Systems Laboratory 6 CFU Modules.', 'The module includes 54 hours of frontal lectures plus 30 hours of on-demand clarifications in the teacher\\\\\\\'s office. The frontal lectures are partitioned in theory and exercises.', 'On successful completion of this course, the student should\r\n\r\n- Students shall know the basic concepts that are common to all general-purpose operating systems, in particular the ones related to the management of CPU and central memory. Students shall also be able to relate these concepts in order to synthesize the intrinsic tradeoffs that underlie a virtual machine (i.e. a computer plus its operating system).\r\n- Students shall definitely be able to solve complex problems related to the synchronization among concurrent processes. Beside, they shall also be able to apply the operating system policies studied in the course (such as CPU schedulers, pagers, etc.) to specific examples.\r\n- Students shall be able to select the best solutions (among those studied in the course) for specific examples.\r\n- Students shall be able to critically explain why the existing operating systems operate in their ways, basing also on the historical notions that they have received in the course and that help to understand the current state-of-art.\r\n- On the basis of the knowledge and capacities acquired in this course, the students shall be able in the future to tackle any actual operating system, by just studying its handbook. This is expected because their knowledge is independent on any specific existing system in this course module, with the goal of providing general instruments suitable for a continuous learning in this domain.', '- General concepts, computer system and operating system structures\r\n- Processes and CPU scheduling\r\n- Process synchronization and deadlock management\r\n- Memory management\r\n- The virtual memory\r\n- The file system', 'other info', 'eng', 22),
(34, 'Argomenti trattati nel modulo di Sistemi Operativi, algoritmi e strutture dati, architetture degli elaboratori, progettazione e programmazione di semplici soluzioni software per problemi elementari, programmazione in linguaggio C. Capacità di integrazione dello studio di aula con lo studio di personale. Lettura e comprensione della lingua inglese.', 'L\\\'obiettivo di questo corso è quello di fornire un\\\'introduzione completa ai sistemi operativi Unix-like. I contenuti del corso sono organizzati come segue: PARTE I ? Architettura di Sistemi UNIX PARTE II - Linea di comando (shell Bash) PARTE III - Bash Scripting PARTE IV - Programmazione in ambienti Unix-like Il corso offre una conoscenza di base, ma comunque completa, dei seguenti aspetti pratici: architettura di sistemi Unix-like, interazione da riga di comando, scripting di shell, files and directories, chiamate di sistema, programmazione di sistema, gestione dei processi e programmazione concorrente.', 'Per la prima sessione, la prova di esame consiste in (1) una prova intermedia scritta (I Parziale) + una prova conclusiva scritta (II Parziale) oppure (2) una sola prova totale scritta. L\\\'esame è superato se il voto della prova totale scritta oppure il voto finale come media dei due parziali è maggiore o uguale a 18. Per le sessione seguenti, la prova di esame consiste di una sola prova totale scritta.', 'Lezioni e esercizi', 'Alla fine del corso, lo studente dovrebbe\r\n\r\n- aver acquisito le conoscenze teoriche necessarie per comprendere come i sistemi operativi possono offrire le loro principali funzionalità;\r\n- aver acquisto le capacità pratiche necessarie per sviluppare programmi di sistema e script bash in ambienti Unix-like;\r\n- essere in grado di sviluppare programmi concorrenti che utilizzano semafori, mutex e variabili condizionali per la sincronizzazione;\r\n- aver acquisito le metodologie per valutare i diversi sistemi operativi integrando tutte le nozioni acquisite durante il corso;\r\n- essere in grado di comunicare con competenza e correttezza linguistica le problematiche legate ai sistemi operativi e la programmazione di sistemi;\r\n\r\n\r\n', '- PARTE I - Architettura di Sistemi UNIX\r\n- PARTE II - Linea di comando (shell Bash)\r\n- PARTE III - Bash Scripting\r\n- PARTE IV - Programmazione in ambienti Unix-like', 'Orario di ricevimento: ogni giovedì dalle ore 11:30 alle ore 13:30', 'ita', 23),
(35, 'Topics treated by the Operating Systems module, algorithms and data structures, computer architecture, design and programming of simple software solutions to elementary problems, programming in the C language. Ability to integrate classroom study room with personal study. Reading comprehension of English.\r\n\r\n', 'The objective of this course is to provide a complete introduction to Unix-like systems. Contents are organized as follow: PART I - UNIX System Architecture PART II - Command Line (Bash shell) PART III - Bash Scripting PART IV - Programming in UNIX-like Environment The course offers a basic, yet complete, knowledge of the following practical aspects: Unix-like systems architecture, command line interaction, shell scripting, files and directories, system calls, system-programming, process management, and concurrent programming.', 'For the 1st session, the exam consists of (1) a midterm written exam + a final written exam or (2) a total written exam. The exam is passed if the score of the total written exam or the final score as the average of the midterm written exam + the final written exam is greater or equal to 18. For later sessions, the exam consists of only a total written exam.\r\n\r\n', 'Lectures and exercises\r\n\r\n', 'On successful completion of this course, the student should\r\n\r\n-acquire the theoretical knowledge necessary to understand how operating systems can implement their main functionalities;\r\n- acquire the practical capabilities necessary to develop system programs and bash scripts in Unix-like environments;\r\n- will be able to develop concurrent programs using semaphores, mutex and condition variables for synchronization;\r\n- acquire methodologies to evaluate different operating systems bny integrating all the notions acquired during the course;\r\n- be able to communicate with competence and correctness of language the issues related with operating systems and systems programming;\r\n\r\n', '- PART I - UNIX System Architecture\r\n- PART II - Command Line (Bash shell)\r\n- PART III - Bash Scripting\r\n- PART IV - Programming in UNIX-like Environment', 'other info', 'eng', 23),
(36, '', '', '', '', '', '', 'Obbligatorio 2° anno Laurea in Matematica percorso Generale', 'ita', 24),
(37, '', '', '', '', '', '', 'Mandatory 2° year Math degree General path', 'eng', 24),
(38, '', '', '', '', '', '', 'Affine / Integrativa / Attività formative affini o integrative', 'ita', 25),
(39, '', '', '', '', '', '', '', 'eng', 25);

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `libri_testo`
--

INSERT INTO `libri_testo` (`id`, `autore`, `titolo`, `volume`, `anno`, `editore`, `link`) VALUES
(1, 'Demetrescu, FInocchi', 'Algoritmi e Strutture Dati', '1', '2015', 'McGraw-Hill', 'www.mcgrawhill.com'),
(2, 'S.Salsa, A.Squellati', 'Esercizi di Matematica', 'vol. 1', '2015', 'Zanichelli', ''),
(3, 'S.Salsa, A.Squellati', 'Esercizi di Matematica vol 2', 'vol 2', '2015', 'Zanichelli', ''),
(4, 'A. Silberschatz, P.B. Galvin, G. Gagne', 'Operating System Concepts', 'I', '2015', 'John Wiley & Sons', '');

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
) ENGINE=MyISAM AUTO_INCREMENT=138 DEFAULT CHARSET=latin1;

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
(20, 'L\'utente flavio@admin.it ha modificato l\'utente ', '2018-06-18 22:07:58'),
(21, 'L\'utente flavio@admin.it ha aggiunto il docente melideo@docente.it', '2018-06-22 15:43:50'),
(22, 'L\'utente flavio@admin.it ha aggiunto il corso ALGORITMI E STRUTTURE DATI CON LABORATORIO', '2018-06-22 16:04:35'),
(23, 'L\'utente flavio@admin.it ha aggiunto un docente al corso ALGORITMI E STRUTTURE DATI CON LABORATORIO', '2018-06-22 16:04:35'),
(24, 'L\'utente flavio@admin.it ha aggiunto un corso di laurea al corso ALGORITMI E STRUTTURE DATI CON LABORATORIO', '2018-06-22 16:07:51'),
(25, 'L\'utente flavio@admin.it ha aggiunto un docente al corso ALGORITMI E STRUTTURE DATI CON LABORATORIO', '2018-06-22 16:08:14'),
(26, 'L\'utente flavio@admin.it ha aggiunto un nuovo libro di testo e lo ha associato al corso ALGORITMI E STRUTTURE DATI CON LABORATORIO', '2018-06-22 16:09:40'),
(27, 'L\'utente flavio@admin.it ha aggiunto un nuovo materiale e lo ha associato al corso ALGORITMI E STRUTTURE DATI CON LABORATORIO', '2018-06-22 16:10:37'),
(28, 'L\'utente flavio@admin.it ha eliminato un materiale dal corso ALGORITMI E STRUTTURE DATI CON LABORATORIO', '2018-06-22 16:11:16'),
(29, 'L\'utente flavio@admin.it ha aggiunto un nuovo materiale e lo ha associato al corso ALGORITMI E STRUTTURE DATI CON LABORATORIO', '2018-06-22 17:11:17'),
(30, 'L\'utente flavio@admin.it ha aggiunto un nuovo materiale e lo ha associato al corso ALGORITMI E STRUTTURE DATI CON LABORATORIO', '2018-06-22 17:28:47'),
(31, 'L\'utente flavio@admin.it ha aggiunto un nuovo materiale e lo ha associato al corso ALGORITMI E STRUTTURE DATI CON LABORATORIO', '2018-06-22 18:01:22'),
(32, 'L\'utente flavio@admin.it ha modificato le informazioni del corso ALGORITMI E STRUTTURE DATI CON LABORATORIO', '2018-06-24 14:19:35'),
(33, 'L\'utente flavio@admin.it ha modificato le informazioni del corso ALGORITMI E STRUTTURE DATI CON LABORATORIO', '2018-06-24 14:23:32'),
(34, 'L\'utente flavio@admin.it ha modificato le informazioni del corso ALGORITMI E STRUTTURE DATI CON LABORATORIO', '2018-06-24 14:24:27'),
(35, 'L\'utente flavio@admin.it ha modificato le informazioni del corso ALGORITMI E STRUTTURE DATI CON LABORATORIO', '2018-06-24 14:34:16'),
(36, 'L\'utente flavio@admin.it ha modificato le informazioni del corso ALGORITMI E STRUTTURE DATI CON LABORATORIO', '2018-06-24 14:35:00'),
(37, 'L\'utente flavio@admin.it ha modificato le informazioni del corso ALGORITMI E STRUTTURE DATI CON LABORATORIO', '2018-06-24 14:37:23'),
(38, 'L\'utente flavio@admin.it ha modificato le informazioni del corso ALGORITMI E STRUTTURE DATI CON LABORATORIO', '2018-06-24 14:48:53'),
(39, 'L\'utente flavio@admin.it ha modificato le informazioni del corso ALGORITMI E STRUTTURE DATI CON LABORATORIO', '2018-06-24 14:53:38'),
(40, 'L\'utente flavio@admin.it ha modificato le informazioni del corso ALGORITMI E STRUTTURE DATI CON LABORATORIO', '2018-06-24 15:14:47'),
(41, 'L\'utente flavio@admin.it ha aggiunto il corso ALGORITMI E STRUTTURE DATI', '2018-06-24 15:49:48'),
(42, 'L\'utente flavio@admin.it ha aggiunto un docente al corso ALGORITMI E STRUTTURE DATI', '2018-06-24 15:49:48'),
(43, 'L\'utente flavio@admin.it ha aggiunto il corso ALGORITMI E STRUTTURE DATI', '2018-06-24 15:51:11'),
(44, 'L\'utente flavio@admin.it ha aggiunto un docente al corso ALGORITMI E STRUTTURE DATI', '2018-06-24 15:51:11'),
(47, 'L\'utente flavio@admin.it ha aggiunto il corso ALGORITMI E STRUTTURE DATI', '2018-06-24 17:21:40'),
(48, 'L\'utente flavio@admin.it ha aggiunto un docente al corso ALGORITMI E STRUTTURE DATI', '2018-06-24 17:21:40'),
(49, 'L\'utente flavio@admin.it ha aggiunto un nuovo materiale e lo ha associato al corso ALGORITMI E STRUTTURE DATI', '2018-06-26 14:58:57'),
(50, 'L\'utente flavio@admin.it ha modificato le informazioni del corso ALGORITMI E STRUTTURE DATI', '2018-06-26 16:10:11'),
(137, 'L\'utente riccardo@admin.it ha modificato l\'utente massimi@docente.it', '2018-07-02 15:24:04'),
(52, 'L\'utente flavio@admin.it ha modificato le informazioni del corso ALGORITMI E STRUTTURE DATI', '2018-06-26 16:21:35'),
(53, 'L\'utente flavio@admin.it ha aggiunto un corso di laurea al corso ALGORITMI E STRUTTURE DATI', '2018-06-26 16:22:03'),
(54, 'L\'utente flavio@admin.it ha aggiunto un libro di testo al corso ALGORITMI E STRUTTURE DATI', '2018-06-26 16:23:23'),
(55, 'L\'utente flavio@admin.it ha aggiunto il corso LABORATORIO DI ALGORITMI E STRUTTURE DATI', '2018-06-26 16:34:31'),
(56, 'L\'utente flavio@admin.it ha aggiunto un docente al corso LABORATORIO DI ALGORITMI E STRUTTURE DATI', '2018-06-26 16:34:31'),
(57, 'L\'utente flavio@admin.it ha modificato le informazioni del corso ALGORITMI E STRUTTURE DATI', '2018-06-27 15:21:36'),
(58, 'L\'utente flavio@admin.it ha modificato le informazioni del corso ALGORITMI E STRUTTURE DATI', '2018-06-27 15:22:20'),
(59, 'L\'utente flavio@admin.it ha modificato le informazioni del corso ALGORITMI E STRUTTURE DATI', '2018-06-27 15:22:41'),
(60, 'L\'utente flavio@admin.it ha modificato le informazioni del corso ALGORITMI E STRUTTURE DATI', '2018-06-27 15:23:01'),
(61, 'L\'utente flavio@admin.it ha modificato le informazioni del corso ALGORITMI E STRUTTURE DATI', '2018-06-27 15:23:42'),
(62, 'L\'utente flavio@admin.it ha modificato le informazioni del corso ALGORITMI E STRUTTURE DATI', '2018-06-27 15:23:58'),
(63, 'L\'utente flavio@admin.it ha modificato le informazioni del corso ALGORITMI E STRUTTURE DATI', '2018-06-27 15:29:11'),
(64, 'L\'utente flavio@admin.it ha modificato le informazioni del corso LABORATORIO DI ALGORITMI E STRUTTURE DATI', '2018-06-27 16:20:34'),
(65, 'L\'utente flavio@admin.it ha modificato le informazioni del corso ALGORITMI E STRUTTURE DATI', '2018-06-27 16:22:25'),
(66, 'L\'utente flavio@admin.it ha aggiunto il corso ANALISI MATEMATICA', '2018-06-27 16:28:44'),
(67, 'L\'utente flavio@admin.it ha aggiunto un docente al corso ANALISI MATEMATICA', '2018-06-27 16:28:44'),
(68, 'L\'utente flavio@admin.it ha aggiunto un corso mutuato al corso ALGORITMI E STRUTTURE DATI CON LABORATORIO', '2018-06-27 16:44:02'),
(69, 'L\'utente flavio@admin.it ha eliminato un corso mutuato dal corso ALGORITMI E STRUTTURE DATI CON LABORATORIO', '2018-06-27 16:44:15'),
(70, 'L\'utente flavio@admin.it ha aggiunto un modulo al corso ALGORITMI E STRUTTURE DATI CON LABORATORIO', '2018-06-27 16:44:21'),
(71, 'L\'utente flavio@admin.it ha aggiunto un corso di laurea al corso ANALISI MATEMATICA', '2018-06-27 17:07:24'),
(72, 'L\'utente flavio@admin.it ha aggiunto un nuovo libro di testo e lo ha associato al corso ANALISI MATEMATICA', '2018-06-27 17:16:09'),
(73, 'L\'utente flavio@admin.it ha aggiunto un corso di laurea al corso LABORATORIO DI ALGORITMI E STRUTTURE DATI', '2018-06-27 17:16:34'),
(74, 'L\'utente flavio@admin.it ha aggiunto un corso propedeutico al corso ALGORITMI E STRUTTURE DATI', '2018-06-27 17:16:49'),
(75, 'L\'utente flavio@admin.it ha aggiunto un corso propedeutico al corso LABORATORIO DI ALGORITMI E STRUTTURE DATI', '2018-06-27 17:16:54'),
(76, 'L\'utente flavio@admin.it ha eliminato un corso propedeutico dal corso LABORATORIO DI ALGORITMI E STRUTTURE DATI', '2018-06-27 17:17:04'),
(77, 'L\'utente flavio@admin.it ha aggiunto un corso propedeutico al corso LABORATORIO DI ALGORITMI E STRUTTURE DATI', '2018-06-27 17:17:11'),
(78, 'L\'utente flavio@admin.it ha aggiunto un libro di testo al corso LABORATORIO DI ALGORITMI E STRUTTURE DATI', '2018-06-27 17:17:35'),
(79, 'L\'utente flavio@admin.it ha aggiunto un nuovo libro di testo e lo ha associato al corso ANALISI MATEMATICA', '2018-06-27 17:43:07'),
(80, 'L\'utente flavio@admin.it ha aggiunto il corso ANALISI MATEMATICA', '2018-06-28 17:05:53'),
(81, 'L\'utente flavio@admin.it ha aggiunto un docente al corso ANALISI MATEMATICA', '2018-06-28 17:05:53'),
(82, 'L\'utente flavio@admin.it ha aggiunto il corso ANALISI MATEMATICA', '2018-06-30 15:41:18'),
(83, 'L\'utente flavio@admin.it ha aggiunto un docente al corso ANALISI MATEMATICA', '2018-06-30 15:41:18'),
(84, 'L\'utente flavio@admin.it ha aggiunto il corso ANALISI MATEMATICA', '2018-06-30 15:44:19'),
(85, 'L\'utente flavio@admin.it ha aggiunto un docente al corso ANALISI MATEMATICA', '2018-06-30 15:44:19'),
(86, 'L\'utente flavio@admin.it ha aggiunto il corso ANALISI MATEMATICA', '2018-06-30 15:45:22'),
(87, 'L\'utente flavio@admin.it ha aggiunto un docente al corso ANALISI MATEMATICA', '2018-06-30 15:45:22'),
(89, 'L\'utente riccardo@admin.it ha aggiunto il corso FISICA', '2018-06-30 16:23:51'),
(90, 'L\'utente riccardo@admin.it ha aggiunto un docente al corso FISICA', '2018-06-30 16:23:52'),
(91, 'L\'utente riccardo@admin.it ha aggiunto un corso di laurea al corso FISICA', '2018-06-30 16:28:02'),
(92, 'L\'utente flavio@admin.it ha aggiunto il docente cortellessa@docente.it', '2018-06-30 16:52:32'),
(93, 'L\'utente flavio@admin.it ha aggiunto il docente autili@docente.it', '2018-06-30 16:53:06'),
(94, 'L\'utente flavio@admin.it ha aggiunto il corso SISTEMI OPERATIVI I', '2018-07-01 15:54:31'),
(95, 'L\'utente flavio@admin.it ha aggiunto un docente al corso SISTEMI OPERATIVI I', '2018-07-01 15:54:31'),
(96, 'L\'utente flavio@admin.it ha aggiunto il corso SISTEMI OPERATIVI', '2018-07-01 16:07:10'),
(97, 'L\'utente flavio@admin.it ha aggiunto un docente al corso SISTEMI OPERATIVI', '2018-07-01 16:07:10'),
(98, 'L\'utente flavio@admin.it ha modificato le informazioni del corso SISTEMI OPERATIVI', '2018-07-01 16:07:50'),
(99, 'L\'utente flavio@admin.it ha aggiunto il corso SISTEMI OPERATIVI', '2018-07-01 16:13:24'),
(100, 'L\'utente flavio@admin.it ha aggiunto un docente al corso SISTEMI OPERATIVI', '2018-07-01 16:13:24'),
(101, 'L\'utente flavio@admin.it ha modificato le informazioni del corso SISTEMI OPERATIVI CON LABORATORIO', '2018-07-01 16:13:50'),
(102, 'L\'utente flavio@admin.it ha aggiunto il corso LABORATORIO DI SISTEMI OPERATIVI', '2018-07-01 16:16:57'),
(103, 'L\'utente flavio@admin.it ha aggiunto un docente al corso LABORATORIO DI SISTEMI OPERATIVI', '2018-07-01 16:16:57'),
(104, 'L\'utente autili@docente.it ha modificato le informazioni del corso LABORATORIO DI SISTEMI OPERATIVI', '2018-07-01 16:20:26'),
(136, 'L\'utente riccardo@admin.it ha modificato l\'utente massimi@docente.it', '2018-07-02 15:19:40'),
(106, 'L\'utente flavio@admin.it ha modificato le informazioni del corso SISTEMI OPERATIVI CON LABORATORIO', '2018-07-01 16:26:38'),
(107, 'L\'utente flavio@admin.it ha aggiunto un corso di laurea al corso SISTEMI OPERATIVI I', '2018-07-01 16:28:07'),
(108, 'L\'utente flavio@admin.it ha aggiunto un corso di laurea al corso SISTEMI OPERATIVI', '2018-07-01 16:29:48'),
(109, 'L\'utente flavio@admin.it ha aggiunto un corso mutuato al corso SISTEMI OPERATIVI', '2018-07-01 16:29:55'),
(110, 'L\'utente flavio@admin.it ha aggiunto un corso di laurea al corso LABORATORIO DI SISTEMI OPERATIVI', '2018-07-01 16:30:29'),
(111, 'L\'utente flavio@admin.it ha aggiunto un corso di laurea al corso SISTEMI OPERATIVI CON LABORATORIO', '2018-07-01 16:32:33'),
(112, 'L\'utente flavio@admin.it ha aggiunto un modulo al corso SISTEMI OPERATIVI CON LABORATORIO', '2018-07-01 16:32:43'),
(113, 'L\'utente flavio@admin.it ha aggiunto un modulo al corso SISTEMI OPERATIVI CON LABORATORIO', '2018-07-01 16:32:50'),
(114, 'L\'utente flavio@admin.it ha aggiunto un docente al corso SISTEMI OPERATIVI CON LABORATORIO', '2018-07-01 16:32:57'),
(115, 'L\'utente flavio@admin.it ha eliminato un materiale dal corso ALGORITMI E STRUTTURE DATI', '2018-07-01 16:51:26'),
(116, 'L\'utente cortellessa@docente.it ha aggiunto un nuovo materiale e lo ha associato al corso SISTEMI OPERATIVI', '2018-07-01 17:01:30'),
(117, 'L\'utente cortellessa@docente.it ha eliminato un materiale dal corso SISTEMI OPERATIVI', '2018-07-01 17:01:57'),
(118, 'L\'utente cortellessa@docente.it ha aggiunto un nuovo libro di testo e lo ha associato al corso SISTEMI OPERATIVI', '2018-07-01 17:37:26'),
(119, 'L\'utente cortellessa@docente.it ha aggiunto un nuovo materiale e lo ha associato al corso SISTEMI OPERATIVI', '2018-07-01 17:38:47'),
(120, 'L\'utente cortellessa@docente.it ha aggiunto un libro di testo al corso SISTEMI OPERATIVI CON LABORATORIO', '2018-07-01 17:39:07'),
(121, 'L\'utente cortellessa@docente.it ha aggiunto un materiale al corso SISTEMI OPERATIVI CON LABORATORIO', '2018-07-01 17:39:16'),
(122, 'L\'utente autili@docente.it ha aggiunto un corso mutuato al corso SISTEMI OPERATIVI CON LABORATORIO', '2018-07-01 17:40:20'),
(123, 'L\'utente autili@docente.it ha aggiunto un corso mutuato al corso SISTEMI OPERATIVI CON LABORATORIO', '2018-07-01 17:40:28'),
(124, 'L\'utente flavio@admin.it ha aggiunto un corso mutuato al corso SISTEMI OPERATIVI', '2018-07-01 17:51:27'),
(125, 'L\'utente flavio@admin.it ha aggiunto un corso di laurea al corso ANALISI MATEMATICA', '2018-07-01 17:53:05'),
(126, 'L\'utente flavio@admin.it ha aggiunto un libro di testo al corso ANALISI MATEMATICA', '2018-07-01 17:53:21'),
(127, 'L\'utente flavio@admin.it ha aggiunto un libro di testo al corso ANALISI MATEMATICA', '2018-07-01 17:53:27'),
(128, 'L\'utente riccardo@admin.it ha aggiunto il docente guglielmi@docente.it', '2018-07-02 14:45:00'),
(129, 'L\'utente riccardo@admin.it ha aggiunto il corso ANALISI NUMERICA', '2018-07-02 14:50:11'),
(130, 'L\'utente riccardo@admin.it ha aggiunto un docente al corso ANALISI NUMERICA', '2018-07-02 14:50:11'),
(131, 'L\'utente guglielmi@docente.it ha aggiunto un corso di laurea al corso ANALISI NUMERICA', '2018-07-02 14:51:08'),
(132, 'L\'utente riccardo@admin.it ha aggiunto il docente Massimi@docente.it', '2018-07-02 14:58:23'),
(133, 'L\'utente riccardo@admin.it ha aggiunto il corso ISTOLOGIA', '2018-07-02 15:00:00'),
(134, 'L\'utente riccardo@admin.it ha aggiunto un docente al corso ISTOLOGIA', '2018-07-02 15:00:00'),
(135, 'L\'utente massimi@docente.it ha aggiunto un corso di laurea al corso ISTOLOGIA', '2018-07-02 15:01:25');

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
  `id_utente` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`id`, `email`, `password`, `tipo_utente`, `nome`, `cognome`) VALUES
(1, 'flavio@admin.it', 'f76405ac130dac085b2a6249073b213b', 'amministratore', 'Flavio', 'Furia'),
(12, 'melideo@docente.it', 'ac99fecf6fcb8c25d18788d14a5384ee', 'docente', 'Giovanna', 'Melideo'),
(3, 'riccardo@admin.it', '9667aacee4c11ab5cb1aee39cb183599', 'amministratore', 'Riccardo', 'Di Prinzio'),
(4, 'valentino@admin.it', '50b483d799f6b531772078e9cd0fa509', 'amministratore', 'Valentino', 'Di Giosaffatte'),
(5, 'dellapenna@docente.it', 'ac99fecf6fcb8c25d18788d14a5384ee', 'docente', 'Giuseppe', 'Della Penna'),
(6, 'engel@docente.it', 'ac99fecf6fcb8c25d18788d14a5384ee', 'docente', 'Klaus', 'Engel'),
(7, 'proietti@docente.it', 'ac99fecf6fcb8c25d18788d14a5384ee', 'docente', 'Guido', 'Proietti'),
(8, 'vellante@docente.it', 'ac99fecf6fcb8c25d18788d14a5384ee', 'docente', 'Massimo', 'Vellante'),
(9, 'pierantonio@docente.it', 'ac99fecf6fcb8c25d18788d14a5384ee', 'docente', 'Alfonso', 'Pierantonio'),
(10, 'scoppola@docente.it', 'ac99fecf6fcb8c25d18788d14a5384ee', 'docente', 'Carlo Maria', 'Scoppola'),
(11, 'tozzi@docente.it', 'ac99fecf6fcb8c25d18788d14a5384ee', 'docente', 'Anna', 'Tozzi'),
(13, 'cortellessa@docente.it', 'ac99fecf6fcb8c25d18788d14a5384ee', 'docente', 'Vittorio', 'Cortellessa'),
(14, 'autili@docente.it', 'ac99fecf6fcb8c25d18788d14a5384ee', 'docente', 'Marco', 'Autili'),
(15, 'guglielmi@docente.it', 'ac99fecf6fcb8c25d18788d14a5384ee', 'docente', 'Maria Gabriella', 'Cimoroni'),
(16, 'massimi@docente.it', 'ac99fecf6fcb8c25d18788d14a5384ee', 'docente', 'Mara', 'Massimi');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
