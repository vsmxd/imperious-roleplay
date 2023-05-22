-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 20, 2023 at 07:54 AM
-- Server version: 8.0.21
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `imrp`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(24) NOT NULL,
  `AdminName` varchar(24) NOT NULL,
  `Password` varchar(129) NOT NULL,
  `Banned` tinyint UNSIGNED NOT NULL,
  `IpAddress` varchar(32) NOT NULL DEFAULT '0.0.0.0',
  `AdminLevel` tinyint UNSIGNED NOT NULL,
  `Money` int NOT NULL,
  `Paycheck` int NOT NULL,
  `Skin` smallint UNSIGNED NOT NULL,
  `Faction` tinyint UNSIGNED NOT NULL,
  `Leadership` tinyint UNSIGNED NOT NULL,
  `Level` tinyint UNSIGNED NOT NULL,
  `Experience` smallint UNSIGNED NOT NULL,
  `PlayingHours` smallint UNSIGNED NOT NULL,
  `Health` float NOT NULL,
  `Armour` float NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  `PosAngle` float NOT NULL,
  `Interior` tinyint UNSIGNED NOT NULL,
  `VirtualWorld` int NOT NULL,
  `Job` tinyint UNSIGNED NOT NULL,
  `wSlot1` tinyint UNSIGNED NOT NULL,
  `wSlot2` tinyint UNSIGNED NOT NULL,
  `wSlot3` tinyint UNSIGNED NOT NULL,
  `wSlot4` tinyint UNSIGNED NOT NULL,
  `wSlot5` tinyint UNSIGNED NOT NULL,
  `wSlot6` tinyint UNSIGNED NOT NULL,
  `wSlot7` tinyint UNSIGNED NOT NULL,
  `wSlot8` tinyint UNSIGNED NOT NULL,
  `wSlot9` tinyint UNSIGNED NOT NULL,
  `wSlot10` tinyint UNSIGNED NOT NULL,
  `wSlot11` tinyint UNSIGNED NOT NULL,
  `wSlot12` tinyint UNSIGNED NOT NULL,
  `NewbMute` tinyint UNSIGNED NOT NULL,
  `AdMute` tinyint UNSIGNED NOT NULL,
  `ReportMute` tinyint UNSIGNED NOT NULL,
  `OocMute` tinyint UNSIGNED NOT NULL,
  `JailTime` smallint UNSIGNED NOT NULL,
  `Rank` tinyint UNSIGNED NOT NULL,
  `Division` tinyint UNSIGNED NOT NULL,
  `WantedLevel` tinyint UNSIGNED NOT NULL,
  `Wounded` tinyint UNSIGNED NOT NULL,
  `Tutorial` tinyint UNSIGNED NOT NULL,
  `Age` tinyint UNSIGNED NOT NULL,
  `Gender` tinyint UNSIGNED NOT NULL,
  `bBalance` int NOT NULL,
  `JackedCar` int UNSIGNED NOT NULL,
  `WalkieTalkie` tinyint UNSIGNED NOT NULL,
  `Channel` int NOT NULL,
  `PhoneNumber` int NOT NULL,
  `VIP` tinyint UNSIGNED NOT NULL,
  `Spraycan` smallint UNSIGNED NOT NULL,
  `DriverLicense` tinyint UNSIGNED NOT NULL,
  `OocJail` tinyint UNSIGNED NOT NULL,
  `GunLicense` tinyint UNSIGNED NOT NULL,
  `Seeds` tinyint UNSIGNED NOT NULL,
  `Weed` tinyint UNSIGNED NOT NULL,
  `PlantX` float NOT NULL,
  `PlantY` float NOT NULL,
  `PlantZ` float NOT NULL,
  `PlantInterior` tinyint UNSIGNED NOT NULL,
  `PlantVw` int NOT NULL,
  `PlantGrowth` int NOT NULL,
  `GasCans` tinyint UNSIGNED NOT NULL,
  `FishedAlready` int NOT NULL,
  `ContractPrice` int NOT NULL,
  `ContractReason` varchar(32) NOT NULL,
  `ContractBy` varchar(24) NOT NULL,
  `Hitman` tinyint UNSIGNED NOT NULL,
  `Referer` varchar(24) NOT NULL,
  `ReceivedCar` tinyint UNSIGNED NOT NULL,
  `Accent` tinyint UNSIGNED NOT NULL,
  `CompletedHits` smallint UNSIGNED NOT NULL,
  `pv0_ModelId` smallint UNSIGNED NOT NULL,
  `pv0_PosX` float NOT NULL,
  `pv0_PosY` float NOT NULL,
  `pv0_PosZ` float NOT NULL,
  `pv0_PosAngle` float NOT NULL,
  `pv0_Locked` tinyint UNSIGNED NOT NULL,
  `pv0_Health` float NOT NULL,
  `pv0_PaintJob` tinyint UNSIGNED NOT NULL,
  `pv0_Color1` tinyint UNSIGNED NOT NULL,
  `pv0_Color2` tinyint UNSIGNED NOT NULL,
  `pv0_Mods` tinyint UNSIGNED NOT NULL,
  `pv0_Ticket` int UNSIGNED NOT NULL,
  `pv0_Impounded` tinyint UNSIGNED NOT NULL,
  `pv1_ModelId` smallint UNSIGNED NOT NULL,
  `pv1_PosX` float NOT NULL,
  `pv1_PosY` float NOT NULL,
  `pv1_PosZ` float NOT NULL,
  `pv1_PosAngle` float NOT NULL,
  `pv1_Locked` tinyint UNSIGNED NOT NULL,
  `pv1_Health` float NOT NULL,
  `pv1_PaintJob` tinyint UNSIGNED NOT NULL,
  `pv1_Color1` tinyint UNSIGNED NOT NULL,
  `pv1_Color2` tinyint UNSIGNED NOT NULL,
  `pv1_Mods` tinyint UNSIGNED NOT NULL,
  `pv1_Ticket` int UNSIGNED NOT NULL,
  `pv1_Impounded` tinyint UNSIGNED NOT NULL,
  `pv2_ModelId` smallint UNSIGNED NOT NULL,
  `pv2_PosX` float NOT NULL,
  `pv2_PosY` float NOT NULL,
  `pv2_PosZ` float NOT NULL,
  `pv2_PosAngle` float NOT NULL,
  `pv2_Locked` tinyint UNSIGNED NOT NULL,
  `pv2_Health` float NOT NULL,
  `pv2_PaintJob` tinyint UNSIGNED NOT NULL,
  `pv2_Color1` tinyint UNSIGNED NOT NULL,
  `pv2_Color2` tinyint UNSIGNED NOT NULL,
  `pv2_Mods` tinyint UNSIGNED NOT NULL,
  `pv2_Ticket` int UNSIGNED NOT NULL,
  `pv2_Impounded` tinyint UNSIGNED NOT NULL,
  `Bombs` tinyint UNSIGNED NOT NULL,
  `Reports` mediumint UNSIGNED NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`Id`, `Username`, `AdminName`, `Password`, `Banned`, `IpAddress`, `AdminLevel`, `Money`, `Paycheck`, `Skin`, `Faction`, `Leadership`, `Level`, `Experience`, `PlayingHours`, `Health`, `Armour`, `PosX`, `PosY`, `PosZ`, `PosAngle`, `Interior`, `VirtualWorld`, `Job`, `wSlot1`, `wSlot2`, `wSlot3`, `wSlot4`, `wSlot5`, `wSlot6`, `wSlot7`, `wSlot8`, `wSlot9`, `wSlot10`, `wSlot11`, `wSlot12`, `NewbMute`, `AdMute`, `ReportMute`, `OocMute`, `JailTime`, `Rank`, `Division`, `WantedLevel`, `Wounded`, `Tutorial`, `Age`, `Gender`, `bBalance`, `JackedCar`, `WalkieTalkie`, `Channel`, `PhoneNumber`, `VIP`, `Spraycan`, `DriverLicense`, `OocJail`, `GunLicense`, `Seeds`, `Weed`, `PlantX`, `PlantY`, `PlantZ`, `PlantInterior`, `PlantVw`, `PlantGrowth`, `GasCans`, `FishedAlready`, `ContractPrice`, `ContractReason`, `ContractBy`, `Hitman`, `Referer`, `ReceivedCar`, `Accent`, `CompletedHits`, `pv0_ModelId`, `pv0_PosX`, `pv0_PosY`, `pv0_PosZ`, `pv0_PosAngle`, `pv0_Locked`, `pv0_Health`, `pv0_PaintJob`, `pv0_Color1`, `pv0_Color2`, `pv0_Mods`, `pv0_Ticket`, `pv0_Impounded`, `pv1_ModelId`, `pv1_PosX`, `pv1_PosY`, `pv1_PosZ`, `pv1_PosAngle`, `pv1_Locked`, `pv1_Health`, `pv1_PaintJob`, `pv1_Color1`, `pv1_Color2`, `pv1_Mods`, `pv1_Ticket`, `pv1_Impounded`, `pv2_ModelId`, `pv2_PosX`, `pv2_PosY`, `pv2_PosZ`, `pv2_PosAngle`, `pv2_Locked`, `pv2_Health`, `pv2_PaintJob`, `pv2_Color1`, `pv2_Color2`, `pv2_Mods`, `pv2_Ticket`, `pv2_Impounded`, `Bombs`, `Reports`) VALUES
