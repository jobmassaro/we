CREATE TABLE `igigli_accreditamento` (
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
  `eliminata` varchar(50) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `igigli_admin` (
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
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;


CREATE TABLE `igigli_calcolo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `da` decimal(10,2) NOT NULL,
  `dam` decimal(10,2) NOT NULL,
  `a` decimal(10,2) NOT NULL,
  `n` int(11) DEFAULT NULL,
  `uova` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `igigli_concorso` (
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


CREATE TABLE `igigli_log_estrazioni` (
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
) ENGINE=MyISAM AUTO_INCREMENT=15876 DEFAULT CHARSET=latin1;


CREATE TABLE `igigli_newcredito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente` varchar(20) NOT NULL,
  `credito` int(11) NOT NULL,
  `usato` int(11) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15409 DEFAULT CHARSET=latin1;


CREATE TABLE `igigli_newgiocata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `risultato` enum('VINTO','PERSO','NOCREDITO') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `premio` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ritirato` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'F',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ritiro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=72791 DEFAULT CHARSET=latin1;


CREATE TABLE `igigli_newgiornata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `inizio` time NOT NULL,
  `fine` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;


CREATE TABLE `igigli_newpremio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `nome` varchar(50) NOT NULL,
  `tot` int(11) NOT NULL,
  `usciti` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=128 DEFAULT CHARSET=latin1;

CREATE TABLE `igigli_pv` (
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
) ENGINE=MyISAM AUTO_INCREMENT=218 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `igigli_scontrino` (
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
) ENGINE=MyISAM AUTO_INCREMENT=10293 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `igigli_tabs` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
