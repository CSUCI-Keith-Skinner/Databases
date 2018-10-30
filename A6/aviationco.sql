-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 30, 2016 at 08:03 PM
-- Server version: 5.1.36
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

DROP DATABASE IF EXISTS AVIATIONCO;
CREATE DATABASE AVIATIONCO;

USE AVIATIONCO;

--
-- Database: `aviationco`
--

-- --------------------------------------------------------

--
-- Table structure for table `aircraft`
--

CREATE TABLE IF NOT EXISTS `aircraft` (
  `AC_NUMBER` varchar(5) NOT NULL DEFAULT '',
  `MOD_CODE` varchar(10) DEFAULT NULL,
  `AC_TTAF` float DEFAULT NULL,
  `AC_TTEL` float DEFAULT NULL,
  `AC_TTER` float DEFAULT NULL,
  PRIMARY KEY (`AC_NUMBER`),
  KEY `MOD_CODE` (`MOD_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aircraft`
--

INSERT INTO `aircraft` (`AC_NUMBER`, `MOD_CODE`, `AC_TTAF`, `AC_TTEL`, `AC_TTER`) VALUES
('1484P', 'PA23-250', 1833.1, 1833.1, 101.8),
('2289L', 'C-90A', 4243.8, 768.9, 1123.4),
('2778V', 'PA31-350', 7992.9, 1513.1, 789.5),
('4278Y', 'PA31-350', 2147.3, 622.1, 243.2);

-- --------------------------------------------------------

--
-- Table structure for table `charter`
--

CREATE TABLE IF NOT EXISTS `charter` (
  `CHAR_TRIP` int(10) NOT NULL DEFAULT '0',
  `CHAR_DATE` datetime DEFAULT NULL,
  `AC_NUMBER` varchar(5) DEFAULT NULL,
  `CHAR_DESTINATION` varchar(3) DEFAULT NULL,
  `CHAR_DISTANCE` float DEFAULT NULL,
  `CHAR_HOURS_FLOWN` float DEFAULT NULL,
  `CHAR_HOURS_WAIT` float DEFAULT NULL,
  `CHAR_FUEL_GALLONS` float DEFAULT NULL,
  `CHAR_OIL_QTS` int(3) DEFAULT NULL,
  `CUS_CODE` int(6) DEFAULT NULL,
  PRIMARY KEY (`CHAR_TRIP`),
  KEY `AC_NUMBER` (`AC_NUMBER`),
  KEY `CUS_CODE` (`CUS_CODE`),
  KEY `CHAR_DESTINATION` (`CHAR_DESTINATION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `charter`
--

INSERT INTO `charter` (`CHAR_TRIP`, `CHAR_DATE`, `AC_NUMBER`, `CHAR_DESTINATION`, `CHAR_DISTANCE`, `CHAR_HOURS_FLOWN`, `CHAR_HOURS_WAIT`, `CHAR_FUEL_GALLONS`, `CHAR_OIL_QTS`, `CUS_CODE`) VALUES
(10001, '2014-02-05 00:00:00', '2289L', 'ATL', 936, 5.1, 2.2, 354.1, 1, 10011),
(10002, '2014-02-05 00:00:00', '2778V', 'BNA', 320, 1.6, 0, 72.6, 0, 10016),
(10003, '2014-02-05 00:00:00', '4278Y', 'GNV', 1574, 7.8, 0, 339.8, 2, 10014),
(10004, '2014-02-06 00:00:00', '1484P', 'STL', 472, 2.9, 4.9, 97.2, 1, 10019),
(10005, '2014-02-06 00:00:00', '2289L', 'ATL', 1023, 5.7, 3.5, 397.7, 2, 10011),
(10006, '2014-02-06 00:00:00', '4278Y', 'STL', 472, 2.6, 5.2, 117.1, 0, 10017),
(10007, '2014-02-06 00:00:00', '2778V', 'GNV', 1574, 7.9, 0, 348.4, 2, 10012),
(10008, '2014-02-07 00:00:00', '1484P', 'TYS', 644, 4.1, 0, 140.6, 1, 10014),
(10009, '2014-02-07 00:00:00', '2289L', 'GNV', 1574, 6.6, 23.4, 459.9, 0, 10017),
(10010, '2014-02-07 00:00:00', '4278Y', 'ATL', 998, 6.2, 3.2, 279.7, 0, 10016),
(10011, '2014-02-07 00:00:00', '1484P', 'BNA', 352, 1.9, 5.3, 66.4, 1, 10012),
(10012, '2014-02-08 00:00:00', '2778V', 'MOB', 884, 4.8, 4.2, 215.1, 0, 10010),
(10013, '2014-02-08 00:00:00', '4278Y', 'TYS', 644, 3.9, 4.5, 174.3, 1, 10011),
(10014, '2014-02-09 00:00:00', '4278Y', 'ATL', 936, 6.1, 2.1, 302.6, 0, 10017),
(10015, '2014-02-09 00:00:00', '2289L', 'GNV', 1645, 6.7, 0, 459.5, 2, 10016),
(10016, '2014-02-09 00:00:00', '2778V', 'MQY', 312, 1.5, 0, 67.2, 0, 10011),
(10017, '2014-02-10 00:00:00', '1484P', 'STL', 508, 3.1, 0, 105.5, 0, 10014),
(10018, '2014-02-10 00:00:00', '4278Y', 'TYS', 644, 3.8, 4.5, 167.4, 0, 10017);

-- --------------------------------------------------------

--
-- Table structure for table `crew`
--

CREATE TABLE IF NOT EXISTS `crew` (
  `CHAR_TRIP` int(6) DEFAULT NULL,
  `EMP_NUM` int(4) DEFAULT NULL,
  `CREW_JOB` varchar(20) DEFAULT NULL,
  KEY `CHAR_TRIP` (`CHAR_TRIP`),
  KEY `EMP_NUM` (`EMP_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crew`
--

INSERT INTO `crew` (`CHAR_TRIP`, `EMP_NUM`, `CREW_JOB`) VALUES
(10001, 104, 'Pilot'),
(10002, 101, 'Pilot'),
(10003, 105, 'Pilot'),
(10003, 109, 'Copilot'),
(10004, 106, 'Pilot'),
(10005, 101, 'Pilot'),
(10006, 109, 'Pilot'),
(10007, 104, 'Pilot'),
(10007, 105, 'Copilot'),
(10008, 106, 'Pilot'),
(10009, 105, 'Pilot'),
(10010, 108, 'Pilot'),
(10011, 101, 'Pilot'),
(10011, 104, 'Copilot'),
(10012, 101, 'Pilot'),
(10013, 105, 'Pilot'),
(10014, 106, 'Pilot'),
(10015, 101, 'Copilot'),
(10015, 104, 'Pilot'),
(10016, 105, 'Copilot'),
(10016, 109, 'Pilot'),
(10017, 101, 'Pilot'),
(10018, 104, 'Copilot'),
(10018, 105, 'Pilot');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `CUS_CODE` int(6) NOT NULL DEFAULT '0',
  `CUS_LNAME` varchar(15) DEFAULT NULL,
  `CUS_FNAME` varchar(15) DEFAULT NULL,
  `CUS_INITIAL` varchar(1) DEFAULT NULL,
  `CUS_AREACODE` varchar(3) DEFAULT NULL,
  `CUS_PHONE` varchar(8) DEFAULT NULL,
  `CUS_BALANCE` float DEFAULT NULL,
  PRIMARY KEY (`CUS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CUS_CODE`, `CUS_LNAME`, `CUS_FNAME`, `CUS_INITIAL`, `CUS_AREACODE`, `CUS_PHONE`, `CUS_BALANCE`) VALUES
(10009, 'Skinner', 'Brian', 'K', '510', '962-2585', 0),
(10010, 'Ramas', 'Alfred', 'A', '615', '844-2573', 0),
(10011, 'Dunne', 'Leona', 'K', '713', '894-1238', 0),
(10012, 'Smith', 'Kathy', 'W', '615', '894-2285', 896.54),
(10013, 'Olowski', 'Paul', 'F', '615', '894-2180', 1285.19),
(10014, 'Orlando', 'Myron', '', '615', '222-1672', 673.21),
(10015, 'O''Brian', 'Amy', 'B', '713', '442-3381', 1014.56),
(10016, 'Brown', 'James', 'G', '615', '297-1228', 0),
(10017, 'Williams', 'George', '', '615', '290-2556', 0),
(10018, 'Farriss', 'Anne', 'G', '713', '382-7185', 0),
(10019, 'Smith', 'Olette', 'K', '615', '297-3809', 453.98);

-- --------------------------------------------------------

--
-- Table structure for table `earnedrating`
--

CREATE TABLE IF NOT EXISTS `earnedrating` (
  `EMP_NUM` int(4) NOT NULL,
  `RTG_CODE` varchar(5) NOT NULL,
  `EARNRTG_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`EMP_NUM`,`RTG_CODE`),
  KEY `earnedrating_ibfk_2` (`RTG_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `earnedrating`
--

INSERT INTO `earnedrating` (`EMP_NUM`, `RTG_CODE`, `EARNRTG_DATE`) VALUES
(101, 'CFI', '1998-02-18 00:00:00'),
(101, 'CFII', '2005-12-15 00:00:00'),
(101, 'INSTR', '1993-11-08 00:00:00'),
(101, 'MEL', '1994-06-23 00:00:00'),
(101, 'SEL', '1993-04-21 00:00:00'),
(104, 'INSTR', '1996-07-15 00:00:00'),
(104, 'MEL', '1997-01-29 00:00:00'),
(104, 'SEL', '1995-03-12 00:00:00'),
(105, 'CFI', '1997-11-18 00:00:00'),
(105, 'INSTR', '1995-04-17 00:00:00'),
(105, 'MEL', '1995-08-12 00:00:00'),
(105, 'SEL', '1994-09-23 00:00:00'),
(106, 'INSTR', '1995-12-20 00:00:00'),
(106, 'MEL', '1996-04-02 00:00:00'),
(106, 'SEL', '1994-03-10 00:00:00'),
(109, 'CFI', '1998-11-05 00:00:00'),
(109, 'CFII', '2003-06-21 00:00:00'),
(109, 'INSTR', '1996-07-23 00:00:00'),
(109, 'MEL', '1997-03-15 00:00:00'),
(109, 'SEL', '1996-02-05 00:00:00'),
(109, 'SES', '1996-05-12 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `EMP_NUM` int(3) NOT NULL DEFAULT '0',
  `EMP_TITLE` varchar(4) DEFAULT NULL,
  `EMP_LNAME` varchar(15) DEFAULT NULL,
  `EMP_FNAME` varchar(15) DEFAULT NULL,
  `EMP_INITIAL` varchar(1) DEFAULT NULL,
  `EMP_DOB` datetime DEFAULT NULL,
  `EMP_HIRE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`EMP_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EMP_NUM`, `EMP_TITLE`, `EMP_LNAME`, `EMP_FNAME`, `EMP_INITIAL`, `EMP_DOB`, `EMP_HIRE_DATE`) VALUES
(100, 'Mr.', 'Kolmycz', 'George', 'D', '1942-06-15 00:00:00', '1987-03-15 00:00:00'),
(101, 'Ms.', 'Lewis', 'Rhonda', 'G', '1965-03-19 00:00:00', '1988-04-25 00:00:00'),
(102, 'Mr.', 'VanDam', 'Rhett', '', '1958-11-14 00:00:00', '1992-12-20 00:00:00'),
(103, 'Ms.', 'Jones', 'Anne', 'M', '1974-10-16 00:00:00', '2005-08-28 00:00:00'),
(104, 'Mr.', 'Lange', 'John', 'P', '1971-11-08 00:00:00', '1996-10-20 00:00:00'),
(105, 'Mr.', 'Williams', 'Robert', 'D', '1975-03-14 00:00:00', '2006-01-08 00:00:00'),
(106, 'Mrs.', 'Duzak', 'Jeanine', 'K', '1968-02-12 00:00:00', '1991-01-05 00:00:00'),
(107, 'Mr.', 'Diante', 'Jorge', 'D', '1974-08-21 00:00:00', '1996-02-01 00:00:00'),
(108, 'Mr.', 'Wiesenbach', 'Paul', 'R', '1966-02-14 00:00:00', '1994-11-18 00:00:00'),
(109, 'Ms.', 'Travis', 'Elizabeth', 'K', '1961-06-18 00:00:00', '1991-04-14 00:00:00'),
(110, 'Mrs.', 'Genkazi', 'Leighla', 'W', '1970-05-19 00:00:00', '1992-12-01 00:00:00'),
(818, 'Mr', 'Anderson', 'Richard', 'P', '1994-03-06 00:00:00', '2014-10-26 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE IF NOT EXISTS `model` (
  `MOD_CODE` varchar(10) NOT NULL DEFAULT '',
  `MOD_MANUFACTURER` varchar(15) DEFAULT NULL,
  `MOD_NAME` varchar(20) DEFAULT NULL,
  `MOD_SEATS` float DEFAULT NULL,
  `MOD_CHG_MILE` float DEFAULT NULL,
  PRIMARY KEY (`MOD_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`MOD_CODE`, `MOD_MANUFACTURER`, `MOD_NAME`, `MOD_SEATS`, `MOD_CHG_MILE`) VALUES
('C-90A', 'Beechcraft', 'KingAir', 8, 2.67),
('PA23-250', 'Piper', 'Aztec', 6, 1.93),
('PA31-350', 'Piper', 'Navajo Chieftain', 10, 2.35);

-- --------------------------------------------------------

--
-- Table structure for table `pilot`
--

CREATE TABLE IF NOT EXISTS `pilot` (
  `EMP_NUM` int(4) NOT NULL DEFAULT '0',
  `PIL_LICENSE` varchar(25) DEFAULT NULL,
  `PIL_RATINGS` varchar(25) DEFAULT NULL,
  `PIL_MED_TYPE` varchar(1) DEFAULT NULL,
  `PIL_MED_DATE` datetime DEFAULT NULL,
  `PIL_PT135_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`EMP_NUM`),
  KEY `EMP_NUM` (`EMP_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pilot`
--

INSERT INTO `pilot` (`EMP_NUM`, `PIL_LICENSE`, `PIL_RATINGS`, `PIL_MED_TYPE`, `PIL_MED_DATE`, `PIL_PT135_DATE`) VALUES
(101, 'ATP', 'SEL/MEL/Instr/CFII', '1', '2013-04-12 00:00:00', '2014-06-15 00:00:00'),
(104, 'ATP', 'SEL/MEL/Instr', '1', '2013-06-10 00:00:00', '2014-03-23 00:00:00'),
(105, 'COM', 'SEL/MEL/Instr/CFI', '2', '2013-02-25 00:00:00', '2014-02-12 00:00:00'),
(106, 'COM', 'SEL/MEL/Instr', '2', '2013-04-02 00:00:00', '2014-12-24 00:00:00'),
(109, 'COM', 'SEL/MEL/SES/Instr/CFII', '1', '2013-04-14 00:00:00', '2014-04-21 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE IF NOT EXISTS `rating` (
  `RTG_CODE` varchar(5) NOT NULL DEFAULT '',
  `RTG_NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RTG_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`RTG_CODE`, `RTG_NAME`) VALUES
('CFI', 'Certified Flight Instructor'),
('CFII', 'Certified Flight Instructor, Instrument'),
('INSTR', 'Instrument'),
('MEL', 'Multiengine Land'),
('SEL', 'Single Engine, Land'),
('SES', 'Single Engine, Sea');

--
-- -----------------------------------
-- 
CREATE TABLE IF NOT EXISTS `airport` (
	`airport_code` varchar(3) NOT NULL DEFAULT '',
    `name` varchar(50),
    `zip_code` int(5),
    `time_zone` varchar(6),
    `airport_use` varchar(20),
    `activation` DATE,
    primary key (`airport_code`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO airport (airport_code, name, zip_code, time_zone, airport_use, activation) VALUES
('ATL', 'Jackson Atlanta International Airport', 30337, 'UTC-4', 'Open to public', '1942-09-01'),
('BNA', 'Nashville International Airport', 37217, 'UTC-5', 'Open to public', '1937-12-01'),
('GNV', 'Gainesville Regional Airport', 32609, 'UTC-4', 'Open to public', '1940-04-01'),
('STL', 'St Louis Lambert International Airport', 63134, 'UTC-5', 'Open to public', '1940-04-01'),
('TYS', 'Mc Ghee Tyson Airport', 37701, 'UTC-4', 'Open to public', '1970-01-01'),
('MOB', 'Mobile Regional Airport', 36608, 'UTC-5', 'Open to public', '1942-04-01'),
('MQY', 'Smyrna Airport', 37167, 'UTC-5', 'Open to public', '1942-10-01');	

--
-- -------------------------------------------------------------------------------------------
-- 

CREATE TABLE IF NOT EXISTS keithskinner (
	cus_code INT(6) primary key,
    foreign key (cus_code) references customer (cus_code)
);

--
-- ---------------------------------------------------------------------------------------------
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `aircraft`
--
ALTER TABLE `aircraft`
  ADD CONSTRAINT `aircraft_ibfk_1` FOREIGN KEY (`MOD_CODE`) REFERENCES `model` (`MOD_CODE`);

--
-- Constraints for table `charter`
--
ALTER TABLE `charter`
  ADD CONSTRAINT `charter_ibfk_1` FOREIGN KEY (`AC_NUMBER`) REFERENCES `aircraft` (`AC_NUMBER`),
  ADD CONSTRAINT `charter_ibfk_2` FOREIGN KEY (`CUS_CODE`) REFERENCES `customer` (`CUS_CODE`),
  ADD CONSTRAINT `charter_ibfk_3` FOREIGN KEY (`CHAR_DESTINATION`) REFERENCES `airport` (`airport_code`);

--
-- Constraints for table `crew`
--
ALTER TABLE `crew`
  ADD CONSTRAINT `crew_ibfk_1` FOREIGN KEY (`CHAR_TRIP`) REFERENCES `charter` (`CHAR_TRIP`),
  ADD CONSTRAINT `crew_ibfk_2` FOREIGN KEY (`EMP_NUM`) REFERENCES `employee` (`EMP_NUM`);

--
-- Constraints for table `earnedrating`
--
ALTER TABLE `earnedrating`
  ADD CONSTRAINT `earnedrating_ibfk_1` FOREIGN KEY (`EMP_NUM`) REFERENCES `employee` (`EMP_NUM`),
  ADD CONSTRAINT `earnedrating_ibfk_2` FOREIGN KEY (`RTG_CODE`) REFERENCES `rating` (`RTG_CODE`);

--
-- Constraints for table `pilot`
--
ALTER TABLE `pilot`
  ADD CONSTRAINT `pilot_ibfk_1` FOREIGN KEY (`EMP_NUM`) REFERENCES `employee` (`EMP_NUM`);