(1, 'Thomas_Freeman', 'Thomas', '74DFC2B27ACFA364DA55F93A5CAEE29CCAD3557247EDA238831B3E9BD931B01D77FE994E4F12B9D4CFA92A124461D2065197D8CF7F33FC88566DA2DB2A4D6EAE', 0, '192.168.1.2', 6, 9904599, 348, 23, 1, 1, 2, 0, 10, 100, 0, 1692.34, 1451.17, 10.7649, 180, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 1, 0, 0, 1, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 1, 'Norrin_Radd', 0, 0, 6, 406, -801.145, 1441.11, 13.7931, 165.582, 0, 1000, 0, 0, 0, 0, 0, 0, 457, -195.815, 2121.05, -13.9528, 258.736, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 'Ray_Vintage', 'Vintage', '4FE4A24CBF6695CCC6440C4A9504DE730609FE60AFD244548B41BE6935FE1252EAB93BB0EDD1BFADC8C4B619D95F79F76FE5E263D4563BD69BA4F8B43A1E0CD9', 0, '127.0.0.1', 6, 99, 0, 82, 0, 0, 1, 0, 0, 67, 0, 2113.73, -1747.16, 13.5625, 174.111, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 18, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bans`
--

DROP TABLE IF EXISTS `bans`;
CREATE TABLE IF NOT EXISTS `bans` (
  `IP_Address` varchar(16) NOT NULL,
  `Username` varchar(24) NOT NULL,
  `Expiry_Date` int NOT NULL,
  `Reason` varchar(64) NOT NULL,
  `Ban_Type` tinyint UNSIGNED NOT NULL,
  PRIMARY KEY (`IP_Address`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `businesses`
--

DROP TABLE IF EXISTS `businesses`;
CREATE TABLE IF NOT EXISTS `businesses` (
  `Id` tinyint NOT NULL AUTO_INCREMENT,
  `Name` varchar(16) NOT NULL,
  `Owner` varchar(24) NOT NULL,
  `BuyPrice` int NOT NULL,
  `Earnings` int NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  `FacingAngle` float NOT NULL,
  `Interior` tinyint UNSIGNED NOT NULL,
  `VirtualWorld` int NOT NULL,
  `Open` tinyint UNSIGNED NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `factions`
--

DROP TABLE IF EXISTS `factions`;
CREATE TABLE IF NOT EXISTS `factions` (
  `Id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` varchar(24) NOT NULL,
  `Motd` varchar(128) NOT NULL,
  `Type` int DEFAULT '0',
  `Rank1` varchar(32) NOT NULL,
  `Rank2` varchar(32) NOT NULL,
  `Rank3` varchar(32) NOT NULL,
  `Rank4` varchar(32) NOT NULL,
  `Rank5` varchar(32) NOT NULL,
  `Rank6` varchar(32) NOT NULL,
  `Rank7` varchar(32) NOT NULL,
  `Rank8` varchar(32) NOT NULL,
  `Rank9` varchar(32) NOT NULL,
  `Rank10` varchar(32) NOT NULL,
  `Div1` varchar(8) NOT NULL,
  `Div2` varchar(8) NOT NULL,
  `Div3` varchar(8) NOT NULL,
  `Div4` varchar(8) NOT NULL,
  `Div5` varchar(8) NOT NULL,
  `LockerX` float NOT NULL,
  `LockerY` float NOT NULL,
  `LockerZ` float NOT NULL,
  `LockerMats` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `factions`
--

INSERT INTO `factions` (`Id`, `Name`, `Motd`, `Type`, `Rank1`, `Rank2`, `Rank3`, `Rank4`, `Rank5`, `Rank6`, `Rank7`, `Rank8`, `Rank9`, `Rank10`, `Div1`, `Div2`, `Div3`, `Div4`, `Div5`, `LockerX`, `LockerY`, `LockerZ`, `LockerMats`) VALUES
(1, 'LSPD', '', 1, 'Cadet', 'Officer', 'Corporal', 'Sergeant', 'Staff Sergeant', 'Lietenant', 'Captain', 'Commander', 'Asst. Chief', 'Chief', 'PTL', 'DET', 'SWAT', 'FTO', 'HC', 263.322, 109.722, 1004.62, 5),
(2, 'None', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0),
(3, 'None', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0),
(4, 'None', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0),
(5, 'None', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0),
(6, 'None', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0),
(7, 'None', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0),
(8, 'None', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0),
(9, 'None', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0),
(10, 'None', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `gates`
--

DROP TABLE IF EXISTS `gates`;
CREATE TABLE IF NOT EXISTS `gates` (
  `Id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  `PosRotationX` float NOT NULL,
  `PosRotationY` float NOT NULL,
  `PosRotationZ` float NOT NULL,
  `DestinationX` float NOT NULL,
  `DestinationY` float NOT NULL,
  `DestinationZ` float NOT NULL,
  `DestRotationX` float NOT NULL,
  `DestRotationY` float NOT NULL,
  `DestRotationZ` float NOT NULL,
  `Model` int NOT NULL,
  `Password` varchar(12) NOT NULL,
  `Speed` int UNSIGNED NOT NULL,
  `Faction` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

DROP TABLE IF EXISTS `houses`;
CREATE TABLE IF NOT EXISTS `houses` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Owner` varchar(24) NOT NULL,
  `BuyPrice` int NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  `FacingAngle` float NOT NULL,
  `VirtualWorld` int NOT NULL,
  `Interior` tinyint UNSIGNED NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `Username` varchar(24) NOT NULL,
  `Date` varchar(32) NOT NULL,
  `Type` varchar(16) NOT NULL,
  `Issuer` varchar(24) NOT NULL,
  `Reason` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vaults`
--

DROP TABLE IF EXISTS `vaults`;
CREATE TABLE IF NOT EXISTS `vaults` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Money` int NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vaults`
--

INSERT INTO `vaults` (`Id`, `Money`, `PosX`, `PosY`, `PosZ`) VALUES
(1, 0, 0, 0, 0),
(2, 0, 0, 0, 0),
(3, 0, 0, 0, 0),
(4, 0, 0, 0, 0),
(5, 0, 0, 0, 0),
(6, 0, 0, 0, 0),
(7, 0, 0, 0, 0),
(8, 0, 0, 0, 0),
(9, 0, 0, 0, 0),
(10, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE IF NOT EXISTS `vehicles` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Model` int NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  `Angle` float NOT NULL,
  `Color1` int NOT NULL,
  `Color2` int NOT NULL,
  `Type` int NOT NULL,
  `Faction` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `waypoints`
--

DROP TABLE IF EXISTS `waypoints`;
CREATE TABLE IF NOT EXISTS `waypoints` (
  `Id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `TextDisplay` varchar(64) NOT NULL,
  `Password` varchar(8) NOT NULL,
  `Locked` tinyint UNSIGNED NOT NULL,
  `wPosX` float NOT NULL,
  `wPosY` float NOT NULL,
  `wPosZ` float NOT NULL,
  `wVirtualWorld` int NOT NULL,
  `wInterior` tinyint UNSIGNED NOT NULL,
  `wFacingAngle` float NOT NULL,
  `wLoadTime` tinyint UNSIGNED NOT NULL,
  `dPosX` float NOT NULL,
  `dPosY` float NOT NULL,
  `dPosZ` float NOT NULL,
  `dVirtualWorld` int NOT NULL,
  `dInterior` tinyint UNSIGNED NOT NULL,
  `dFacingAngle` float NOT NULL,
  `dLoadTime` tinyint UNSIGNED NOT NULL,
  `FactionRestriction` tinyint UNSIGNED NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
