-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.12-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             8.2.0.4690
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for imrp
CREATE DATABASE IF NOT EXISTS `imrp` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `imrp`;


-- Dumping structure for table imrp.accounts
CREATE TABLE IF NOT EXISTS `accounts` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(24) NOT NULL,
  `AdminName` varchar(24) NOT NULL,
  `Password` varchar(129) NOT NULL,
  `Banned` tinyint(3) unsigned NOT NULL,
  `IpAddress` varchar(32) NOT NULL DEFAULT '0.0.0.0',
  `AdminLevel` tinyint(3) unsigned NOT NULL,
  `Money` int(11) NOT NULL,
  `Paycheck` int(11) NOT NULL,
  `Skin` smallint(3) unsigned NOT NULL,
  `Faction` tinyint(3) unsigned NOT NULL,
  `Leadership` tinyint(3) unsigned NOT NULL,
  `Level` tinyint(3) unsigned NOT NULL,
  `Experience` smallint(5) unsigned NOT NULL,
  `PlayingHours` smallint(5) unsigned NOT NULL,
  `Health` float NOT NULL,
  `Armour` float NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  `PosAngle` float NOT NULL,
  `Interior` tinyint(3) unsigned NOT NULL,
  `VirtualWorld` int(11) NOT NULL,
  `Job` tinyint(3) unsigned NOT NULL,
  `wSlot1` tinyint(3) unsigned NOT NULL,
  `wSlot2` tinyint(3) unsigned NOT NULL,
  `wSlot3` tinyint(3) unsigned NOT NULL,
  `wSlot4` tinyint(3) unsigned NOT NULL,
  `wSlot5` tinyint(3) unsigned NOT NULL,
  `wSlot6` tinyint(3) unsigned NOT NULL,
  `wSlot7` tinyint(3) unsigned NOT NULL,
  `wSlot8` tinyint(3) unsigned NOT NULL,
  `wSlot9` tinyint(3) unsigned NOT NULL,
  `wSlot10` tinyint(3) unsigned NOT NULL,
  `wSlot11` tinyint(3) unsigned NOT NULL,
  `wSlot12` tinyint(3) unsigned NOT NULL,
  `NewbMute` tinyint(3) unsigned NOT NULL,
  `AdMute` tinyint(3) unsigned NOT NULL,
  `ReportMute` tinyint(3) unsigned NOT NULL,
  `OocMute` tinyint(3) unsigned NOT NULL,
  `JailTime` smallint(5) unsigned NOT NULL,
  `Rank` tinyint(3) unsigned NOT NULL,
  `Division` tinyint(3) unsigned NOT NULL,
  `WantedLevel` tinyint(3) unsigned NOT NULL,
  `Wounded` tinyint(3) unsigned NOT NULL,
  `Tutorial` tinyint(3) unsigned NOT NULL,
  `Age` tinyint(3) unsigned NOT NULL,
  `Gender` tinyint(3) unsigned NOT NULL,
  `bBalance` int(11) NOT NULL,
  `JackedCar` int(10) unsigned NOT NULL,
  `WalkieTalkie` tinyint(3) unsigned NOT NULL,
  `Channel` int(11) NOT NULL,
  `PhoneNumber` int(11) NOT NULL,
  `VIP` tinyint(3) unsigned NOT NULL,
  `Spraycan` smallint(5) unsigned NOT NULL,
  `DriverLicense` tinyint(3) unsigned NOT NULL,
  `OocJail` tinyint(3) unsigned NOT NULL,
  `GunLicense` tinyint(3) unsigned NOT NULL,
  `Seeds` tinyint(3) unsigned NOT NULL,
  `Weed` tinyint(3) unsigned NOT NULL,
  `PlantX` float NOT NULL,
  `PlantY` float NOT NULL,
  `PlantZ` float NOT NULL,
  `PlantInterior` tinyint(3) unsigned NOT NULL,
  `PlantVw` int(11) NOT NULL,
  `PlantGrowth` int(11) NOT NULL,
  `GasCans` tinyint(3) unsigned NOT NULL,
  `FishedAlready` int(11) NOT NULL,
  `ContractPrice` int(11) NOT NULL,
  `ContractReason` varchar(32) NOT NULL,
  `ContractBy` varchar(24) NOT NULL,
  `Hitman` tinyint(3) unsigned NOT NULL,
  `Referer` varchar(24) NOT NULL,
  `ReceivedCar` tinyint(3) unsigned NOT NULL,
  `Accent` tinyint(3) unsigned NOT NULL,
  `CompletedHits` smallint(5) unsigned NOT NULL,
  `pv0_ModelId` smallint(5) unsigned NOT NULL,
  `pv0_PosX` float NOT NULL,
  `pv0_PosY` float NOT NULL,
  `pv0_PosZ` float NOT NULL,
  `pv0_PosAngle` float NOT NULL,
  `pv0_Locked` tinyint(3) unsigned NOT NULL,
  `pv0_Health` float NOT NULL,
  `pv0_PaintJob` tinyint(3) unsigned NOT NULL,
  `pv0_Color1` tinyint(3) unsigned NOT NULL,
  `pv0_Color2` tinyint(3) unsigned NOT NULL,
  `pv0_Mods` tinyint(3) unsigned NOT NULL,
  `pv0_Ticket` int(10) unsigned NOT NULL,
  `pv0_Impounded` tinyint(3) unsigned NOT NULL,
  `pv1_ModelId` smallint(5) unsigned NOT NULL,
  `pv1_PosX` float NOT NULL,
  `pv1_PosY` float NOT NULL,
  `pv1_PosZ` float NOT NULL,
  `pv1_PosAngle` float NOT NULL,
  `pv1_Locked` tinyint(3) unsigned NOT NULL,
  `pv1_Health` float NOT NULL,
  `pv1_PaintJob` tinyint(3) unsigned NOT NULL,
  `pv1_Color1` tinyint(3) unsigned NOT NULL,
  `pv1_Color2` tinyint(3) unsigned NOT NULL,
  `pv1_Mods` tinyint(3) unsigned NOT NULL,
  `pv1_Ticket` int(10) unsigned NOT NULL,
  `pv1_Impounded` tinyint(3) unsigned NOT NULL,
  `pv2_ModelId` smallint(5) unsigned NOT NULL,
  `pv2_PosX` float NOT NULL,
  `pv2_PosY` float NOT NULL,
  `pv2_PosZ` float NOT NULL,
  `pv2_PosAngle` float NOT NULL,
  `pv2_Locked` tinyint(3) unsigned NOT NULL,
  `pv2_Health` float NOT NULL,
  `pv2_PaintJob` tinyint(3) unsigned NOT NULL,
  `pv2_Color1` tinyint(3) unsigned NOT NULL,
  `pv2_Color2` tinyint(3) unsigned NOT NULL,
  `pv2_Mods` tinyint(3) unsigned NOT NULL,
  `pv2_Ticket` int(10) unsigned NOT NULL,
  `pv2_Impounded` tinyint(3) unsigned NOT NULL,
  `Bombs` tinyint(3) unsigned NOT NULL,
  `Reports` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table imrp.accounts: ~3 rows (approximately)
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
REPLACE INTO `accounts` (`Id`, `Username`, `Password`, `Banned`, `IpAddress`, `AdminLevel`, `Money`, `Paycheck`, `Skin`, `Faction`, `Leadership`, `Level`, `Experience`, `PlayingHours`, `Health`, `Armour`, `PosX`, `PosY`, `PosZ`, `PosAngle`, `Interior`, `VirtualWorld`, `Job`, `wSlot1`, `wSlot2`, `wSlot3`, `wSlot4`, `wSlot5`, `wSlot6`, `wSlot7`, `wSlot8`, `wSlot9`, `wSlot10`, `wSlot11`, `wSlot12`, `NewbMute`, `AdMute`, `ReportMute`, `OocMute`, `JailTime`, `Rank`, `Division`, `WantedLevel`, `Wounded`, `Tutorial`, `Age`, `Gender`, `bBalance`, `JackedCar`, `WalkieTalkie`, `Channel`, `PhoneNumber`, `VIP`, `Spraycan`, `DriverLicense`, `OocJail`, `GunLicense`, `Seeds`, `Weed`, `PlantX`, `PlantY`, `PlantZ`, `PlantInterior`, `PlantVw`, `PlantGrowth`, `GasCans`, `FishedAlready`, `ContractPrice`, `ContractReason`, `ContractBy`, `Hitman`, `Referer`, `ReceivedCar`, `Accent`, `CompletedHits`, `pv0_ModelId`, `pv0_PosX`, `pv0_PosY`, `pv0_PosZ`, `pv0_PosAngle`, `pv0_Locked`, `pv0_Health`, `pv0_PaintJob`, `pv0_Color1`, `pv0_Color2`, `pv0_Mods`, `pv0_Ticket`, `pv0_Impounded`, `pv1_ModelId`, `pv1_PosX`, `pv1_PosY`, `pv1_PosZ`, `pv1_PosAngle`, `pv1_Locked`, `pv1_Health`, `pv1_PaintJob`, `pv1_Color1`, `pv1_Color2`, `pv1_Mods`, `pv1_Ticket`, `pv1_Impounded`, `pv2_ModelId`, `pv2_PosX`, `pv2_PosY`, `pv2_PosZ`, `pv2_PosAngle`, `pv2_Locked`, `pv2_Health`, `pv2_PaintJob`, `pv2_Color1`, `pv2_Color2`, `pv2_Mods`, `pv2_Ticket`, `pv2_Impounded`, `Bombs`, `Reports`) VALUES
	(1, 'Thomas_Freeman', '74DFC2B27ACFA364DA55F93A5CAEE29CCAD3557247EDA238831B3E9BD931B01D77FE994E4F12B9D4CFA92A124461D2065197D8CF7F33FC88566DA2DB2A4D6EAE', 0, '192.168.1.2', 6, 9904599, 348, 23, 1, 1, 2, 0, 10, 100, 0, 1692.34, 1451.17, 10.7649, 180, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 1, 0, 0, 1, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 1, 'Norrin_Radd', 0, 0, 6, 406, -801.145, 1441.11, 13.7931, 165.582, 0, 1000, 0, 0, 0, 0, 0, 0, 457, -195.815, 2121.05, -13.9528, 258.736, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;


-- Dumping structure for table imrp.bans
CREATE TABLE IF NOT EXISTS `bans` (
  `IP_Address` varchar(16) NOT NULL,
  `Username` varchar(24) NOT NULL,
  `Expiry_Date` int(11) NOT NULL,
  `Reason` varchar(64) NOT NULL,
  `Ban_Type` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`IP_Address`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table imrp.bans: 0 rows
/*!40000 ALTER TABLE `bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `bans` ENABLE KEYS */;


-- Dumping structure for table imrp.businesses
CREATE TABLE IF NOT EXISTS `businesses` (
  `Id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `Name` varchar(16) NOT NULL,
  `Owner` varchar(24) NOT NULL,
  `BuyPrice` int(11) NOT NULL,
  `Earnings` int(11) NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  `FacingAngle` float NOT NULL,
  `Interior` tinyint(3) unsigned NOT NULL,
  `VirtualWorld` int(11) NOT NULL,
  `Open` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table imrp.businesses: ~1 rows (approximately)
/*!40000 ALTER TABLE `businesses` DISABLE KEYS */;
/*!40000 ALTER TABLE `businesses` ENABLE KEYS */;


-- Dumping structure for table imrp.factions
CREATE TABLE IF NOT EXISTS `factions` (
  `Id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(24) NOT NULL,
  `Motd` varchar(128) NOT NULL,
  `Type` int(11) DEFAULT '0',
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
  `LockerMats` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table imrp.factions: ~10 rows (approximately)
/*!40000 ALTER TABLE `factions` DISABLE KEYS */;
REPLACE INTO `factions` (`Id`, `Name`, `Motd`, `Type`, `Rank1`, `Rank2`, `Rank3`, `Rank4`, `Rank5`, `Rank6`, `Rank7`, `Rank8`, `Rank9`, `Rank10`, `Div1`, `Div2`, `Div3`, `Div4`, `Div5`, `LockerX`, `LockerY`, `LockerZ`, `LockerMats`) VALUES
	(1, 'LSPD', '', 1, 'Nigger', '', '', '', '', '', '', '', '', 'Chief', 'PTL', 'DET', 'nothin', 'FTO', 'HC', 255.377, 76.9721, 1003.64, 5),
	(2, 'Robadan Republic', 'nate higgers', 2, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 476.099, -14.9788, 1003.7, 10),
	(3, 'None', '', 3, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1837.23, -1734.01, 602.677, 0),
	(4, 'None', '', 5, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 385.795, 2416.18, 16.4844, 0),
	(5, 'None', '', 2, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0),
	(6, 'None', '', 2, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0),
	(7, 'None', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0),
	(8, 'None', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0),
	(9, 'None', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0),
	(10, 'None', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0);
/*!40000 ALTER TABLE `factions` ENABLE KEYS */;


-- Dumping structure for table imrp.gates
CREATE TABLE IF NOT EXISTS `gates` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `Model` int(11) NOT NULL,
  `Password` varchar(12) NOT NULL,
  `Speed` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table imrp.gates: ~0 rows (approximately)
/*!40000 ALTER TABLE `gates` DISABLE KEYS */;
/*!40000 ALTER TABLE `gates` ENABLE KEYS */;


-- Dumping structure for table imrp.houses
CREATE TABLE IF NOT EXISTS `houses` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Owner` varchar(24) NOT NULL,
  `BuyPrice` int(11) NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  `FacingAngle` float NOT NULL,
  `VirtualWorld` int(11) NOT NULL,
  `Interior` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table imrp.houses: ~2 rows (approximately)
/*!40000 ALTER TABLE `houses` DISABLE KEYS */;
REPLACE INTO `houses` (`Id`, `Owner`, `BuyPrice`, `PosX`, `PosY`, `PosZ`, `FacingAngle`, `VirtualWorld`, `Interior`) VALUES
	(1, 'None', 1, -1204.54, 1829.37, 41.7188, 323.956, 94352, 1),
	(2, 'None', 1, -1199.7, 1826.43, 41.7188, 233.956, 35191, 1),
	(3, 'None', 1, -1197.77, 1828.65, 41.7188, 323.956, 33817, 1);
/*!40000 ALTER TABLE `houses` ENABLE KEYS */;


-- Dumping structure for table imrp.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `Username` varchar(24) NOT NULL,
  `Date` varchar(32) NOT NULL,
  `Type` varchar(16) NOT NULL,
  `Issuer` varchar(24) NOT NULL,
  `Reason` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table imrp.logs: ~3 rows (approximately)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;


-- Dumping structure for table imrp.vaults
CREATE TABLE IF NOT EXISTS `vaults` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Money` int(11) NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table imrp.vaults: ~10 rows (approximately)
/*!40000 ALTER TABLE `vaults` DISABLE KEYS */;
REPLACE INTO `vaults` (`Id`, `Money`, `PosX`, `PosY`, `PosZ`) VALUES
	(1, 21100, -2450.57, 2234.2, 4.84375),
	(2, 147700, -2405.61, 2350.7, 7.29655),
	(3, 36000, 0, 0, 0),
	(4, 17800, 2551.02, -1288.78, 1044.12),
	(5, 0, 0, 0, 0),
	(6, 0, 0, 0, 0),
	(7, 0, 0, 0, 0),
	(8, 0, 0, 0, 0),
	(9, 0, 0, 0, 0),
	(10, 0, -2443.31, 2237.64, 4.84375);
/*!40000 ALTER TABLE `vaults` ENABLE KEYS */;


-- Dumping structure for table imrp.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Model` int(11) NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  `Angle` float NOT NULL,
  `Color1` int(11) NOT NULL,
  `Color2` int(11) NOT NULL,
  `Type` int(11) NOT NULL,
  `Faction` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table imrp.vehicles: ~4 rows (approximately)
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
REPLACE INTO `vehicles` (`Id`, `Model`, `PosX`, `PosY`, `PosZ`, `Angle`, `Color1`, `Color2`, `Type`, `Faction`) VALUES
	(1, 400, -2431.22, 2313.03, 4.98438, 48.6755, 0, 0, 2, 0),
	(2, 400, 2467.78, 2512.65, 10.7936, 85.3878, 0, 0, 2, 0),
	(3, 448, -1207.81, 1827.21, 41.7188, 354.735, 0, 0, 4, 0);
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;


-- Dumping structure for table imrp.waypoints
CREATE TABLE IF NOT EXISTS `waypoints` (
  `Id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `TextDisplay` varchar(64) NOT NULL,
  `Password` varchar(8) NOT NULL,
  `Locked` tinyint(3) unsigned NOT NULL,
  `wPosX` float NOT NULL,
  `wPosY` float NOT NULL,
  `wPosZ` float NOT NULL,
  `wVirtualWorld` int(11) NOT NULL,
  `wInterior` tinyint(3) unsigned NOT NULL,
  `wFacingAngle` float NOT NULL,
  `wLoadTime` tinyint(3) unsigned NOT NULL,
  `dPosX` float NOT NULL,
  `dPosY` float NOT NULL,
  `dPosZ` float NOT NULL,
  `dVirtualWorld` int(11) NOT NULL,
  `dInterior` tinyint(3) unsigned NOT NULL,
  `dFacingAngle` float NOT NULL,
  `dLoadTime` tinyint(3) unsigned NOT NULL,
  `FactionRestriction` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table imrp.waypoints: ~0 rows (approximately)
/*!40000 ALTER TABLE `waypoints` DISABLE KEYS */;
REPLACE INTO `waypoints` (`Id`, `TextDisplay`, `Password`, `Locked`, `wPosX`, `wPosY`, `wPosZ`, `wVirtualWorld`, `wInterior`, `wFacingAngle`, `wLoadTime`, `dPosX`, `dPosY`, `dPosZ`, `dVirtualWorld`, `dInterior`, `dFacingAngle`, `dLoadTime`, `FactionRestriction`) VALUES
	(1, 'Weapon Factory', 'None', 0, -2457.42, 2291.12, 4.98438, 0, 0, 343.005, 0, 2569.59, -1301.81, 1044.12, 666, 2, 87.3461, 3, 0),
	(2, 'Mineshaft', 'None', 0, 601.261, 867.974, -42.9609, 0, 0, 72.9819, 0, -272.942, 2009.39, -13.805, 0, 1, 350.934, 3, 0);
/*!40000 ALTER TABLE `waypoints` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
