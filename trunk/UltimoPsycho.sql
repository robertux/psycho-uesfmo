-- MySQL dump 10.10
--
-- Host: localhost    Database: psicologia
-- ------------------------------------------------------
-- Server version	5.0.22-community-nt

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
-- Table structure for table `administradores`
--
DROP DATABASE IF EXISTS psicologia
CREATE DATABASE psicologia
USE psicologia

DROP TABLE IF EXISTS `administradores`;
CREATE TABLE `administradores` (
  `codigo` char(7) NOT NULL default '',
  `nombres` varchar(80) NOT NULL default '',
  `privilegio` varchar(45) NOT NULL default '',
  `contrasenia` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administradores`
--


/*!40000 ALTER TABLE `administradores` DISABLE KEYS */;
LOCK TABLES `administradores` WRITE;
INSERT INTO `administradores` VALUES ('0000001','Roberto','El mero mero papa de todos(Interfaz)','XJvDzsifplOsLxQPnTUpaw=='),('0000002','Jhoni','El encargado del acceso a datos','sKDrBaVmwxc='),('0000003','Shiru','El encargado del acceso a datos','LpC5bJ8Um60='),('0000004','Shiru','La encargada del acceso a datos','LpC5bJ8Um60='),('0000005','Henoch','El encargado de la interfaz','ETMILfJANTY='),('0000006','Any','La encargada de la interfaz','mPy+3Mxpjh4='),('0000007','Antony','El mero mero evaluador RAVEN','MCMp8J9w6NQ='),('0000008','Tavo','El mero mero evaluador CEPS','5unwuPjJlzI='),('0000009','IrrJ','MDT','XJvDzsifplOsLxQPnTUpaw==');
UNLOCK TABLES;
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;

--
-- Table structure for table `aspirantes`
--

DROP TABLE IF EXISTS `aspirantes`;
CREATE TABLE `aspirantes` (
  `codigo` char(7) NOT NULL default '',
  `nombres` varchar(50) NOT NULL default '',
  `apellidos` varchar(50) NOT NULL default '',
  `direccion` varchar(200) NOT NULL,
  `telefono` char(9) NOT NULL default '',
  `lugarestudio` char(5) NOT NULL default '',
  `ciudad` char(5) NOT NULL default '',
  `departamento` char(5) NOT NULL default '',
  `anioaprobado` varchar(100) NOT NULL,
  `estado` varchar(45) NOT NULL default '',
  `sexo` char(1) NOT NULL default '',
  `carrera` char(5) NOT NULL default '',
  `facultad` char(5) NOT NULL default '',
  `fechanacimiento` datetime NOT NULL default '0000-00-00 00:00:00',
  `codgrupo` char(7) default NULL,
  `resultado` varchar(10) default NULL,
  `anioregistrado` int(10) NOT NULL,
  PRIMARY KEY  (`codigo`),
  KEY `FK_codgrupo` (`codgrupo`),
  KEY `FK_carrera` (`carrera`),
  KEY `FK_facultad` (`facultad`),
  KEY `FK_ciudades` (`ciudad`),
  KEY `FK_departamentos` (`departamento`),
  KEY `FK_centroestudio` (`lugarestudio`),
  CONSTRAINT `FK_carreras` FOREIGN KEY (`carrera`) REFERENCES `carreras` (`codigo`),
  CONSTRAINT `FK_centroestudio` FOREIGN KEY (`lugarestudio`) REFERENCES `centroestudio` (`codigo`),
  CONSTRAINT `FK_ciudades` FOREIGN KEY (`ciudad`) REFERENCES `ciudades` (`codigo`),
  CONSTRAINT `FK_codgrupo` FOREIGN KEY (`codgrupo`) REFERENCES `grupos` (`codgrupo`),
  CONSTRAINT `FK_departamentos` FOREIGN KEY (`departamento`) REFERENCES `departamentos` (`codigo`),
  CONSTRAINT `FK_facultades` FOREIGN KEY (`facultad`) REFERENCES `facultades` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aspirantes`
--


/*!40000 ALTER TABLE `aspirantes` DISABLE KEYS */;
LOCK TABLES `aspirantes` WRITE;
INSERT INTO `aspirantes` VALUES ('AA00001','Aspir1','Apellidos1','adw;lfkjasd;flk\r\nasdflaksdjf;alsdkfj\r\n','125','00001','00001','00001','2006','pendiente','M','00006','00001','2005-09-26 00:00:00','I050901',NULL,2005),('AA00002','Anastacio','Aquino','sdf;lksadjf;asldkfj\r\nasfalskja\r\nsdfj\r\nasdfklsadfsad\r\nfasdflsadflk','122354','00005','00001','00001','2004','evaluando','M','00003','00001','2005-09-05 00:00:00','J050801',NULL,2005),('aa00003','as','as','a','123','00001','00001','00001','123','pendiente','M','00001','00001','0001-01-01 00:00:00','I050901',NULL,2001),('aa00004','abc','abc','asdf','2440-0000','00001','00001','00001','2006','pendiente','M','00001','00001','2007-04-20 00:00:00','N010101',NULL,2007),('aa00005','aaaaaaaa','aaaaaaaa','asdf','1230-1230','00001','00001','00001','1970','pendiente','M','00001','00001','1993-01-10 00:00:00','GrpNone',NULL,2007),('AN00001','Nombres1','Apellidos1','Direccion1','245678','00006','00013','00003','2005','pendiente','M','00005','00001','1985-10-28 00:00:00','I050901',NULL,2004),('AN00006','Nuevo...','Aspirante...','asd;lkasdjf;laskdjf\r\nasdf;laskdfjas;ldfkjas\r\nasdf;asf;lskj','123456789','00001','00001','00001','2005','pendiente','M','00001','00001','2005-07-31 00:00:00','A050801',NULL,2005),('AN00007','NombrePrueba1','ApellidoPrueba1','asdfasdf;asldkfjas;dlfk','123456','00001','00001','00001','2005','pendiente','M','00001','00001','0001-01-01 00:00:00','I050901',NULL,2006),('AN00009','NombrePrueba3','ApellidoPrueba3','asdf;alsdkfjas;dlfkjasd;lfkajsdf','123456','00001','00001','00001','2005','pendiente','M','00001','00001','0001-01-01 00:00:00','I050901',NULL,2006),('AN00010','NombrePrueba4','ApellidoPrueba4','asdf;asldkfja;sdflkj\r\nasdjf;asdlkfjsdlkfjaslkdhasdfg','123456','00001','00001','00001','2005','pendiente','M','00001','00001','0001-01-01 00:00:00','I050901',NULL,2006),('CA00001','Ana del Carmen','Corleto Melendez','asd;lkasdjf;lasdkjfa;sdlfkj\r\nasd;flkjasd;faslkdjf;asdlkfja\r\nasd;lksadjf;asldkfja;sdlfkjas;d','123456','00003','00002','00001','2005','pendiente','F','00006','00001','0001-01-01 00:00:00','A010101',NULL,2005),('CE00001','Ernesto','Calderon','asd;flkasjdf;lkasdjf\r\nasdflkasdjf\r\nsadjflsadkfjasdlfjasdlfk\r\nsdlfkj','5566358','00001','00003','00001','2001','pendiente','M','00005','00001','2005-06-13 00:00:00','A050801',NULL,2005),('CH00001','Hernan','Cortez','sad;lfkjasd;fk\r\nasdflasdfjlksdfj\r\nsls;l\r\nd','222222','00010','00010','00005','2003','pendiente','M','00006','00001','2005-10-21 00:00:00','GrpNone',NULL,2005),('CR00001','Rolando','Cente','asd;flkasjdf;lkj','','00001','00001','00001','','pendiente','M','00001','00001','0001-01-01 00:00:00','A050801',NULL,2005),('ee00001','es','es','asdf','123','00001','00001','00001','123','pendiente','M','00001','00001','0001-01-01 00:00:00','I050901',NULL,2001),('FP00001','Patricia','Funes','asd;lkasdfasdsaasjdf;lkj\r\nsdfasdfasdf','22200215','00005','00001','00001','2005','pendiente','M','00002','00001','2005-10-09 00:00:00','E050901',NULL,2005),('GL00001','Luisas','Guzman','sd;flkj\r\nasd;lkj','123456','00007','00004','00004','2005','pendiente','F','00005','00001','1985-10-28 00:00:00','I050901',NULL,2005),('HB00001','Blanca','Hernandez','asd;flkjas;flkj\r\nasdf;asdlfkjas;dlkf\r\nasdjf;laskd','12345','00005','00010','00005','2005','pendiente','F','00006','00001','2005-09-10 00:00:00','I050901',NULL,2005),('HF00001','Fernando','Henriquez','asdfl;kjasd;flkj\r\nasdf;lkasdjf;lskdafj\r\nasdf;asldfkjas;dflkj','45678','00002','00011','00003','2005','pendiente','M','00005','00001','2005-09-26 00:00:00','E050901',NULL,2005),('HM00001','Maximiliano','Hernandez Martinez','asfdjkl;qweruipozxcmv,','2440-0000','00001','00001','00001','1970','pendiente','M','00001','00001','0001-01-01 00:00:00','N010101',NULL,2007),('lj00001','jose','lima','aafdasd','111444','00001','00009','00002','2001','pendiente','M','00004','00001','2005-08-29 00:00:00','I050901',NULL,2005),('ME00001','Eustacio','Montoya','asdlkasjd;lkaj\r\nasdf;asldkfj\r\nsadjflsadjflksdjlasdkjf\r\nsadjl','456682','00003','00001','00001','2005','pendiente','M','00001','00001','2005-06-27 00:00:00','E050901',NULL,2005),('MI00001','Ignacio','Martinez','fasd;lkjasdf;laksdjf\r\nasdf;alskdfjas;ldfkj\r\nasdfas;dlfkjas;lkj','12345','00009','00001','00001','2005','pendiente','M','00002','00001','0001-01-01 00:00:00','N010101',NULL,2005),('PJ00001','Juan','Perez','asdfasdasdasd\r\nasdlasdjfalskfj\r\nasdflasdjalsdkfj','12345678','00001','00001','00001','2005','pendiente','M','00001','00001','1985-10-28 00:00:00','GrpNone',NULL,2000),('PJ00002','Juan','Perez','asdfasdasdasd\r\nasdlasdjfalskfj\r\nasdflasdjalsdkfj','12345678','00001','00001','00001','2005','pendiente','M','00001','00001','1985-10-28 00:00:00','GrpNone',NULL,2000),('RE00001','Edwin','Ramirez','asd;flkjsad;lk\r\nasd;lksadjf;asldkfj\r\nasdf','12456','00006','00004','00004','2005','pendiente','M','00003','00001','0001-01-01 00:00:00','N010101',NULL,2005);
UNLOCK TABLES;
/*!40000 ALTER TABLE `aspirantes` ENABLE KEYS */;

--
-- Table structure for table `carreras`
--

DROP TABLE IF EXISTS `carreras`;
CREATE TABLE `carreras` (
  `codigo` char(5) NOT NULL default '',
  `nombre` varchar(100) NOT NULL,
  `codfacultad` char(5) NOT NULL default '',
  PRIMARY KEY  (`codigo`),
  KEY `FK_codfacultad` (`codfacultad`),
  CONSTRAINT `FK_codfacultad` FOREIGN KEY (`codfacultad`) REFERENCES `facultades` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 3072 kB; (`codigo`) REFER `psicologia/facultade';

--
-- Dumping data for table `carreras`
--


/*!40000 ALTER TABLE `carreras` DISABLE KEYS */;
LOCK TABLES `carreras` WRITE;
INSERT INTO `carreras` VALUES ('00001','Profesorado en Educación Básica para Primero y Segundo Ciclos','00001'),('00002','Profesorado en Lenguaje y Literatura para Tercer Ciclo de Educación Básica y Educación Media','00001'),('00003','Profesorado en Idioma Inglés para Tercer Ciclo de Educación Básica y Educación Media','00001'),('00004','Profesorado en Ciencias Sociales para Tercer Ciclo de Educación Básica y Educación Media','00001'),('00005','Profesorado en Ciencias Naturales para Tercer Ciclo de Educación Básica y Educación Media','00001'),('00006','Profesorado en Matemática para Tercer Ciclo de Educación Básica y Educación Media','00001'),('00007','Profesorado en Educación Parvularia','00002'),('00008','Profesorado en Educación Básica para Primero y Segundo Ciclos','00002'),('00009','Profesorado en Lenguaje y Literatura para Tercer Ciclo de Educación Básica y Educación Media','00002'),('00010','Profesorado en Idioma Inglés para Tercer Ciclo de Educación Básica y Educación Media','00002'),('00011','Profesorado en Ciencias Sociales para Tercer Ciclo de Educación Básica y Educación Media','00002'),('00012','Profesorado en Ciencias Naturales para Tercer Ciclo de Educación Básica y Educación Media','00002'),('00013','Profesorado en Matemática para Tercer Ciclo de Educación Básica y Educación Media','00002'),('00014','Profesorado en Educación Parvularia','00003'),('00015','Profesorado en Educación Básica para Primero y Segundo Ciclos','00003'),('00016','Profesorado en Ciencias Naturales para Tercer Ciclo de Educación Básica y Educación Media','00003'),('00017','Profesorado en Matemática para Tercer Ciclo de Educación Básica y Educación Media','00003'),('00018','Profesorado en Educación Parvularia','00004'),('00019','Profesorado en Educación Básica para Primero y Segundo Ciclos','00004'),('00020','Profesorado en Lenguaje y Literatura para Tercer Ciclo de Educación Básica y Educación Media','00004'),('00021','Profesorado en Idioma Inglés para Tercer Ciclo de Educación Básica y Educación Media','00004'),('00022','Profesorado en Ciencias Sociales para Tercer Ciclo de Educación Básica y Educación Media','00004');
UNLOCK TABLES;
/*!40000 ALTER TABLE `carreras` ENABLE KEYS */;

--
-- Table structure for table `centroestudio`
--

DROP TABLE IF EXISTS `centroestudio`;
CREATE TABLE `centroestudio` (
  `codigo` char(5) NOT NULL default '',
  `nombre` varchar(70) NOT NULL default '',
  PRIMARY KEY  (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `centroestudio`
--


/*!40000 ALTER TABLE `centroestudio` DISABLE KEYS */;
LOCK TABLES `centroestudio` WRITE;
INSERT INTO `centroestudio` VALUES ('00001','Colegio Bautista de Santa Ana'),('00002','Colegio Latinoamericano'),('00003','Colegio Nazareno'),('00004','Centro Escolar INSA'),('00005','Complejo Educativo Manuel Monedero'),('00006','Colegio Manchester'),('00007','Colegio San Luis'),('00008','Colegio Santaneco'),('00009','Colegio Montesori'),('00010','Colegio Raul Villalta');
UNLOCK TABLES;
/*!40000 ALTER TABLE `centroestudio` ENABLE KEYS */;

--
-- Table structure for table `centroscomputo`
--

DROP TABLE IF EXISTS `centroscomputo`;
CREATE TABLE `centroscomputo` (
  `codigo` char(5) NOT NULL default '',
  `nombre` varchar(100) NOT NULL,
  `codfacultad` char(5) NOT NULL,
  PRIMARY KEY  (`codigo`),
  KEY `FK_centroscomputo_1` (`codfacultad`),
  CONSTRAINT `FK_centroscomputo_1` FOREIGN KEY (`codfacultad`) REFERENCES `facultades` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `centroscomputo`
--


/*!40000 ALTER TABLE `centroscomputo` DISABLE KEYS */;
LOCK TABLES `centroscomputo` WRITE;
INSERT INTO `centroscomputo` VALUES ('00001','Centro de computo de biblioteca','00001'),('00002','Centro de computo de ciencias economicas','00001'),('00003','Centro de computo de ingenieria','00001');
UNLOCK TABLES;
/*!40000 ALTER TABLE `centroscomputo` ENABLE KEYS */;

--
-- Table structure for table `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
CREATE TABLE `ciudades` (
  `codigo` char(5) NOT NULL default '',
  `coddepto` char(5) NOT NULL default '',
  `nombre` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`codigo`),
  KEY `FK_coddepto` (`coddepto`),
  CONSTRAINT `FK_coddepto` FOREIGN KEY (`coddepto`) REFERENCES `departamentos` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 3072 kB; (`codigo`) REFER `psicologia/departame';

--
-- Dumping data for table `ciudades`
--


/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
LOCK TABLES `ciudades` WRITE;
INSERT INTO `ciudades` VALUES ('00001','00001','Santa Ana'),('00002','00001','Chalchuapa'),('00003','00001','Metapan'),('00004','00004','Nahuilingo'),('00005','00004','Nahuizalco'),('00006','00004','Sonzacate'),('00007','00004','Sonsonate'),('00008','00004','Izalco'),('00009','00002','San Salvador'),('00010','00005','Santa Tecla'),('00011','00003','Ataco'),('00012','00003','Tacuba'),('00013','00003','Apaneca');
UNLOCK TABLES;
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE `departamentos` (
  `codigo` char(5) NOT NULL default '',
  `nombre` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departamentos`
--


/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
LOCK TABLES `departamentos` WRITE;
INSERT INTO `departamentos` VALUES ('00001','Santa Ana'),('00002','San Salvador'),('00003','Ahuachapan'),('00004','Sonsonate'),('00005','La Libertad'),('00006','Chalatenango'),('00007','La Paz'),('00008','La Cuzcatlan'),('00009','Usulutan'),('00010','Morazan'),('00011','San Miguel'),('00012','La Union'),('00013','Caba¤as'),('00014','San Vicente');
UNLOCK TABLES;
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;

--
-- Table structure for table `facultades`
--

DROP TABLE IF EXISTS `facultades`;
CREATE TABLE `facultades` (
  `codigo` char(5) NOT NULL default '',
  `nombre` varchar(60) NOT NULL,
  PRIMARY KEY  (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facultades`
--


/*!40000 ALTER TABLE `facultades` DISABLE KEYS */;
LOCK TABLES `facultades` WRITE;
INSERT INTO `facultades` VALUES ('00001','Facultad Multidisciplinaria de Occidente'),('00002','Facultad Multidisciplinaria de Oriente'),('00003','Facultad Multidisciplinaria Paracentral'),('00004','Facultad de Ciencias y Humanidades(Unidad Central)');
UNLOCK TABLES;
/*!40000 ALTER TABLE `facultades` ENABLE KEYS */;

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
CREATE TABLE `grupos` (
  `codgrupo` char(7) NOT NULL default '',
  `tamanio` int(10) unsigned NOT NULL default '0',
  `examinador` varchar(60) NOT NULL default '',
  `fecharealizacion` datetime NOT NULL default '0000-00-00 00:00:00',
  `horarealizacion` int(10) unsigned NOT NULL default '0',
  `minutorealizacion` int(10) unsigned NOT NULL default '0',
  `centrocomputo` char(5) NOT NULL default '',
  PRIMARY KEY  (`codgrupo`),
  KEY `FK_centroscomputo` (`centrocomputo`),
  CONSTRAINT `FK_centroscomputo` FOREIGN KEY (`centrocomputo`) REFERENCES `centroscomputo` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grupos`
--


/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
LOCK TABLES `grupos` WRITE;
INSERT INTO `grupos` VALUES ('A010101',10,'Antony Lima','2001-01-01 22:15:20',9,25,'00001'),('A050801',10,'Any Corleto','2005-08-29 00:00:00',5,20,'00001'),('E050901',10,'EEEEEEEEE','2005-09-14 20:52:23',12,30,'00002'),('E070101',10,'Examinador1','2007-01-06 17:11:42',6,1,'00001'),('GrpNone',10,'examinador','2006-01-01 01:01:01',0,0,'00001'),('GrpTemp',10,'Jhoni Torres','2006-01-01 00:00:00',6,25,'00003'),('I050901',10,'Gustavo Linares','2007-01-06 00:00:00',14,50,'00003'),('J050801',10,'Jhoni Torres','2006-01-01 00:00:00',6,25,'00003'),('N010101',10,'NuevoExaminador','2001-01-01 10:32:23',6,25,'00002');
UNLOCK TABLES;
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;

--
-- Table structure for table `pruebaceps`
--

DROP TABLE IF EXISTS `pruebaceps`;
CREATE TABLE `pruebaceps` (
  `codprueba` char(7) NOT NULL default '',
  `codaspirante` char(7) NOT NULL default '',
  `fecharealizacion` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`codprueba`),
  KEY `FK_pruebaceps` (`codaspirante`),
  CONSTRAINT `FK_pruebaceps` FOREIGN KEY (`codaspirante`) REFERENCES `aspirantes` (`codigo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pruebaceps`
--


/*!40000 ALTER TABLE `pruebaceps` DISABLE KEYS */;
LOCK TABLES `pruebaceps` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `pruebaceps` ENABLE KEYS */;

--
-- Table structure for table `pruebaraven`
--

DROP TABLE IF EXISTS `pruebaraven`;
CREATE TABLE `pruebaraven` (
  `codprueba` char(7) NOT NULL default '',
  `codaspirante` char(7) NOT NULL default '',
  `fecharealizacion` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`codprueba`),
  KEY `FK_pruebaraven` (`codaspirante`),
  CONSTRAINT `FK_pruebaraven` FOREIGN KEY (`codaspirante`) REFERENCES `aspirantes` (`codigo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pruebaraven`
--


/*!40000 ALTER TABLE `pruebaraven` DISABLE KEYS */;
LOCK TABLES `pruebaraven` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `pruebaraven` ENABLE KEYS */;

--
-- Table structure for table `respuestas`
--

DROP TABLE IF EXISTS `respuestas`;
CREATE TABLE `respuestas` (
  `codigo` char(7) NOT NULL,
  `npregunta` int(10) NOT NULL,
  `respuesta_asp` int(10) NOT NULL,
  `codprueba` char(7) NOT NULL,
  PRIMARY KEY  (`codigo`),
  KEY `fk_codprueba2` (`codprueba`),
  CONSTRAINT `fk_codprueba` FOREIGN KEY (`codprueba`) REFERENCES `pruebaceps` (`codprueba`),
  CONSTRAINT `fk_codprueba2` FOREIGN KEY (`codprueba`) REFERENCES `pruebaraven` (`codprueba`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `respuestas`
--


/*!40000 ALTER TABLE `respuestas` DISABLE KEYS */;
LOCK TABLES `respuestas` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `respuestas` ENABLE KEYS */;

--
-- Table structure for table `resultadosceps`
--

DROP TABLE IF EXISTS `resultadosceps`;
CREATE TABLE `resultadosceps` (
  `codresult` char(7) NOT NULL default '',
  `pcontrol` int(10) unsigned NOT NULL default '0',
  `pextrover` int(10) unsigned NOT NULL default '0',
  `pparanoi` int(10) unsigned NOT NULL default '0',
  `psincer` int(10) unsigned NOT NULL default '0',
  `pdecision` int(10) unsigned NOT NULL default '0',
  `diagnostico` text NOT NULL,
  `faltasin` tinyint(1) NOT NULL default '0',
  `codaspirante` char(7) NOT NULL,
  PRIMARY KEY  (`codresult`),
  KEY `FK_codaspirante` (`codaspirante`),
  CONSTRAINT `FK_codaspirante` FOREIGN KEY (`codaspirante`) REFERENCES `aspirantes` (`codigo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resultadosceps`
--


/*!40000 ALTER TABLE `resultadosceps` DISABLE KEYS */;
LOCK TABLES `resultadosceps` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `resultadosceps` ENABLE KEYS */;

--
-- Table structure for table `resultadosraven`
--

DROP TABLE IF EXISTS `resultadosraven`;
CREATE TABLE `resultadosraven` (
  `codresult` char(7) NOT NULL default '',
  `consistencia` varchar(15) NOT NULL default '',
  `percentil` int(10) unsigned NOT NULL default '0',
  `diagnostico` text NOT NULL,
  `codaspirante` char(7) NOT NULL,
  PRIMARY KEY  (`codresult`),
  KEY `FK_codasp` (`codaspirante`),
  CONSTRAINT `FK_codasp` FOREIGN KEY (`codaspirante`) REFERENCES `aspirantes` (`codigo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resultadosraven`
--


/*!40000 ALTER TABLE `resultadosraven` DISABLE KEYS */;
LOCK TABLES `resultadosraven` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `resultadosraven` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

