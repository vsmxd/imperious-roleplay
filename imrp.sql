-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 20, 2023 at 01:28 AM
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
(1, 'Thomas_Freeman', '', '74DFC2B27ACFA364DA55F93A5CAEE29CCAD3557247EDA238831B3E9BD931B01D77FE994E4F12B9D4CFA92A124461D2065197D8CF7F33FC88566DA2DB2A4D6EAE', 0, '192.168.1.2', 6, 9904599, 348, 23, 1, 1, 2, 0, 10, 100, 0, 1692.34, 1451.17, 10.7649, 180, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 1, 0, 0, 1, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 1, 'Norrin_Radd', 0, 0, 6, 406, -801.145, 1441.11, 13.7931, 165.582, 0, 1000, 0, 0, 0, 0, 0, 0, 457, -195.815, 2121.05, -13.9528, 258.736, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11, 'Ray_Vintage', '', '4FE4A24CBF6695CCC6440C4A9504DE730609FE60AFD244548B41BE6935FE1252EAB93BB0EDD1BFADC8C4B619D95F79F76FE5E263D4563BD69BA4F8B43A1E0CD9', 0, '127.0.0.1', 6, 100, 0, 82, 0, 0, 1, 0, 0, 95, 0, 2056.52, -1910, 13.5469, 267.665, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 18, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businesses`
--

INSERT INTO `businesses` (`Id`, `Name`, `Owner`, `BuyPrice`, `Earnings`, `PosX`, `PosY`, `PosZ`, `FacingAngle`, `Interior`, `VirtualWorld`, `Open`) VALUES
(1, 'Barber Shop', 'None', 10000, 0, 2071.4, -1793.9, 13.5533, 271.309, 3, 62802, 1),
(2, 'None', 'LS Pizza', 1, 0, 2105.14, -1806.53, 13.5547, 91.3793, 7, 78903, 1),
(3, 'None', 'Government', 1, 0, 1832.72, -1842.52, 13.5781, 90.3412, 20, 31308, 1),
(4, 'None', 'Government', 15000, 0, 2244.55, -1664.62, 15.4766, 346.026, 21, 14052, 1),
(5, 'Ammunation', 'Government', 1, 0, 2400.61, -1981.25, 13.5469, 359.98, 28, 68958, 1);

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
(1, 'LSPD', '', 1, 'Nigger', '', '', '', '', '', '', '', '', 'Chief', 'PTL', 'DET', 'nothin', 'FTO', 'HC', 255.377, 76.9721, 1003.64, 5),
(2, 'Robadan Republic', 'nate higgers', 2, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 476.099, -14.9788, 1003.7, 10),
(3, 'LSMD', '', 3, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1837.23, -1734.01, 602.677, 0),
(4, 'None', '', 5, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 385.795, 2416.18, 16.4844, 0),
(5, 'None', '', 2, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0),
(6, 'None', '', 2, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0),
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gates`
--

INSERT INTO `gates` (`Id`, `PosX`, `PosY`, `PosZ`, `PosRotationX`, `PosRotationY`, `PosRotationZ`, `DestinationX`, `DestinationY`, `DestinationZ`, `DestRotationX`, `DestRotationY`, `DestRotationZ`, `Model`, `Password`, `Speed`, `Faction`) VALUES
(1, 1586.78, -1638.32, 14.5828, 0, 0, -2.39986, 1586.78, -1638.32, 7.70282, 0, 0, -2.39986, 19313, '', 3, 0);

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

--
-- Dumping data for table `houses`
--

INSERT INTO `houses` (`Id`, `Owner`, `BuyPrice`, `PosX`, `PosY`, `PosZ`, `FacingAngle`, `VirtualWorld`, `Interior`) VALUES
(1, 'None', 1, -1204.54, 1829.37, 41.7188, 323.956, 94352, 1),
(2, 'None', 1, -1199.7, 1826.43, 41.7188, 233.956, 35191, 1),
(3, 'None', 1, -1197.77, 1828.65, 41.7188, 323.956, 33817, 1),
(4, 'None', 1, 2068.05, -1731.59, 13.8762, 270.439, 42588, 9);

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

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`Username`, `Date`, `Type`, `Issuer`, `Reason`) VALUES
('Ray_Vintage', '2023/1/20 - 11:52:39', 'Jail', 'Ray_Vintage', 'test (1 minutes)');

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
(1, 21100, -2450.57, 2234.2, 4.84375),
(2, 147800, -2405.61, 2350.7, 7.29655),
(3, 36000, 0, 0, 0),
(4, 17800, 2551.02, -1288.78, 1044.12),
(5, 0, 0, 0, 0),
(6, 0, 0, 0, 0),
(7, 0, 0, 0, 0),
(8, 0, 0, 0, 0),
(9, 0, 0, 0, 0),
(10, 0, -2443.31, 2237.64, 4.84375);

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

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`Id`, `Model`, `PosX`, `PosY`, `PosZ`, `Angle`, `Color1`, `Color2`, `Type`, `Faction`) VALUES
(1, 420, 1807.99, -1868.53, 13.3613, 0.66047, 6, 0, 0, 0),
(2, 400, 2467.78, 2512.65, 10.7936, 85.3878, 0, 0, 2, 0),
(3, 448, -1207.81, 1827.21, 41.7188, 354.735, 0, 0, 4, 0),
(4, 499, 2168.7, -2273.26, 13.3762, 225.149, 1, 4, 5, 0),
(5, 499, 2165.88, -2276.51, 13.3796, 225.039, 6, 9, 5, 0),
(6, 499, 2172.68, -2269.22, 13.3758, 225.082, 5, 3, 5, 0),
(7, 499, 2175.47, -2266.25, 13.3762, 225.476, 9, 0, 5, 0),
(8, 499, 2160.9, -2281.09, 13.3768, 224.249, 0, 0, 5, 0),
(9, 420, 1802.88, -1868.47, 13.357, 0.01389, 6, 0, 0, 0),
(10, 420, 1798.07, -1868.43, 13.352, 1.02607, 6, 0, 0, 0),
(11, 420, 1792.82, -1868.53, 13.3481, 359.972, 6, 0, 0, 0),
(12, 596, 1595.48, -1710.64, 5.89062, 359.41, 0, 1, 0, 1),
(13, 404, 2052.53, -1904.17, 13.2808, 180.125, 10, 11, 2, 0),
(14, 596, 1591.49, -1710.59, 5.89062, 358.026, 0, 1, 0, 1),
(15, 596, 1587.46, -1710.6, 5.89062, 359.616, 0, 1, 0, 1),
(16, 596, 1583.36, -1710.56, 5.89062, 359.934, 0, 1, 0, 1),
(17, 596, 1578.55, -1710.68, 5.89062, 1.20626, 0, 1, 0, 1),
(18, 596, 1574.45, -1710.76, 5.89062, 1.90557, 0, 1, 0, 1),
(19, 596, 1570.31, -1710.87, 5.89062, 359.96, 0, 1, 0, 1),
(20, 525, 1558.77, -1711.44, 5.89062, 0.579121, 0, 1, 0, 1),
(21, 560, 1530.62, -1645.13, 5.89062, 179.29, 0, 1, 0, 1),
(22, 560, 1534.65, -1645.13, 5.89062, 180.833, 0, 1, 0, 1),
(23, 560, 1538.7, -1645.05, 5.89062, 181.147, 0, 1, 0, 1),
(24, 541, 1545.64, -1651.11, 5.89062, 90.5921, 0, 1, 0, 1),
(25, 541, 1545.62, -1655.09, 5.89062, 88.7823, 0, 1, 0, 1),
(26, 541, 1545.7, -1659.06, 5.89062, 90.349, 0, 1, 0, 1),
(27, 541, 1545.84, -1663.15, 5.89062, 90.6623, 0, 1, 0, 1),
(28, 525, 1529.87, -1687.96, 5.89062, 268.011, 0, 1, 0, 1),
(29, 596, 1545.4, -1688.5, 5.89062, 89.4091, 0, 1, 0, 1),
(30, 596, 1545.38, -1684.38, 5.89062, 89.6733, 0, 1, 0, 1),
(31, 596, 1545.59, -1680.18, 5.89062, 88.8058, 0, 1, 0, 1),
(32, 596, 1545.72, -1676.07, 5.89062, 89.1191, 0, 1, 0, 1),
(33, 560, 1545.97, -1668.03, 5.89062, 89.409, 0, 1, 0, 1),
(34, 560, 1546.16, -1672.04, 5.89062, 89.4559, 0, 1, 0, 1),
(35, 426, 1601.79, -1704.28, 5.89062, 89.3608, 0, 1, 0, 1),
(36, 426, 1601.88, -1700.15, 5.89062, 89.345, 0, 1, 0, 1),
(37, 426, 1601.77, -1696.16, 5.89062, 89.2549, 0, 1, 0, 1),
(38, 426, 1601.87, -1691.99, 5.89062, 89.8816, 0, 1, 0, 1),
(39, 525, 1562.92, -1711.57, 5.89062, 1.17386, 0, 1, 0, 1),
(40, 448, 2122, -1784.16, 12.9844, 0.9122, 3, 6, 4, 0),
(41, 448, 2120, -1784.16, 12.9844, 0.9122, 3, 6, 4, 0),
(42, 448, 2118, -1784.16, 12.9844, 0.9122, 3, 6, 4, 0),
(43, 448, 2116, -1784.16, 12.9844, 0.9122, 3, 6, 4, 0),
(44, 448, 2114, -1784.16, 12.9844, 0.9122, 3, 6, 4, 0),
(45, 448, 2112, -1784.16, 12.9844, 0.9122, 3, 6, 4, 0),
(46, 404, 2055.97, -1904.08, 13.2792, 180.127, 11, 10, 2, 0),
(47, 404, 2059.31, -1904.28, 13.2803, 180.664, 11, 10, 2, 0),
(48, 416, 2030.6, -1438.08, 17.2804, 179.395, 1, 3, 0, 3),
(49, 416, 2030.53, -1428.91, 17.2088, 180.423, 1, 3, 0, 3);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `waypoints`
--

