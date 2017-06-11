-- phpMyAdmin SQL Dump
-- version 3.4.7.1
-- http://www.phpmyadmin.net
--
-- Host: 89.46.111.38
-- Generato il: Giu 11, 2017 alle 21:58
-- Versione del server: 5.6.35
-- Versione PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Sql1069287_1`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `igigli_accreditamento`
--

CREATE TABLE IF NOT EXISTS `igigli_accreditamento` (
  `id` int(11) NOT NULL DEFAULT '0',
  `barcode` varchar(255) CHARACTER SET utf8 NOT NULL,
  `nome` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `cognome` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sesso` varchar(6) CHARACTER SET utf8 DEFAULT NULL,
  `nascita` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `cf` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `telefono` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `indirizzo` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `civico` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `cap` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `comune` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `provincia` varchar(2) CHARACTER SET utf8 DEFAULT NULL,
  `privacy` varchar(2) CHARACTER SET utf8 DEFAULT NULL,
  `privacy2` varchar(2) CHARACTER SET utf8 DEFAULT NULL,
  `data` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `operatore` int(11) DEFAULT NULL,
  `blocca` int(11) DEFAULT NULL,
  `eliminata` varchar(50) CHARACTER SET utf8 DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `igigli_accreditamento`
--

INSERT INTO `igigli_accreditamento` (`id`, `barcode`, `nome`, `cognome`, `sesso`, `nascita`, `cf`, `telefono`, `mobile`, `email`, `indirizzo`, `civico`, `cap`, `comune`, `provincia`, `privacy`, `privacy2`, `data`, `operatore`, `blocca`, `eliminata`) VALUES
(0, '820110', 'sasa', 'sasa', 'Uomo', '2017-06-13', NULL, '32131221321', '321312321321', 'ewew@wqwq.com', 'ruiewruo', '191', '7439827', '4328979', '32', '1', '0', '2017-06-09 08:34:09', 101, NULL, 'N'),
(0, '15096', 'valeria', 'casalino', 'Donna', '2017-06-09', NULL, '000000', '000000', 'valeria@worldevent.it', 'via bionaz', '40/9', '10142', 'torino', 'to', '1', '0', '2017-06-09 13:58:33', 101, NULL, 'N'),
(0, '80656074', 'sasasa', 'sasa', 'Uomo', '01/06/1999', NULL, '45456654', '4564646546', 'sasa@sasa.com', 'via bonaz', '41', '10101', 'milano', 'mi', '1', '1', '2017-06-11 10:58:21', 101, NULL, 'N');

-- --------------------------------------------------------

--
-- Struttura della tabella `igigli_admin`
--

