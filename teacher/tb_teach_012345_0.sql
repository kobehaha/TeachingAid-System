-- MySQL dump 10.13  Distrib 5.6.21, for Win64 (x86_64)
--
-- Host: localhost    Database: db_teach
-- ------------------------------------------------------
-- Server version	5.6.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_admin`
--

DROP TABLE IF EXISTS `tb_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_admin` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET gb2312 DEFAULT NULL,
  `pwd` varchar(50) CHARACTER SET gb2312 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_admin`
--

LOCK TABLES `tb_admin` WRITE;
/*!40000 ALTER TABLE `tb_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_course`
--

DROP TABLE IF EXISTS `tb_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_course` (
  `cno` int(10) NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) CHARACTER SET gb2312 NOT NULL,
  `tno` int(10) NOT NULL,
  `cpno` int(10) DEFAULT NULL,
  `credit` varchar(10) CHARACTER SET gb2312 DEFAULT NULL,
  `address` varchar(50) CHARACTER SET gb2312 DEFAULT NULL,
  PRIMARY KEY (`cno`),
  KEY `tno` (`tno`),
  KEY `cpno` (`cpno`),
  CONSTRAINT `tb_course_ibfk_1` FOREIGN KEY (`tno`) REFERENCES `tb_teacher` (`tno`),
  CONSTRAINT `tb_course_ibfk_2` FOREIGN KEY (`tno`) REFERENCES `tb_teacher` (`tno`),
  CONSTRAINT `tb_course_ibfk_3` FOREIGN KEY (`cpno`) REFERENCES `tb_course` (`cno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_course`
--

LOCK TABLES `tb_course` WRITE;
/*!40000 ALTER TABLE `tb_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_sc`
--

DROP TABLE IF EXISTS `tb_sc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_sc` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cno` int(10) NOT NULL,
  `sno` int(10) NOT NULL,
  `grades` varchar(10) CHARACTER SET gb2312 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cno` (`cno`),
  KEY `sno` (`sno`),
  CONSTRAINT `tb_sc_ibfk_1` FOREIGN KEY (`cno`) REFERENCES `tb_course` (`cno`),
  CONSTRAINT `tb_sc_ibfk_2` FOREIGN KEY (`sno`) REFERENCES `tb_student` (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sc`
--

LOCK TABLES `tb_sc` WRITE;
/*!40000 ALTER TABLE `tb_sc` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_sc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_student`
--

DROP TABLE IF EXISTS `tb_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_student` (
  `sno` int(10) NOT NULL AUTO_INCREMENT,
  `sname` varchar(20) CHARACTER SET gb2312 NOT NULL,
  `sage` int(3) default 0,
  `ssex` varchar(4) CHARACTER SET gb2312 DEFAULT NULL,
  `sclass` int(10) DEFAULT NULL,
  `spassword` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_student`
--

LOCK TABLES `tb_student` WRITE;
/*!40000 ALTER TABLE `tb_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_task`
--

DROP TABLE IF EXISTS `tb_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_task` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cno` int(10) DEFAULT NULL,
  `pubdate` date DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `content` varchar(500) CHARACTER SET gb2312 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cno` (`cno`),
  CONSTRAINT `tb_task_ibfk_1` FOREIGN KEY (`cno`) REFERENCES `tb_course` (`cno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_task`
--

LOCK TABLES `tb_task` WRITE;
/*!40000 ALTER TABLE `tb_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_teacher`
--

DROP TABLE IF EXISTS `tb_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_teacher` (
  `tno` int(10) NOT NULL AUTO_INCREMENT,
  `tname` varchar(10) CHARACTER SET gb2312 NOT NULL,
  `tsex` varchar(4) CHARACTER SET gb2312 DEFAULT NULL,
  `tdept` varchar(20) DEFAULT NULL,
  `tpassword` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`tno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE TABLE `course`
(
	cno int(10) AUTO_INCREMENT PRIMARY KEY,   -- 
);
--
-- Dumping data for table `tb_teacher`
--

LOCK TABLES `tb_teacher` WRITE;
/*!40000 ALTER TABLE `tb_teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_student`
--

DROP TABLE IF EXISTS `tb_user_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user_student` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `pwd` varchar(50) CHARACTER SET gb2312 DEFAULT NULL,
  `sno` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sno` (`sno`),
  CONSTRAINT `tb_user_student_ibfk_1` FOREIGN KEY (`sno`) REFERENCES `tb_student` (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_student`
--

LOCK TABLES `tb_user_student` WRITE;
/*!40000 ALTER TABLE `tb_user_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_user_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_teacher`
--

DROP TABLE IF EXISTS `tb_user_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user_teacher` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `pwd` varchar(50) CHARACTER SET gb2312 DEFAULT NULL,
  `tno` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tno` (`tno`),
  CONSTRAINT `tb_user_teacher_ibfk_1` FOREIGN KEY (`tno`) REFERENCES `tb_teacher` (`tno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_teacher`
--

LOCK TABLES `tb_user_teacher` WRITE;
/*!40000 ALTER TABLE `tb_user_teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_user_teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-10 14:14:11