INSERT INTO `waypoints` (`Id`, `TextDisplay`, `Password`, `Locked`, `wPosX`, `wPosY`, `wPosZ`, `wVirtualWorld`, `wInterior`, `wFacingAngle`, `wLoadTime`, `dPosX`, `dPosY`, `dPosZ`, `dVirtualWorld`, `dInterior`, `dFacingAngle`, `dLoadTime`, `FactionRestriction`) VALUES
(1, 'Weapon Factory', 'None', 0, 2122.89, -1185.56, 24.0314, 0, 0, 92.2214, 0, 2569.59, -1301.81, 1044.12, 666, 2, 87.3461, 3, 0),
(2, 'Mineshaft', 'None', 0, 2195.8, -1973.48, 13.5589, 0, 0, 179.637, 0, -272.942, 2009.39, -13.805, 0, 1, 350.934, 3, 0),
(3, 'Crack Den', 'None', 0, 2166.3, -1671.64, 15.0739, 0, 0, 221.461, 0, 318.57, 1115.46, 1083.88, 66700, 5, 0, 0, 0),
(4, 'LS DMV', 'None', 0, 2046.67, -1908.06, 13.5469, 0, 0, 269.858, 0, -2029.57, -118.776, 1035.17, 32855, 3, 357.786, 0, 0),
(5, 'City Hall', 'None', 0, 1481.06, -1769.89, 18.7958, 0, 0, 358.922, 0, 389.304, 173.782, 1008.38, 432432, 3, 89.7891, 0, 0),
(6, 'Bank of Los Santos', 'None', 0, 1498.51, -1582.37, 13.5469, 0, 0, 180.944, 0, 2305.79, -16.1977, 26.7496, 23123, 0, 270.244, 0, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