CREATE TABLE IF NOT EXISTS `igigli_admin` (
  `adminid` int(25) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_level` enum('super','admin','concorso','buoni','baby','guest','foto','data_entry') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `signup_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activated` enum('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `gift_level` int(11) DEFAULT NULL,
  PRIMARY KEY (`adminid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=103 ;

--
-- Dump dei dati per la tabella `igigli_admin`
--

INSERT INTO `igigli_admin` (`adminid`, `first_name`, `last_name`, `username`, `password`, `user_level`, `signup_date`, `activated`, `gift_level`) VALUES
(101, 'developer', 'developer', 'igigli', 'igigli', 'admin', '2017-05-26 14:48:28', '1', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `igigli_calcolo`
--

CREATE TABLE IF NOT EXISTS `igigli_calcolo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `da` decimal(10,2) NOT NULL,
  `dam` decimal(10,2) NOT NULL,
  `a` decimal(10,2) NOT NULL,
  `n` int(11) DEFAULT NULL,
  `uova` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dump dei dati per la tabella `igigli_calcolo`
--

INSERT INTO `igigli_calcolo` (`id`, `da`, `dam`, `a`, `n`, `uova`) VALUES
(1, '5.00', '0.00', '50.00', 1, NULL),
(2, '50.01', '0.00', '10000000.00', 2, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `igigli_concorso`
--

CREATE TABLE IF NOT EXISTS `igigli_concorso` (
  `id` int(11) NOT NULL DEFAULT '0',
  `nome` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `foto` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `card` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sito` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `privacy` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `swf` int(11) DEFAULT '1',
  `swf_pass` int(11) DEFAULT '1',
  `swf_online` int(11) DEFAULT '1',
  `totem` int(11) DEFAULT '1',
  `carnet1` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `carnet2` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `carnet3` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `prezzo1` int(11) DEFAULT NULL,
  `prezzo2` int(11) DEFAULT NULL,
  `prezzo3` int(11) DEFAULT NULL,
  `valore1` int(11) DEFAULT NULL,
  `valore2` int(11) DEFAULT NULL,
  `valore3` int(11) DEFAULT NULL,
  `numero1` int(11) DEFAULT NULL,
  `numero2` int(11) DEFAULT NULL,
  `numero3` int(11) DEFAULT NULL,
  `max1` int(11) DEFAULT NULL,
  `max2` int(11) DEFAULT NULL,
  `max3` int(11) DEFAULT NULL,
  `maxtot` int(11) DEFAULT NULL,
  `stamparicevuta` int(11) DEFAULT NULL,
  `giornocarnet` int(11) DEFAULT NULL,
  `codbar` int(11) DEFAULT NULL,
  `nomebar` int(11) DEFAULT NULL,
  `voto` int(11) DEFAULT NULL,
  `uovo` int(11) DEFAULT NULL,
  `numerocaselle` int(11) DEFAULT NULL,
  `casellario_multi` int(11) DEFAULT NULL,
  `completo` int(11) DEFAULT NULL,
  `coupon` int(11) DEFAULT NULL,
  `contascontrini` int(11) DEFAULT NULL,
  `insscontrini` int(11) DEFAULT NULL,
  `vinciscontrino` int(11) DEFAULT NULL,
  `rimborso` int(11) DEFAULT NULL,
  `arrotonda` int(11) DEFAULT NULL,
  `buoniTot` int(11) DEFAULT NULL,
  `numscontrino` int(11) DEFAULT '10',
  `premiononassegnato` int(11) DEFAULT NULL,
  `passaggio` int(11) DEFAULT NULL,
  `passaggio_insieme` int(11) DEFAULT NULL,
  `datanumero` int(11) DEFAULT NULL,
  `stampavalorescontrino` int(11) DEFAULT NULL,
  `scontrinoRisto` int(11) DEFAULT NULL,
  `scontrinoGalle` int(11) DEFAULT NULL,
  `settimana` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `quesito` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `igigli_concorso`
--

INSERT INTO `igigli_concorso` (`id`, `nome`, `foto`, `card`, `email`, `sito`, `privacy`, `swf`, `swf_pass`, `swf_online`, `totem`, `carnet1`, `carnet2`, `carnet3`, `prezzo1`, `prezzo2`, `prezzo3`, `valore1`, `valore2`, `valore3`, `numero1`, `numero2`, `numero3`, `max1`, `max2`, `max3`, `maxtot`, `stamparicevuta`, `giornocarnet`, `codbar`, `nomebar`, `voto`, `uovo`, `numerocaselle`, `casellario_multi`, `completo`, `coupon`, `contascontrini`, `insscontrini`, `vinciscontrino`, `rimborso`, `arrotonda`, `buoniTot`, `numscontrino`, `premiononassegnato`, `passaggio`, `passaggio_insieme`, `datanumero`, `stampavalorescontrino`, `scontrinoRisto`, `scontrinoGalle`, `settimana`, `quesito`) VALUES
(1, 'CONCORSO IGIGLI', '', 'GIFTCARD', '', '', '', 1, 1, 1, 1, 'GIFTCARD 50', 'GIFTCARD 1000', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `igigli_log_estrazioni`
--

CREATE TABLE IF NOT EXISTS `igigli_log_estrazioni` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATA` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `K` varchar(20) NOT NULL,
  `PERCENTUALETOTALE` varchar(20) NOT NULL,
  `PROBPERCENTUALE` varchar(20) NOT NULL,
  `FASCIACORRENTE` varchar(20) NOT NULL,
  `RANDOM` varchar(20) NOT NULL,
  `MINUTOATTUALE` varchar(20) DEFAULT NULL,
  `INC_PERC_AL_MIN` varchar(20) DEFAULT NULL,
  `DURFASCIA` varchar(20) DEFAULT NULL,
  `ORAINIZIO` varchar(20) NOT NULL,
  `ORAFINE` varchar(20) NOT NULL,
  `TTRASCORSO` varchar(20) NOT NULL,
  `TOTPREMI` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dump dei dati per la tabella `igigli_log_estrazioni`
--

INSERT INTO `igigli_log_estrazioni` (`ID`, `DATA`, `K`, `PERCENTUALETOTALE`, `PROBPERCENTUALE`, `FASCIACORRENTE`, `RANDOM`, `MINUTOATTUALE`, `INC_PERC_AL_MIN`, `DURFASCIA`, `ORAINIZIO`, `ORAFINE`, `TTRASCORSO`, `TOTPREMI`) VALUES
(1, '2017-06-11 14:59:08', '1', '13', '13.561111111111', '3', '26', '119', '0.10555555555556', '180', '', '', '479', '4'),
(2, '2017-06-11 15:03:33', '1', '13', '13.983333333333', '3', '23', '123', '0.10555555555556', '180', '', '', '483', '4'),
(3, '2017-06-11 15:04:38', '1', '14', '14.088888888889', '3', '81', '124', '0.10555555555556', '180', '', '', '484', '4'),
(4, '2017-06-11 15:05:44', '1', '14', '14.194444444444', '3', '82', '125', '0.10555555555556', '180', '', '', '485', '4'),
(5, '2017-06-11 15:05:54', '1', '14', '14.194444444444', '3', '39', '125', '0.10555555555556', '180', '', '', '485', '4'),
(6, '2017-06-11 15:05:58', '1', '14', '14.194444444444', '3', '68', '125', '0.10555555555556', '180', '', '', '485', '4'),
(7, '2017-06-11 15:07:13', '1', '14', '14.405555555556', '3', '80', '127', '0.10555555555556', '180', '', '', '487', '4'),
(8, '2017-06-11 15:18:33', '1', '15', '15.566666666667', '3', '61', '138', '0.10555555555556', '180', '', '', '498', '4'),
(9, '2017-06-11 15:19:40', '1', '15', '15.672222222222', '3', '60', '139', '0.10555555555556', '180', '', '', '499', '4'),
(10, '2017-06-11 15:21:47', '1', '15', '15.883333333333', '3', '11', '141', '0.10555555555556', '180', '', '', '501', '4'),
(11, '2017-06-11 15:27:59', '0', '0', '16.516666666667', '3', '94', '147', '0.10555555555556', '180', '', '', '507', '4'),
(12, '2017-06-11 15:29:08', '0', '0', '16.727777777778', '3', '12', '149', '0.10555555555556', '180', '', '', '509', '4'),
(13, '2017-06-11 15:31:11', '0', '0', '16.938888888889', '3', '63', '151', '0.10555555555556', '180', '', '', '511', '4'),
(14, '2017-06-11 15:32:45', '0', '0', '17.044444444444', '3', '17', '152', '0.10555555555556', '180', '', '', '512', '4'),
(15, '2017-06-11 15:33:54', '0', '0', '17.15', '3', '95', '153', '0.10555555555556', '180', '', '', '513', '4'),
(16, '2017-06-11 15:34:36', '0', '0', '17.255555555556', '3', '16', '154', '0.10555555555556', '180', '', '', '514', '4'),
(17, '2017-06-11 15:37:37', '0', '0', '17.572222222222', '3', '4', '157', '0.10555555555556', '180', '', '', '517', '4'),
(18, '2017-06-11 15:38:22', '0', '0', '17.677777777778', '3', '19', '158', '0.10555555555556', '180', '', '', '518', '4');

-- --------------------------------------------------------

--
-- Struttura della tabella `igigli_newcredito`
--

CREATE TABLE IF NOT EXISTS `igigli_newcredito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente` varchar(20) NOT NULL,
  `credito` int(11) NOT NULL,
  `usato` int(11) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15413 ;

--
-- Dump dei dati per la tabella `igigli_newcredito`
--

INSERT INTO `igigli_newcredito` (`id`, `cliente`, `credito`, `usato`, `timestamp`) VALUES
(15410, '820110', 9, 6, '2017-06-09 17:02:10'),
(15411, '15096', 1, 1, '2017-06-09 14:00:37'),
(15412, '80656074', 100, 68, '2017-06-11 15:38:22');

-- --------------------------------------------------------

--
-- Struttura della tabella `igigli_newgiocata`
--

CREATE TABLE IF NOT EXISTS `igigli_newgiocata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `risultato` enum('VINTO','PERSO','NOCREDITO') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `premio` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ritirato` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'F',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ritiro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=72865 ;

--
-- Dump dei dati per la tabella `igigli_newgiocata`
--

INSERT INTO `igigli_newgiocata` (`id`, `cliente`, `risultato`, `premio`, `ritirato`, `timestamp`, `ritiro`) VALUES
(72791, '820110', 'PERSO', NULL, 'F', '2017-06-09 09:22:29', NULL),
(72792, '820110', 'PERSO', NULL, 'F', '2017-06-09 09:25:40', NULL),
(72793, '820110', 'PERSO', NULL, 'F', '2017-06-09 09:26:35', NULL),
(72794, '820110', 'PERSO', NULL, 'F', '2017-06-09 09:28:43', NULL),
(72795, '820110', 'PERSO', NULL, 'F', '2017-06-09 09:35:45', NULL),
(72796, '15096', 'VINTO', 'GIFT CARD 50', 'T', '2017-06-09 14:00:37', '2017-06-09 16:21:33'),
(72797, '80656074', 'PERSO', NULL, 'F', '2017-06-11 11:03:26', NULL),
(72798, '80656074', 'PERSO', NULL, 'F', '2017-06-11 11:14:30', NULL),
(72799, '80656074', 'PERSO', NULL, 'F', '2017-06-11 11:24:11', NULL),
(72800, '80656074', 'PERSO', NULL, 'F', '2017-06-11 11:34:45', NULL),
(72801, '80656074', 'PERSO', NULL, 'F', '2017-06-11 11:36:30', NULL),
(72802, '80656074', 'PERSO', NULL, 'F', '2017-06-11 11:45:11', NULL),
(72803, '80656074', 'PERSO', NULL, 'F', '2017-06-11 11:45:55', NULL),
(72804, '80656074', 'VINTO', 'GIFT CARD 50', 'F', '2017-06-11 11:48:53', NULL),
(72805, '80656074', 'PERSO', NULL, 'F', '2017-06-11 11:50:43', NULL),
(72806, '80656074', 'PERSO', NULL, 'F', '2017-06-11 11:53:04', NULL),
(72807, '80656074', 'PERSO', NULL, 'F', '2017-06-11 11:54:51', NULL),
(72808, '80656074', 'PERSO', NULL, 'F', '2017-06-11 11:54:57', NULL),
(72809, '80656074', 'PERSO', NULL, 'F', '2017-06-11 11:56:16', NULL),
(72810, '80656074', 'PERSO', NULL, 'F', '2017-06-11 11:56:39', NULL),
(72811, '80656074', 'PERSO', NULL, 'F', '2017-06-11 11:57:55', NULL),
(72812, '80656074', 'PERSO', NULL, 'F', '2017-06-11 12:03:38', NULL),
(72813, '80656074', 'PERSO', NULL, 'F', '2017-06-11 13:13:26', NULL),
(72814, '80656074', 'PERSO', NULL, 'F', '2017-06-11 13:15:59', NULL),
(72815, '80656074', 'PERSO', NULL, 'F', '2017-06-11 13:20:08', NULL),
(72816, '80656074', 'PERSO', NULL, 'F', '2017-06-11 13:20:49', NULL),
(72817, '80656074', 'PERSO', NULL, 'F', '2017-06-11 13:22:08', NULL),
(72818, '80656074', 'PERSO', NULL, 'F', '2017-06-11 13:27:14', NULL),
(72819, '80656074', 'PERSO', NULL, 'F', '2017-06-11 13:33:01', NULL),
(72820, '80656074', 'PERSO', NULL, 'F', '2017-06-11 13:34:58', NULL),
(72821, '80656074', 'PERSO', NULL, 'F', '2017-06-11 13:36:20', NULL),
(72822, '80656074', 'PERSO', NULL, 'F', '2017-06-11 13:37:23', NULL),
(72823, '80656074', 'PERSO', NULL, 'F', '2017-06-11 13:38:41', NULL),
(72824, '80656074', 'PERSO', NULL, 'F', '2017-06-11 13:42:33', NULL),
(72825, '80656074', 'PERSO', NULL, 'F', '2017-06-11 13:42:56', NULL),
(72826, '80656074', 'PERSO', NULL, 'F', '2017-06-11 13:42:59', NULL),
(72827, '80656074', 'PERSO', NULL, 'F', '2017-06-11 13:43:13', NULL),
(72828, '80656074', 'PERSO', NULL, 'F', '2017-06-11 13:46:10', NULL),
(72829, '80656074', 'PERSO', NULL, 'F', '2017-06-11 13:47:31', NULL),
(72830, '80656074', 'PERSO', NULL, 'F', '2017-06-11 13:50:17', NULL),
(72831, '80656074', 'PERSO', NULL, 'F', '2017-06-11 13:51:09', NULL),
(72832, '80656074', 'PERSO', NULL, 'F', '2017-06-11 13:55:24', NULL),
(72833, '80656074', 'PERSO', NULL, 'F', '2017-06-11 13:55:55', NULL),
(72834, '80656074', 'PERSO', NULL, 'F', '2017-06-11 13:57:23', NULL),
(72835, '80656074', 'PERSO', NULL, 'F', '2017-06-11 14:17:26', NULL),
(72836, '80656074', 'PERSO', NULL, 'F', '2017-06-11 14:19:30', NULL),
(72837, '80656074', 'PERSO', NULL, 'F', '2017-06-11 14:25:07', NULL),
(72838, '80656074', 'PERSO', NULL, 'F', '2017-06-11 14:29:20', NULL),
(72839, '80656074', 'PERSO', NULL, 'F', '2017-06-11 14:47:51', NULL),
(72840, '80656074', 'PERSO', NULL, 'F', '2017-06-11 14:49:02', NULL),
(72841, '80656074', 'PERSO', NULL, 'F', '2017-06-11 14:49:37', NULL),
(72842, '80656074', 'PERSO', NULL, 'F', '2017-06-11 14:51:57', NULL),
(72843, '80656074', 'PERSO', NULL, 'F', '2017-06-11 14:52:41', NULL),
(72844, '80656074', 'PERSO', NULL, 'F', '2017-06-11 14:53:24', NULL),
(72845, '80656074', 'PERSO', NULL, 'F', '2017-06-11 14:55:58', NULL),
(72846, '80656074', 'PERSO', NULL, 'F', '2017-06-11 14:56:49', NULL),
(72847, '80656074', 'PERSO', NULL, 'F', '2017-06-11 14:59:08', NULL),
(72848, '80656074', 'PERSO', NULL, 'F', '2017-06-11 15:03:33', NULL),
(72849, '80656074', 'PERSO', NULL, 'F', '2017-06-11 15:04:38', NULL),
(72850, '80656074', 'PERSO', NULL, 'F', '2017-06-11 15:05:44', NULL),
(72851, '80656074', 'PERSO', NULL, 'F', '2017-06-11 15:05:54', NULL),
(72852, '80656074', 'PERSO', NULL, 'F', '2017-06-11 15:05:58', NULL),
(72853, '80656074', 'PERSO', NULL, 'F', '2017-06-11 15:07:13', NULL),
(72854, '80656074', 'PERSO', NULL, 'F', '2017-06-11 15:18:33', NULL),
(72855, '80656074', 'PERSO', NULL, 'F', '2017-06-11 15:19:40', NULL),
(72856, '80656074', 'VINTO', 'GIFT CARD 1000', 'F', '2017-06-11 15:21:47', NULL),
(72857, '80656074', 'PERSO', NULL, 'F', '2017-06-11 15:27:59', NULL),
(72858, '80656074', 'PERSO', NULL, 'F', '2017-06-11 15:29:08', NULL),
(72859, '80656074', 'PERSO', NULL, 'F', '2017-06-11 15:31:11', NULL),
(72860, '80656074', 'PERSO', NULL, 'F', '2017-06-11 15:32:45', NULL),
(72861, '80656074', 'PERSO', NULL, 'F', '2017-06-11 15:33:54', NULL),
(72862, '80656074', 'PERSO', NULL, 'F', '2017-06-11 15:34:36', NULL),
(72863, '80656074', 'PERSO', NULL, 'F', '2017-06-11 15:37:37', NULL),
(72864, '80656074', 'PERSO', NULL, 'F', '2017-06-11 15:38:22', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `igigli_newgiornata`
--

CREATE TABLE IF NOT EXISTS `igigli_newgiornata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `inizio` time NOT NULL,
  `fine` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dump dei dati per la tabella `igigli_newgiornata`
--

INSERT INTO `igigli_newgiornata` (`id`, `data`, `inizio`, `fine`) VALUES
(27, '2017-06-11', '09:00:00', '21:00:00');

-- --------------------------------------------------------

--
-- Struttura della tabella `igigli_newpremio`
--

CREATE TABLE IF NOT EXISTS `igigli_newpremio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `nome` varchar(50) NOT NULL,
  `tot` int(11) NOT NULL,
  `usciti` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=130 ;

--
-- Dump dei dati per la tabella `igigli_newpremio`
--

INSERT INTO `igigli_newpremio` (`id`, `data`, `nome`, `tot`, `usciti`) VALUES
(128, '2017-06-11', 'GIFT CARD 50', 3, 2),
(129, '2017-06-11', 'GIFT CARD 1000', 1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `igigli_pv`
--

CREATE TABLE IF NOT EXISTS `igigli_pv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `insegna` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ragione_sociale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `valminimo` int(11) DEFAULT NULL,
  `valminimo_online` int(11) DEFAULT NULL,
  `valore` int(11) DEFAULT NULL,
  `valore_online` int(11) DEFAULT NULL,
  `scontrino` int(11) DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT '/logo/default.png',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=218 ;

--
-- Dump dei dati per la tabella `igigli_pv`
--

INSERT INTO `igigli_pv` (`id`, `insegna`, `ragione_sociale`, `valminimo`, `valminimo_online`, `valore`, `valore_online`, `scontrino`, `logo`) VALUES
(64, 'Panorama', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(65, 'Leroy Merlin', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(66, 'Kasanova', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(67, 'Don Nino', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(68, 'C''è Bassetti', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(69, 'Casa Mia', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(70, 'Thun', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(71, 'Nespresso - c/o Coin', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(72, 'Materassi & Materassi', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(73, 'Stroili Oro', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(74, 'Swarovski', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(144, 'Invidiauomo', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(76, 'Geox', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(77, 'Blue Spirit', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(143, 'Calvin Klein Jeans', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(81, 'Claire''s', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(82, 'Timberland', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(145, 'Foot Locker', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(84, 'Cafénoir', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(85, 'Spazio Ragazzi', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(137, 'Oltre', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(138, 'Desigual', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(139, '012 of Benetton', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(140, 'Guess', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(141, 'Stradivarius', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(127, 'Media World', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(128, 'TIM', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(129, 'Apple Store', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(130, 'Game Stop', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(131, 'Wind', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(132, 'Vodafone one', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(133, '3 - Tre Store', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(134, 'Coin', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(135, 'OVS', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(124, 'Parfois', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(125, 'Toys Center', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(126, 'Peccati di Moda ', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(63, 'Bata', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(111, 'Il Giglio d''Oro', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(146, 'Due Punto Zero - 2.0', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(114, 'Chic Accent', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(115, 'Salmoiraghi & Vigano', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(116, 'Divarese', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(148, 'United Colors of Benetton', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(123, 'O bag Store', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(119, 'Goldenpoint', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(147, 'Hollister', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(142, 'Pimkie', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(136, 'Universo Sport', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(149, 'Quintessence', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(150, 'You', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(151, 'Conte of Florence', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(152, 'Intimissimi', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(153, 'Jeckerson', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(154, 'Sisley Uomo', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(155, 'Pennyblack', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(156, 'Calzedonia', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(157, 'Oasi Natur', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(158, 'C&A', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(159, 'H&M', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(160, 'Fiorella Rubino', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(161, 'Tezenis', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(162, 'Lovable', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(163, 'Dixie', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(164, 'Napapijri', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(165, 'Liu Jo Jeans', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(166, 'Sarabanda', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(167, 'Tommy ', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(168, 'Primark', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(169, 'iDo', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(170, 'Fiorentina Store', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(171, 'AW Lab', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(172, 'Mumble ', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(173, 'C''Art', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(174, 'Profumerie Douglas', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(175, 'Kiko Make Up Milano', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(176, 'Sephora', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(177, 'Bottega Verde', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(178, 'L''occitane en Provence', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(179, 'Profumerie Douglas', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(180, 'Lush', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(181, 'Beauty & co', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(182, 'Dentadent', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(183, 'Farmacia', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(184, 'L''edicolone', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(185, 'L''isola del tesoro', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(186, 'Ipersec', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(187, 'Presto Service', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(188, 'Jean Louis David', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(189, 'Mondadori Bookstore', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(190, 'Bluvacanze', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(191, 'Ginfo Punto Informazione I Gigli', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(192, 'Unicredit Banca di Roma', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(193, 'Papaya Viaggi', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(194, 'Uffici della Direzione', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(195, 'La casa di Baboo', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(196, 'Ufficio oggetti smarriti', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(197, 'Mercatino I Gigli', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(198, 'Bareostato', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(199, 'La Bottega del Caffè', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(200, 'Don Nino', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(201, 'Oasi Natur', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(202, 'Il Cantuccio', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(203, 'Lindt', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(204, 'Gelateria Sottozero', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(205, 'Da...Saba', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(206, 'McDonald''s', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(207, 'Biobab', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(208, 'Il Lupo', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(209, 'Kikko sushi', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(210, 'Vulkania', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(211, 'Arabian Kebab', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(212, 'Old Wild West', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(213, 'Il mulino del lupo', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(214, 'Dispensa Emilia', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(215, 'Baccanale', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(216, 'America Graffiti', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png'),
(217, 'Grom', NULL, 5, NULL, NULL, NULL, NULL, '/logo/default.png');

-- --------------------------------------------------------

--
-- Struttura della tabella `igigli_scontrino`
--

CREATE TABLE IF NOT EXISTS `igigli_scontrino` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_caricamento` datetime NOT NULL,
  `idesercizio` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `importo` decimal(10,2) NOT NULL,
  `giocate_rimaste` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `operatore` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `giocate_assegnate` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `numero_scontrino` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `data_scontrino` datetime NOT NULL,
  `barcode` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `nome_puntovendita` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `esercizio` (`idesercizio`),
  KEY `data_scontrino` (`data_scontrino`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10314 ;

--
-- Dump dei dati per la tabella `igigli_scontrino`
--

INSERT INTO `igigli_scontrino` (`id`, `data_caricamento`, `idesercizio`, `importo`, `giocate_rimaste`, `operatore`, `giocate_assegnate`, `numero_scontrino`, `data_scontrino`, `barcode`, `nome_puntovendita`) VALUES
(10294, '2017-06-09 10:35:48', '133', '333.00', '2', '101', '2', '1', '2017-06-09 10:35:48', '820110', '3 - Tre Store'),
(10295, '2017-06-09 10:50:18', '133', '66.00', '4', '101', '4', '1', '2017-06-09 10:50:18', '820110', '3 - Tre Store'),
(10296, '2017-06-09 11:12:41', '133', '100.00', '5', '101', '5', '1', '2017-06-09 11:12:41', '820110', '3 - Tre Store'),
(10297, '2017-06-09 11:13:39', '133', '100.00', '5', '101', '5', '1', '2017-06-09 11:13:39', '820110', '3 - Tre Store'),
(10298, '2017-06-09 11:14:18', '133', '100.00', '5', '101', '5', '1', '2017-06-09 11:14:18', '820110', '3 - Tre Store'),
(10299, '2017-06-09 11:18:44', '133', '100.00', '5', '101', '5', '1', '2017-06-09 11:18:44', '820110', '3 - Tre Store'),
(10300, '2017-06-09 11:19:32', '133', '100.00', '5', '101', '5', '1', '2017-06-09 11:19:32', '820110', '3 - Tre Store'),
(10301, '2017-06-09 16:00:05', '216', '5.00', '1', '101', '1', '', '2017-06-09 16:00:05', '15096', 'America Graffiti'),
(10302, '2017-06-09 18:51:35', '133', '50.00', '1', '101', '1', '', '2017-06-09 18:51:35', '820110', '3 - Tre Store'),
(10303, '2017-06-09 18:54:07', '133', '11.00', '2', '101', '2', '1', '2017-06-09 18:54:07', '820110', '3 - Tre Store'),
(10304, '2017-06-09 19:02:10', '133', '5.00', '3', '101', '3', '1', '2017-06-09 19:02:10', '820110', '3 - Tre Store'),
(10305, '2017-06-11 13:03:16', '133', '55.00', '2', '101', '2', '1', '2017-06-11 13:03:16', '80656074', '3 - Tre Store'),
(10306, '2017-06-11 13:21:08', '77', '49.00', '1', '101', '1', '1', '2017-06-11 13:21:08', '80656074', 'Blue Spirit'),
(10307, '2017-06-11 13:21:36', '190', '6.00', '2', '101', '2', '1', '2017-06-11 13:21:36', '80656074', 'Bluvacanze'),
(10308, '2017-06-11 13:36:23', '177', '55.00', '2', '101', '2', '2', '2017-06-11 13:36:23', '80656074', 'Bottega Verde'),
(10309, '2017-06-11 13:45:47', '77', '10010.00', '2', '101', '2', '2', '2017-06-11 13:45:47', '80656074', 'Blue Spirit'),
(10310, '2017-06-11 13:50:23', '190', '100.00', '2', '101', '2', '2', '2017-06-11 13:50:23', '80656074', 'Bluvacanze'),
(10311, '2017-06-11 13:54:46', '216', '100.00', '2', '101', '2', '1', '2017-06-11 13:54:46', '80656074', 'America Graffiti'),
(10312, '2017-06-11 13:56:08', '198', '100.00', '2', '101', '2', '1', '2017-06-11 13:56:08', '80656074', 'Bareostato'),
(10313, '2017-06-11 13:57:42', '129', '100.00', '2', '101', '2', '1', '2017-06-11 13:57:42', '80656074', 'Apple Store');

-- --------------------------------------------------------

--
-- Struttura della tabella `igigli_tabs`
--

CREATE TABLE IF NOT EXISTS `igigli_tabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_level` enum('super','admin','concorso','buoni','baby','guest','foto','data_entry') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `vendita_buoni` int(11) DEFAULT NULL,
  `elenco_buoni` int(11) DEFAULT NULL,
  `scontrini` int(11) DEFAULT NULL,
  `scontrini_multi` int(11) DEFAULT NULL,
  `nuova_tessera` int(11) DEFAULT NULL,
  `tessera_bambini` int(11) DEFAULT NULL,
  `nuova_tessera_provvisoria` int(11) DEFAULT NULL,
  `nuova_tessera_figli` int(11) DEFAULT NULL,
  `elenco_tessere` int(11) DEFAULT NULL,
  `vincite` int(11) DEFAULT NULL,
  `vincite_we` int(11) DEFAULT NULL,
  `vincite_se` int(11) DEFAULT NULL,
  `vincite_online` int(11) DEFAULT NULL,
  `casellario` int(11) DEFAULT NULL,
  `casellario_multi` int(11) DEFAULT NULL,
  `report` int(11) DEFAULT NULL,
  `report_multi` int(11) DEFAULT NULL,
  `report_buoni` int(11) DEFAULT NULL,
  `report_ingressi` int(11) DEFAULT NULL,
  `report_ingressi_tempo` int(11) DEFAULT NULL,
  `report_foto` int(11) DEFAULT NULL,
  `baby` int(11) DEFAULT NULL,
  `ingressi` int(11) DEFAULT NULL,
  `ingressi_tempo` int(11) DEFAULT NULL,
  `foto` int(11) DEFAULT NULL,
  `fotoricerca` int(11) DEFAULT NULL,
  `classifica` int(11) DEFAULT NULL,
  `report_classifica` int(11) DEFAULT NULL,
  `timer` int(11) DEFAULT NULL,
  `vita_carta` int(11) DEFAULT NULL,
  `estrazioni` int(11) DEFAULT NULL,
  `revert_msisdn` int(11) DEFAULT NULL,
  `configurazioni` int(11) DEFAULT NULL,
  `perizia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dump dei dati per la tabella `igigli_tabs`
--

INSERT INTO `igigli_tabs` (`id`, `user_level`, `vendita_buoni`, `elenco_buoni`, `scontrini`, `scontrini_multi`, `nuova_tessera`, `tessera_bambini`, `nuova_tessera_provvisoria`, `nuova_tessera_figli`, `elenco_tessere`, `vincite`, `vincite_we`, `vincite_se`, `vincite_online`, `casellario`, `casellario_multi`, `report`, `report_multi`, `report_buoni`, `report_ingressi`, `report_ingressi_tempo`, `report_foto`, `baby`, `ingressi`, `ingressi_tempo`, `foto`, `fotoricerca`, `classifica`, `report_classifica`, `timer`, `vita_carta`, `estrazioni`, `revert_msisdn`, `configurazioni`, `perizia`) VALUES
(2, 'admin', 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
