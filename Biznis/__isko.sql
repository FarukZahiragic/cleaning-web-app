-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 22, 2022 at 09:59 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `čisko`
--

-- --------------------------------------------------------

--
-- Table structure for table `dobavljač`
--

CREATE TABLE IF NOT EXISTS `dobavljač` (
  `IdDobavljača` int(11) NOT NULL AUTO_INCREMENT,
  `NazivDobavljača` varchar(40) NOT NULL,
  `KontaktTelefonDobavljača` date NOT NULL,
  `EMailDobavljača` varchar(40) NOT NULL,
  `NazivRepromaterijala` varchar(40) NOT NULL,
  PRIMARY KEY (`IdDobavljača`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `formanarudžbe`
--

CREATE TABLE IF NOT EXISTS `formanarudžbe` (
  `IdNarudžbe` int(11) NOT NULL AUTO_INCREMENT,
  `ImeIPrezimeKorisnika` varchar(40) NOT NULL,
  `KontaktTelefonKorisnika` int(11) NOT NULL,
  `DatumNarudžbe` date NOT NULL,
  `LokacijaNarudžbe` varchar(40) DEFAULT NULL,
  `EMailKorisnika` varchar(40) DEFAULT NULL,
  `ŠifraUsluge` int(11) NOT NULL,
  PRIMARY KEY (`IdNarudžbe`),
  KEY `ŠifraUsluge` (`ŠifraUsluge`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `izvršeneusluge`
--

CREATE TABLE IF NOT EXISTS `izvršeneusluge` (
  `IdIzvršeneUsluge` int(11) NOT NULL AUTO_INCREMENT,
  `NazivIzvršeneUsluge` varchar(40) NOT NULL,
  `ZaradaUsluge` int(11) NOT NULL,
  `TrošakUsluge` int(11) DEFAULT NULL,
  `ProfitUsluge` int(11) NOT NULL,
  `NoviKorisnik` tinyint(1) NOT NULL,
  `ŠifraUsluge` int(11) NOT NULL,
  `ŠifraRepromaterijala` int(11) NOT NULL,
  `ŠifraKorisnika` int(11) NOT NULL,
  PRIMARY KEY (`IdIzvršeneUsluge`),
  KEY `ŠifraUsluge` (`ŠifraUsluge`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE IF NOT EXISTS `korisnik` (
  `IdKorisnika` int(11) NOT NULL AUTO_INCREMENT,
  `ImeIPrezimeKorisnika` varchar(40) NOT NULL,
  `LokacijaKorisnika` varchar(40) DEFAULT NULL,
  `KontaktTelefonKorisnika` int(11) NOT NULL,
  `EMailKorisnika` varchar(40) DEFAULT NULL,
  `NarudžbaKorisnika` int(11) NOT NULL,
  PRIMARY KEY (`IdKorisnika`),
  KEY `NarudžbaKorisnika` (`NarudžbaKorisnika`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nabavka`
--

CREATE TABLE IF NOT EXISTS `nabavka` (
  `IdNabavke` int(11) NOT NULL AUTO_INCREMENT,
  `NazivNabavke` varchar(40) NOT NULL,
  `KoličinaNabavke` decimal(10,0) NOT NULL,
  `CijenaNabavke` decimal(10,0) NOT NULL,
  `DatumNabavke` date NOT NULL,
  `ŠifraDobavljača` int(11) NOT NULL,
  `ŠifraRepromaterijala` int(11) NOT NULL,
  PRIMARY KEY (`IdNabavke`),
  KEY `ŠifraDobavljača` (`ŠifraDobavljača`),
  KEY `ŠifraRepromaterijala` (`ŠifraRepromaterijala`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `repromaterijal`
--

CREATE TABLE IF NOT EXISTS `repromaterijal` (
  `IdRepromaterijala` int(11) NOT NULL AUTO_INCREMENT,
  `CijenaRepromaterijala` decimal(10,0) NOT NULL,
  `NazivRepromaterijala` varchar(40) NOT NULL,
  `DatumNabavke` date NOT NULL,
  `DostupanRepromaterijal` tinyint(1) NOT NULL,
  `DostupnaKoličina` decimal(10,0) DEFAULT NULL,
  `ŠifraDobavljača` int(11) NOT NULL,
  `ŠifraNabavke` int(11) NOT NULL,
  PRIMARY KEY (`IdRepromaterijala`),
  KEY `ŠifraDobavljača` (`ŠifraDobavljača`),
  KEY `ŠifraNabavke` (`ŠifraNabavke`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `usluge`
--

CREATE TABLE IF NOT EXISTS `usluge` (
  `IdUsluge` int(11) NOT NULL AUTO_INCREMENT,
  `NazivUsluge` varchar(40) NOT NULL,
  `CijenaUsluge` int(11) NOT NULL,
  `TrošakRepromaterijalaUsluge` int(11) DEFAULT NULL,
  `TrošakAmortizacije` int(11) DEFAULT NULL,
  `OstaliTroškovi` int(11) DEFAULT NULL,
  `UkupanTrošak` int(11) NOT NULL,
  `ŠifraRepromaterijala` int(11) DEFAULT NULL,
  `KoličinaRepromaterijala` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdUsluge`),
  KEY `ŠifraRepromaterijala` (`ŠifraRepromaterijala`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `formanarudžbe`
--
ALTER TABLE `formanarudžbe`
  ADD CONSTRAINT `formanarudžbe_ibfk_1` FOREIGN KEY (`ŠifraUsluge`) REFERENCES `usluge` (`IdUsluge`);

--
-- Constraints for table `izvršeneusluge`
--
ALTER TABLE `izvršeneusluge`
  ADD CONSTRAINT `izvršeneusluge_ibfk_1` FOREIGN KEY (`ŠifraUsluge`) REFERENCES `usluge` (`IdUsluge`);

--
-- Constraints for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD CONSTRAINT `korisnik_ibfk_1` FOREIGN KEY (`NarudžbaKorisnika`) REFERENCES `formanarudžbe` (`IdNarudžbe`);

--
-- Constraints for table `nabavka`
--
ALTER TABLE `nabavka`
  ADD CONSTRAINT `nabavka_ibfk_2` FOREIGN KEY (`ŠifraRepromaterijala`) REFERENCES `repromaterijal` (`IdRepromaterijala`),
  ADD CONSTRAINT `nabavka_ibfk_1` FOREIGN KEY (`ŠifraDobavljača`) REFERENCES `dobavljač` (`IdDobavljača`);

--
-- Constraints for table `repromaterijal`
--
ALTER TABLE `repromaterijal`
  ADD CONSTRAINT `repromaterijal_ibfk_2` FOREIGN KEY (`ŠifraNabavke`) REFERENCES `nabavka` (`IdNabavke`),
  ADD CONSTRAINT `repromaterijal_ibfk_1` FOREIGN KEY (`ŠifraDobavljača`) REFERENCES `dobavljač` (`IdDobavljača`);

--
-- Constraints for table `usluge`
--
ALTER TABLE `usluge`
  ADD CONSTRAINT `usluge_ibfk_1` FOREIGN KEY (`ŠifraRepromaterijala`) REFERENCES `repromaterijal` (`IdRepromaterijala`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
