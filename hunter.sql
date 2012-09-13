-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2012 年 09 月 12 日 07:11
-- 服务器版本: 5.5.16
-- PHP 版本: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `hunter`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `ID` int(255) NOT NULL AUTO_INCREMENT,
  `ACCOUNT` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`ID`, `ACCOUNT`, `PASSWORD`, `EMAIL`, `NAME`) VALUES
(1, 'admin', 'admin', 'admin@qq.com', 'admin');

-- --------------------------------------------------------

--
-- 表的结构 `admin_log`
--

CREATE TABLE IF NOT EXISTS `admin_log` (
  `ID` int(255) NOT NULL AUTO_INCREMENT,
  `TIME` date NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `IP` varchar(255) NOT NULL,
  `ADMIN_ID` int(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `admin_log`
--

INSERT INTO `admin_log` (`ID`, `TIME`, `DESCRIPTION`, `IP`, `ADMIN_ID`) VALUES
(1, '2012-09-12', 'admin login', '10.1.1.1', 1);

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `ID` int(255) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `PARENT_ID` int(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `category`
--

INSERT INTO `category` (`ID`, `TITLE`, `DESCRIPTION`, `PARENT_ID`) VALUES
(1, 'sport', 'this is a news about sport', 1),
(2, 'football', 'this is a new about football', 1);

-- --------------------------------------------------------

--
-- 表的结构 `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `ID` int(255) NOT NULL AUTO_INCREMENT,
  `NEWS_ID` int(255) NOT NULL,
  `CONTENT` varchar(255) NOT NULL,
  `TIME` date NOT NULL,
  `USER_ID` int(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `comment`
--

INSERT INTO `comment` (`ID`, `NEWS_ID`, `CONTENT`, `TIME`, `USER_ID`) VALUES
(1, 1, 'really good', '2012-09-12', 1);

-- --------------------------------------------------------

--
-- 表的结构 `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `ID` int(255) NOT NULL AUTO_INCREMENT,
  `CATEGORY_ID` int(255) NOT NULL,
  `TITLE` varchar(255) NOT NULL,
  `CONTENT` varchar(255) NOT NULL,
  `PUBLISHER` varchar(255) NOT NULL,
  `TIME` date NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `news`
--

INSERT INTO `news` (`ID`, `CATEGORY_ID`, `TITLE`, `CONTENT`, `PUBLISHER`, `TIME`) VALUES
(1, 2, 'AC milan', 'AC beat me', 'Harry', '2012-09-12');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `ID` int(255) NOT NULL AUTO_INCREMENT,
  `ACCOUNT` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`ID`, `ACCOUNT`, `PASSWORD`, `NAME`, `EMAIL`) VALUES
(1, 'user', 'pwd', 'jason', 'jason@qq.com');

-- --------------------------------------------------------

--
-- 表的结构 `user_log`
--

CREATE TABLE IF NOT EXISTS `user_log` (
  `ID` int(255) NOT NULL AUTO_INCREMENT,
  `TIME` date NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `IP` varchar(255) NOT NULL,
  `USER_ID` int(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `user_log`
--

INSERT INTO `user_log` (`ID`, `TIME`, `DESCRIPTION`, `IP`, `USER_ID`) VALUES
(1, '2012-09-12', 'login successful', '10.1.1.1', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
