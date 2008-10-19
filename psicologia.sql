-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.22-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema psicologia
--

CREATE DATABASE IF NOT EXISTS psicologia;
USE psicologia;

--
-- Definition of table `administradores`
--

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
INSERT INTO `administradores` (`codigo`,`nombres`,`privilegio`,`contrasenia`) VALUES 
 ('0000001','Roberto','Administrador','dMn1wNMXqAY='),
 ('0000002','Jhoni','Administrador','Dlu4WmYll7o='),
 ('0000003','Any','Administrador','sjZOrLM40zM='),
 ('0000004','Antony','Administrador','jwkvAht6Gyk='),
 ('0000005','Tavo','Administrador','5oizkIHdheU='),
 ('0000006','Psicologia','Administrador','pEbhOrC7QTwC3JxZ0X0MAQ==');
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;


--
-- Definition of table `aspirantes`
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
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('AA00001','Alice Marjory','Andaluz Chicas','31a. calle pte. lot. el cocal casa #7','2440-7920','3955','210','2','2006','evaluado','F','00003','00001','1989-04-06 00:00:00','GrpNone','',2007),
 ('AA00002','Aracely Elizabeth','Arias Escobar','Col. san jose canto valle nuevo juayua sonsonate','-','3185','313','3','2006','evaluado','F','00003','00001','1987-07-09 00:00:00','GrpNone','',2007),
 ('AB00001','Bryan Macquiver','Alfaro','Col. Rio Zarco Av. Cutumay casa #29','-','3840','210','2','2006','evaluado','M','00005','00001','1989-07-04 00:00:00','GrpNone','',2007),
 ('AH00001','Hosni Raquel','Alarcón Reyes','Ciudad real res. valencia pol. 20 #10 santa ana','-','3877','210','2','2006','evaluado','F','00002','00001','1989-10-20 00:00:00','GrpNone','',2007),
 ('AJ00001','Josué de Jesús','Alvarez Reyes','Calle libertad poniente col. santa lucia casa #22B','-','3883','210','2','2006','evaluado','M','00005','00001','1990-08-25 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('AJ00002','José Mario','Aguilar Sandoval','Altos del palmar Block \"D\" pol. 6 #11','-','3883','210','2','2006','evaluado','M','00005','00001','1990-10-26 00:00:00','GrpNone','',2007),
 ('AK00001','Karla Marcela','Avila  Albanés','Col. llanos el espino pje.9 casa #23 ahuachapán, ahuachapán','2413-2818','3537','103','1','2006','evaluado','F','00006','00001','1990-08-17 00:00:00','GrpNone','',2007),
 ('AL00001','Lucia Beatriz','Albanés Hidalgo','final 6a. calle pte. #9A col. bosques del rio atiquizaya','2418-0614','3606','210','2','2006','evaluado','F','00003','00001','1985-06-19 00:00:00','GrpNone','',2007),
 ('AL00002','Liliana Sarahí','Arévalo Reyes','Col. libertad #2 lote #75 chalchuapa','2406-0730','7204','203','2','2006','evaluado','F','00001','00001','1990-06-26 00:00:00','GrpNone','',2007),
 ('AM00001','Mario Alcides','Anzora','Final 11a. av. nte. col. el cocal pol. 6 #7 santa ana','2402-8830','34','617','6','2006','evaluado','M','00003','00001','1976-06-30 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('AM00002','María Guadalupe','Amaya Girón','Final av. 10 de mayo col. monge casa #62','2448-1097','3883','210','2','2006','evaluado','F','00001','00001','1985-10-28 00:00:00','GrpNone','',2007),
 ('AM00003','Mónica Cecilia','Aguilar Callejas','Col. ivu sector la floresta pje. 12 #10','-','3819','210','2','2006','evaluado','F','00004','00001','1987-09-30 00:00:00','GrpNone','',2007),
 ('AN00001','Nelson Eduardo','Aparicio Monge','Residencial suncuan senda atiquizaya','-','3537','101','1','2006','evaluado','M','00005','00001','1989-09-24 00:00:00','GrpNone','',2007),
 ('AN00002','Nubia Rocío','Arias de Solórzano','Col. dulce nombre de Jesús #5 ahuachapán','-','7211','101','1','2006','evaluado','F','00002','00001','1985-09-29 00:00:00','GrpNone','',2007),
 ('AV00001','Vilma Marisol ','Aguilar Larios','Col. nazare calle 14 casa #11 pol. 35','-','3945','210','2','2006','evaluado','F','00006','00001','1990-01-10 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('AZ00001','Zenaida Isabel','Ardón Carpio','Av. independencia norte pje. b casa #7A col. ivu','2431-7163','3819','210','2','2006','evaluado','F','00006','00001','1987-01-05 00:00:00','GrpNone','',2007),
 ('BA00001','Angel Humberto ','Baños Zaldaña','Col. el mora calle principal frente a ex iglesia san judas pje. basagoitia casa #9','2448-1257','3883','210','2','2006','evaluado','M','00006','00001','1990-02-11 00:00:00','GrpNone','',2007),
 ('BA00002','Alba Lisseth','Barrientos Germán','Lotificacion las lomitas carretera antigua a san salvador santa ana','-','7209','106','1','2006','evaluado','F','00003','00001','1988-12-22 00:00:00','GrpNone','',2007),
 ('BB00001','Blanca del Carmen','Barrientos Orellana','Lot. el manzano pol. A lote #6 atiquizaya ahuachapán','7748-5492','3592','203','2','2006','evaluado','F','00001','00001','1983-02-10 00:00:00','GrpNone','',2007),
 ('BC00001','Carmen Maricela','Barrientos González','Col. San Rafael casa #10 Atiquizaya','-','3606','203','2','2006','evaluado','F','00005','00001','1987-01-04 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('BE00001','Elsa Noemi','Blanco de Cristales','Col. magaña lote #59','-','3697','113','1','2006','evaluado','F','00004','00001','1979-05-10 00:00:00','GrpNone','',2007),
 ('BG00001','Gladys Verónica','Beltrán Hernández','Col. la esmeraldita, pje. 4, lote 11 juayua sonsonate','2452-2364','6118','307','3','2006','evaluado','F','00001','00001','1984-07-11 00:00:00','GrpNone','',2007),
 ('BJ00001','Jaime Alexander','Baños Hernández','Final 6a av. norte col. jardines de santa anita casa #2 ','2448-1490','3883','210','2','2006','evaluado','M','00001','00001','1990-07-27 00:00:00','GrpNone','',2007),
 ('BN00001','Nancy Carolina','Barrera Estrada','17 Calle poniente 24 Av. sur colonia Magaña #37','2413-6142','3901','210','2','2006','evaluado','F','00005','00001','1986-05-29 00:00:00','GrpNone','',2007),
 ('BN00002','Norma Guadalupe','Bernardino Hernández','Col. san isandro block D lote #1 juayua','-','3185','604','6','2006','evaluado','F','00003','00001','1991-03-04 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('BR00001','Ronald Edgardo','Benítez Martínez','Col. buenos aires casa  pol. E santa ana santa ana','-','3883','210','2','2006','evaluado','M','00003','00001','1983-04-08 00:00:00','GrpNone','',2007),
 ('CA00001','Ana Ruth Nohemi','Cordero Reyes','Col. nazareno pol. 19 calle 12 casa 15','-','3902','210','2','2006','evaluado','F','00004','00001','1988-06-15 00:00:00','GrpNone','',2007),
 ('CC00001','Claudia Maribel','Cruz Castro','Caserio el Rosario Canton el Resbaladero','7879-2050','4017','210','2','2006','evaluado','F','00006','00001','1990-04-21 00:00:00','GrpNone','',2007),
 ('CC00002','Claudia María','Clavel Menjivar','8a. ote. casa #21 Suchitoto Cuscatlan','-','1922','715','7','2006','evaluado','F','00005','00001','1991-02-02 00:00:00','GrpNone','',2007),
 ('CC00003','Cristina Elizabeth','Cuellar Mancía','Calle antigua a san salvador km 59 1/2 cantón san juan bueno pista caserillo las canoas casa #1','7220-5646','4000','210','2','2006','evaluado','F','00001','00001','1986-10-27 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('CD00001','Deysi Lissette','Castillo Melgar','Col. garcia #1 casa #7 calle a san luis la planta','2447-5969','3883','1217','12','2006','evaluado','F','00006','00001','1990-05-22 00:00:00','GrpNone','',2007),
 ('CD00002','Dixiee Alessandra ','Cortéz Alemán','Urb. santa ana norte 8va etapa calle BZ-1 casa 35 ','-','3819','210','2','2006','evaluado','F','00003','00001','1989-10-14 00:00:00','GrpNone','',2007),
 ('CE00001','Elisa Guadalupe','Cienfuegos Hernández','Barrio el centro, frente a alcaldia municipal, el congo','2446-9777','4000','204','2','2006','evaluado','F','00006','00001','1990-10-16 00:00:00','GrpNone','',2007),
 ('CE00002','Enrique Bilbao','Chinchilla Escobar','Hda. la labor cantón san lorenzo ahuachapán','2415-6276','3537','109','1','2006','evaluado','M','00006','00001','1990-02-15 00:00:00','GrpNone','',2007),
 ('CE00003','Emerita Brendali','Cruz Barrientos','Caserillo las mercedez cantón el coco chalchuapa santa ana','7935-6149','4111','203','2','2006','evaluado','F','00001','00001','1989-05-07 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('CH00001','Hugo Bladimir','Centeno Alvarado','C/el tinteral coatepeque santa ana','7889-0263','1249','202','2','2006','evaluado','M','00006','00001','1973-12-14 00:00:00','GrpNone','',2007),
 ('CI00001','Iris Raquel','Cristales','Col. bosques del rio casa 2 block \"e\" atiquizaya','7892-2385','3592','101','1','2006','evaluado','F','00001','00001','1979-03-10 00:00:00','GrpNone','',2007),
 ('CJ00001','José David ','Cruz Hernández','Santa ana barrio san antonio col. lños cedros pje. #3 casa #8','7009-0204','3883','210','2','2006','evaluado','M','00006','00001','1989-07-16 00:00:00','GrpNone','',2007),
 ('CK00001','Krissia Cecilia','Cortéz Orellana','Col. san antonio casa #21 pol. \"A\" el refugio ahuachapán','7744-6501','4069','103','1','2006','evaluado','F','00001','00001','1990-01-24 00:00:00','GrpNone','',2007),
 ('CL00001','Luis Alfonso','Cerna Rodríguez','5a. ote. entre 5 y 7 av. sur #17C santa ana ','-','3945','210','2','2006','evaluando','M','00003','00001','1983-12-02 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('CL00002','Liseth Isabel','Cienfuegos de Medina','Urb. el molino pj1 #29 santa ana coatepeque','-','3883','202','2','2006','evaluado','F','00003','00001','1978-08-28 00:00:00','GrpNone','',2007),
 ('CM00001','Marlon Ulises','Calderón Escobar','Calle al cuje casa #4 Chalchuapa','-','4069','203','2','2006','evaluado','M','00005','00001','1989-05-14 00:00:00','GrpNone','',2007),
 ('CM00002','María Amanda','Chinchilla Hernández','Caserillo santa inés, cantón metalapa metapán','7929-2032','4289','207','2','2006','evaluado','F','00006','00001','1987-07-05 00:00:00','GrpNone','',2007),
 ('CM00003','Manuel Alejandro','Chinchilla Orellana','Santa ana, canton primavera, col. fortuna casa #2A','2447-9915','3883','614','6','2006','evaluado','M','00006','00001','1990-05-06 00:00:00','GrpNone','',2007),
 ('CM00004','María Suyapa','Canales Arévalo','Col. san antonio av. max magaña casa #3','2410-1326','3576','1408','14','2006','evaluado','F','00001','00001','1986-09-10 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('CM00005','María Jose','Cruz Hernández','Col. rio zarco lotif. floresta calle principal el tamarindo lote 3 pol. E','-','3841','210','2','2006','evaluado','F','00004','00001','1987-12-08 00:00:00','GrpNone','',2007),
 ('CN00001','Nancy Carolina','Castillo Mira','Col. altos del nopal casa #15 Ahuachapan','-','3576','101','1','2006','evaluado','F','00005','00001','1990-12-08 00:00:00','GrpNone','',2007),
 ('CO00001','Oscar Mauricio','Chávez Pérez','Cantón el coco chalchuapa santa ana','2448-9102','4111','203','2','2006','evaluado','M','00006','00001','1979-12-22 00:00:00','GrpNone','',2007),
 ('CR00001','Roxana Claribel','Cuellar Hernández','Barrio san Fr. calle el progr. R. altamira casa  #10 el congo santa ana','2473-7827','4000','204','2','2006','evaluado','F','00001','00001','1986-07-22 00:00:00','GrpNone','',2007),
 ('CS00001','Sara Arelí','Contreras Arévalo','Col. cafetal pol. #6 lote #2 coatepeque santa ana','-','3883','202','2','2006','evaluado','F','00003','00001','1984-06-08 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('CS00002','Suleyma Lizeth','Colíndres Ávalos','San cristóbal de la frontera','-','4132','201','2','2006','evaluado','F','00001','00001','1985-11-24 00:00:00','GrpNone','',2007),
 ('CS00003','Stephanny  Esmeralda','Carranza Carranza','Col. esmeralda 4a av. norte block B No 2','7314-0363','7213','210','2','2006','evaluado','F','00001','00001','1987-08-13 00:00:00','GrpNone','',2007),
 ('CS00004','Sharon Natali','Colocho ','Col. san antonio #2 casa #7 chalchuapa santa ana','2408-2546','4083','203','2','2006','evaluado','F','00001','00001','1988-08-05 00:00:00','GrpNone','',2007),
 ('CW00001','Walter Alexander ','Cerna Ortíz','Carretera panamericana Km 80 1/2 atiquizaya ahuachapán ','2416-3530','3606','112','1','2006','evaluado','M','00006','00001','1991-06-21 00:00:00','GrpNone','',2007),
 ('CY00001','Yancy Claribel','Carpio Ramos','Caserillo el progreso, cantón san jacinto, coatepeque','-','4018','210','2','2006','evaluado','F','00006','00001','1989-08-19 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('CY00002','Yesenia Magaly','Campos León','Cantón cutumay camones ','-','3877','210','2','2006','evaluado','F','00002','00001','1987-10-14 00:00:00','GrpNone','',2007),
 ('DA00001','Alan Lester','Duran Martínez','Col. jardines de santa anita pas. sonsonate pol.25 lote 28t','-','3883','210','2','2006','evaluado','M','00005','00001','1988-08-27 00:00:00','GrpNone','',2007),
 ('DG00001','Geraldine Meriley','Díaz Peñate','Col. rpo. zarco final pje. paramo casa #2','-','3883','210','2','2006','evaluado','F','00004','00001','1989-12-22 00:00:00','GrpNone','',2007),
 ('DI00001','Iris Noemy','Dueñas Aguilar','Col. buena vista #3 pol. #6 casa #3 chalchuapa','-','4069','113','1','2006','evaluado','F','00004','00001','1989-11-06 00:00:00','GrpNone','',2007),
 ('DJ00001','Joel','Díaz Alemán','Col. asuncion #10 pol. C santa ana','-','3840','1216','12','2006','evaluado','M','00003','00001','1986-04-27 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('DM00001','Maritza Lisset','Domínguez Rodríguez','Col. san luis san sebastian salitrillo santa ana casa #8 pol. B','-','7204','215','2','2006','evaluado','F','00004','00001','1988-12-21 00:00:00','GrpNone','',2007),
 ('DW00001','Walter José','Durán','Barrio el transito #64 el congo santa ana','-','4000','210','2','2006','evaluado','M','00003','00001','1987-03-27 00:00:00','GrpNone','',2007),
 ('ED00001','Daniel Gustavo','Espinoza Martínez','Col. las animas lote #3 pol. 15 cantón tierra blanca candelaria de la frontera','-','4132','201','2','2006','evaluado','M','00004','00001','1989-03-23 00:00:00','GrpNone','',2007),
 ('EK00001','Kenia Jeaneth','Estévez','Av. cutumay pje. azacualpa #25 col. rio zarco','-','3883','210','2','2006','evaluado','F','00005','00001','1989-12-19 00:00:00','GrpNone','',2007),
 ('FA00001','Ana Maria ','Figueroa Martínez','Col. Amaos 25 calle ote. y 17 av. sur casa #16 santa ana','2431-0081','3974','207','2','2006','evaluado','F','00006','00001','1989-02-07 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('FC00001','Claudia Iveth','Fuentes Ayala','Cantón primavera col. el bosque pol. #8 lote #33','2412-5910','3974','609','6','2006','evaluado','F','00001','00001','1987-12-31 00:00:00','GrpNone','',2007),
 ('FE00001','Emma Elizabeth','Flores Linares','Col. las delicias pol. 4 lote #1','-','4069','203','2','2006','evaluado','F','00004','00001','1988-05-22 00:00:00','GrpNone','',2007),
 ('FF00001','Floridalma Elizabeth','Figueroa Gómez','Cantón santa rita atiquizaya ahuachapán','-','7205','103','1','2006','evaluado','F','00002','00001','1990-04-24 00:00:00','GrpNone','',2007),
 ('FH00001','Hector Edgardo','Figueroa García','Atiquizaya comunidad la estacion pol.A lote  #73 ','2444-1021','3606','103','1','2006','evaluado','M','00006','00001','1989-11-22 00:00:00','GrpNone','',2007),
 ('FJ00001','Jesús Omar','Flores Vásquez','Col. el bosque cantón primavera casa #33 pol. 6 santa ana','7006-2494','3883','210','2','2006','evaluado','M','00006','00001','1987-02-15 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('FJ00002','José Francisco ','Flores','Barrio san antonio lot. las marias pol. B #10 santa ana','7038-1354','3902','210','2','2006','evaluado','M','00006','00001','1982-10-11 00:00:00','GrpNone','',2007),
 ('FN00001','Nora Virginia','Fuentes Pereira','Cantón Izcaquilio cruz verde km. 81 1/2 ahuachapán','-','7204','210','2','2006','evaluado','F','00004','00001','1991-02-11 00:00:00','GrpNone','',2007),
 ('FO00001','Osmin Alexis','Flores Cortéz','Sonsonate juayua Los naranjos','-','7202','307','3','2006','evaluado','M','00005','00001','1983-10-26 00:00:00','GrpNone','',2007),
 ('FR00001','Rolando Isaac','Flores Constante','Final Av. Morazán Urb. las palmeras #34, Sonsonate, Sonsonate','2451-9330','6118','315','3','2006','evaluado','M','00006','00001','1986-10-16 00:00:00','GrpNone','',2007),
 ('FY00001','Yurisan Janise','Flores Vivas','Calle las cruces cantón las flores chalchuapa','7785-8272','4069','203','2','2006','evaluado','F','00002','00001','1987-09-11 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('GA00001','Ana María ','García','11 calle ote. entre 17 y 19 av. sur barrio san rafael #2 santa ana','7937-9447','3883','210','2','2006','evaluado','F','00001','00001','1989-10-05 00:00:00','GrpNone','',2007),
 ('GD00001','David Orlando','Grijalva Corado','Caserio cruz verde canton izcaquilio atiquizaya','-','3606','103','1','2006','evaluado','M','00004','00001','1991-05-01 00:00:00','GrpNone','',2007),
 ('GD00002','Deysi Guadalupe','Galdamez Alarcón','Canton concepcion caserio el pezote coatepeque','-','7209','202','2','2006','evaluado','F','00004','00001','1989-12-02 00:00:00','GrpNone','',2007),
 ('GE00001','Evelia Yesenia','González Luna','Col. lamatepec zona \"A\" pol. \"G\" pje. 2 #13','7782-8920','3818','210','2','2006','evaluado','F','00001','00001','1986-04-21 00:00:00','GrpNone','',2007),
 ('GE00002','Evelyn Maritza','Gálvez Segura','Col. santa marina av. los tulipanes block A #35 ','2448-0079','3883','210','2','2006','evaluado','F','00001','00001','1988-09-04 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('GE00003','Erick Alexander','Gomez Gomez','Final 9 calle ote. apartamentos las brisas 79 #12 santa ana','-','3883','210','2','2006','evaluado','M','00004','00001','1984-09-28 00:00:00','GrpNone','',2007),
 ('GG00001','Glenda Noemy','González Meléndez','Col. cáceres pje. 2 de abril 31 c.p. #20-1','-','7212','210','2','2006','evaluado','F','00002','00001','1987-04-02 00:00:00','GrpNone','',2007),
 ('GH00001','Hernán Alberto','Gálvez ','Cantón flor amarilla arriba ','7896-7734','7216','210','2','2006','evaluado','M','00001','00001','1986-08-02 00:00:00','GrpNone','',2007),
 ('GI00001','Immer Alexander','García','Col. san mauricio poligono #17 lote #12, canton cantarana','-','3883','210','2','2006','evaluado','M','00005','00001','1988-02-14 00:00:00','GrpNone','',2007),
 ('GJ00001','José Miguel','Gálvez Sandoval','Entre 6a. Av. Norte y 18 calle pte. casa #80 col. IVU','2431-6542','3871','210','2','2006','evaluado','M','00006','00001','1989-11-25 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('GJ00002','José Enmanuel','García Pimentel','Calle Comapa casa de esquina El Refugio Ahuachapán','-','4069','203','2','2006','evaluado','M','00005','00001','1984-09-03 00:00:00','GrpNone','',2007),
 ('GJ00003','Johanna Beatriz','Galdámez Villeda','Final 15 avenida norte, reparto sihuatehuacán, block \"G\" casa #4, santa ana','2447-6449','3955','210','2','2006','evaluado','F','00001','00001','1988-12-31 00:00:00','GrpNone','',2007),
 ('GJ00004','Jessica Lizeth','Guevara de Mancia','28 av. sur 51/53 calle pte. col san felipe','-','3877','210','2','2006','evaluado','F','00002','00001','1984-02-17 00:00:00','GrpNone','',2007),
 ('GK00001','Katy Yesenia','Goméz Cortéz','Calle san luis la planta col. cel block f lote #9 santa ana','-','3876','210','2','2006','evaluado','F','00003','00001','1988-11-18 00:00:00','GrpNone','',2007),
 ('GM00001','Merlin Xiomara','González Ramírez','Cantón cujucuyo cas. montañita texistepeque   santa ana ','7924-1117','4165','213','2','2006','evaluado','F','00001','00001','1989-05-24 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('GN00001','Norma Carolina','Gomez Erazo','Barrio san antonio callejon samaria quinta samaria casa #11','-','3902','315','3','2006','evaluado','F','00004','00001','1988-04-13 00:00:00','GrpNone','',2007),
 ('GR00001','Roberto Geovanni','Galicia García','8a calle pte. y 5a av. sur b. el socorro turín ahuachapán','-','7205','113','1','2006','evaluado','M','00004','00001','1989-05-24 00:00:00','GrpNone','',2007),
 ('GR00002','Raquel Abigail','Galán Ganzález','Ciudad real res. madrid pol. 27 casa #27','-','3883','210','2','2006','evaluado','F','00004','00001','1984-01-27 00:00:00','GrpNone','',2007),
 ('GS00001','Silvia Patricia','García Linares','Col. San Mauricio Pol. 10 casa #16','7228-9391','3902','210','2','2006','evaluado','F','00005','00001','1990-04-09 00:00:00','GrpNone','',2007),
 ('GS00002','Silvia Guadalupe ','Girón Mirón','Av. canal de panamá, calle alberto masferrer','2448-7501','7204','112','1','2006','evaluado','F','00001','00001','1991-10-03 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('GT00001','Thelma Lisseth','García Hernández','Col. san rafael carretera internacional frente a antigua estación de ferrocaril','2418-1412','3606','1306','13','2006','evaluado','F','00001','00001','1987-11-10 00:00:00','GrpNone','',2007),
 ('GY00001','Yamilleth Abigail','Guillén Valladares','Carretera santa cruz tazulat cantán el cacao sonsonate','-','6118','315','3','2006','evaluado','F','00004','00001','1989-12-23 00:00:00','GrpNone','',2007),
 ('HC00001','Claudia Lorena','Hernández de Hernández','Col. lamatepec pol. F pje. D zona B #22','-','3818','210','2','2006','evaluado','F','00004','00001','1967-02-22 00:00:00','GrpNone','',2007),
 ('HD00001','David Javier','Hernández Tobar','Entre 23 y 25 calle pte. casa #84 mario calvo santa ana','2440-6545','3496','210','2','2006','evaluado','M','00006','00001','1990-06-25 00:00:00','GrpNone','',2007),
 ('HH00001','Henry Alexander','Hidalgo Rivas','Canton natividad col. garcia #1 casa #7 santa ana santa ana','2448-2739','3883','210','2','2006','evaluado','M','00006','00001','1989-03-24 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('HH00002','Hugo Francisco','Hernández Arrida','Urb. el trebol col. alto verde II pol. #8 senda los olivos casa #73','-','3856','210','2','2006','evaluado','M','00003','00001','1989-03-12 00:00:00','GrpNone','',2007),
 ('HR00001','Roxana Carolina','Hernández Corleto','Cantón Chancuyo pje. #5 ahuachapán ','-','3520','210','2','2006','evaluado','F','00004','00001','1991-01-12 00:00:00','GrpNone','',2007),
 ('JA00001','Aydee del Carmen','Jacobo Melara','Crío. santa marta el tinteral coatepeque santa ana ','-','1286','202','2','2006','evaluado','F','00003','00001','1987-08-06 00:00:00','GrpNone','',2007),
 ('JJ00001','Jenniffer Ivon','Jaco García','Santa ana residenciales el molino pje. 10 #8 pol. L','-','3941','210','2','2006','evaluado','F','00004','00001','1989-11-07 00:00:00','GrpNone','',2007),
 ('JX00001','Xiomara Elena','Jiménez González','Col. san francisco atiquizaya casa #28 pol. 7','-','3606','101','1','2006','evaluado','F','00002','00001','1986-09-16 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('LD00001','Deysi Karina','Luna Olivares','10a. Av. sur Barrio San Sebastian casa 2-C Chalchuapa','-','4086','203','2','2006','evaluado','F','00005','00001','1989-10-17 00:00:00','GrpNone','',2007),
 ('LD00002','Dinora Angélica','Lucero Lucero','Final 26 av. sur col. españa santa ana','2440-8362','7207','210','2','2006','evaluado','F','00001','00001','1986-05-31 00:00:00','GrpNone','',2007),
 ('LE00001','Elida Eduviges','Linares Arce','Final calle libertad poniente col. contexa pje. #1 block B casa 21','-','7212','210','2','2006','evaluado','F','00002','00001','1989-06-18 00:00:00','GrpNone','',2007),
 ('LI00001','Ingrid Yasmin','Linares Estrada','Col. sonia america casa #3 atiquizaya ahuachapan','-','3606','103','1','2006','evaluado','F','00004','00001','1988-07-06 00:00:00','GrpNone','',2007),
 ('LJ00001','Jacquelinne Elizabeth','López Guardado','19 calle pte. entre 3 y 4 av. independencia sur casa #5 barrio san miguelito','7720-7147','3883','210','2','2006','evaluado','F','00001','00001','1990-05-25 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('LJ00002','Juan Carlos ','Linares Fuentes','Cantón calzontes arriba caserillo linares santa ana santa ana','-','7218','210','2','2006','evaluado','M','00004','00001','1983-09-03 00:00:00','GrpNone','',2007),
 ('LK00001','Karla María','López González','Col. las ninfas 2a. av. casa #26 chalchuapa santa ana','-','4086','210','2','2006','evaluado','F','00003','00001','1988-02-17 00:00:00','GrpNone','',2007),
 ('LM00001','Maria Raquel','Lobos Cabrejo','Caserio santa ines canton matalapa metapan santa ana','7921-5016','4289','207','2','2006','evaluado','F','00003','00001','1989-09-15 00:00:00','GrpNone','',2007),
 ('LN00001','Nilson José','López Escobar','Col. Bella vista pol. 11 paje. 4-A casa #5 santa ana','2406-0994','3941','202','2','2006','evaluado','M','00006','00001','1989-12-06 00:00:00','GrpNone','',2007),
 ('LR00001','Rosa Yesenia','López Galán','Caserillo barranca honda km 67 ','2416-3578','3537','101','1','2006','evaluado','F','00001','00001','1987-01-26 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('LS00001','Sonia Beatríz','López de Vásquez','Urb. jardínes del tecana pol. 36 pje. 13 sur #16 ','2406-0788','7196','203','2','2006','evaluado','F','00001','00001','1971-06-23 00:00:00','GrpNone','',2007),
 ('LW00001','Wendy Catalina','Luma Tejada','Av. benjamin estrada valiente nte. y 5a. calle pte. #9','2402-0015','4287','207','2','2006','evaluado','F','00006','00001','1989-11-06 00:00:00','GrpNone','',2007),
 ('LY00001','Yeni Elizabeth','López González','Col. las ninfas 2a. Av. casa #26 Chalchuapa','-','4086','210','2','2006','evaluado','F','00005','00001','1989-11-19 00:00:00','GrpNone','',2007),
 ('MA00001','Aldo Eliseo','Martínez Bojorquez','Col. cumbres del trebol block G-5 casa #11 ','2449-1869','3877','210','2','2006','evaluado','M','00006','00001','1988-02-10 00:00:00','GrpNone','',2007),
 ('MA00002','Amilcar Antonio ','Magaña Rivera','Cantón Chayal col. loma linda #1 atiquizaya ahuachapán','7258-6056','3606','103','1','2006','evaluado','M','00006','00001','1988-01-27 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('MA00003','Alba Lizeth','Martínez Chávez','Canto las aradas caserio el zapote santa ana','-','7209','210','2','2006','evaluado','F','00003','00001','1990-04-17 00:00:00','GrpNone','',2007),
 ('MB00001','Beatríz Guadalupe','Marroquín Pimentel','San cristóbal de la frontera municipio de candelaria de la frontera','2441-8262','4132','201','2','2006','evaluado','F','00001','00001','1989-02-10 00:00:00','GrpNone','',2007),
 ('MC00001','Carla Elizabeth','Matamoros Morán','Col. argentina #1 calle principal av. buenos aires casa #4C','2448-2992','7212','210','2','2006','evaluado','F','00001','00001','1988-11-07 00:00:00','GrpNone','',2007),
 ('MC00002','Carlos Alberto','Mazariego Escobar','Final 6a calle ote. entre 21 y 23 av. norte col. santa marina casa #72','-','3883','210','2','2006','evaluado','M','00004','00001','1990-12-26 00:00:00','GrpNone','',2007),
 ('MD00001','David Jonathan','Morán Santos','#25 entre 19 y 31 calle pte.','2240-0508','7212','614','6','2006','evaluado','M','00003','00001','1986-10-28 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('MD00002','Dinora Jeanmileth','Martínez Vargas','8a. calle ote. final Bil chalchuapita','-','3606','103','1','2006','evaluado','F','00004','00001','1990-03-12 00:00:00','GrpNone','',2007),
 ('ME00001','Erika Yenifer','Murga Rodríguez','Col. san ramon canton izcaquilio atiquizaya ahuachapan','7228-5362','7204','112','1','2006','evaluado','F','00006','00001','1990-09-02 00:00:00','GrpNone','',2007),
 ('ME00002','Elba Margarita','Morán Gálvez','9a. calle pte. barrio el pilar casa #34 sonsonate','-','6843','315','3','2006','evaluado','F','00003','00001','1989-01-13 00:00:00','GrpNone','',2007),
 ('ME00003','Edwin Adalberto','Meléndez Consuegra','Canton el pezote el congo santa ana','-','4000','204','2','2006','evaluado','M','00003','00001','1987-12-27 00:00:00','GrpNone','',2007),
 ('MG00001','Gabriela María','Morán Alarcón','Res. Rio Zarco Block \"C\" casa 20','-','3883','210','2','2006','evaluado','F','00005','00001','1990-05-02 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('MG00002','Giovanni Alexander','Mazariego Linares','19 calle ote. entre 3a. y av. independecia sur barrio san miguelito casa #2 santa ana','-','7210','210','2','2006','evaluado','M','00003','00001','1980-09-04 00:00:00','GrpNone','',2007),
 ('MG00003','Glenda Xiomara','Mendoza Hernández','El progreso canton san jacinto coatepeque santa ana','-','4018','202','2','2006','evaluado','F','00004','00001','1987-09-27 00:00:00','GrpNone','',2007),
 ('MI00001','Iris Margarita','Méndez García','7a calle pte. entre 8 y 10 av. sur #45 ','2440-4671','3883','210','2','2006','evaluado','F','00001','00001','1990-01-17 00:00:00','GrpNone','',2007),
 ('MJ00001','Jenny Elizabeth','Martínez Polanco','Col. jardines de san jose pol. #5 lote #11','2441-4214','3883','210','2','2006','evaluado','F','00006','00001','1987-03-23 00:00:00','GrpNone','',2007),
 ('MJ00002','Juan José','Moreno Ramírez','Col. rio zarco III etapa pje. cuscatlan block \"D\" casa #64','7906-0961','3883','210','2','2006','evaluado','M','00006','00001','1990-01-29 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('MJ00003','José Manuel','Mendoza','Av. central dr. marcelino urrutia #3-77B atiquizaya','2418-1420','3606','103','1','2006','evaluado','M','00006','00001','1990-08-17 00:00:00','GrpNone','',2007),
 ('MJ00004','Jennifer Elizabeth','Meléndez García','Canton comecayo caserio puerto rico santa ana','-','3902','210','2','2006','evaluado','F','00004','00001','1989-11-06 00:00:00','GrpNone','',2007),
 ('MK00001','Karina Elizabeth','Molina Hernández','Col. planes del ranchador pol. 11 casa #22 carretera candelario de la frontera','2411-4486','3902','210','2','2006','evaluado','F','00006','00001','1990-02-06 00:00:00','GrpNone','',2007),
 ('ML00001','Luis Alonso','Menéndez Zeceña','Canton flor amarilla abajo col. la granja casa #21 pol. B','-','3883','210','2','2006','evaluado','M','00004','00001','1989-01-14 00:00:00','GrpNone','',2007),
 ('MM00001','Maria del Carmen','Mendoza Mendoza','Col. el progreso casa#8 contiguo a tanques de ANDA Atiquizaya Ahuachapan','-','392','614','6','2006','evaluado','F','00005','00001','1989-01-22 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('MM00002','Martha Yoana','Medina Sánchez','Col. la realidad sector #6 lote 553, santa ana','7257-6556','3841','210','2','2006','evaluado','F','00006','00001','1989-03-21 00:00:00','GrpNone','',2007),
 ('MM00003','Mario Ernesto','Mejía Menéndez','3o. la unión av. central turín ahuachapán','7054-7158','7205','113','1','2006','evaluado','M','00006','00001','1985-05-30 00:00:00','GrpNone','',2007),
 ('MM00004','Marta Elizabeth','Magaña Castillo','Final 2a. av. norte barrio chalchuapita atiquizaya','2418-1310','3606','103','1','2006','evaluado','F','00006','00001','1990-06-30 00:00:00','GrpNone','',2007),
 ('MM00005','María Teresa','Mendoza Morales','4a. calle pte. #4 col. mendez canton comecayo','-','7206','210','2','2006','evaluado','F','00006','00001','1967-07-14 00:00:00','GrpNone','',2007),
 ('MM00006','Manuel Fernando','Muñoz Torres','Urb. el trebol pje. los olivos #25 pol. b ','7243-7179','3941','210','2','2006','evaluado','M','00003','00001','1989-07-24 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('MM00007','Mirna Yaneth','Martínez Molina','Col. los pinos calle a la matepec lote 257 santa ana','-','3883','210','2','2006','evaluado','F','00003','00001','1978-09-25 00:00:00','GrpNone','',2007),
 ('MO00001','Otoniel Humberto','Morán Hurtado','Calle general ramon flores casa #4 chalchuapa','-','4069','203','2','2006','evaluado','M','00002','00001','1989-08-16 00:00:00','GrpNone','',2007),
 ('MR00001','Rosa Angelica','Marínez de Zarpate','Col. canada casa #3 block 3 km. 60 carretera antigua a san salvador santa ana','-','3883','210','2','2006','evaluado','F','00003','00001','1971-01-12 00:00:00','GrpNone','',2007),
 ('MR00002','Rosa de los Angeles','Menjívar González','Col. altos del molino pje. G casa #8 santa ana','2448-2642','3883','210','2','2006','evaluado','F','00001','00001','1990-12-26 00:00:00','GrpNone','',2007),
 ('MR00003','Rosa Elvira','Meléndez Acuña','Canton portezuelo calle al mirador quinta rosi','-','3902','210','2','2006','evaluado','F','00004','00001','1986-04-15 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('MS00001','Sandra Lisseth','Marroquìn de Reinosa','Col. casa blanca km. 84 1/2 carretera Atiquizaya Ahuachapán','2411-9393','4083','103','1','2006','evaluado','F','00005','00001','1983-12-30 00:00:00','GrpNone','',2007),
 ('MS00002','Soraya Carmina','Méndez ','Col. carrillo av. emerita granados calle a la laguna ahuachapán','7843-1110','3576','307','3','2006','evaluado','F','00006','00001','1978-10-03 00:00:00','GrpNone','',2007),
 ('MS00003','Selenia Lisset','Martínez Calderón','Col. IVU pje. 21 block Q casa #6','2415-2154','3871','210','2','2006','evaluado','F','00003','00001','1989-04-05 00:00:00','GrpNone','',2007),
 ('MW00001','Wendy Xiomara','Martínez de Garcia','Calle central poniente gerardo barrios 3a. la union, turin ahuachapan','-','3592','101','1','2006','evaluado','F','00003','00001','1987-05-05 00:00:00','GrpNone','',2007),
 ('MW00002','Wendy Susana','Monterrosa Vanegas','Calle antigua a san salvador km 62 costado norte motel bonanza lotif. roma lote #6','2413-7662','3883','210','2','2006','evaluado','F','00002','00001','1982-11-04 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('MY00001','Yesica Carolina','Menéndez Alarcón','Final 3a calle ote. col. san josé casa #9 block B chalchuapa santa ana','-','4068','203','2','2006','evaluado','F','00004','00001','1990-05-09 00:00:00','GrpNone','',2007),
 ('NM00001','Melissa María','Nerio Amaya','Col. el calvario casa #6 block \"C\" Juayua Sonsonate','-','3185','307','3','2006','evaluado','F','00005','00001','1990-06-15 00:00:00','GrpNone','',2007),
 ('OD00001','Dina Erika','Osorio Monterrosa','Cantón el ranchador col. las marías carretera C/F Km 72 1/2','7285-9515','3902','210','2','2006','evaluado','F','00001','00001','1989-06-30 00:00:00','GrpNone','',2007),
 ('OE00001','Erika Vanessa','Oliva López','Canton cantarrana lotif. barcelona casa #13 lot. #14','-','3902','210','2','2006','evaluado','F','00004','00001','1990-12-18 00:00:00','GrpNone','',2007),
 ('OI00001','Ingrid Jeaneth','Olmos González','Col. San francisco pol. #2 casa #12 ','-','7208','101','1','2006','evaluado','F','00003','00001','1988-05-09 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('OR00001','Roberto Carlos','Orantes Zepeda','4a. y 5a. av. sur barrio el socorro casa #9 turin','-','7205','103','1','2006','evaluado','M','00004','00001','1990-10-07 00:00:00','GrpNone','',2007),
 ('OS00001','Silvia Patricia','Ordóñez ','Col. montreal cantón cantarrana calle las palmeras pol. 23 lote #2','2430-2340','3877','210','2','2006','evaluado','F','00001','00001','1989-04-09 00:00:00','GrpNone','',2007),
 ('OS00002','Sara Elvira','Ordóñez Clemente','Col. la esmeraldita block #8 casa #36','7279-4905','3185','307','3','2006','evaluado','F','00001','00001','1986-01-08 00:00:00','GrpNone','',2007),
 ('OY00001','Yesenia Lizeth','Olmos Castro','Col. bendición de Dios el refugio ahuachapán pol. K lote 5','2414-3347','7414','103','1','2006','evaluado','F','00001','00001','1985-05-26 00:00:00','GrpNone','',2007),
 ('PA00001','Abimael Isai','Peraza Murga','19 av. sur 9 y 11 calle ote. #22A','7897-6848','7207','101','1','2006','evaluado','M','00006','00001','1981-05-10 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('PD00001','Dimas Amilcar','Portillo Aragón','Cantón el tránsito, san pablo tacachico, la libertad','7738-4929','1168','517','5','2006','evaluado','M','00006','00001','1989-07-30 00:00:00','GrpNone','',2007),
 ('PE00001','Emerson Edgardo','Peraza Garcia','col. jardines del tecana pol. 14 casa #1 calle principal','-','3819','210','2','2006','evaluado','M','00003','00001','1989-04-24 00:00:00','GrpNone','',2007),
 ('PE00002','Ever Armando','Pacheco Melgar','El congo santa ana casa #3 barrio san francisco av. santa ana california','2434-2144','7217','204','2','2006','evaluado','M','00001','00001','1980-07-06 00:00:00','GrpNone','',2007),
 ('PE00003','Evelin Xiomara','Presidente Trejo','Col. zacamil #1 sector C canton ashapuco ahuachapan','-','3556','101','1','2006','evaluado','F','00004','00001','1986-10-12 00:00:00','GrpNone','',2007),
 ('PF00001','Fany Damaris','Palacios Rosales','Cantón Izcaquilio cas. los albanes atiquizaya','2413-5782','4069','112','1','2006','evaluado','F','00006','00001','1989-04-18 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('PG00001','Glendis Celina','Pacheco Martínez','Col. galicia pol. \"B\" #23 canton los amates san sebastian salitrillo','-','7211','215','2','2006','evaluado','F','00003','00001','1980-01-01 00:00:00','GrpNone','',2007),
 ('PI00001','Irvin Ademir','Peraza Molina','Santa ana, col. 10 de mayo pje. las rosas casa #18','2406-1295','3883','210','2','2006','evaluado','M','00006','00001','1988-12-05 00:00:00','GrpNone','',2007),
 ('PO00001','Oscar Alberto','Pichinte Escobar','Col. sitio del niño, San Juan Opico, La Libertad','-','7200','509','5','2006','evaluado','M','00005','00001','1989-05-04 00:00:00','GrpNone','',2007),
 ('PY00001','Yenci Margarita','Posada Montoya','Calle santa cruz entre 21 y 23 av. sur, apartamentos EL INDIO #2 barrio san rafael','2447-7178','3883','614','6','2006','evaluado','F','00006','00001','1990-09-08 00:00:00','GrpNone','',2007),
 ('PY00002','Yaneth de los Angeles','Polanco Polanco','Col. miraflores I pol. C casa #3 texistepeque ','7261-8232','4165','207','2','2006','evaluado','F','00001','00001','1988-04-21 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('PZ00001','Zindy Krisbeth','Pérez Landaverde','Urb. el milagro pol. A calle A casa 25A','-','3883','210','2','2006','evaluado','F','00003','00001','1989-11-14 00:00:00','GrpNone','',2007),
 ('QC00001','Celsa Griselda','Quitanilla Ramírez','Residencial san Rafael Sur Poligono \"A\" casa #8','2449-0388','3883','614','6','2006','evaluado','F','00006','00001','1988-06-17 00:00:00','GrpNone','',2007),
 ('RA00001','Alberto Felix','Reyes Torres','San rafael oriente barrio san benito','-','4884','1218','12','2006','evaluado','M','00004','00001','1990-04-09 00:00:00','GrpNone','',2007),
 ('RF00001','Febe Elizabeth','Rodríguez Mojica','Canto cantarana col. canada casa#15 santa ana','2431-8029','3883','210','2','2006','evaluado','F','00006','00001','1990-02-26 00:00:00','GrpNone','',2007),
 ('RI00001','Ingrid Xiomara','Rosales Morán','Canton joya el zapote Atiqizaya col. san francisco #2','-','3606','210','2','2006','evaluado','F','00005','00001','1991-01-07 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('RJ00001','José Ruben','Rosales Martínez','Caserio San Francisco #2','-','3606','101','1','2006','evaluado','M','00005','00001','1990-01-01 00:00:00','GrpNone','',2007),
 ('RJ00002','Johana Patricia','Rodríguez Rosales','Canton joya el zapote caserios los ramos','-','3606','101','1','2006','evaluado','F','00005','00001','1989-07-14 00:00:00','GrpNone','',2007),
 ('RJ00003','José David','Rodríguez Arévalo','Caserio las flores, los naranjos, juayua, sonsonate','7059-5554','7202','210','2','2006','evaluado','M','00006','00001','1990-05-16 00:00:00','GrpNone','',2007),
 ('RJ00004','Jacqueline Beatriz','Rivera Magaña','Ahuachapan atiquizaya','2413-7116','3606','103','1','2006','evaluado','F','00006','00001','1991-07-06 00:00:00','GrpNone','',2007),
 ('RJ00005','Jaime Alberto','Rivas Galvez','Col. Y. pje. 5 ote casa #35 santa ana','-','3941','210','2','2006','evaluado','M','00003','00001','1989-07-24 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('RJ00006','Jairo Alexander','Recinos Nolasco','Urb. ciudad paraiso pol. 19 casa #9 ','-','3985','614','6','2006','evaluado','M','00003','00001','1985-01-23 00:00:00','GrpNone','',2007),
 ('RJ00007','Jenniffer Mercedes','Ramos','Col. las victorias #2 pol. 12 canton el barro','2427-8676','3550','101','1','2006','evaluado','F','00004','00001','1985-09-30 00:00:00','GrpNone','',2007),
 ('RK00001','Kenia Briseth','Rosales Quiñones','Santa cruz, chinamas Ahuachapan','-','3515','101','1','2006','evaluado','F','00005','00001','1990-01-26 00:00:00','GrpNone','',2007),
 ('RK00002','Karla Iliana ','Rivas Rivera','Cantón siete príncipes coatepeque santa ana','-','3537','107','1','2006','evaluado','F','00003','00001','1986-06-17 00:00:00','GrpNone','',2007),
 ('RL00001','Lourdes Elizabeth','Rincán Herrera','Calle 22 de marzo col. san esteban barrio el angel atiquizaya','-','3606','103','1','2006','evaluado','F','00002','00001','1985-10-18 00:00:00','GrpNone','',2007),
 ('RM00001','María Eunice','Rosa Siciliano','Col. las tres marias #6 po. C ahuchapan','2412-7811','3556','101','1','2006','evaluado','F','00003','00001','1987-12-01 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('RM00002','Maria Sara','Rodriguez Anaya','Canton piletas caserio los planes coatepeque santa ana','-','7209','202','2','2006','evaluado','F','00002','00001','1989-05-31 00:00:00','GrpNone','',2007),
 ('RN00001','Noemi Abigail','Rendón Barrientos','Col. san juan pol. 38 casa #14 s.s.s. santa ana','2431-7728','4069','215','2','2006','evaluado','F','00006','00001','1988-11-29 00:00:00','GrpNone','',2007),
 ('RN00002','Nancy Lisbeth','Ramos Mejía','Col. el mora calle principal pje. cordoba mesón san carlini','-','3902','210','2','2006','evaluado','F','00004','00001','1987-04-06 00:00:00','GrpNone','',2007),
 ('RO00001','Oscar Alejandro','Ramos Guillén','Col. ivu pje. M block M casa #32 santa ana','2407-0720','3883','210','2','2006','evaluado','M','00006','00001','1987-11-20 00:00:00','GrpNone','',2007),
 ('RS00001','Sindy Okely','Rivera Herrera','Col. sta. clara #18 coatepeque santa ana','-','7209','202','2','2006','evaluado','F','00003','00001','1988-03-18 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('RS00002','Silvia Marisol','Rivas Hernández','Final col. san jose zapotitan','-','1279','302','3','2006','evaluado','F','00002','00001','1988-05-30 00:00:00','GrpNone','',2007),
 ('SA00001','Abner Asael','Samayoa Landaverde','Av. club de leones entre 3a. y 5a. calle, Chalchuapa, Santa Ana','-','7201','203','2','2006','evaluado','M','00005','00001','1979-05-15 00:00:00','GrpNone','',2007),
 ('SC00001','Claudia Beatríz','Sánchez Rodriguez','Res. alto verde II, pje. los bambúes, pol. 9 , casa #178 santa ana ','2480-1443','3902','210','2','2006','evaluado','F','00001','00001','1988-01-02 00:00:00','GrpNone','',2007),
 ('SC00002','Cristian Ernesto','Salinas Vargas','11a. av. sur casa #4 col. tazumal chalchuapa santa ana','-','4069','203','2','2006','evaluado','M','00004','00001','1976-05-10 00:00:00','GrpNone','',2007),
 ('SH00001','Héctor Vladimir','Solís ','Col. la dalia atiquizaya ahuachapán','-','3606','103','1','2006','evaluado','M','00004','00001','1984-12-03 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('SK00001','Kenia Maricela','Serrano Ventura','Calle gustavo guerrero #25 barrio el centro ciudad arce','7763-0822','1279','515','5','2006','evaluado','F','00006','00001','1988-09-15 00:00:00','GrpNone','',2007),
 ('SL00001','Laura Carolina','Sánchez Coto','Residencial Cuscachapa casa #7 paje.#4 pol.#7 Chalchuapa ','-','4069','210','2','2006','evaluado','F','00003','00001','1991-01-11 00:00:00','GrpNone','',2007),
 ('SL00002','Luz de María ','Salazar Chicas','Urb. altos del palmar block \"c\" pol. 9 casa #17 santa ana','2449-1371','7209','210','2','2006','evaluado','F','00001','00001','1989-11-04 00:00:00','GrpNone','',2007),
 ('SM00001','Mauricio Alejandro','Solís Dolores','Urb. Ciudad pacifico pje. bahia casa #8','-','3537','315','3','2006','evaluado','M','00005','00001','1989-04-26 00:00:00','GrpNone','',2007),
 ('SM00002','Mauricio Ernesto','Sánchez Menéndez','9a calle ote. entre 23 y 25 av. sur casa #98 ','-','3941','210','2','2006','evaluado','M','00004','00001','1990-02-04 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('SR00001','Rafael Edgardo','Salinas Sandoval','San lorenzo barrio el pilar, Ahuachapan','2401-4148','3606','109','1','2006','evaluado','M','00006','00001','1987-08-13 00:00:00','GrpNone','',2007),
 ('SS00001','Sara de los Angeles','Siguenza de Escobar','Final 37 calle poniente col. el progreso #65 \"A\"','-','3883','210','2','2006','evaluado','F','00005','00001','1978-09-23 00:00:00','GrpNone','',2007),
 ('TE00001','Edwin René','Toledo Rodríguez','8a. av. nte. 2-7 barrio santa lucia juayua','-','3189','307','3','2006','evaluado','M','00003','00001','1989-10-30 00:00:00','GrpNone','',2007),
 ('TF00001','Fernando Félix','Torres Morejón','Col. los Olivos psj. Tecas casa #30A Chalchuapa, Santa Ana','7781-5488','4069','1205','12','2006','evaluado','M','00006','00001','1990-05-21 00:00:00','GrpNone','',2007),
 ('TG00001','Gabriela Jeamileth','Tobar Menjívar','Final calle josé mariano méndez col. la esperanza sector #1 casa #64 santa ana santa ana','2431-1736','3877','210','2','2006','evaluado','F','00001','00001','1990-03-02 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('TO00001','Olga Raquel','Torres Argumedo','Col. cristales pol. 9 lote 10','-','7207','210','2','2006','evaluado','F','00004','00001','1987-01-27 00:00:00','GrpNone','',2007),
 ('TR00001','Reyna del Carmen ','Torres Díaz','Cantón Chayal paje. #3 atiquizaya','7872-6480','3606','103','1','2006','evaluado','F','00002','00001','1989-01-11 00:00:00','GrpNone','',2007),
 ('UL00001','Luis Eduardo','Umaña Umaña','Santa Ana C/Comecayo Col/Mendez','-','3902','210','2','2006','evaluado','M','00005','00001','1983-03-12 00:00:00','GrpNone','',2007),
 ('VA00001','Ana Yanira','Velásquez Gutierrez','Calle candelaria de la Frontera Km 72 1/2 col. san josé comecayo ','7971-0983','3901','210','2','2006','evaluado','F','00006','00001','1985-08-07 00:00:00','GrpNone','',2007),
 ('VA00002','Arely del Carmen','Vargas Molina','Canton portezuelo colonia la finquita #8 pol. B','-','3902','210','2','2006','evaluado','F','00003','00001','1988-07-12 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('VC00001','Celina Cecibel','Vásquez Morán','Lotificación sihuacoop pol. 8 #5 c/primavera santa ana','2412-7942','3883','210','2','2006','evaluado','F','00006','00001','1978-03-23 00:00:00','GrpNone','',2007),
 ('VG00001','Glenda Ivett','Vivas Castro','Col. casa blanca #7 casa #8 poligono \"A\" Chalchuapa','-','4086','101','1','2006','evaluado','F','00005','00001','1985-02-24 00:00:00','GrpNone','',2007),
 ('VG00002','Geidi Patricia','Valle Henríquez','Res. altos santa lucia pol.#23 paje 11 #5 ','-','3883','210','2','2006','evaluado','F','00003','00001','1978-08-30 00:00:00','GrpNone','',2007),
 ('VG00003','Gloria Marina','Valdivieso Martínez','Aldea blaños candelaria de la frontera santa ana','-','7207','207','2','2006','evaluado','F','00003','00001','1986-03-29 00:00:00','GrpNone','',2007),
 ('VG00004','Gloria Elizabeth','Vásquez Fernández','Cantón potrero grande abajo santa ana','-','7218','202','2','2006','evaluado','F','00002','00001','1985-07-28 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('VK00001','Karla Lizzette','Varela Rodríguez','Urb. ciudad paraíso 1 pol. 6 casa #38 carretera a candelaria de la frontera','2401-1137','3902','315','3','2006','evaluado','F','00006','00001','1991-03-01 00:00:00','GrpNone','',2007),
 ('VM00001','Maria Jacquelinne','Vásquez Morales','Carretera a chalchuapa km. 76 col. montecarlo block E #7','-','4067','210','2','2006','evaluado','F','00004','00001','1980-10-17 00:00:00','GrpNone','',2007),
 ('VM00002','Maritza Cecilia','Valladares Rodríguez','10a av. sur casa 2-D barrio san sebastián chalchuapa','-','4069','203','2','2006','evaluado','F','00002','00001','1990-05-03 00:00:00','GrpNone','',2007),
 ('VN00001','Nancy Iliana','Vásquez Cartagena','Calle central pte. barrio el transito turin ahuachapan','-','3606','113','1','2006','evaluado','F','00004','00001','1991-03-31 00:00:00','GrpNone','',2007),
 ('VN00002','Nestor Jonathan','Villalta Rivera','Col. los pinos calle a lamatepec lote #257','-','3883','302','3','2006','evaluado','M','00002','00001','1990-05-09 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('VR00001','Rosa Elena','Valiente Rivera','Cantón lomas de alarcón Atiquizaya ahuachapán','2413-5477','3606','103','1','2006','evaluado','F','00006','00001','1990-03-09 00:00:00','GrpNone','',2007),
 ('VR00002','Rosa Lizeth','Villalta Hernández','Col. san francisco pje. E pol. 20 casa #7 chalchuapa santa ana','-','6456','210','2','2006','evaluado','F','00002','00001','1984-03-17 00:00:00','GrpNone','',2007),
 ('VS00001','Sulma Yaneth','Villanueva Clavel','Col. la reina calle costa rica casa #7 Km 74 santa ana chalchuapa','2411-4034','4069','215','2','2006','evaluado','F','00006','00001','1986-05-09 00:00:00','GrpNone','',2007),
 ('ZC00001','Claudia Susana','Zepeda Siguenza','Col. santa isabel calle la bolsa 1-B santa ana','2447-6003','3974','102','1','2006','evaluado','F','00001','00001','1987-12-08 00:00:00','GrpNone','',2007),
 ('ZN00001','Nehemías Jhonatan','Zepeda Martínez','Res. contexa paje.#6 casa #10H ','-','3945','210','2','2006','evaluado','M','00003','00001','1987-09-17 00:00:00','GrpNone','',2007);
INSERT INTO `aspirantes` (`codigo`,`nombres`,`apellidos`,`direccion`,`telefono`,`lugarestudio`,`ciudad`,`departamento`,`anioaprobado`,`estado`,`sexo`,`carrera`,`facultad`,`fechanacimiento`,`codgrupo`,`resultado`,`anioregistrado`) VALUES 
 ('ZS00001','Sarbia Raquel','Zometa Molina','Col. las brisas calle los girasoles casa #18 el congo santa ana','7881-3732','4000','204','2','2006','evaluado','F','00001','00001','1988-01-05 00:00:00','GrpNone','',2007),
 ('ZT00001','Tania Dasilvia','Zelada Baños','Lot. las mareas poligono \"B\" casa 10','-','3902','210','2','2006','evaluado','F','00005','00001','1987-11-28 00:00:00','GrpNone','',2007);
/*!40000 ALTER TABLE `aspirantes` ENABLE KEYS */;


--
-- Definition of table `carreras`
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
INSERT INTO `carreras` (`codigo`,`nombre`,`codfacultad`) VALUES 
 ('00001','Profesorado en Educación Básica para Primero y Segundo Ciclos','00001'),
 ('00002','Profesorado en Lenguaje y Literatura para Tercer Ciclo de Educación Básica y Educación Media','00001'),
 ('00003','Profesorado en Idioma Inglés para Tercer Ciclo de Educación Básica y Educación Media','00001'),
 ('00004','Profesorado en Ciencias Sociales para Tercer Ciclo de Educación Básica y Educación Media','00001'),
 ('00005','Profesorado en Ciencias Naturales para Tercer Ciclo de Educación Básica y Educación Media','00001'),
 ('00006','Profesorado en Matemática para Tercer Ciclo de Educación Básica y Educación Media','00001'),
 ('00007','Profesorado en Educación Parvularia','00002'),
 ('00008','Profesorado en Educación Básica para Primero y Segundo Ciclos','00002'),
 ('00009','Profesorado en Lenguaje y Literatura para Tercer Ciclo de Educación Básica y Educación Media','00002'),
 ('00010','Profesorado en Idioma Inglés para Tercer Ciclo de Educación Básica y Educación Media','00002'),
 ('00011','Profesorado en Ciencias Sociales para Tercer Ciclo de Educación Básica y Educación Media','00002');
INSERT INTO `carreras` (`codigo`,`nombre`,`codfacultad`) VALUES 
 ('00012','Profesorado en Ciencias Naturales para Tercer Ciclo de Educación Básica y Educación Media','00002'),
 ('00013','Profesorado en Matemática para Tercer Ciclo de Educación Básica y Educación Media','00002'),
 ('00014','Profesorado en Educación Parvularia','00003'),
 ('00015','Profesorado en Educación Básica para Primero y Segundo Ciclos','00003'),
 ('00016','Profesorado en Ciencias Naturales para Tercer Ciclo de Educación Básica y Educación Media','00003'),
 ('00017','Profesorado en Matemática para Tercer Ciclo de Educación Básica y Educación Media','00003'),
 ('00018','Profesorado en Educación Parvularia','00004'),
 ('00019','Profesorado en Educación Básica para Primero y Segundo Ciclos','00004'),
 ('00020','Profesorado en Lenguaje y Literatura para Tercer Ciclo de Educación Básica y Educación Media','00004'),
 ('00021','Profesorado en Idioma Inglés para Tercer Ciclo de Educación Básica y Educación Media','00004'),
 ('00022','Profesorado en Ciencias Sociales para Tercer Ciclo de Educación Básica y Educación Media','00004');
/*!40000 ALTER TABLE `carreras` ENABLE KEYS */;


--
-- Definition of table `centroestudio`
--

DROP TABLE IF EXISTS `centroestudio`;
CREATE TABLE `centroestudio` (
  `codigo` char(5) NOT NULL default '',
  `nombre` varchar(99) NOT NULL,
  `codciudad` char(5) NOT NULL,
  `telefono1` char(9) default NULL,
  `telefono2` char(9) default NULL,
  `fax` char(9) default NULL,
  `email` varchar(80) default NULL,
  `web` varchar(90) default NULL,
  `caracter_inst` char(2) NOT NULL default '',
  `sector` varchar(8) NOT NULL,
  PRIMARY KEY  (`codigo`),
  KEY `codciudad` (`codciudad`),
  CONSTRAINT `codciudad` FOREIGN KEY (`codciudad`) REFERENCES `ciudades` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `centroestudio`
--

/*!40000 ALTER TABLE `centroestudio` DISABLE KEYS */;
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('0','INSTITUCION EXTRANJERA PUBLICO','0',NULL,NULL,NULL,NULL,NULL,'E','P?blico'),
 ('1008','INSTITUTO NACIONAL DE SAN BARTOLO','607','','','',NULL,NULL,'N','P?blico'),
 ('1009','COMPLEJO EDUCATIVO COLONIA LAS CAÑAS','607','','','',NULL,NULL,'N','P?blico'),
 ('1017','COLEGIO JERUSALEM','607','2952461','2952060','2950183',NULL,NULL,'N','Privado'),
 ('1024','COLEGIO LA CIMA','607','','2953760','2770657',NULL,NULL,'N','Privado'),
 ('1039','COLEGIO SAN PATRICIO','607','2940316','2946189','2940316',NULL,NULL,'N','Privado'),
 ('104','COLEGIO CRISTOBAL COLON','614','2252320','2253607','2255914',NULL,NULL,'N','Privado'),
 ('1041','LICEO CRISTIANO REVERENDO JUAN BUENO DE LA COLONIA SANTA LUCIA','607','2944825','2944885','2944284',NULL,NULL,'N','Privado'),
 ('1042','INSTITUTO NACIONAL DE LA COLONIA SANTA LUCIA','607','2940841','2942036','2942038',NULL,NULL,'N','P?blico'),
 ('1044','COLEGIO IOSEPH','607','2941608','','2941607',NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('1055','COLEGIO DOCTORA MARIA SOLA DESELLARES','617','2940239','','',NULL,NULL,'N','Privado'),
 ('1078','LICEO ALEXANDER FLEMING','617','2901026','','',NULL,NULL,'N','Privado'),
 ('1080','LICEO CRISTIANO REVERENDO JUAN BUENO DE LA COLONIA BOSQUES DEL RIO','617','2902078','','2902078',NULL,NULL,'N','Privado'),
 ('1084','INSTITUTO NACIONAL SAN LUIS','617','2906467','','2906467',NULL,NULL,'N','P?blico'),
 ('1087','COLEGIO CULTURAL RENOVACION VEINTE DE DICIEMBRE DE MIL NOVECIENTOS OCHENTA Y TRES','617','2900091','2900358','2990944',NULL,NULL,'N','Privado'),
 ('1098','COLEGIO CRISTIANO JARDINES DE SAN JOSE','617','2900232','','2904613',NULL,NULL,'N','Privado'),
 ('1104','CENTRO ESCOLAR SANTA EDUVIGES','617','','2923228','',NULL,NULL,'N','P?blico'),
 ('1114','LICEO SAN MARTIN','613','2580007','','',NULL,NULL,'N','Privado'),
 ('1118','COLEGIO PROFESORA MERCEDES MAITI DE LUARCA','613','2953961','','2953961',NULL,NULL,'N','Privado'),
 ('1122','NUEVO INSTITUTO CULTURAL ANDREAS VESALIUS','613','','2581019','',NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('1123','INSTITUTO COMERCIAL SAN MARTIN CABALLERO','613','2580115','','',NULL,NULL,'N','Privado'),
 ('1124','COLEGIO LICENCIADO GUILLERMO MACHON DE PAZ','613','8685680','','',NULL,NULL,'N','Privado'),
 ('1133','COLEGIO SAN PABLO DE LA CIUDAD DE SAN MARTIN','613','2580182','','',NULL,NULL,'N','Privado'),
 ('1135','ESCUELA EUCARISTICA DE SAN MARTIN','613','2584675','','2580342',NULL,NULL,'N','Privado'),
 ('1136','COLEGIO SIGLO VEINTIUNO','613','2581838','','',NULL,NULL,'N','Privado'),
 ('1138','COLEGIO HELEN ADAMS KELLER','613','2583932','','',NULL,NULL,'N','Privado'),
 ('1151','INSTITUTO NACIONAL DE SAN MARTIN','613','2580114','','2580114',NULL,NULL,'N','P?blico'),
 ('1158','INSTITUTO CATOLICO SAN PABLO APOSTOL','517','3319279','','',NULL,NULL,'N','Privado'),
 ('1168','INSTITUTO NACIONAL DE SAN PABLO TACACHICO','517','3319087','3319086','',NULL,NULL,'N','P?blico'),
 ('118','COLEGIO DIEGO DE HOLGUIN','614','2250500','','2250500',NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('1182','CENTRO ESCOLAR SAN ISIDRO','517','3996082','','',NULL,NULL,'N','P?blico'),
 ('120','LICEO JEAN PIAGET','614','2081321','','',NULL,NULL,'N','Privado'),
 ('1200','COMPLEJO EDUCATIVO SOLDADO OSCAR ANTONIO ORTIZ REYES','515','','','',NULL,NULL,'N','P?blico'),
 ('121','CENTRO INTERNACIONAL DE PROGRAMACION DE COMPUTADORAS','614','2257431','2265355','2261449',NULL,NULL,'N','Privado'),
 ('1216','ESCUELA DE CAPACITACION ADVENTISTA SALVADOREÑA','515','3413520','3413521','3413522',NULL,NULL,'N','Privado'),
 ('122','COLEGIO SPENCER','614','2261326','','2261323',NULL,NULL,'N','Privado'),
 ('1221','INSTITUTO DIOCESANO SAN JUAN EVANGELISTA','515','','3313021','',NULL,NULL,'N','Privado'),
 ('1225','CENTRO ESCOLAR HACIENDA TALCUALHUYA CANTON EL CARMEN','515','3319744','','',NULL,NULL,'N','P?blico'),
 ('1227','CENTRO ESCOLAR CASTO VALLADARES','515','3413822','','3413822',NULL,NULL,'N','P?blico'),
 ('1242','INSTITUTO NACIONAL DE SAN JUAN OPICO','515','3313134','','3313134',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('1247','CENTRO ESCOLAR SANTOS NOVOA','515','3313343','','',NULL,NULL,'N','P?blico'),
 ('1249','INSTITUTO NACIONAL DE CIUDAD ARCE','502','3309015','','',NULL,NULL,'N','P?blico'),
 ('125','BERRY COLLEGE SCHOOL OF BUSINESS','614','2250854','2267409','2250854',NULL,NULL,'N','Privado'),
 ('1251','INSTITUTO TECNICO SAN ANTONIO','502','3408417','','',NULL,NULL,'N','Privado'),
 ('1258','NUEVO INSTITUTO ARCE JERIEL','502','3408011','','3408011',NULL,NULL,'N','Privado'),
 ('126','INSTITUTO NACIONAL ALBERT CAMUS','614','2250710','','2250710',NULL,NULL,'N','P?blico'),
 ('1269','CENTRO ESCOLAR SAN FRANCISCO','502','3309129','','',NULL,NULL,'N','P?blico'),
 ('127','CENTRO ESCOLAR GENERAL FRANCISCO MORAZAN','614','','','',NULL,NULL,'N','P?blico'),
 ('1279','INSTITUTO NACIONAL TECPAN','515','3194265','','',NULL,NULL,'N','P?blico'),
 ('128','INSTITUTO TECNICO RICALDONE','614','2264250','2255588','2268668',NULL,NULL,'N','Privado'),
 ('1281','INSTITUTO SAN ANDRES','502','3458699','3384852','',NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('1284','CENTRO ESCOLAR CANTON ZAPOTITAN','502','','','',NULL,NULL,'N','P?blico'),
 ('1286','CENTRO ESCOLAR IGNACIO ELLACURIA','502','3458695','','',NULL,NULL,'N','P?blico'),
 ('1290','INSTITUTO NACIONAL DE SAN MATIAS','516','3454269','','',NULL,NULL,'N','P?blico'),
 ('130','COLEGIO GUADALUPANO','614','2253437','2353961','2265055',NULL,NULL,'N','Privado'),
 ('1309','COLEGIO JOAQUIN CASTRO CANIZALES','512','','','',NULL,NULL,'N','Privado'),
 ('131','COLEGIO EXTERNADO DE SAN JOSE','614','2253241','2253464','2257624',NULL,NULL,'N','Privado'),
 ('1311','CENTRO ESCOLAR PROFESOR ALBERTO MASFERRER','512','3102049','3103165','3102049',NULL,NULL,'N','P?blico'),
 ('1316','CENTRO ESCOLAR DE QUEZALTEPEQUE','512','3102164','','',NULL,NULL,'N','P?blico'),
 ('1320','COLEGIO SUPERIOR PROFESOR EDMUNDO ALIRIO VILLACORTA','512','3100048','','',NULL,NULL,'N','Privado'),
 ('1322','INSTITUTO NACIONAL JOSE MARIA PERALTA LAGOS','512','3102173','','',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('1327','LICEO JOSE SIMEON CAÑAS','512','3100288','','',NULL,NULL,'N','Privado'),
 ('1342','LICEO CRISTIANO APOSTOL SAN PEDRO','512','','','',NULL,NULL,'N','Privado'),
 ('1345','COMPLEJO EDUCATIVO CATOLICO SAN JOSE','512','3102249','','',NULL,NULL,'N','P?blico'),
 ('1354','CENTRO ESCOLAR COOPERATIVA SAN FERNANDO','513','3456177','','',NULL,NULL,'N','P?blico'),
 ('1359','INSTITUTO NACIONAL CANTON SAN JOSE LOS SITIOS','519','','3466602','3466602',NULL,NULL,'N','P?blico'),
 ('1370','INSTITUTO NACIONAL HEBER REMBERTO TRUJILLO DIAZ','507','3388092','','3388092',NULL,NULL,'N','P?blico'),
 ('1373','COMPLEJO EDUCATIVO TALNIQUE','519','','','',NULL,NULL,'N','P?blico'),
 ('1381','COLEGIO RAFAEL BAIRES','503','','3187217','',NULL,NULL,'N','Privado'),
 ('1398','INSTITUTO NACIONAL CANTON LOURDES','503','3384571','3182834','3384571',NULL,NULL,'N','P?blico'),
 ('1399','LICEO SAN VICENTE DE PAUL','511','2284251','','',NULL,NULL,'N','Privado'),
 ('1418','CENTRO ESCOLAR CANTON LAS MORAS','503','3188380','','',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('1431','COLEGIO CARLOS LANIER','511','2281435','','',NULL,NULL,'N','Privado'),
 ('1432','LICEO JORGE ADALBERTO LAGOS','511','2283289','','2882088',NULL,NULL,'N','Privado'),
 ('1433','COLEGIO INMACULADA CONCEPCION','511','2280329','','',NULL,NULL,'N','Privado'),
 ('1435','LICEO ANTONIO MACHADO','511','2284031','','',NULL,NULL,'N','Privado'),
 ('1436','COLEGIO GUSTAVO ADOLFO BECQUER','511','2291498','','2291498',NULL,NULL,'N','Privado'),
 ('1437','COLEGIO HISPANOAMERICA','511','','2281135','2281135',NULL,NULL,'N','Privado'),
 ('1438','COMPLEJO EDUCATIVO JOSE MARTI','511','','','2280143',NULL,NULL,'N','P?blico'),
 ('144','INSTITUTO TECNICO SALVAROREÑO','614','2222231','','',NULL,NULL,'N','Privado'),
 ('1443','COLEGIO SANTA INES','511','2281402','2291263','2284902',NULL,NULL,'N','Privado'),
 ('1463','LICEO SALVADOREÑO CANADIENSE','511','','2280987','',NULL,NULL,'N','Privado'),
 ('1467','COMPLEJO EDUCATIVO CATOLICO MARIA MAZZARELLO','511','','2287888','2287888',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('1477','ESCUELA EN COMERCIO Y ADMINISTRACION','511','2281973','','2283332',NULL,NULL,'N','Privado'),
 ('1491','COLEGIO JOSE INGENIEROS','511','2899181','2788984','',NULL,NULL,'N','Privado'),
 ('1493','COLEGIO CHAMPAGNAT','511','2281160','2282125','2291012',NULL,NULL,'N','Privado'),
 ('1495','COMPLEJO EDUCATIVO WALTER A SOUNDY','511','2299067','','2299067',NULL,NULL,'N','P?blico'),
 ('1496','COLEGIO BELEN','511','','2280106','2297388',NULL,NULL,'N','Privado'),
 ('1499','COLEGIO DE INFORMATICA Y ADMINISTRACION JULIO VERNE','511','2281273','','2281273',NULL,NULL,'N','Privado'),
 ('1501','COLEGIO SAO PAULO','511','2280449','','2280449',NULL,NULL,'N','Privado'),
 ('1513','CENTRO ESCOLAR LAMATEPEC','511','2295333','2295334','2295328',NULL,NULL,'N','Privado'),
 ('1514','INSTITUTO BETHANIA','511','2280075','2281023','2281646',NULL,NULL,'N','Privado'),
 ('1515','COLEGIO NAZARETH','511','2281253','2280560','2281253',NULL,NULL,'N','Privado'),
 ('1516','CENTRO ESCOLAR LA FLORESTA','511','2295336','2295337','2295340',NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('1517','LICEO FRANCES','511','2282281','2280615','2282865',NULL,NULL,'N','Privado'),
 ('1518','ACADEMIA BRITANICA CUSCATLECA','511','2282011','','2282956',NULL,NULL,'N','Privado'),
 ('1520','COLEGIO NUESTRA SEÑORA DEL ROSARIO DE FATIMA','511','2281070','','2283588',NULL,NULL,'N','Privado'),
 ('1521','CENTRO ESCOLAR JOSE DAMIAN VILLACORTA','511','2284973','2280159','2284973',NULL,NULL,'N','P?blico'),
 ('1532','CENTRO ESCOLAR DE TEPECOYO','521','','','',NULL,NULL,'N','P?blico'),
 ('1547','INSTITUTO NACIONAL DE ANTIGUO CUSCATLAN','501','2438699','2434648','2434845',NULL,NULL,'N','P?blico'),
 ('1549','CENTRO ESCOLAR WALTER THILO DEININGER','501','2431356','','2431356',NULL,NULL,'N','P?blico'),
 ('1562','CENTRO ESCOLAR COLONIA EL COCO','505','','','',NULL,NULL,'N','P?blico'),
 ('1563','CENTRO ESCOLAR JOSE SIMEON CAÑAS','505','','','',NULL,NULL,'N','P?blico'),
 ('1564','COMPLEJO EDUCATIVO CATOLICO SANTO DOMINGO','505','3388862','','3388821',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('1584','COMPLEJO EDUCATIVO CANTON EL ZUNZAL','518','3896064','','',NULL,NULL,'N','P?blico'),
 ('1585','COMPLEJO EDUCATIVO CAPITAN GENERAL GERARDO BARRIOS','518','3389734','','',NULL,NULL,'N','P?blico'),
 ('1588','INSTITUTO NACIONAL DE SACACOYO','513','','3467810','3467810',NULL,NULL,'N','P?blico'),
 ('1592','INSTITUTO NACIONAL JOSE RIVERA CAMPOS','504','3389957','','',NULL,NULL,'N','P?blico'),
 ('161','INSTITUTO HERMANAS SOMASCAS','614','2433703','','2433788',NULL,NULL,'N','Privado'),
 ('162','COLEGIO INTERNACIONAL DE SAN SALVADOR','614','2241330','2791992','2237335',NULL,NULL,'N','Privado'),
 ('1621','CENTRO ESCOLAR EDUARDO GUIROLA','509','3060153','','',NULL,NULL,'N','P?blico'),
 ('1628','INSTITUTO CATOLICO SAN FRANCISCO DE ASIS','509','','3353168','3353168',NULL,NULL,'N','Privado'),
 ('163','ESCUELA BILINGUE MAQUILISHUAT','614','2638008','','2638082',NULL,NULL,'N','Privado'),
 ('1631','INSTITUTO NACIONAL DEL PUERTO DE LA LIBERTAD','509','3353091','','3353091',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('1633','COLEGIO HUGO LINDO OLIVARES','509','3353575','','',NULL,NULL,'N','Privado'),
 ('1636','CENTRO ESCOLAR DE LA LIBERTAD','509','3353015','','',NULL,NULL,'N','P?blico'),
 ('1642','INSTITUTO NACIONAL DE ZARAGOZA','522','3155327','','',NULL,NULL,'N','P?blico'),
 ('165','INSTITUTO EMILIANI','614','2433813','2433684','2433757',NULL,NULL,'N','Privado'),
 ('1652','INSTITUTO TECNICO VOCACIONAL DE SAN JOSE VILLANUEVA','514','3423019','','',NULL,NULL,'N','P?blico'),
 ('1659','COLEGIO OSCAR ARNULFO ROMERO','522','3140824','','',NULL,NULL,'N','Privado'),
 ('1661','CENTRO ESCOLAR JOSE MARIA CACERES','522','3140849','','',NULL,NULL,'N','P?blico'),
 ('167','COLEGIO CRISTIANO JOSUE','614','2638841','2641769','',NULL,NULL,'N','Privado'),
 ('1675','CENTRO ESCOLAR DE HUIZUCAR','506','3420009','','',NULL,NULL,'N','P?blico'),
 ('168','LICEO CRISTIANO REVERENDO JUAN BUENO DE LA COLONIA SAN BENITO','614','2980418','2233865','2791831',NULL,NULL,'N','Privado'),
 ('1689','COMPLEJO EDUCATIVO CASERIO EL ZUNZAL','520','','','',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('1696','INSTITUTO NACIONAL DE TEOTEPEQUE','520','3388675','','',NULL,NULL,'N','P?blico'),
 ('17','ESCUELA CRISTIANA MARANATHA','614','2423384','','2423384',NULL,NULL,'N','Privado'),
 ('171','ESCUELA AMERICANA','601','2578336','2578328','2578303',NULL,NULL,'N','Privado'),
 ('1720','CENTRO ESCOLAR DE SANTA CRUZ ANALQUITO','713','','3799053','',NULL,NULL,'N','P?blico'),
 ('1723','COMPLEJO EDUCATIVO RAFAEL CABRERA','712','','3798010','',NULL,NULL,'N','P?blico'),
 ('1733','COLEGIO ADVENTISTA','702','3720503','','3720503',NULL,NULL,'N','Privado'),
 ('1738','COLEGIO SANTA ISABEL','702','3720148','','3724370',NULL,NULL,'N','Privado'),
 ('1741','INSTITUTO NACIONAL WALTER THILO DEININGER','702','3720220','3724482','3720220',NULL,NULL,'N','P?blico'),
 ('1751','INSTITUTO POLITECNICO HENRY FORD','702','3724292','','3724292',NULL,NULL,'N','Privado'),
 ('1752','INSTITUTO CULTURAL CUSCATLAN','702','','3721300','3721300',NULL,NULL,'N','Privado'),
 ('1757','CENTRO ESCOLAR RAFAEL BARRAZA RODRIGUEZ','703','3723917','','',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('1771','CENTRO ESCOLAR SAN CRISTOBAL','708','3797006','','',NULL,NULL,'N','P?blico'),
 ('1772','COLEGIO LEON SIGUENZA','702','3720758','','3728468',NULL,NULL,'N','Privado'),
 ('1773','LICEO RAUL CONTRERAS','702','3720572','','3720572',NULL,NULL,'N','Privado'),
 ('1779','COLEGIO MOISES VINCENZI','711','3780201','','',NULL,NULL,'N','Privado'),
 ('1816','INSTITUTO NACIONAL TENANCINGO','716','3793084','3793093','',NULL,NULL,'N','P?blico'),
 ('183','COLEGIO MONTESSORI','614','2241494','2238517','2238517',NULL,NULL,'N','Privado'),
 ('1833','COLEGIO PRESBITERO LUIS MONTESINOS','707','3792166','','3792166',NULL,NULL,'N','Privado'),
 ('1834','CENTRO ESCOLAR SAN BARTOLOME PERULAPIA','707','3791099','','',NULL,NULL,'N','P?blico'),
 ('1835','COMPLEJO EDUCATIVO DOCTOR PIO ROMERO BOSQUE','706','3540450','','',NULL,NULL,'N','P?blico'),
 ('184','COLEGIO CENTRO HARVARD','614','2236767','2980241','',NULL,NULL,'N','Privado'),
 ('1840','INSTITUTO DIOCESANO SAN FRANCISCO DE ASIS','709','3765109','','',NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('185','INSTITUTO POLITECNICO NAZARETH','614','2790206','','2790223',NULL,NULL,'N','Privado'),
 ('1853','LICEO AMERICANO ESPAÑOL','710','3541637','','',NULL,NULL,'N','Privado'),
 ('1854','INSTITUTO NACIONAL SAN PEDRO PERULAPAN','710','','3790030','3790030',NULL,NULL,'N','P?blico'),
 ('186','COLEGIO LOS ROBLES','614','2452566','2452551','2452562',NULL,NULL,'N','Privado'),
 ('1867','CENTRO ESCOLAR GENERAL FRANCISCO MENENDEZ','710','3541593','','',NULL,NULL,'N','P?blico'),
 ('188','COLEGIO SALVADOREÑO ESPAÑOL','614','2237451','2236879','2240134',NULL,NULL,'N','Privado'),
 ('1880','CENTRO ESCOLAR DOCTOR ANDRES GONZALO FUNES','710','3540372','','',NULL,NULL,'N','P?blico'),
 ('189','COLEGIO LA SAGRADA FAMILIA','614','2981800','','2792867',NULL,NULL,'N','Privado'),
 ('1902','CENTRO ESCOLAR CASERIO EL BARRIO CANTON PLATANARES','715','','','',NULL,NULL,'N','P?blico'),
 ('1921','COMPLEJO EDUCATIVO DOCTOR GUILLERMO MANUEL UNGO','715','','3540799','',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('1922','INSTITUTO NACIONAL SUCHITOTO','715','','3351113','3351113',NULL,NULL,'N','P?blico'),
 ('1928','COMPLEJO TECNICO JORGE WASHINGTON','821','3342556','3341321','3342556',NULL,NULL,'N','Privado'),
 ('1932','EXTERNADO JOHN FITZGERALD KENNEDY','821','3340478','','3340478',NULL,NULL,'N','Privado'),
 ('1935','CENTRO PSICOPEDAGOGICO LA PAZ','821','3340670','','3340670',NULL,NULL,'N','Privado'),
 ('1939','INSTITUTO NACIONAL JOSE SIMEON CAÑAS','821','3340292','','3344533',NULL,NULL,'N','P?blico'),
 ('1940','COMPLEJO EDUCATIVO PROFESOR CARLOS LOBATO','821','3345412','','3345412',NULL,NULL,'N','P?blico'),
 ('1956','LICEO VIROLEÑO DE COMERCIO','821','3345022','','3345022',NULL,NULL,'N','Privado'),
 ('1978','CENTRO ESCOLAR CANTON EL ESPINO ABAJO','821','3342354','0','0',NULL,NULL,'N','P?blico'),
 ('1994','CENTRO ESCOLAR CANTON LAS TABLAS','821','','','',NULL,NULL,'N','P?blico'),
 ('2002','INSTITUTO NACIONAL PROFESOR FRANCISCO GUERRERO','817','3300905','','',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('201','COMPLEJO EDUCATIVO ANDRES BELLO','614','2608533','','2608541',NULL,NULL,'N','Privado'),
 ('2018','INSTITUTO NACIONAL DE EDUCACION A DISTANCIA DE SAN JUAN NONUALCO SEDE N. 26','810','3345007','','',NULL,NULL,'N','P?blico'),
 ('2022','COMPLEJO EDUCATIVO PROFESOR FELIPE HUEZO CORDOVA','810','3301040','','',NULL,NULL,'N','P?blico'),
 ('2026','LICEO CAMILO MINERO','819','3304543','3304192','3304192',NULL,NULL,'N','Privado'),
 ('203','LICEO GETSEMANI','614','2607272','','2607319',NULL,NULL,'N','Privado'),
 ('2039','INSTITUTO NACIONAL JOSE INGENIEROS','819','3304004','','3304004',NULL,NULL,'N','P?blico'),
 ('204','CENTRO EDUCATIVO DENVER','614','2731159','2735536','2731585',NULL,NULL,'N','Privado'),
 ('2043','CENTRO ESCOLAR DOCTOR JOAQUIN JULE GALVEZ','819','','','',NULL,NULL,'N','P?blico'),
 ('206','LICEO SALVADOREÑO','614','2609888','2607459','2607246',NULL,NULL,'N','Privado'),
 ('2066','INSTITUTO NACIONAL AUGUSTO CESAR ROMERO','816','3349337','3349301','3349337',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('207','INSTITUTO NACIONAL TECNICO INDUSTRIAL','614','2233156','2233886','2231385',NULL,NULL,'N','P?blico'),
 ('2080','INSTITUTO NACIONAL DE JERUSALEN','803','3963310','','',NULL,NULL,'N','P?blico'),
 ('2085','INSTITUTO NACIONAL DE SANTA MARIA OSTUMA','818','3620161','','',NULL,NULL,'N','P?blico'),
 ('2101','CENTRO ESCOLAR CANTON EL ACHIOTAL','815','3544217','','',NULL,NULL,'N','P?blico'),
 ('2103','CENTRO ESCOLAR CANTON SAN MARCELINO','815','3382623','','',NULL,NULL,'N','P?blico'),
 ('2105','COMPLEJO EDUCATIVO CANTON LAS ISLETAS','815','0','3544130','0',NULL,NULL,'N','P?blico'),
 ('2119','COMPLEJO EDUCATIVO MARCOS OCHOA','820','3959505','','',NULL,NULL,'N','P?blico'),
 ('2127','INSTITUTO NACIONAL DE SAN ANTONIO MASAHUAT','807','3302540','','',NULL,NULL,'N','P?blico'),
 ('2132','INSTITUTO NACIONAL DE EL ROSARIO','802','3303252','','',NULL,NULL,'N','P?blico'),
 ('2146','INSTITUTO NACIONAL DE SAN LUIS TALPA','813','3348162','','',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('2152','COLEGIO MONSEÑOR PEDRO ARNOLDO APARICIO Y QUINTANILLA','813','3348533','0','0',NULL,NULL,'N','Privado'),
 ('2159','CENTRO ESCOLAR SAN LUIS TALPA','813','3348185','0','0',NULL,NULL,'N','P?blico'),
 ('2167','INSTITUTO NACIONAL DOCTOR MANUEL LUIS ESCAMILLA','801','3307009','','',NULL,NULL,'N','P?blico'),
 ('217','LICEO DAVID J GUZMAN','614','2718703','','2718703',NULL,NULL,'N','Privado'),
 ('2173','CENTRO ESCOLAR DOCTOR VICTORINO AYALA','801','3307004','','',NULL,NULL,'N','P?blico'),
 ('2178','INSTITUTO NACIONAL DE OLOCUILTA','805','3306159','','3306159',NULL,NULL,'N','P?blico'),
 ('2206','CENTRO ESCOLAR CLAUDIA LARS','809','3621103','','',NULL,NULL,'N','P?blico'),
 ('2208','INSTITUTO NACIONAL DE SAN JUAN TEPEZONTES','812','','','3622031',NULL,NULL,'N','P?blico'),
 ('2209','INSTITUTO NACIONAL DE SAN EMIGDIO','808','','3792536','',NULL,NULL,'N','P?blico'),
 ('221','LICEO CRISTIANO REVERENDO JUAN BUENO DEL BARRIO MODELO','614','2701019','','2701019',NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('2218','COMPLEJO EDUCATIVO GENERAL RAFAEL OSORIO HIJO','806','8370835','','',NULL,NULL,'N','P?blico'),
 ('2227','INSTITUTO NACIONAL DE SAN LUIS LA HERRADURA','822','3650079','3650527','3650079',NULL,NULL,'N','P?blico'),
 ('223','LICEO NUESTRA SEÑORA DE LOS ANGELES','614','2711508','','2811140',NULL,NULL,'N','Privado'),
 ('2241','COMPLEJO EDUCATIVO CANTON GUADALUPE LA ZORRA','822','','','',NULL,NULL,'N','P?blico'),
 ('225','CENTRO ESCOLAR REPUBLICA DEL ECUADOR','614','2420118','','2420118',NULL,NULL,'N','P?blico'),
 ('2255','COLEGIO TECNICO DE COMPUTACION DE SENSUNTEPEQUE','906','3821372','','',NULL,NULL,'N','Privado'),
 ('2259','CENTRO ESCOLAR CATOLICO SANTA TERESITA','906','3823075','','',NULL,NULL,'N','P?blico'),
 ('226','CENTRO ESCOLAR JOSE MATIAS DELGADO','614','2716092','','2716092',NULL,NULL,'N','P?blico'),
 ('2261','CENTRO ESCOLAR PROFESOR JOSE ANGEL CASTILLO','906','3823116','','',NULL,NULL,'N','P?blico'),
 ('2280','INSTITUTO NACIONAL DE SENSUNTEPEQUE','906','3824901','','3823008',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('229','COLEGIO EVANGELICO CENTROAMERICANO','614','2352000','','2352000',NULL,NULL,'N','Privado'),
 ('2327','INSTITUTO NACIONAL CENTRAL EL GUAYABO','906','3891019','','',NULL,NULL,'N','P?blico'),
 ('2351','INSTITUTO NACIONAL DOCTOR SALVADOR ANTONIO NAVARRETE AZURDIA','909','3892161','','3892161',NULL,NULL,'N','P?blico'),
 ('2368','INSTITUTO NACIONAL DE VICTORIA','908','3893115','','',NULL,NULL,'N','P?blico'),
 ('2389','CENTRO ESCOLAR CANTON SANTA MARTA','908','','','',NULL,NULL,'N','P?blico'),
 ('24','ESCUELA TECNICA PARA LA SALUDMARIA TERESA LANG','614','2211154','2210176','2225669',NULL,NULL,'N','Privado'),
 ('2405','INSTITUTO NACIONAL DE SAN ISIDRO','905','3863131','','',NULL,NULL,'N','P?blico'),
 ('242','COLEGIO DIVINO SALVADOR','614','2225817','2217106','',NULL,NULL,'N','Privado'),
 ('2438','LICEO EUROPEO','903','3842097','','3842097',NULL,NULL,'N','Privado'),
 ('244','INSTITUTO SALVADOREÑO DE SUPERACION INTEGRAL ISAAC NEWTON','614','2223635','2210715','2223635',NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('2443','INSTITUTO NACIONAL DE ILOBASCO','903','3322089','','3322089',NULL,NULL,'N','P?blico'),
 ('246','NUEVO LICEO CENTROAMERICANO','614','2210392','','2210394',NULL,NULL,'N','Privado'),
 ('2460','CENTRO ESCOLAR GENERAL FRANCISCO MENENDEZ','903','3322150','','',NULL,NULL,'N','P?blico'),
 ('248','CENTRO ESCOLAR REPUBLICA DE COSTA RICA','614','2228517','','',NULL,NULL,'N','P?blico'),
 ('2497','INSTITUTO NACIONAL CRISTOBAL IGLESIAS DE TEJUTEPEQUE','907','3890067','0','0',NULL,NULL,'N','P?blico'),
 ('250','CENTRO TECNICO DE CAPACITACION CONTABLE','614','2263967','','',NULL,NULL,'N','Privado'),
 ('2504','CENTRO ESCOLAR 15 DE SEPTIEMBRE','904','3894032','','',NULL,NULL,'N','P?blico'),
 ('251','INSTITUTO NACIONAL NOCTURNO MAYOR VICTOR MANUEL BAIRES CRUZ','614','','','',NULL,NULL,'N','P?blico'),
 ('2513','INSTITUTO NACIONAL CANTON EL PACUN','1011','6322011','8868570','6322011',NULL,NULL,'N','P?blico'),
 ('252','COLEGIO AMERICANO DE COMPUTACION','614','2222131','','2222131',NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('253','COLEGIO CULTURAL ITALIANO','614','2214504','','',NULL,NULL,'N','Privado'),
 ('2532','CENTRO ESCOLAR ROMILIA BLANCO VIUDA DE BRIOSO','1011','3988017','','',NULL,NULL,'N','P?blico'),
 ('2540','INSTITUTO NACIONAL DE TECOLUCA','1011','3624130','','',NULL,NULL,'N','P?blico'),
 ('255','COLEGIO TALES DE MILETO','614','2223012','','',NULL,NULL,'N','Privado'),
 ('2557','COLEGIO TECNICO CULTURAL JOSE NAPOLEON RODRIGUEZ','1010','3930808','','',NULL,NULL,'N','Privado'),
 ('256','CENTRO ACADEMICO ALFRED NOBEL','614','2220262','','2225032',NULL,NULL,'N','Privado'),
 ('2563','COLEGIO EVANGELICO','1010','3930654','','',NULL,NULL,'N','Privado'),
 ('257','COLEGIO MARIA INMACULADA','614','2225543','','2227151',NULL,NULL,'N','Privado'),
 ('2570','COLEGIO MODELO','1010','3934116','','',NULL,NULL,'N','Privado'),
 ('2572','COLEGIO EUCARISTICO DEL DIVINO SALVADOR','1010','3930164','','3930164',NULL,NULL,'N','Privado'),
 ('2574','CENTRO ESCOLAR PROFESOR JUSTO CARDOZA','1010','3930039','','',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('2575','CENTRO ESCOLAR ANTONIA GALINDO','1010','3930477','','',NULL,NULL,'N','P?blico'),
 ('2577','COMPLEJO EDUCATIVO CATOLICO GUADALUPE CARCAMO','1010','3930202','','',NULL,NULL,'N','Privado'),
 ('2578','INSTITUTO NACIONAL DOCTOR SARBELIO NAVARRETE','1010','3930250','3932653','3930250',NULL,NULL,'N','P?blico'),
 ('259','INSTITUTO CULTURAL OXFORD','613','2211977','','',NULL,NULL,'N','Privado'),
 ('2593','COMPLEJO EDUCATIVO CATOLICO LA SANTA FAMILIA','1010','3930232','','',NULL,NULL,'N','P?blico'),
 ('2594','COMPLEJO EDUCATIVO CASERIO LA GALERA','1010','','','',NULL,NULL,'N','P?blico'),
 ('260','COLEGIO CRISTIANO SALVADOREÑO EN HACORE','614','2611459','','2611458',NULL,NULL,'N','Privado'),
 ('2609','COMPLEJO EDUCATIVO PEDRO PABLO CASTILLO','1012','3963402','','',NULL,NULL,'N','P?blico'),
 ('261','COLEGIO CORAZON DE MARIA','614','2221147','2715727','2221147',NULL,NULL,'N','Privado'),
 ('2610','COMPLEJO EDUCATIVO DOCTOR JUSTO AGUILAR','1003','3932036','','3932036',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('2621','INSTITUTO NACIONAL SAN JOSE VERAPAZ','1013','','3963045','3963354',NULL,NULL,'N','P?blico'),
 ('2625','INSTITUTO NACIONAL PROFESOR SANTIAGO ECHEGOYEN','1002','3626211','','3626211',NULL,NULL,'N','P?blico'),
 ('263','LICEO BERTRAND RUSSELL','614','2815853','','',NULL,NULL,'N','Privado'),
 ('2631','COLEGIO ANA GUERRA DE JESUS','1005','3330201','','3330279',NULL,NULL,'N','Privado'),
 ('2635','INSTITUTO NACIONAL DE SANTO DOMINGO','1005','3330177','','3330177',NULL,NULL,'N','P?blico'),
 ('264','COLEGIO MONTE MARIA','614','2211134','2714570','2211134',NULL,NULL,'N','Privado'),
 ('2643','COMPLEJO EDUCATIVO CANTON LA LABOR','1009','','3339625','',NULL,NULL,'N','P?blico'),
 ('265','INSTITUTO EL SALVADOR','614','2210415','','',NULL,NULL,'N','Privado'),
 ('2651','INSTITUTO NACIONAL DE SAN SEBASTIAN','1009','','','3339016',NULL,NULL,'N','P?blico'),
 ('2655','CENTRO ESCOLAR CATOLICO LA SANTA FAMILIA DE SAN SEBASTIAN','1009','3339031','','',NULL,NULL,'N','P?blico'),
 ('2659','CENTRO ESCOLAR FEDERICO GONZALEZ','1009','3339161','','',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('266','COLEGIO LA ASUNCION','614','2223779','2713498','2713498',NULL,NULL,'N','Privado'),
 ('2661','INSTITUTO NACIONAL DE SAN LORENZO','1008','','','',NULL,NULL,'N','P?blico'),
 ('267','INSTITUTO NACIONAL GENERAL FRANCISCO MORAZAN','614','2210148','2210419','2228700',NULL,NULL,'N','P?blico'),
 ('2670','COMPLEJO EDUCATIVO CANTON LAS ANIMAS','1008','','','',NULL,NULL,'N','P?blico'),
 ('268','COMPLEJO EDUCATIVO JOAQUIN RODEZNO','614','2222860','','',NULL,NULL,'N','P?blico'),
 ('2686','INSTITUTO NACIONAL DOCTOR PEDRO MIGUEL RIVERA DAMAS','1006','','3627009','',NULL,NULL,'N','P?blico'),
 ('2691','CENTRO ESCOLAR CATOLICO PRESBITERO HIGINIO TORRES','1006','3627019','3627133','3627133',NULL,NULL,'N','P?blico'),
 ('2692','CENTRO ESCOLAR DE SANTA CLARA','1004','3897009','','',NULL,NULL,'N','P?blico'),
 ('2700','COLEGIO NATIVIDAD OTMARO ROMERO','1001','','','',NULL,NULL,'N','Privado'),
 ('2724','INSTITUTO NACIONAL DE SAN ILDEFONSO','1007','3628148','','3628148',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('2742','INSTITUTO NACIONAL DE APASTEPEQUE','1001','3280001','','',NULL,NULL,'N','P?blico'),
 ('275','COLEGIO THEODOR HERZL','614','2261418','','2224038',NULL,NULL,'N','Privado'),
 ('2767','CENTRO ESCOLAR ALFREDO ESPINO','424','3320838','','3320838',NULL,NULL,'N','P?blico'),
 ('2769','INSTITUTO NACIONAL DE SAN JOSE LAS FLORES','428','3549046','','',NULL,NULL,'N','P?blico'),
 ('2788','COMPLEJO EDUCATIVO LEANDRO MARIA GUARDADO','402','','3548054','',NULL,NULL,'N','P?blico'),
 ('279','LICEO LUXEMBURGO','614','2252142','','',NULL,NULL,'N','Privado'),
 ('2796','INSTITUTO NACIONAL SAN FRANCISCO LEMPA','423','','','3993050',NULL,NULL,'N','P?blico'),
 ('28','QUEENS SCHOOL OF BUSINESS SA','614','2606986','','2607155',NULL,NULL,'N','Privado'),
 ('2800','INSTITUTO NACIONAL DE AZACUALPA','403','','3994092','3994065',NULL,NULL,'N','P?blico'),
 ('2813','INSTITUTO NACIONAL DE LA LAGUNA','411','3099133','','',NULL,NULL,'N','P?blico'),
 ('282','INSTITUTO CULTURAL MIGUEL DE CERVANTES','614','2228237','','2223204',NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('283','COLEGIO ADVENTISTA DE SAN SALVADOR','614','2255646','','2255646',NULL,NULL,'N','Privado'),
 ('2839','INSTITUTO NACIONAL DE CONCEPCION QUEZALTEPEQUE','406','3312330','','3312330',NULL,NULL,'N','P?blico'),
 ('2857','INSTITUTO NACIONAL DE DULCE NOMBRE DE MARIA','408','3569263','','3569199',NULL,NULL,'N','P?blico'),
 ('2863','CENTRO ESCOLAR SANTA RITA','432','3098141','','',NULL,NULL,'N','P?blico'),
 ('287','COLEGIO MARIA AUXILIADORA','614','2261767','','2264830',NULL,NULL,'N','Privado'),
 ('288','LICEO CRISTIANO REVERENDO JUAN BUENO CENTRAL','614','2255816','2256734','2257008',NULL,NULL,'N','Privado'),
 ('2890','COLEGIO ADVENTISTA DE CHALATENANGO','407','3352535','','',NULL,NULL,'N','Privado'),
 ('2895','INSTITUTO NACIONAL DOCTOR FRANCISCO MARTINEZ SUAREZ','407','3011598','3011360','3352126',NULL,NULL,'N','P?blico'),
 ('2908','INSTITUTO NACIONAL GENERAL JUAN ORLANDO ZEPEDA','407','3092880','','3092536',NULL,NULL,'N','P?blico'),
 ('2930','INSTITUTO NACIONAL DE NOMBRE DE JESUS','415','3097037','','3097037',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('2949','INSTITUTO NACIONAL DE POTONICO','419','3546083','','3546083',NULL,NULL,'N','P?blico'),
 ('2964','CENTRO ESCOLAR DE CITALA DEPARTAMENTO DE CHALATENANGO','404','3359455','','',NULL,NULL,'N','P?blico'),
 ('2973','CENTRO ESCOLAR RUFINO GUEVARA','401','','','3094125',NULL,NULL,'N','P?blico'),
 ('3005','COMPLEJO EDUCATIVO CANTON LAS PILAS','425','','','',NULL,NULL,'N','P?blico'),
 ('3011','INSTITUTO NACIONAL DE SAN IGNACIO','425','3359385','','3359385',NULL,NULL,'N','P?blico'),
 ('3018','COLEGIO EVANGELICO AMIGOS DE EL SALVADOR','425','3359331','','3359331',NULL,NULL,'N','Privado'),
 ('3029','INSTITUTO NACIONAL DE LA PALMA','412','','3359013','3359013',NULL,NULL,'N','P?blico'),
 ('3034','CENTRO ESCOLAR VEINTIDOS DE JUNIO','412','3359165','','3359004',NULL,NULL,'N','P?blico'),
 ('3065','INSTITUTO NACIONAL REPUBLICA DE ITALIA','433','3536001','','3536001',NULL,NULL,'N','P?blico'),
 ('307','INSTITUTO NACIONAL GENERAL FRANCISCO MENENDEZ','614','2766085','2766080','2766083',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('3074','INSTITUTO NACIONAL CASERIO AGUACAYO CANTON EL TIGRE','413','','','',NULL,NULL,'N','P?blico'),
 ('3080','INSTITUTO NACIONAL DE LA REINA','413','','3091623','',NULL,NULL,'N','P?blico'),
 ('31','LICEO FLOR BLANCA','614','2607005','','',NULL,NULL,'N','Privado'),
 ('311','LICEO CAMILO CAMPOS','614','2212834','','',NULL,NULL,'N','Privado'),
 ('3121','INSTITUTO NACIONAL DE NUEVA CONCEPCION','416','3357051','','3357051',NULL,NULL,'N','P?blico'),
 ('3138','COMPLEJO EDUCATIVO EBEN EZER CANTON POTRERO SULA','416','','','3542258',NULL,NULL,'N','P?blico'),
 ('3146','INSTITUTO NACIONAL DE SAN RAFAEL','431','','3570135','3570311',NULL,NULL,'N','P?blico'),
 ('3151','INSTITUTO NACIONAL DE EL PARAISO','410','3560074','','',NULL,NULL,'N','P?blico'),
 ('316','INSTITUTO COMERCIAL NOCTURNO CUSCATLECO','614','2210189','','',NULL,NULL,'N','Privado'),
 ('317','CENTRO ESCOLAR ACCION CIVICA MILITAR','614','2227833','','2227833',NULL,NULL,'N','P?blico'),
 ('3185','INSTITUTO NACIONAL DE JUAYUA','307','4522073','','',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('3189','CENTRO ESCOLAR FRAY BARTOLOME DE LAS CASAS','307','','','',NULL,NULL,'N','P?blico'),
 ('319','INSTITUTO TECNICO OBRERO EMPRESARIAL DON BOSCO','614','2934215','','2937735',NULL,NULL,'N','Privado'),
 ('320','LICEO TECNOLOGICO CANADIENSE','614','2223080','2222884','2210189',NULL,NULL,'N','Privado'),
 ('321','COLEGIO EUCARISTICO','614','2224841','','2225421',NULL,NULL,'N','Privado'),
 ('3211','CENTRO ESCOLAR DOCTOR JOSE CIRO BRITO','308','4530235','','4530235',NULL,NULL,'N','P?blico'),
 ('3219','COMPLEJO EDUCATIVO EDUARDO SALAVERRIA','313','4575010','','4575010',NULL,NULL,'N','P?blico'),
 ('324','COLEGIO LA DIVINA PROVIDENCIA','614','2210567','2221935','2221935',NULL,NULL,'N','Privado'),
 ('3249','INSTITUTO NACIONAL DE IZALCO','306','4535405','4536468','4535405',NULL,NULL,'N','P?blico'),
 ('3251','COMPLEJO EDUCATIVO PEDRO F CANTOR','306','4535101','','4535101',NULL,NULL,'N','P?blico'),
 ('326','INSTITUTO TECNICO DE EXALUMNOS SALESIANOS','614','2214911','','2222724',NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('3266','COMPLEJO EDUCATIVO CANTON SAN ISIDRO','306','','4834671','',NULL,NULL,'N','P?blico'),
 ('3282','CENTRO ESCOLAR REPUBLICA DE CHINA','303','4830731','','',NULL,NULL,'N','P?blico'),
 ('3292','INSTITUTO NACIONAL DE SAN JULIAN','312','4520357','','4520357',NULL,NULL,'N','P?blico'),
 ('33','COLEGIO CRISTIANO NUEVO PACTO','614','2814020','2811293','2713705',NULL,NULL,'N','Privado'),
 ('3306','COMPLEJO EDUCATIVO DOCTOR ANDRES BELLO','315','4512935','','4290648',NULL,NULL,'N','Privado'),
 ('3315','COLEGIO GREGORIO SILVESTRE','302','4521065','','',NULL,NULL,'N','Privado'),
 ('3321','COLEGIO PRESBITERO WALTER GUERRA','302','4610375','4610375','4610375',NULL,NULL,'N','Privado'),
 ('3323','INSTITUTO NACIONAL DE ARMENIA','302','4521027','','4521027',NULL,NULL,'N','P?blico'),
 ('3338','COMPLEJO EDUCATIVO MARIA MENDOZA DE BARATTA','305','','','',NULL,NULL,'N','P?blico'),
 ('3347','CENTRO ESCOLAR CANTON SAN LUCAS','304','','','',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('3348','COMPLEJO EDUCATIVO CRISTOBAL IBARRA MEJICANOS','304','','3388292','',NULL,NULL,'N','P?blico'),
 ('3361','CENTRO ESCOLAR REPUBLICA DE HAITI','315','4504634','','',NULL,NULL,'N','P?blico'),
 ('3368','COLEGIO VICENTE ALBERTO MONICO MASFERRER','315','','4503124','',NULL,NULL,'N','Privado'),
 ('3371','LICEO METROPOLITANO','315','4538770','','',NULL,NULL,'N','Privado'),
 ('3372','INSTITUTO NACIONAL GENERAL E INGENIERO JAIME ABDUL GUTIERREZ','315','4513789','','4513789',NULL,NULL,'N','P?blico'),
 ('3373','COLEGIO ADVENTISTA SONSONATECO','315','4511821','','',NULL,NULL,'N','Privado'),
 ('3375','INSTITUTO POLITECNICO SONSONATE','315','4513738','','',NULL,NULL,'N','Privado'),
 ('3377','COLEGIO SALARRUE','315','4517363','','4517363',NULL,NULL,'N','Privado'),
 ('3379','COMPLEJO EDUCATIVO THOMAS JEFFERSON','315','4510842','','4510842',NULL,NULL,'N','P?blico'),
 ('34','COMPLEJO EDUCATIVO CAPITAN GENERAL GERARDO BARRIOS','614','2612508','','',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('3405','CENTRO ESCOLAR CANTON PALO COMBO','315','','','',NULL,NULL,'N','P?blico'),
 ('3407','CENTRO ESCOLAR CANTON MIRAVALLES','315','','','',NULL,NULL,'N','P?blico'),
 ('341','COMPLEJO EDUCATIVO CATOLICO FRAY MARTIN DE PORRES','617','2930189','','2530313',NULL,NULL,'N','Privado'),
 ('3419','CENTRO ESCOLAR CASERIO HACIENDA SANTA CLARA CANTON SANTA EMILIA','315','4017734','','',NULL,NULL,'N','P?blico'),
 ('3421','COLEGIO SAN FRANCISCO DE ASIS','315','4510307','4515333','4515333',NULL,NULL,'N','Privado'),
 ('3423','COMPLEJO EDUCATIVO DOLORES DE BRITO','315','4511207','4511785','4511207',NULL,NULL,'N','P?blico'),
 ('3434','CENTRO ESCOLAR CASERIO LOS VASQUEZ CANTON EL ZARZAL','314','','','',NULL,NULL,'N','P?blico'),
 ('3438','COMPLEJO EDUCATIVO DE SANTO DOMINGO DE GUZMAN','314','4837055','','',NULL,NULL,'N','P?blico'),
 ('3450','INSTITUTO TECNICO DE EDUCACION MULTIPLE CORONEL CIRIACO DE JESUS ALAS','315','4517921','','4517922',NULL,NULL,'N','Privado'),
 ('3473','INSTITUTO NACIONAL DE ACAJUTLA','301','','4523109','4523109',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('3476','COMPLEJO EDUCATIVO INGENIERO RODOLFO ENRIQUE VARELA MANZANO','301','4524330','','',NULL,NULL,'N','P?blico'),
 ('3492','CENTRO ESCOLAR JUAN JOSE CAÑAS','301','','','',NULL,NULL,'N','P?blico'),
 ('3496','COMPLEJO EDUCATIVO HACIENDA METALIO','301','4609011','','',NULL,NULL,'N','P?blico'),
 ('350','COLEGIO BAUTISTA MIES','617','2923088','2917075','2911599',NULL,NULL,'N','Privado'),
 ('3513','LICEO FERNANDO DE MAGALLANES','101','','4100474','',NULL,NULL,'N','Privado'),
 ('3514','COLEGIO MONTE CARMELO','101','4430153','4133536','4133411',NULL,NULL,'N','Privado'),
 ('3515','COMPLEJO EDUCATIVO GENERAL FABIO MORAN','101','4013150','','',NULL,NULL,'N','P?blico'),
 ('3517','COMPLEJO EDUCATIVO DOCTOR ARTURO ROMERO','101','4132419','','',NULL,NULL,'N','P?blico'),
 ('3520','COLEGIO AHUACHAPANECO DE COMERCIO','101','','4431145','4430529',NULL,NULL,'N','Privado'),
 ('3522','COLEGIO LA PROVIDENCIA','101','4431249','4430240','4430381',NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('3523','LICEO CLARIBEL ALEGRIA','101','4431390','','',NULL,NULL,'N','Privado'),
 ('3525','LICEO PROF FLAVIO JIMENEZ','101','4431774','','4431774',NULL,NULL,'N','Privado'),
 ('3537','INSTITUTO NACIONAL ALEJANDRO DE HUMBOLDT','101','4430086','4101039','4101039',NULL,NULL,'N','P?blico'),
 ('3538','CENTRO ESCOLAR ALEJANDRO DE HUMBOLDT','101','4430425','','',NULL,NULL,'N','P?blico'),
 ('3543','COLEGIO VOCACIONAL CENTROAMERICANO','101','4134510','','',NULL,NULL,'N','Privado'),
 ('355','INSTITUTO CULTURAL REVERENDO JOSE GUSTAVO GALDAMEZ','617','2915175','','',NULL,NULL,'N','Privado'),
 ('3550','COLEGIO JOSEFINO','101','4430048','','',NULL,NULL,'N','Privado'),
 ('3556','COLEGIO CRISTIANO PROFESOR JUSTO GONZALEZ CARRASCO','101','4431742','','4431742',NULL,NULL,'N','Privado'),
 ('356','COLEGIO DE ESPAÑA PADRE ARRUPE','617','2924800','2924801','2924802',NULL,NULL,'N','Privado'),
 ('3576','COLEGIO ALBERTO MASFERRER','101','4431844','4430361','4431844',NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('3587','COLEGIO CRISTIANO PROFESOR JUSTO GONZALEZ CARRASCO','103','4441135','','4441669',NULL,NULL,'N','Privado'),
 ('3592','CENTRO ESCOLAR GENERAL FRANCISCO MENENDEZ','103','4441216','','',NULL,NULL,'N','P?blico'),
 ('3606','INSTITUTO NACIONAL CORNELIO AZENON SIERRA','103','4441018','','4441018',NULL,NULL,'N','P?blico'),
 ('361','COLEGIO DON BOSCO','617','2910029','2515000','2923435',NULL,NULL,'N','Privado'),
 ('3626','INSTITUTO NACIONAL DE SAN LORENZO','109','4014008','','',NULL,NULL,'N','P?blico'),
 ('3629','COMPLEJO EDUCATIVO CANTON LAS POZAS','109','','','',NULL,NULL,'N','P?blico'),
 ('3648','COMPLEJO EDUCATIVO ANTONIO J ALFARO','104','4505180','','',NULL,NULL,'N','P?blico'),
 ('3658','INSTITUTO NACIONAL LICENCIADO RENE PORFIRIO OSORIO','111','','4174353','',NULL,NULL,'N','P?blico'),
 ('3681','CENTRO ESCOLAR JOSE MARTI','111','4174240','','4174240',NULL,NULL,'N','P?blico'),
 ('3697','CENTRO ESCOLAR GENERAL FRANCISCO MENENDEZ','102','4330041','','4330041',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('37','CENTRO EDUCATIVO EDUCACION ENINFORMATICA','614','2237210','','2233399',NULL,NULL,'N','Privado'),
 ('3709','COMPLEJO EDUCATIVO PROFESOR PABLO SORIANO URQUILLA','110','4201018','','',NULL,NULL,'N','P?blico'),
 ('3710','INSTITUTO NACIONAL DE JUJUTLA','107','4200868','','',NULL,NULL,'N','P?blico'),
 ('3728','COMPLEJO EDUCATIVO DE GUAYMANGO','106','4200513','','',NULL,NULL,'N','P?blico'),
 ('3751','COMPLEJO EDUCATIVO BARRA DE SANTIAGO','107','4201824','','',NULL,NULL,'N','P?blico'),
 ('3752','CENTRO ESCOLAR CANTON GUAYAPA ABAJO','107','','','',NULL,NULL,'N','P?blico'),
 ('3753','COMPLEJO EDUCATIVO COLONIA NUEVA','107','','','',NULL,NULL,'N','P?blico'),
 ('3755','COLEGIO INTERNACIONAL GUADALUPANO JUAN PABLO SEGUNDO','108','','4370074','4370074',NULL,NULL,'N','Privado'),
 ('376','COLEGIO PENIEL','617','2926521','','2926521',NULL,NULL,'N','Privado'),
 ('3760','INSTITUTO TECNICO DE EDUCACION MULTIPLE AGUSTIN ALVAREZ','108','4370397','','',NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('3765','COMPLEJO EDUCATIVO GARITA PALMERA','108','','4202050','',NULL,NULL,'N','P?blico'),
 ('3768','COMPLEJO EDUCATIVO CANTON CARA SUCIA','108','4370013','','4370013',NULL,NULL,'N','P?blico'),
 ('377','INSTITUTO NACIONAL DE SOYAPANGO','617','','2272155','2272155',NULL,NULL,'N','P?blico'),
 ('3796','CENTRO ESCOLAR GENERAL FRANCISCO MENENDEZ','108','4203045','','',NULL,NULL,'N','P?blico'),
 ('381','COLEGIO SAN ANTONIO','617','2778867','2270283','',NULL,NULL,'N','Privado'),
 ('3812','LICEO DEMOCRATICO SAN LORENZO','201','4413161','','',NULL,NULL,'N','Privado'),
 ('3814','CENTRO ESCOLAR MARCO RENE REVELO','210','','','',NULL,NULL,'N','P?blico'),
 ('3815','COLEGIO MONTESSORI','210','4472205','4413060','',NULL,NULL,'N','Privado'),
 ('3818','COMPLEJO EDUCATIVO PROFESOR JOSE ARNOLDO SERMEÑO','210','4413055','','',NULL,NULL,'N','P?blico'),
 ('3819','COMPLEJO EDUCATIVO CAPITAN GENERAL GERARDO BARRIOS','210','4478367','','4476075',NULL,NULL,'N','P?blico'),
 ('382','CENTRO ESCOLAR REPUBLICA DE COREA','617','2273306','2770722','',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('3837','CENTRO ESCOLAR CANTON LOS APOYOS','210','','','',NULL,NULL,'N','P?blico'),
 ('3840','CENTRO ESCOLAR HACIENDA SAN CAYETANO','210','','','',NULL,NULL,'N','P?blico'),
 ('3841','COMPLEJO EDUCATIVO COLONIA RIO ZARCO','210','4414383','','4414383',NULL,NULL,'N','P?blico'),
 ('3856','CENTRO ESCOLAR FE Y ALEGRIA LA MERCED','210','4416280','','4416280',NULL,NULL,'N','P?blico'),
 ('3862','INSTITUTO NACIONAL NOCTURNO SUBINSPECTOR CARLOS FRANCISCO VASQUEZ GUILLEN','204','','4403011','',NULL,NULL,'N','P?blico'),
 ('3866','CENTRO ESCOLAR ARTURO AMBROGI','210','4474090','','4410476',NULL,NULL,'N','P?blico'),
 ('3871','COLEGIO BAUTISTA','210','4403232','4403943','4404542',NULL,NULL,'N','Privado'),
 ('3873','LICEO SANTANECO','210','4412457','','4412457',NULL,NULL,'N','Privado'),
 ('3876','COLEGIO LA ESPERANZA','210','4412376','4479646','',NULL,NULL,'N','Privado'),
 ('3877','COLEGIO CENTRO CRISTIANO DE LAS ASAMBLEAS DE DIOS','210','4401354','4408314','4404489',NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('3881','INSTITUTO MARIA AUXILIADORA','210','4412381','','4472575',NULL,NULL,'N','Privado'),
 ('3883','CENTRO ESCOLAR INSA','210','4401880','4401182','4901880',NULL,NULL,'N','P?blico'),
 ('390','COLEGIO ALBERT EINSTEIN','617','2272147','','2272147',NULL,NULL,'N','Privado'),
 ('3901','CENTRO ESCOLAR MANUEL MONEDERO','210','4011162','','',NULL,NULL,'N','P?blico'),
 ('3902','COMPLEJO EDUCATIVO REPUBLICA DE GUATEMALA','210','4402527','4402929','4402527',NULL,NULL,'N','P?blico'),
 ('3919','LICEO SAN LUIS','210','4490769','4491814','4490978',NULL,NULL,'N','Privado'),
 ('392','COMPLEJO EDUCATIVO CATOLICO MARIA AUXILIADORA','617','2772123','','2775192',NULL,NULL,'N','P?blico'),
 ('3922','COLEGIO SALESIANO SAN JOSE','210','4408447','4408445','4409180',NULL,NULL,'N','Privado'),
 ('393','LICEO LEONARDO AZCUNAGA','617','2271283','2775160','2270968',NULL,NULL,'N','Privado'),
 ('3941','COMPLEJO EDUCATIVO CATOLICO JUAN VEINTITRES','210','4413405','','4413405',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('3945','COLEGIO DOCTOR ALBERT EINSTEIN CATORCE DE MARZO MIL OCHOCIENTOS SETENTA Y NUEVE','210','4471557','','',NULL,NULL,'N','Privado'),
 ('3947','INSTITUTO DE SEÑORITAS LA MEDALLA MILAGROSA','210','4412402','','',NULL,NULL,'N','Privado'),
 ('3948','COLEGIO MANCHESTER','201','4410041','4471030','',NULL,NULL,'N','Privado'),
 ('3955','LICEO LATINOAMERICANO','210','4405055','8991226','4408326',NULL,NULL,'N','Privado'),
 ('3974','NUEVO LICEO PANAMERICANO','210','4402442','4403301','',NULL,NULL,'N','Privado'),
 ('3979','LICEO CRISTIANO REVERENDO JUAN BUENO','210','','4403520','4403520',NULL,NULL,'N','Privado'),
 ('398','CENTRO ESCOLAR REINO DE DINAMARCA','617','2273658','','',NULL,NULL,'N','P?blico'),
 ('3982','COLEGIO NAZARENO','210','4401586','','4401586',NULL,NULL,'N','Privado'),
 ('3983','COLEGIO SANTA MARIA','210','4401490','','4407353',NULL,NULL,'N','Privado'),
 ('3984','ESCUELA INTERAMERICANA','210','4407213','','',NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('3985','COLEGIO RAUL VILLALTA','210','4405169','','',NULL,NULL,'N','Privado'),
 ('3989','INSTITUTO PARROQUIAL DIVINA PROVIDENCIA','204','4469415','','',NULL,NULL,'N','Privado'),
 ('399','LICEO CRISTIANO REVERENDO JUAN BUENO DE LA COLONIA CORUÑA','617','2770764','','2770764',NULL,NULL,'N','Privado'),
 ('4000','INSTITUTO NACIONAL DE EL CONGO','204','4469425','','4469425',NULL,NULL,'N','P?blico'),
 ('4017','COMPLEJO EDUCATIVO CANTON EL RESBALADERO','202','','','',NULL,NULL,'N','P?blico'),
 ('4018','CENTRO ESCOLAR CATOLICO EL PROGRESO','202','','','',NULL,NULL,'N','P?blico'),
 ('4037','CENTRO ESCOLAR COATEPEQUE','202','4469216','','',NULL,NULL,'N','P?blico'),
 ('405','COLEGIO MAESTRO ANIBAL PONCE','617','2923134','','',NULL,NULL,'N','Privado'),
 ('4054','COLEGIO JUAN BAUTISTA LAMARK','203','4440524','','',NULL,NULL,'N','Privado'),
 ('4065','LICEO EL SALVADOR DE CHALCHUAPA','203','4440306','','',NULL,NULL,'N','Privado'),
 ('4067','COMPLEJO EDUCATIVO CATOLICO MARIA AUXILIADORA','203','4440215','','4440215',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('4068','COLEGIO EVANGELICO CHALCHUAPANECO','203','4082320','','',NULL,NULL,'N','Privado'),
 ('4069','INSTITUTO NACIONAL JORGE ELISEO AZUCENA ORTEGA','203','4440104','','4440104',NULL,NULL,'N','P?blico'),
 ('4083','LICEO TECNICO EN COMERCIO Y ADMINISTRACION JUAN NAPIER','203','4340165','','',NULL,NULL,'N','Privado'),
 ('4084','COLEGIO CRISTIANO PROFESOR JUSTO GONZALEZ CARRASCO','203','4440662','','4440662',NULL,NULL,'N','Privado'),
 ('4086','INSTITUTO CHALCHUAPANECO DOCTOR LUIS PASTEUR','203','4440443','','',NULL,NULL,'N','Privado'),
 ('4111','COMPLEJO EDUCATIVO CANTON EL COCO','203','4489248','','',NULL,NULL,'N','P?blico'),
 ('4118','INSTITUTO TECNICO INDUSTRIAL CHALCHUAPANECO','201','','','',NULL,NULL,'N','Privado'),
 ('4132','INSTITUTO NACIONAL CANDELARIA DE LA FRONTERA','201','4723098','4723483','4723098',NULL,NULL,'N','P?blico'),
 ('4150','COMPLEJO EDUCATIVO SANTIAGO DELA FRONTERA','212','4415618','','',NULL,NULL,'N','P?blico'),
 ('4151','CENTRO ESCOLAR JOSE MARIA SALAZAR ESPAÑA','208','4418627','','',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('4165','CENTRO EDUCATIVO INSTITUTO NACIONAL TEXISTEPEQUE','213','4700219','4700642','4700219',NULL,NULL,'N','P?blico'),
 ('4190','CENTRO ESCOLAR SALVADOR MARTINEZ FIGUEROA','213','4700252','4700601','',NULL,NULL,'N','P?blico'),
 ('4204','CENTRO ESCOLAR MASAHUAT','206','4839032','','',NULL,NULL,'N','P?blico'),
 ('4219','CENTRO ESCOLAR CASERIO LA CONCHAGUA CANTON LAS PIEDRAS','207','4838962','','',NULL,NULL,'N','P?blico'),
 ('422','LICEO AMERICA DE ALAS','619','2764709','','',NULL,NULL,'N','Privado'),
 ('424','COLEGIO NUESTRA SEÑORA DE LA CONCEPCION','619','2760320','','',NULL,NULL,'N','Privado'),
 ('4287','INSTITUTO NACIONAL BENJAMIN ESTRADA VALIENTE','207','4420139','4022154','4420139',NULL,NULL,'N','P?blico'),
 ('4289','CENTRO ESCOLAR RODRIGO J LEIVA','207','4420141','','',NULL,NULL,'N','P?blico'),
 ('430','COLEGIO MIGUEL SERVET','619','2760675','','',NULL,NULL,'N','Privado'),
 ('431','INSTITUTO PARROQUIAL PRESBITERO ESTEBAN ALLIET','619','2762490','','2762490',NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('4323','COMPLEJO EDUCATIVO CIUDAD DE TORONTO','211','','','',NULL,NULL,'N','P?blico'),
 ('4324','CENTRO ESCOLAR DE SANTA ROSA GUACHIPILIN','211','','','',NULL,NULL,'N','P?blico'),
 ('435','INSTITUTO NACIONAL DE CIUDAD DELGADO','619','2866872','','2866872',NULL,NULL,'N','P?blico'),
 ('4358','CENTRO ESCOLAR DE JUCUAPA','1109','6652151','','',NULL,NULL,'N','P?blico'),
 ('4362','INSTITUTO NACIONAL DE JUCUAPA','1110','6652154','','',NULL,NULL,'N','P?blico'),
 ('4374','INSTITUTO NACIONAL DE JUCUARAN','1110','6275004','0','6275015',NULL,NULL,'N','P?blico'),
 ('4412','INSTITUTO NACIONAL DE CONCEPCION BATRES','1104','0','6270222','0',NULL,NULL,'N','P?blico'),
 ('4425','INSTITUTO NACIONAL DE EREGUAYQUIN','1106','6276174','0','0',NULL,NULL,'N','P?blico'),
 ('443','COMPLETO EDUCATIVO DELGADO','619','','2763167','',NULL,NULL,'N','P?blico'),
 ('444','CENTRO ESCOLAR REFUGIO SIFONTES','619','2768111','','',NULL,NULL,'N','P?blico'),
 ('4448','INSTITUTO NACIONAL DE SANTA ELENA','1118','6634007','0','6634007',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('4454','COLEGIO TECNICO MERCANTIL DE ORIENTE','1123','6621277','','6623281',NULL,NULL,'N','Privado'),
 ('4461','INSTITUTO NACIONAL SANTA MARIA','1120','6243570','','6243570',NULL,NULL,'N','P?blico'),
 ('4462','COLEGIO CENTENARIO','1123','6620151','','6620151',NULL,NULL,'N','Privado'),
 ('4467','LICEO BRITANICO','1123','6620675','','',NULL,NULL,'N','Privado'),
 ('4490','COMPLEJO EDUCATIVO CANTON LAS SALINAS','1123','6321210','0','0',NULL,NULL,'N','P?blico'),
 ('4492','CENTRO ESCOLAR DE USULUTAN','1123','6620406','6623683','6620406',NULL,NULL,'N','P?blico'),
 ('4496','CENTRO TECNICO DE CAPACITACION CONTABLE','1123','6244859','','6620650',NULL,NULL,'N','Privado'),
 ('4497','COLEGIO POLITECNICO SALARRUE','1123','6620749','6242429','',NULL,NULL,'N','Privado'),
 ('4522','COLEGIO SAN AGUSTIN','1123','6620877','','',NULL,NULL,'N','Privado'),
 ('4523','COLEGIO REPUBLICA DE ISRAEL','1123','6623967','','',NULL,NULL,'N','Privado'),
 ('4526','COLEGIO CRISTIANO PROFESOR JUSTO GONZALEZ CARRASCO','1123','6621045','','6621045',NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('4538','INSTITUTO NACIONAL DE OZATLAN','1113','6278038','','',NULL,NULL,'N','P?blico'),
 ('4560','INSTITUTO NACIONAL DE PUERTO EL TRIUNFO','1114','6636291','','6636291',NULL,NULL,'N','P?blico'),
 ('4576','INSTITUTO NACIONAL DE JIQUILISCO','1108','6638982','6638327','6638982',NULL,NULL,'N','P?blico'),
 ('4577','CENTRO ESCOLAR REPUBLICA FEDERAL CENTROAMERICANA','1108','6439791','0','',NULL,NULL,'N','P?blico'),
 ('4590','CENTRO ESCOLAR CANTON LOS ESPERANZA','1108','','','',NULL,NULL,'N','P?blico'),
 ('4591','CENTRO ESCOLAR CANTON ISLA DE MENDEZ','1108','','','',NULL,NULL,'N','P?blico'),
 ('4598','INSTITUTO NACIONAL CANTON TIERRA BLANCA','1108','6308253','','',NULL,NULL,'N','P?blico'),
 ('46','COLEGIO BILINGUE FRANCES','614','2620802','','2620802',NULL,NULL,'N','Privado'),
 ('4617','INSTITUTO NACIONAL NUEVA ESPERANZA DEL BAJO LEMPA','1108','','','',NULL,NULL,'N','P?blico'),
 ('4625','INSTITUTO NACIONAL DE SAN AGUSTIN','1115','6281856','','',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('4640','INSTITUTO NACIONAL DE SAN FRANCISCO JAVIER','1119','','6281644','',NULL,NULL,'N','P?blico'),
 ('4663','COMPLEJO EDUCATIVO DE TECAPAN','1122','6282756','','',NULL,NULL,'N','P?blico'),
 ('4672','COLEGIO JUAN PABLO SEGUNDO','1121','6630471','','',NULL,NULL,'N','Privado'),
 ('4680','LICEO CULTURAL SANTIAGUEÑO','1121','6631302','','',NULL,NULL,'N','Privado'),
 ('4682','INSTITUTO NACIONAL DE SANTIAGO DE MARIA','1121','6630173','','6630173',NULL,NULL,'N','P?blico'),
 ('4687','INSTITUTO NACIONAL DE ALEGRIA','1101','6281067','','6281067',NULL,NULL,'N','P?blico'),
 ('47','COLEGIO MILITAR GENERAL TOMAS REGALADO','614','2632992','2632997','2638094',NULL,NULL,'N','Privado'),
 ('4713','INSTITUTO NACIONAL DE BERLIN','1102','6632259','','6632259',NULL,NULL,'N','P?blico'),
 ('4714','CENTRO ESCOLAR CATOLICO EL ESPIRITU SANTO','1102','','6632273','6632326',NULL,NULL,'N','P?blico'),
 ('4745','INSTITUTO NACIONAL DE MERCEDES UMAÑA','1111','6295232','','6295232',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('4760','INSTITUTO NACIONAL DE ESTANZUELAS','1107','6274129','0','6274129',NULL,NULL,'N','P?blico'),
 ('4789','INSTITUTO NACIONAL DE NUEVA GRANADA','1112','6282136','','',NULL,NULL,'N','P?blico'),
 ('4817','LICEO CRISTIANO RIOS DE AGUA VIVA','1123','6242875','','',NULL,NULL,'N','Privado'),
 ('4818','INSTITUTO NACIONAL ERNESTO FLORES','1105','','6280241','6280241',NULL,NULL,'N','P?blico'),
 ('4827','INSTITUTO NACIONAL DE CHIRILAGUA','1206','6801263','','6801263',NULL,NULL,'N','P?blico'),
 ('4847','CENTRO ESCOLAR CANTON SAN PEDRO','1206','','','',NULL,NULL,'N','P?blico'),
 ('4860','INSTITUTO NACIONAL EL TRANSITO','1207','6160127','6161021','6160127',NULL,NULL,'N','P?blico'),
 ('4874','INSTITUTO NACIONAL DE SAN JORGE','1215','6102403','6102025','6102025',NULL,NULL,'N','P?blico'),
 ('4884','INSTITUTO NACIONAL JOHN F KENNEDY','1218','','','6194005',NULL,NULL,'N','P?blico'),
 ('49','COLEGIO CARLOS LOPEZ MENDOZA','614','','2641945','2641945',NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('4914','INSTITUTO NACIONAL DE SAN ANTONIO SILVA','1217','6190118','','',NULL,NULL,'N','P?blico'),
 ('4944','INSTITUTO NACIONAL NOCTURNO AGENTE VIVIANO VASQUEZ RAMIREZ','1217','6612033','','',NULL,NULL,'N','P?blico'),
 ('4947','LICEO ALBERTO MASFERRER','1217','6611412','6610846','',NULL,NULL,'N','Privado'),
 ('4948','INSTITUTO REGIONAL DE COMPUTACION Y ADMINISTRACION','1217','','','6618225',NULL,NULL,'N','Privado'),
 ('4950','INSTITUTO GENERAL GERARDO BARRIOS','1217','6611304','','6611304',NULL,NULL,'N','Privado'),
 ('4954','INSTITUTO NACIONAL FRANCISCO GAVIDIA','1217','','6617159','6697159',NULL,NULL,'N','P?blico'),
 ('4955','COLEGIO CRISTIANO CATORCE DE ABRIL','1217','6610504','','6610504',NULL,NULL,'N','Privado'),
 ('4956','COLEGIO SUPERIOR DE COMERCIO','1217','6611915','','6611915',NULL,NULL,'N','Privado'),
 ('4957','LICEO ASOCIACION DE CRISTIANOS ADVENTISTA','1217','6606789','','',NULL,NULL,'N','Privado'),
 ('4959','LICEO BAUTISTA PANAMERICANO','1217','6618397','','',NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('4960','COLEGIO ADVENTISTA','1217','6617260','','',NULL,NULL,'N','Privado'),
 ('4961','COLEGIO CORAZON DE JESUS Y DE MARIA','1217','','','6613675',NULL,NULL,'N','Privado'),
 ('4962','INSTITUTO MIGUELEÑO DE COMERCIO','1217','6611968','6616029','6611968',NULL,NULL,'N','Privado'),
 ('4963','COLEGIO TECNICO CULTURAL','1217','','6610414','6610414',NULL,NULL,'N','Privado'),
 ('4967','COLEGIO TECNOLOGICO CRISTIANO PROFESOR JUSTO GONZALEZ CARRASCO','1217','6614413','6602719','6614415',NULL,NULL,'N','Privado'),
 ('4968','COMPLEJO EDUCATIVO AMINTA DE MONTIEL','1217','6610428','','',NULL,NULL,'N','P?blico'),
 ('4972','COMPLEJO EDUCATIVO OFELIA HERRERA','1217','6614291','','',NULL,NULL,'N','P?blico'),
 ('4975','INSTITUTO CATOLICO SANTA SOFIA','1217','6611051','6611421','6611051',NULL,NULL,'N','Privado'),
 ('4981','COLEGIO POLITECNICO CENTROAMERICANO','1217','6611607','','6614181',NULL,NULL,'N','Privado'),
 ('4983','CENTRO TECNICO DE EX ALUMNOS SALESIANOS PRESBITERO FRANCISCO WAGNER','1217','6614068','6614098','6602028',NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('4985','COLEGIO PROFESORA ALBITA DE RODRIGUEZ','1217','6614205','6602109','',NULL,NULL,'N','Privado'),
 ('4986','INSTITUTO NACIONAL JOAQUIN ERNESTO CARDENAS','1217','6410925','','6610825',NULL,NULL,'N','P?blico'),
 ('50','COLEGIO SAN PABLO','614','2630666','2630755','2630755',NULL,NULL,'N','Privado'),
 ('5005','INSTITUTO CATOLICO DE ORIENTE','1217','6616473','6601724','6600722',NULL,NULL,'N','Privado'),
 ('5007','CENTRO DE FORMACION EN CIENCIAS COMERCIALES','1217','6612397','','6612397',NULL,NULL,'N','Privado'),
 ('5009','CENTRO INTERNACIONAL DE PROGRAMACION DE COMPUTADORAS','1217','6617470','6617471','6617469',NULL,NULL,'N','Privado'),
 ('5010','COLEGIO JOSEFINO NUESTRA SEÑORA DE LA PAZ','1217','6611759','','6611759',NULL,NULL,'N','Privado'),
 ('5015','INSTITUTO NACIONAL ISIDRO MENENDEZ','1217','6601970','','6610640',NULL,NULL,'N','P?blico'),
 ('502','COLEGIO GENESIS','608','','2748166','2746186',NULL,NULL,'N','Privado'),
 ('5027','INSTITUTO NACIONAL METROPOLITANO','1217','6694752','','6694752',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('5033','COMPLEJO EDUCATIVO SOR CECILIA SANTILLANA AHUACTZIN','1217','6600885','','',NULL,NULL,'N','P?blico'),
 ('5045','LICEO ORIENTAL','1217','','','6611163',NULL,NULL,'N','Privado'),
 ('5046','COLEGIO ALBERT EINSTEIN','1217','6610586','6602735','',NULL,NULL,'N','Privado'),
 ('5050','COLEGIO EL DIVINO MAESTRO','1217','6617150','','',NULL,NULL,'N','Privado'),
 ('506','INSTITUTO NACIONAL MAESTRO ALBERTO MASFERRER','608','2321756','2725015','2321756',NULL,NULL,'N','P?blico'),
 ('5060','LICEO FRANCISCO GAVIDIA','1217','6612555','','6611848',NULL,NULL,'N','Privado'),
 ('5070','COLEGIO CRISTIANO JOSUE','1217','6696465','','',NULL,NULL,'N','Privado'),
 ('5071','CENTRO ESCOLAR PROFESOR ABRAHAM MENA','1217','6610614','','6610614',NULL,NULL,'N','P?blico'),
 ('5073','COLEGIO JESUS DE NAZARETH','1217','6610111','','',NULL,NULL,'N','Privado'),
 ('5076','ESCUELA LATINO AMERICANA','1217','6611879','','6613166',NULL,NULL,'N','Privado'),
 ('5080','LICEO SAN MIGUEL','1217','6611434','','6618332',NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('5081','COMPLEJO EDUCATIVO CONFEDERACION SUIZA','1217','6695683','','',NULL,NULL,'N','P?blico'),
 ('5087','INSTITUTO NACIONAL DE ULUAZAPA','1220','','','6191571',NULL,NULL,'N','P?blico'),
 ('5093','COMPLEJO EDUCATIVO DE COMACARAN','1203','6800460','','',NULL,NULL,'N','P?blico'),
 ('5123','INSTITUTO NACIONAL DE CHINAMECA','1205','6650053','','',NULL,NULL,'N','P?blico'),
 ('5128','INSTITUTO NACIONAL FEDERICO GARCIA PRIETO N','1205','','','',NULL,NULL,'N','P?blico'),
 ('5135','INSTITUTO NACIONAL DE NUEVA GUADALUPE','1210','6130014','','',NULL,NULL,'N','P?blico'),
 ('515','COLEGIO ERNESTO HEMINGWAY','608','2820220','','',NULL,NULL,'N','Privado'),
 ('5157','INSTITUTO NACIONAL DE LOLOTIQUE','1208','6809058','','6809058',NULL,NULL,'N','P?blico'),
 ('5181','INSTITUTO NACIONAL DE MONCAGUA','1209','6186069','','6186069',NULL,NULL,'N','P?blico'),
 ('52','COLEGIO MAYA','614','2632381','2632357','2640577',NULL,NULL,'N','Privado'),
 ('5202','INSTITUTO NACIONAL DE CHAPELTIQUE','1204','6182250','','6182250',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('5208','CENTRO ESCOLAR ELISEO HENRIQUEZ','1204','6182345','','',NULL,NULL,'N','P?blico'),
 ('523','COLEGIO CRISTIANO PAN DE VIDA','608','','2720930','',NULL,NULL,'N','Privado'),
 ('5238','INSTITUTO NACIONAL DE SESORI','1219','6820607','','6820607',NULL,NULL,'N','P?blico'),
 ('5254','CENTRO ESCOLAR PROFESORA JUDITH CELINA MONROY DE FUENTES','1202','','','',NULL,NULL,'N','P?blico'),
 ('527','CENTRO ESCOLAR JAPON','608','2820102','2820468','2820102',NULL,NULL,'N','P?blico'),
 ('5270','INSTITUTO NACIONAL DE CIUDAD BARRIOS','1202','','6659138','6659138',NULL,NULL,'N','P?blico'),
 ('5293','INSTITUTO NACIONAL DE CAROLINA','1201','6811988','','',NULL,NULL,'N','P?blico'),
 ('53','LICEO EL SALVADOR DEL MUNDO DIECISEIS DE ENERO DE MIL NOVECIENTOS NOVENTA Y DOS','614','2632474','','',NULL,NULL,'N','Privado'),
 ('5305','INSTITUTO NACIONAL DE SAN LUIS DE LA REINA','1216','6801544','','',NULL,NULL,'N','P?blico'),
 ('5333','COMPLEJO EDUCATIVO DE SAN GERARDO','1214','6800050','','',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('5353','CENTRO ESCOLAR NUEVO EDEN DE SAN JUAN','1211','6800823','','',NULL,NULL,'N','P?blico'),
 ('5371','INSTITUTO NACIONAL DE EL DIVISADERO','1306','','','',NULL,NULL,'N','P?blico'),
 ('538','CENTRO ESCOLAR CATOLICO SAN AGUSTIN','608','','','2821417',NULL,NULL,'N','Privado'),
 ('5397','INSTITUTO NACIONAL PROF JOSE LUIS LOPEZ','1312','4500011','','6500011',NULL,NULL,'N','P?blico'),
 ('54','COLEGIO YOLANDA VILLALTA PEÑA','614','2633539','','',NULL,NULL,'N','Privado'),
 ('5413','COMPLEJO EDUCATIVO PEDRO PABLO CASTILLO','1325','6806079','6806244','',NULL,NULL,'N','P?blico'),
 ('542','COLEGIO JARDIN','608','2820801','','',NULL,NULL,'N','Privado'),
 ('5428','INSTITUTO NACIONAL DE GUATAJIAGUA','1309','','6586118','',NULL,NULL,'N','P?blico'),
 ('5437','LICEO JORGE FRANCISCO REYES MARTINEZ','1319','6542102','','6541658',NULL,NULL,'N','Privado'),
 ('5446','COLEGIO DE EDUCACION INTEGRAL DE SAN FRANCISCO GOTERA','1319','6541041','','6541041',NULL,NULL,'N','Privado'),
 ('5451','INSTITUTO NACIONAL CATORCE DE JULIO DE MIL OCHOCIENTOS SETENTA Y CINCO','1319','6540038','','6540038',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('5462','INSTITUTO NACIONAL DE SOCIEDAD','1323','6804802','6804612','6804802',NULL,NULL,'N','P?blico'),
 ('55','ESCUELA CRISTIANA AMERICANA','614','2633544','2642583','2633544',NULL,NULL,'N','Privado'),
 ('551','COLEGIO GANDHI','603','2720692','','',NULL,NULL,'N','Privado'),
 ('5529','COMPLEJO EDUCATIVO NACIONES UNIDAS','1302','6510078','','',NULL,NULL,'N','P?blico'),
 ('553','CENTRO ESCOLAR GENERAL FRANCISCO MENENDEZ','603','2049635','','2049636',NULL,NULL,'N','P?blico'),
 ('554','INSTITUTO NACIONAL DE AYUTUXTEPEQUE','603','2327503','','2327502',NULL,NULL,'N','P?blico'),
 ('5570','INSTITUTO NACIONAL DE CORINTO','1303','6581237','','',NULL,NULL,'N','P?blico'),
 ('5596','CENTRO ESCOLAR JOSE MATIAS DELGADO','1308','6839005','','',NULL,NULL,'N','P?blico'),
 ('56','COLEGIO ANGEL MARIA PEDROZA','614','2620671','2622406','2621190',NULL,NULL,'N','Privado'),
 ('5610','INSTITUTO NACIONAL DE SAN SIMON','1321','6839204','','6839204',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('5617','CENTRO ESCOLAR GENERAL FRANCISCO MORAZAN','1320','6839441','','',NULL,NULL,'N','P?blico'),
 ('5632','INSTITUTO NACIONAL DE SEGUNDO MONTES','1314','6805560','','',NULL,NULL,'N','P?blico'),
 ('5634','CENTRO ESCOLAR PROFESOR SAMUEL CORDOVA','1319','','','',NULL,NULL,'N','P?blico'),
 ('5655','COMPLEJO EDUCATIVO GENERAL MANUEL JOSE ARCE','1310','','','',NULL,NULL,'N','P?blico'),
 ('5666','INSTITUTO NACIONAL DE PERQUIN','1316','6804178','','',NULL,NULL,'N','P?blico'),
 ('5671','COMPLEJO EDUCATIVO FLORINDA DE JUAREZ ALEMAN','1311','','','',NULL,NULL,'N','P?blico'),
 ('5691','CENTRO ESCOLAR MARCELINO GARCIA FLAMENCO','1324','6839273','','',NULL,NULL,'N','P?blico'),
 ('5701','COMPLEJO EDUCATIVO DE MEANGUERA DEL GOLFO','1410','','','',NULL,NULL,'N','P?blico'),
 ('5719','CENTRO ESCOLAR CANTON EL JAGUEY','1404','6495244','','',NULL,NULL,'N','P?blico'),
 ('5720','COMPLEJO EDUCATIVO DE INTIPUCA','1407','','6494014','',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('575','LICEO CRISTIANO REVERENDO JUAN BUENO DE LA COLONIA LAS MARGARITAS','604','2860974','','2763299',NULL,NULL,'N','Privado'),
 ('5754','CENTRO ESCOLAR CANTON LOMA LARGA','1408','6816326','','',NULL,NULL,'N','P?blico'),
 ('5755','CENTRO ESCOLAR CANTON AGUA CALIENTE','1408','','','',NULL,NULL,'N','P?blico'),
 ('5759','CENTRO ESCOLAR LA UNION','1408','6044197','','6044197',NULL,NULL,'N','P?blico'),
 ('5765','INSTITUTO NACIONAL CANTON AMAPALITA','1408','','','',NULL,NULL,'N','P?blico'),
 ('5769','INSTITUTO TECNOLOGICO DE COMERCIO','1408','6044283','6043784','6044283',NULL,NULL,'N','Privado'),
 ('5788','COMPLEJO EDUCATIVO JOSE PANTOJA HIJO','1408','6040501','','',NULL,NULL,'N','P?blico'),
 ('580','COMPLEJO EDUCATIVO TOMAS CABRERA','604','2764935','','',NULL,NULL,'N','P?blico'),
 ('5802','CENTRO ESCOLAR CANTON EL PICHE','1405','6816003','','',NULL,NULL,'N','P?blico'),
 ('5803','CENTRO ESCOLAR JOHN F KENNEDY','1405','6808742','','',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('5811','INSTITUTO NACIONAL DE EL CARMEN','1405','6807097','6807101','6807097',NULL,NULL,'N','P?blico'),
 ('5831','CENTRO ESCOLAR PROFESOR LUIS ARMANDO ROBLES','1414','6490170','0','0',NULL,NULL,'N','P?blico'),
 ('5889','INSTITUTO NACIONAL DANIEL ARIAS DE PASAQUINA','1412','0','0','6497125',NULL,NULL,'N','P?blico'),
 ('5892','COMPLEJO EDUCATIVO CANTON SANTA CLARA','1412','6499102','0','0',NULL,NULL,'N','P?blico'),
 ('59','ESCUELA PANAMERICANA','614','2630814','2630803','',NULL,NULL,'N','Privado'),
 ('5912','COLEGIO DOCTOR JUAN ALLWOOD PAREDES','1416','6412261','','',NULL,NULL,'N','Privado'),
 ('5915','INSTITUTO COMERCIAL SANTA ROSA','1416','6412179','','6412179',NULL,NULL,'N','Privado'),
 ('5916','INSTITUTO NACIONAL PROFESOR FRANCISCO VENTURA ZELAYA','1416','6412025','','6412025',NULL,NULL,'N','P?blico'),
 ('5956','INSTITUTO NACIONAL ANAMOROS','1401','6470491','','',NULL,NULL,'N','P?blico'),
 ('5960','CENTRO ESCOLAR DE ANAMOROS','1401','6470042','','',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('5971','INSTITUTO NACIONAL DE EL SAUCE','1406','6477006','','6477006',NULL,NULL,'N','P?blico'),
 ('5990','COMPLEJO EDUCATIVO PROFESOR VIDAL UMANZOR','1403','6802703','','',NULL,NULL,'N','P?blico'),
 ('5998','INSTITUTO NACIONAL DE NUEVA ESPARTA','1411','6823078','','6823088',NULL,NULL,'N','P?blico'),
 ('60','COLEGIO SALVADOREÑO INGLES','614','2637516','2645213','2631905',NULL,NULL,'N','Privado'),
 ('6019','COMPLEJO EDUCATIVO DE POLOROS','1413','6824042','','',NULL,NULL,'N','P?blico'),
 ('6032','CENTRO ESCOLAR MIRTALA YANEZ DE JIMENEZ','1411','8886662','','',NULL,NULL,'N','P?blico'),
 ('604','CENTRO ESCOLAR ANGELA DE SOLER','604','2041164','','2041164',NULL,NULL,'N','P?blico'),
 ('6054','COMPLEJO EDUCATIVO DE LISLIQUE','1409','','6823704','0',NULL,NULL,'N','P?blico'),
 ('606','COLEGIO EL SEÑOR ES MI PASTOR','602','2166363','','',NULL,NULL,'N','Privado'),
 ('6070','COMPLEJO EDUCATIVO DE BOLIVAR','1402','6807670','','',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('6076','CENTRO ESCOLAR DE YUCUAIQUIN','1418','6802035','6802330','6802035',NULL,NULL,'N','P?blico'),
 ('6089','COLEGIO CENTRO AMERICA','315','4510674','4518211','4510674',NULL,NULL,'N','Privado'),
 ('61','COLEGIO SAGRADO CORAZON','614','2633170','2633108','2633107',NULL,NULL,'N','Privado'),
 ('611','COLEGIO SANTA CRUZ','602','2165728','','',NULL,NULL,'N','Privado'),
 ('6118','INSTITUTO NACIONAL THOMAS JEFFERSON','315','4510623','','4510636',NULL,NULL,'N','P?blico'),
 ('6126','INSTITUTO DE SEÑORITAS SAN VICENTE DE PAUL','315','4510236','','4502930',NULL,NULL,'N','Privado'),
 ('6146','INSTITUTO NACIONAL SAN JOSE GUAYABAL','709','3765184','3765281','',NULL,NULL,'N','P?blico'),
 ('6148','INSTITUTO NACIONAL CASERIO EL COYOLITO CANTON QUITASOL','433','3093685','','',NULL,NULL,'N','P?blico'),
 ('6150','LICEO HUGO REYNALDO TRUJILLO','416','3067655','','',NULL,NULL,'N','Privado'),
 ('6170','INSTITUTO NACIONAL DE SAN ANTONIO LOS RANCHOS','421','','','',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('6171','INSTITUTO NACIONAL DE SAN MIGUEL DE MERCEDES','430','3096177','','',NULL,NULL,'N','P?blico'),
 ('6199','INSTITUTO NACIONAL SAN RAFAEL CEDROS','711','3780475','','3780521',NULL,NULL,'N','P?blico'),
 ('62','COMPLEJO EDUCATIVO CONCHA VIUDA DE ESCALON','614','2642672','','',NULL,NULL,'N','P?blico'),
 ('6201','CENTRO ESCOLAR GENERAL SALVADOR CASTANEDA CASTRO','203','4440661','','',NULL,NULL,'N','P?blico'),
 ('621','INSTITUTO NOE CANJURA','602','2164008','','',NULL,NULL,'N','Privado'),
 ('6227','COLEGIO DOCTOR MIGUEL ANGEL GALLARDO','511','2297515','','2288870',NULL,NULL,'N','Privado'),
 ('6234','COLEGIO SANTA CECILIA','511','2280462','2280463','2280464',NULL,NULL,'N','Privado'),
 ('6244','ESCUELA CRISTIANA OASIS','210','4412129','4412997','4412129',NULL,NULL,'N','Privado'),
 ('625','COLEGIO NUESTRA SEÑORA DEL PERPETUO SOCORRO','602','2160079','','2160079',NULL,NULL,'N','Privado'),
 ('6254','INSTITUTO CIENTIFICO COMERCIAL METAPANECO','207','4020697','','4420001',NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('627','INSTITUTO NACIONAL DE APOPA','602','2164344','2162772','2164001',NULL,NULL,'N','P?blico'),
 ('6289','ESCUELA CRISTIANA OASIS','501','2830934','2830935','2830954',NULL,NULL,'N','Privado'),
 ('6291','ESCUELA ALEMANA','501','2432279','2434892','2432129',NULL,NULL,'N','Privado'),
 ('6294','COLEGIO AUGUSTO WALTE','501','2436040','2433131','2433256',NULL,NULL,'N','Privado'),
 ('6386','INSTITUTO NACIONAL MONSEÑOR TOMAS MIGUEL PINEDA Y SALDAÑA','815','3302211','3302460','3302211',NULL,NULL,'N','P?blico'),
 ('6393','CENTRO ESCOLAR CATOLICO JUAN XXIII','810','3301005','','3301853',NULL,NULL,'N','P?blico'),
 ('6395','COMPLEJO EDUCATIVO PROFESOR ALBERTO VARELA','811','3305159','3305115','',NULL,NULL,'N','P?blico'),
 ('64','COLEGIO SUIZO SALVADOREÑO','614','2620868','2622053','',NULL,NULL,'N','Privado'),
 ('641','INSTITUTO DE ALTA TECNOLOGIA DAVID BEN GURION','602','2159665','2163723','2159665',NULL,NULL,'N','Privado'),
 ('6411','LICEO RAFAEL MENDOZA','101','4430298','','',NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('6415','LICEO MARTIN LUTHER KING','101','4130390','','',NULL,NULL,'N','Privado'),
 ('6417','LICEO JOSE MILLA','101','4430382','','',NULL,NULL,'N','Privado'),
 ('645','INSTITUTO NACIONAL DE LA COLONIA CIUDAD OBRERA DE APOPA','602','2162111','','2162111',NULL,NULL,'N','P?blico'),
 ('6456','INSTITUTO NACIONAL LUIS REYNALDO TOBAR','101','','4019651','',NULL,NULL,'N','P?blico'),
 ('647','COLEGIO PRESBITERO JOSE OSCAR MARTELL','602','2148678','','',NULL,NULL,'N','Privado'),
 ('649','COMPLEJO EDUCATIVO INGENIERO GUILLERMO BORJA NATHAN','602','2166390','','2166390',NULL,NULL,'N','P?blico'),
 ('6490','CENTRO DE ESTUDIOS ACADEMICO VOCACIONAL CORONEL FRANCISCO LINARES','602','2160119','','',NULL,NULL,'N','Privado'),
 ('653','INSTITUTO PADRE JOSE MARIA VILASECA','602','2165165','','2165165',NULL,NULL,'N','P?blico'),
 ('6566','COLEGIO SAN FRANCISCO','501','2732233','2734036','2734078',NULL,NULL,'N','Privado'),
 ('6578','COLEGIO PROFESOR RICARDO HUMBERTO SOLANO','306','4536648','','',NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('658','LICEO HILDEBRANDO JUAREZ','602','','2160998','',NULL,NULL,'N','Privado'),
 ('6580','CENTRO BILINGUE SAN JOSE CALIFORNIA','315','4502788','','',NULL,NULL,'N','Privado'),
 ('6592','ESCUELA INTERNACIONAL DE COMERCIO Y COMPUTACION PROFESORA LEANDRA ALVAREZ DE AYALA','1217','','6614627','',NULL,NULL,'N','Privado'),
 ('6611','COLEGIO PRESBITERO MARINO BRASPENNING','903','3844577','','',NULL,NULL,'N','Privado'),
 ('662','LICEO MARIANO SAN JUAN BOSCO','602','2160448','','2160448',NULL,NULL,'N','Privado'),
 ('6620','COLEGIO BILINGUE EUROAMERICANO DOS MIL','614','2638533','2638532','2630861',NULL,NULL,'N','Privado'),
 ('6621','COLEGIO LICENCIADO LUIS ALONSO APARICIO OSEGUEDA','606','3240067','3240032','3240180',NULL,NULL,'N','Privado'),
 ('6622','CENTRO ESCOLAR DELFINA DE DIAZ','606','3549982','','',NULL,NULL,'N','P?blico'),
 ('6623','CENTRO EDUCATIVO JOYAS DE CEREN','614','2605019','2606129','2606130',NULL,NULL,'N','Privado'),
 ('6626','LICEO SAN BENITO','614','2244165','2984582','',NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('6693','COLEGIO LUZ DE ISRAEL','614','2791736','2792716','2792715',NULL,NULL,'N','Privado'),
 ('6695','INSTITUTO NACIONAL PROFESOR JAIME FRANCISCO LOPEZ','614','2426129','','2422237',NULL,NULL,'N','P?blico'),
 ('6729','INSTITUTO NACIONAL DE OSICALA','1315','6588179','','6588179',NULL,NULL,'N','P?blico'),
 ('674','COLEGIO CARLOS FENNEY DOS','602','2147566','','',NULL,NULL,'N','Privado'),
 ('6806','COLEGIO CRISTIANO REY SALOMON','617','2975520','2975515','2975515',NULL,NULL,'N','Privado'),
 ('6836','COMPLEJO EDUCATIVO DOCTOR DAVID ESCOBAR GALINDO','606','3240670','','',NULL,NULL,'N','P?blico'),
 ('6842','INSTITUTO TECNICO METROPOLITAN0','614','','2212243','2811007',NULL,NULL,'N','Privado'),
 ('6843','COLEGIO CENTROAMERICA','614','2263021','','2263021',NULL,NULL,'N','Privado'),
 ('6862','INSTITUTO NACIONAL DE AYUTUXTEPEQUE','603','2327503','','2327502',NULL,NULL,'N','P?blico'),
 ('6875','INSTITUTO NACIONAL DE CIUDAD CREDISA','617','2930498','','',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('6880','CENTRO ESCOLAR GENERAL MANUEL JOSE ARCE','614','','','',NULL,NULL,'N','P?blico'),
 ('6889','COLEGIO CRISTIANO SANTA SION','617','2774367','','',NULL,NULL,'N','Privado'),
 ('695','INSTITUTO NACIONAL DE TONACATEPEQUE','618','3220207','','3220207',NULL,NULL,'N','P?blico'),
 ('696','CENTRO ESCOLAR DESARROLLO JUVENIL','618','','','3220231',NULL,NULL,'N','P?blico'),
 ('701','COLEGIO FRANCISCO ESPINOZA','618','2153968','','',NULL,NULL,'N','Privado'),
 ('7188','COLEGIO CARLOS CAÑAS','705','','','',NULL,NULL,'N','Privado'),
 ('7191','COMPLEJO EDUCATIVO CATOLICO EUCARISTICO DE SAN MARTIN (ANTIGUA ESCUELA EUCARISTICA DE SAN MARTIN)','613','258-4675','','258-0342',NULL,NULL,'N','Privado'),
 ('7192','LICEO DIVINO NIÑO JESUS (ASOCIACION HIJAS DEL DIVINO SALVADOR)','1010','','','',NULL,NULL,'N','Privado'),
 ('7193','COMPLEJO EDUCATIVO CANTON VERACRUZ','502',NULL,NULL,NULL,NULL,NULL,'N','P?blico'),
 ('7194','LICEO ESPAÑOL OCCIDENTAL','210','4405161',NULL,NULL,NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('7195','INSTITUTO POLITECNICO EL SALVADOR','210','4412267',NULL,NULL,NULL,NULL,'N','Privado'),
 ('7196','CENTRO ESCOLAR SANTA ANA CALIFORNIA','210',NULL,NULL,NULL,NULL,NULL,'N','Privado'),
 ('7200','LICEO CRISTIANO BETUEL','503','23181982','',NULL,NULL,NULL,'N','Privado'),
 ('7201','CENTRO ESCOLAR JUAN RAMON JIMENEZ ','512','23102967',NULL,NULL,NULL,NULL,'N','Publico'),
 ('7202','CENTRO ESCOLAR  DOCTOR CAMILO AREVALO','307','24837556',NULL,NULL,NULL,NULL,'N','Publico'),
 ('7203','CENTRO ESCOLAR JUAN RAMON JIMENEZ','614','78889675',NULL,NULL,NULL,NULL,'N','Publico'),
 ('7204','INSTITUTO NACIONAL DE EL REFUGIO','112','24484323',NULL,NULL,NULL,NULL,'N','Publico'),
 ('7205','INSTITUTO CATOLICO SAGRADA FAMILIA','113','24441729',NULL,NULL,NULL,NULL,'N','Publico'),
 ('7206','INSTITUTO NACIONAL NOCTURNO NAPOLEON RODRIGUEZ RUIZ','210',NULL,NULL,NULL,NULL,NULL,'N','Publico'),
 ('7207','UNIVERSIDAD CATOLICA DE OCCIDENTE (PLAN EDUCAME)','210',NULL,NULL,NULL,NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('7208','COLEGIO MISION BAUTISTA INTERNACIONAL','602','22148555',NULL,NULL,NULL,NULL,'N','Privado'),
 ('7209','INSTITUTO NACIONAL DE COATEPEQUE','202','24715386',NULL,NULL,NULL,NULL,'N','Publico'),
 ('7210','UNIVERSIDAD DE EL SALVADOR OCCIDENTE','210',NULL,NULL,NULL,NULL,NULL,'N','Publico'),
 ('7211','INSTITUTO NACIONAL A DISTANCIA','215',NULL,NULL,NULL,NULL,NULL,'N','Publico'),
 ('7212','C. D. EL CALVARIO (PLAN EDUCAME)','614',NULL,NULL,NULL,NULL,NULL,'N','Publico'),
 ('7213','COLEGIO BILINGUE LIDIA SALMAN DE VARGAS','210','24477574',NULL,NULL,NULL,NULL,'N','Privado'),
 ('7216','CENTRO ESCOLAR CANTON FLOR AMARILLA ARRIBA','210','24118340',NULL,NULL,NULL,NULL,'N','Publico'),
 ('7217','MOSEÑOR JOSE ADOLFO MOJICA MORALES','202',NULL,NULL,NULL,NULL,NULL,'N','Privado'),
 ('7218','CENTRO ESCOLAR DOCTOR MANUEL PARADA SALGADO','210','78855608',NULL,NULL,NULL,NULL,'N','Publico'),
 ('736','LICEO CULTURAL BENJAMIN FRANKLIN','601','3214144','3214311','',NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('738','INSTITUTO NACIONAL DE AGUILARES','601','3314051','','3314051',NULL,NULL,'N','P?blico'),
 ('739','LICEO PROFESOR JOSE ATILIO MONICO','601','3314613','','',NULL,NULL,'N','Privado'),
 ('741','INSTITUTO ABRAHAM LINCOLN','601','3314866','3314867','',NULL,NULL,'N','Privado'),
 ('7414','CENTRO ESCOLAR FRANCISCO GAVIDIA ','112','24084323',NULL,NULL,NULL,NULL,'N','Publico'),
 ('749','INSTITUTO NACIONAL DE EL PAISNAL','605','3090036','','3090036',NULL,NULL,'N','P?blico'),
 ('75','INSTITUTO NACIONAL GENERAL JESUS MARIA BRAN','614','','2743389','2743389',NULL,NULL,'N','P?blico'),
 ('76','COLEGIO CRISTIANO MIRAMONTE','614','2610406','2601905','2601898',NULL,NULL,'N','Privado'),
 ('760','COMPLEJO EDUCATIVO CANTON EL TULE','605','3093251','','',NULL,NULL,'N','P?blico'),
 ('773','INSTITUTO NACIONAL JUAN PABLO SEGUNDO','609','2010344','','2010344',NULL,NULL,'N','P?blico'),
 ('78','COLEGIO ANGLO AMERICANO','614','2601215','','2608651',NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('79','COLEGIO CEFAS','614','2609370','2604834','2604780',NULL,NULL,'N','Privado'),
 ('80','COLEGIO SANTA MARIA','614','2743584','','2840745',NULL,NULL,'N','Privado'),
 ('81','CENTRO DE ESTUDIOS LA SALLE','614','2604688','2608747','2604688',NULL,NULL,'N','Privado'),
 ('812','COLEGIO LA TRANSFIGURACION','614','2700591','','2700591',NULL,NULL,'N','Privado'),
 ('822','INSTITUTO NACIONAL GENERAL MANUEL JOSE ARCE','614','','2700885','2700884',NULL,NULL,'N','P?blico'),
 ('823','COMPLEJO EDUCATIVO REPUBLICA DEL BRASIL','614','2700820','','',NULL,NULL,'N','P?blico'),
 ('826','LICEO JOHN ROBERT GREGG','614','2701661','','',NULL,NULL,'N','Privado'),
 ('827','COLEGIO PROFESOR CARLOS ALVAREZ PINEDA','614','2805597','2804759','',NULL,NULL,'N','Privado'),
 ('836','LICEO KORAND ADENAVER','614','2701968','','2800047',NULL,NULL,'N','Privado'),
 ('838','COLEGIO EL ESPIRITU SANTO','614','2702015','2702083','2702015',NULL,NULL,'N','Privado'),
 ('84','COLEGIO GARCIA FLAMENCO','614','2600244','2600245','2601231',NULL,NULL,'N','Privado');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('840','COMPLEJO EDUCATIVO DOCTOR HUMBERTO ROMERO ALVERGUE','614','2701523','','2701523',NULL,NULL,'N','P?blico'),
 ('842','COLEGIO BAUTISTA','614','2701333','2703903','2701791',NULL,NULL,'N','Privado'),
 ('859','LICEO EVANGELICO DE SAN SALVADOR','614','2702954','2705945','2706580',NULL,NULL,'N','Privado'),
 ('860','INSTITUTO NACIONAL DE COMERCIO','614','2372165','','2702852',NULL,NULL,'N','P?blico'),
 ('870','COLEGIO SANTA TERESA DE JESUS','612','2200119','2081713','',NULL,NULL,'N','Privado'),
 ('876','COMPLEJO EDUCATIVO CATOLICO NUESTRA SEÑORA DEL ROSARIO','612','2201063','','2206932',NULL,NULL,'N','P?blico'),
 ('879','LICEO ARQUIDIOCESANO NOCTURNO SAN MARCOS','612','','','',NULL,NULL,'N','Privado'),
 ('880','LICEO ARQUIDIOCESANO SAN MARCOS','612','2130427','','',NULL,NULL,'N','Privado'),
 ('885','LICEO CRISTIANO SAULO DE TARSO','612','2201280','2205457','2205457',NULL,NULL,'N','Privado'),
 ('886','INSTITUTO NACIONAL DE SAN MARCOS','612','2206075','2200745','',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('902','INSTITUTO NACIONAL SIMON BOLIVAR','616','2209163','','2209798',NULL,NULL,'N','P?blico'),
 ('905','INSTITUTO NACIONAL DE SANTIAGO TEXACUANGOS','615','2208671','','',NULL,NULL,'N','P?blico'),
 ('917','COLEGIO TECNICO ACADEMICO YAVE','614','2741813','','',NULL,NULL,'N','Privado'),
 ('918','CENTRO ESCOLAR CATOLICO SAN MATEO APOSTOL','615','','','',NULL,NULL,'N','P?blico'),
 ('928','ESCUELA MONTEMIRA','612','2701483','2371775','',NULL,NULL,'N','Privado'),
 ('933','INSTITUTO NACIONAL PROFESORA BERTHA FIDELIA CAÑAS','612','2808731','','2808731',NULL,NULL,'N','P?blico'),
 ('94','INSTITUTO EN COMERCIO Y ADMINISTRACION DEMOCRACIA','614','2255032','','',NULL,NULL,'N','Privado'),
 ('940','COMPLEJO EDUCATIVO CATOLICO SAN ANTONIO','610','2808526','','2805530',NULL,NULL,'N','P?blico'),
 ('95','CENTRO CULTURAL SALVADOREÑO','614','2603911','2603912','2603914',NULL,NULL,'N','Privado'),
 ('962','CENTRO ESCOLAR PROFESOR BERNARDINO VILLAMARIONA','610','2808837','','2808837',NULL,NULL,'N','P?blico');
INSERT INTO `centroestudio` (`codigo`,`nombre`,`codciudad`,`telefono1`,`telefono2`,`fax`,`email`,`web`,`caracter_inst`,`sector`) VALUES 
 ('975','COMPLEJO EDUCATIVO MANUEL JOSE ARCE','611','3990221','','',NULL,NULL,'N','P?blico'),
 ('977','ESCUELA TECNICA DE MECANICA DE AVIACION','607','2500070','','2950279',NULL,NULL,'N','Privado'),
 ('996','CENTRO ESCOLAR FABIO CASTILLO','607','2965387','','2965387',NULL,NULL,'N','P?blico'),
 ('999','INSTITUTO NOCTURNO MIGUEL DE UNAMUNO','607','2950635','','',NULL,NULL,'N','Privado');
/*!40000 ALTER TABLE `centroestudio` ENABLE KEYS */;


--
-- Definition of table `centroscomputo`
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
INSERT INTO `centroscomputo` (`codigo`,`nombre`,`codfacultad`) VALUES 
 ('00001','Centro de computo de biblioteca','00001'),
 ('00002','Centro de computo de ciencias economicas','00001'),
 ('00003','Centro de computo de ingenieria','00001');
/*!40000 ALTER TABLE `centroscomputo` ENABLE KEYS */;


--
-- Definition of table `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
CREATE TABLE `ciudades` (
  `codigo` char(5) NOT NULL default '',
  `nombre` varchar(45) NOT NULL default '',
  `coddepto` char(5) NOT NULL default '',
  PRIMARY KEY  (`codigo`),
  KEY `FK_coddepto` (`coddepto`),
  CONSTRAINT `FK_coddepto` FOREIGN KEY (`coddepto`) REFERENCES `departamentos` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 3072 kB; (`codigo`) REFER `psicologia/departame';

--
-- Dumping data for table `ciudades`
--

/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
INSERT INTO `ciudades` (`codigo`,`nombre`,`coddepto`) VALUES 
 ('1001','Apastepeque','10'),
 ('1002','Guadalupe','10'),
 ('1003','San Cayetano Istepeque','10'),
 ('1004','Santa Clara','10'),
 ('1005','Santo Domingo','10'),
 ('1006','San Esteban Catarina','10'),
 ('1007','San Ildefonso','10'),
 ('1008','San  Lorenzo','10'),
 ('1009','San Sebastian','10'),
 ('101','Ahuachapan','1'),
 ('1010','San Vicente','10'),
 ('1011','Tecoluca','10'),
 ('1012','Tepetitan','10'),
 ('1013','Verapaz','10'),
 ('1014','San Lorenzo','10'),
 ('102','Apaneca','1'),
 ('103','Atiquizaya','1'),
 ('104','Concepcion de Ataco','1'),
 ('106','El Guaymango','1'),
 ('107','Jujutla','1'),
 ('108','San Francisco Menendez','1'),
 ('109','San Lorenzo','1'),
 ('110','San Pedro Puxtla','1'),
 ('1101','Alegria','11'),
 ('1102','Berlin','11'),
 ('1104','Concepcion Batres','11'),
 ('1105','Villa El Triunfo','11'),
 ('1106','Ereguayquin','11'),
 ('1107','Estanzuelas','11'),
 ('1108','Jiquilisco','11'),
 ('1109','Jucuapa','11'),
 ('111','Tacuba','1');
INSERT INTO `ciudades` (`codigo`,`nombre`,`coddepto`) VALUES 
 ('1110','Jucuaran','11'),
 ('1111','Mercedes Umaña','11'),
 ('1112','Nueva Granada','11'),
 ('1113','Ozatlan','11'),
 ('1114','Puerto El Triunfo','11'),
 ('1115','San Agustin','11'),
 ('1118','Santa Elena','11'),
 ('1119','San Francisco Javier','11'),
 ('112','El Refugio','1'),
 ('1120','Santa Maria','11'),
 ('1121','Santiago de Maria','11'),
 ('1122','Tecapan','11'),
 ('1123','Usulutan','11'),
 ('1124','Quelepa','11'),
 ('1125','San Antonio del Mosco','11'),
 ('113','Turin','1'),
 ('1201','Carolina','12'),
 ('1202','Ciudad Barrios','12'),
 ('1203','Comacaran','12'),
 ('1204','Chapeltique','12'),
 ('1205','Chinameca','12'),
 ('1206','Chirilagua','12'),
 ('1207','El Transito','12'),
 ('1208','Lololtique','12'),
 ('1209','Moncagua','12'),
 ('1210','Nueva Guadalupe','12'),
 ('1211','Nuevo Eden de San Juan','12'),
 ('1214','San Gerardo','12'),
 ('1215','San Jorge','12'),
 ('1216','San Luis de La Reina','12'),
 ('1217','San Miguel','12'),
 ('1218','San Rafael Oriente','12');
INSERT INTO `ciudades` (`codigo`,`nombre`,`coddepto`) VALUES 
 ('1219','Sesori','12'),
 ('1220','Uluazapa','12'),
 ('1221','California','12'),
 ('1222','El Triunfo','12'),
 ('1223','San Buenaventura','12'),
 ('1224','San Dionisio','12'),
 ('1302','Cacaopera','13'),
 ('1303','Corinto','13'),
 ('1306','El Divisadero','13'),
 ('1308','Gualococti','13'),
 ('1309','Guatajiagua','13'),
 ('1310','Joateca','13'),
 ('1311','Jocoaitique','13'),
 ('1312','Jocoro','13'),
 ('1314','Meanguera','13'),
 ('1315','Osicala','13'),
 ('1316','Perquin','13'),
 ('1319','San Francisco Gotera','13'),
 ('1320','San Isidro','13'),
 ('1321','San Simon','13'),
 ('1323','Sociedad','13'),
 ('1324','Torola','13'),
 ('1325','Yamabal','13'),
 ('1326','Arambala','13'),
 ('1327','Chilanga','13'),
 ('1328','Delicias de Concepcion','13'),
 ('1329','El Rosario','13'),
 ('1330','Lolotiquillo','13'),
 ('1331','San Carlos','13'),
 ('1332','San Fernando','13'),
 ('1333','Sesembra','13'),
 ('1334','Yoloaquin','13'),
 ('1401','Anamoros','14'),
 ('1402','Bolivar','14');
INSERT INTO `ciudades` (`codigo`,`nombre`,`coddepto`) VALUES 
 ('1403','Concepcion de Oriente','14'),
 ('1404','Conchagua','14'),
 ('1405','El Carmen','14'),
 ('1406','El Sauce','14'),
 ('1407','Intipuca','14'),
 ('1408','La Union','14'),
 ('1409','Lislique','14'),
 ('1410','Meanguera del Golfo','14'),
 ('1411','Nueva Esparta','14'),
 ('1412','Pasaquina','14'),
 ('1413','Poloros','14'),
 ('1414','San Alejo','14'),
 ('1416','Santa Rosa de lIma','14'),
 ('1418','Yucuaiquin','14'),
 ('1419','San Jose Las Fuentes','14'),
 ('1420','Yayantique','14'),
 ('201','Candelaria de la Frontera','2'),
 ('202','Coatepeque','2'),
 ('203','Chalchuapa','2'),
 ('204','El Congo','2'),
 ('206','Masahuat','2'),
 ('207','Metapan','2'),
 ('208','San Antonio Pajonal','2'),
 ('210','Santa Ana','2'),
 ('211','Santa Rosa Guachipilin','2'),
 ('212','Santiago de la Frontera','2'),
 ('213','Texistepeque','2'),
 ('214','El Porvenir','2'),
 ('215','San Sebastian Salitrillo','2'),
 ('301','Acajutla','3'),
 ('302','Armenia','3'),
 ('303','Caluco','3');
INSERT INTO `ciudades` (`codigo`,`nombre`,`coddepto`) VALUES 
 ('304','Cuisnahuat','3'),
 ('305','Santa Isabel Ishuatan','3'),
 ('306','Izalco','3'),
 ('307','Juayua','3'),
 ('308','Nahuizalco','3'),
 ('312','San Julian','3'),
 ('313','Santa Catarina Masahuat','3'),
 ('314','Santo Domingo de Guzman','3'),
 ('315','Sonsonate','3'),
 ('316','Nahuilingo','3'),
 ('317','Salcoatitan','3'),
 ('318','San Antonio del Monte','3'),
 ('319','Sonzacate','3'),
 ('401','Agua Caliente','4'),
 ('402','Arcatao','4'),
 ('403','Azacualpa','4'),
 ('404','Citala','4'),
 ('406','Concepcion Quezaltepeque','4'),
 ('407','Chalatenango','4'),
 ('408','Dulce Nombre de Maria','4'),
 ('410','El Paraiso','4'),
 ('411','La Laguna','4'),
 ('412','La Palma','4'),
 ('413','La Reina','4'),
 ('415','Nombre de Jesus','4'),
 ('416','Nueva Concepcion','4'),
 ('419','Potonico','4'),
 ('421','San Antonio de los Ranchos','4'),
 ('423','San Francisco Lempa','4'),
 ('424','San Francisco Morazan','4'),
 ('425','San Ignacio','4'),
 ('428','San Jose las Flores','4');
INSERT INTO `ciudades` (`codigo`,`nombre`,`coddepto`) VALUES 
 ('430','San Miguel de Mercedes','4'),
 ('431','San Rafael','4'),
 ('432','Santa Rita','4'),
 ('433','Tejutla','4'),
 ('434','Comalapa','4'),
 ('435','El Carrizal','4'),
 ('436','Las Vueltas','4'),
 ('437','Nueva Trinidad','4'),
 ('438','Ojos de Agua','4'),
 ('439','San Antonio de la Cruz','4'),
 ('440','San Fernando','4'),
 ('441','San Isidro Labrador','4'),
 ('442','San Jose Cancasque','4'),
 ('443','San Luis del Carmen','4'),
 ('501','Antiguo Cuscatlan','5'),
 ('502','Ciudad Arce','5'),
 ('503','Colon','5'),
 ('504','Comasagua','5'),
 ('505','Chiltiupan','5'),
 ('506','Huizucar','5'),
 ('507','Jayaque','5'),
 ('509','La Libertad','5'),
 ('511','Nueva San Salvador','5'),
 ('512','Quezaltepeque','5'),
 ('513','Sacacoyo','5'),
 ('514','San Jose Villanueva','5'),
 ('515','San Juan Opico','5'),
 ('516','San Matias','5'),
 ('517','San Pablo Tacachico','5'),
 ('518','Tamanique','5'),
 ('519','Talnique','5'),
 ('520','Teotepeque','5'),
 ('521','Tepecoyo','5');
INSERT INTO `ciudades` (`codigo`,`nombre`,`coddepto`) VALUES 
 ('522','Zaragoza','5'),
 ('523','Jicalapa','5'),
 ('524','Nuevo Cuscatlan','5'),
 ('601','Aguilares','6'),
 ('602','Apopa','6'),
 ('603','Ayutuxtepeque','6'),
 ('604','Cuscatancingo','6'),
 ('605','El Paisnal','6'),
 ('606','Guazapa','6'),
 ('607','Ilopango','6'),
 ('608','Mejicanos','6'),
 ('609','Nejapa','6'),
 ('610','Panchimalco','6'),
 ('611','Rosario de Mora','6'),
 ('612','San Marcos','6'),
 ('613','San Martin','6'),
 ('614','San Salvador','6'),
 ('615','Santiago Texacuangos','6'),
 ('616','Santo Tomas','6'),
 ('617','Soyapango','6'),
 ('618','Tonacatepeque','6'),
 ('619','Ciudad Delgado','6'),
 ('702','Cojutepeque','7'),
 ('703','El Carmen','7'),
 ('705','Monte San Juan','7'),
 ('706','Oratorio de Concepcion','7'),
 ('707','San Bartolome perulapia','7'),
 ('708','San Cristobal','7'),
 ('709','San Jose Guayabal','7'),
 ('710','San Pedro Perulapan','7'),
 ('711','San Rafael Cedros','7'),
 ('712','San Ramon','7'),
 ('713','Santa Cruz Analquito','7'),
 ('715','Suchitoto','7');
INSERT INTO `ciudades` (`codigo`,`nombre`,`coddepto`) VALUES 
 ('716','Tenancingo','7'),
 ('717','Candelaria','7'),
 ('718','El Rosario','7'),
 ('719','Santa Cruz Michapa','7'),
 ('801','Cuyultitan','8'),
 ('802','El Rosario','8'),
 ('803','Jerusalen','8'),
 ('805','Olocuilta','8'),
 ('806','Paraiso de Osorio','8'),
 ('807','San Antonio Masahuat','8'),
 ('808','San Emigdio','8'),
 ('809','San Francisco Chinameca','8'),
 ('810','San Juan Nonualco','8'),
 ('811','San Juan Talpa','8'),
 ('812','San Juan Tepezontes','8'),
 ('813','San Luis Talpa','8'),
 ('815','San Pedro Masahuat','8'),
 ('816','San Pedro Nonualco','8'),
 ('817','San Rafael Obrajuelo','8'),
 ('818','Santa Maria Ostuma','8'),
 ('819','Santiago Nonualco','8'),
 ('820','Tapalhuaca','8'),
 ('821','Zacatecoluca','8'),
 ('822','San Luis La Herradura','8'),
 ('823','San Juan Opico','8'),
 ('824','San Miguel Tepezontes','8'),
 ('903','Ilobasco','9'),
 ('904','Jutiapa','9'),
 ('905','San Isidro','9'),
 ('906','Sensuntepeque','9'),
 ('907','Tejutepeque','9');
INSERT INTO `ciudades` (`codigo`,`nombre`,`coddepto`) VALUES 
 ('908','Villa Victoria','9'),
 ('909','Villa Dolores','9'),
 ('910','Cinquera','9'),
 ('911','Guacotecti','9');
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;


--
-- Definition of table `departamentos`
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
INSERT INTO `departamentos` (`codigo`,`nombre`) VALUES 
 ('1','Ahuachapan'),
 ('10','San Vicente'),
 ('11','Usulutan'),
 ('12','San Miguel'),
 ('13','Morazan'),
 ('14','La Union'),
 ('2','Santa Ana'),
 ('3','Sonsonate'),
 ('4','Chalatenango'),
 ('5','La Libertad'),
 ('6','San Salvador'),
 ('7','Cuscatlan'),
 ('8','La Paz'),
 ('9','Cabañas');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;


--
-- Definition of table `facultades`
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
INSERT INTO `facultades` (`codigo`,`nombre`) VALUES 
 ('00001','Facultad Multidisciplinaria de Occidente'),
 ('00002','Facultad Multidisciplinaria de Oriente'),
 ('00003','Facultad Multidisciplinaria Paracentral'),
 ('00004','Facultad de Ciencias y Humanidades(Unidad Central)');
/*!40000 ALTER TABLE `facultades` ENABLE KEYS */;


--
-- Definition of table `grupos`
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
INSERT INTO `grupos` (`codgrupo`,`tamanio`,`examinador`,`fecharealizacion`,`horarealizacion`,`minutorealizacion`,`centrocomputo`) VALUES 
 ('GrpNone',10,'examinador','2006-01-01 01:01:01',0,0,'00001'),
 ('GrpTemp',10,'Alguien Mas','2001-01-01 04:05:03',6,0,'00001');
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;


--
-- Definition of table `pruebaceps`
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
INSERT INTO `pruebaceps` (`codprueba`,`codaspirante`,`fecharealizacion`) VALUES 
 ('0000001','GJ00002','0001-01-01 00:00:00'),
 ('0000002','LD00001','0001-01-01 00:00:00'),
 ('0000003','VG00001','0001-01-01 00:00:00'),
 ('0000004','FO00001','0001-01-01 00:00:00'),
 ('0000005','PO00001','0001-01-01 00:00:00'),
 ('0000006','SA00001','0001-01-01 00:00:00'),
 ('0000007','BN00001','0001-01-01 00:00:00'),
 ('0000008','GS00001','0001-01-01 00:00:00'),
 ('0000009','ZT00001','0001-01-01 00:00:00'),
 ('0000010','MS00001','0001-01-01 00:00:00'),
 ('0000011','MG00001','0001-01-01 00:00:00'),
 ('0000012','BC00001','0001-01-01 00:00:00'),
 ('0000013','RJ00001','0001-01-01 00:00:00'),
 ('0000014','SS00001','0001-01-01 00:00:00'),
 ('0000015','AB00001','0001-01-01 00:00:00'),
 ('0000016','RI00001','0001-01-01 00:00:00'),
 ('0000017','DA00001','0001-01-01 00:00:00'),
 ('0000018','GI00001','0001-01-01 00:00:00'),
 ('0000019','AJ00001','0001-01-01 00:00:00'),
 ('0000020','CN00001','0001-01-01 00:00:00'),
 ('0000021','NM00001','0001-01-01 00:00:00');
INSERT INTO `pruebaceps` (`codprueba`,`codaspirante`,`fecharealizacion`) VALUES 
 ('0000022','MM00001','0001-01-01 00:00:00'),
 ('0000023','AJ00002','0001-01-01 00:00:00'),
 ('0000024','UL00001','0001-01-01 00:00:00'),
 ('0000025','RK00001','0001-01-01 00:00:00'),
 ('0000026','EK00001','0001-01-01 00:00:00'),
 ('0000027','SM00001','0001-01-01 00:00:00'),
 ('0000028','CC00002','0001-01-01 00:00:00'),
 ('0000029','CM00001','0001-01-01 00:00:00'),
 ('0000030','LY00001','0001-01-01 00:00:00'),
 ('0000031','RJ00002','0001-01-01 00:00:00'),
 ('0000032','AN00001','0001-01-01 00:00:00'),
 ('0000033','CM00002','0001-01-01 00:00:00'),
 ('0000034','AV00001','0001-01-01 00:00:00'),
 ('0000035','PD00001','0001-01-01 00:00:00'),
 ('0000036','CY00001','0001-01-01 00:00:00'),
 ('0000037','MS00002','0001-01-01 00:00:00'),
 ('0000038','VC00001','0001-01-01 00:00:00'),
 ('0000039','PY00001','0001-01-01 00:00:00'),
 ('0000040','AZ00001','0001-01-01 00:00:00'),
 ('0000041','LW00001','0001-01-01 00:00:00'),
 ('0000042','CD00001','0001-01-01 00:00:00');
INSERT INTO `pruebaceps` (`codprueba`,`codaspirante`,`fecharealizacion`) VALUES 
 ('0000043','MJ00003','0001-01-01 00:00:00'),
 ('0000044','RJ00003','0001-01-01 00:00:00'),
 ('0000045','MJ00002','0001-01-01 00:00:00'),
 ('0000046','CE00001','0001-01-01 00:00:00'),
 ('0000047','MM00002','0001-01-01 00:00:00'),
 ('0000048','SR00001','0001-01-01 00:00:00'),
 ('0000049','PI00001','0001-01-01 00:00:00'),
 ('0000050','MJ00001','0001-01-01 00:00:00'),
 ('0000051','LN00001','0001-01-01 00:00:00'),
 ('0000052','HD00001','0001-01-01 00:00:00'),
 ('0000053','FJ00001','0001-01-01 00:00:00'),
 ('0000054','CO00001','0001-01-01 00:00:00'),
 ('0000055','PF00001','0001-01-01 00:00:00'),
 ('0000056','RN00001','0001-01-01 00:00:00'),
 ('0000057','MK00001','0001-01-01 00:00:00'),
 ('0000058','RF00001','0001-01-01 00:00:00'),
 ('0000059','HH00001','0001-01-01 00:00:00'),
 ('0000060','ME00001','0001-01-01 00:00:00'),
 ('0000061','RJ00004','0001-01-01 00:00:00'),
 ('0000062','CM00003','0001-01-01 00:00:00'),
 ('0000063','AK00001','0001-01-01 00:00:00');
INSERT INTO `pruebaceps` (`codprueba`,`codaspirante`,`fecharealizacion`) VALUES 
 ('0000064','FA00001','0001-01-01 00:00:00'),
 ('0000065','MM00004','0001-01-01 00:00:00'),
 ('0000066','SK00001','0001-01-01 00:00:00'),
 ('0000067','CW00001','0001-01-01 00:00:00'),
 ('0000068','VK00001','0001-01-01 00:00:00'),
 ('0000069','FJ00002','0001-01-01 00:00:00'),
 ('0000071','CJ00001','0001-01-01 00:00:00'),
 ('0000072','CE00002','0001-01-01 00:00:00'),
 ('0000073','FH00001','0001-01-01 00:00:00'),
 ('0000074','CH00001','0001-01-01 00:00:00'),
 ('0000075','RO00001','0001-01-01 00:00:00'),
 ('0000076','BA00001','0001-01-01 00:00:00'),
 ('0000077','MA00001','0001-01-01 00:00:00'),
 ('0000078','MM00003','0001-01-01 00:00:00'),
 ('0000079','VR00001','0001-01-01 00:00:00'),
 ('0000080','MA00002','0001-01-01 00:00:00'),
 ('0000081','VS00001','0001-01-01 00:00:00'),
 ('0000082','VA00001','0001-01-01 00:00:00'),
 ('0000083','MM00005','0001-01-01 00:00:00'),
 ('0000085','PA00001','0001-01-01 00:00:00'),
 ('0000086','CL00002','0001-01-01 00:00:00');
INSERT INTO `pruebaceps` (`codprueba`,`codaspirante`,`fecharealizacion`) VALUES 
 ('0000087','ME00003','0001-01-01 00:00:00'),
 ('0000088','CS00001','0001-01-01 00:00:00'),
 ('0000090','DW00001','0001-01-01 00:00:00'),
 ('0000091','MM00007','0001-01-01 00:00:00'),
 ('0000092','VA00002','0001-01-01 00:00:00'),
 ('0000093','AA00002','0001-01-01 00:00:00'),
 ('0000094','BR00001','0001-01-01 00:00:00'),
 ('0000095','DJ00001','0001-01-01 00:00:00'),
 ('0000096','RM00001','0001-01-01 00:00:00'),
 ('0000097','AL00001','0001-01-01 00:00:00'),
 ('0000098','OI00001','0001-01-01 00:00:00'),
 ('0000099','SL00001','0001-01-01 00:00:00'),
 ('0000100','PZ00001','0001-01-01 00:00:00'),
 ('0000101','PE00001','0001-01-01 00:00:00'),
 ('0000102','HH00002','0001-01-01 00:00:00'),
 ('0000103','RJ00006','0001-01-01 00:00:00'),
 ('0000104','RS00001','0001-01-01 00:00:00'),
 ('0000105','BN00002','0001-01-01 00:00:00'),
 ('0000106','GK00001','0001-01-01 00:00:00'),
 ('0000107','MA00003','0001-01-01 00:00:00'),
 ('0000108','LK00001','0001-01-01 00:00:00');
INSERT INTO `pruebaceps` (`codprueba`,`codaspirante`,`fecharealizacion`) VALUES 
 ('0000109','TE00001','0001-01-01 00:00:00'),
 ('0000110','VG00003','0001-01-01 00:00:00'),
 ('0000111','MR00001','0001-01-01 00:00:00'),
 ('0000112','BA00002','0001-01-01 00:00:00'),
 ('0000113','MW00001','0001-01-01 00:00:00'),
 ('0000114','AM00001','0001-01-01 00:00:00'),
 ('0000115','MM00006','0001-01-01 00:00:00'),
 ('0000116','LM00001','0001-01-01 00:00:00'),
 ('0000117','ZN00001','0001-01-01 00:00:00'),
 ('0000118','MS00003','0001-01-01 00:00:00'),
 ('0000119','RK00002','0001-01-01 00:00:00'),
 ('0000120','CD00002','0001-01-01 00:00:00'),
 ('0000121','VG00002','0001-01-01 00:00:00'),
 ('0000122','JA00001','0001-01-01 00:00:00'),
 ('0000123','RJ00005','0001-01-01 00:00:00'),
 ('0000124','ME00002','0001-01-01 00:00:00'),
 ('0000125','AA00001','0001-01-01 00:00:00'),
 ('0000126','PG00001','0001-01-01 00:00:00'),
 ('0000127','MG00002','0001-01-01 00:00:00'),
 ('0000128','MD00001','0001-01-01 00:00:00'),
 ('0000129','PE00002','0001-01-01 00:00:00');
INSERT INTO `pruebaceps` (`codprueba`,`codaspirante`,`fecharealizacion`) VALUES 
 ('0000130','LD00002','0001-01-01 00:00:00'),
 ('0000131','AM00002','0001-01-01 00:00:00'),
 ('0000132','CI00001','0001-01-01 00:00:00'),
 ('0000133','SL00002','0001-01-01 00:00:00'),
 ('0000134','FC00001','0001-01-01 00:00:00'),
 ('0000135','CK00001','0001-01-01 00:00:00'),
 ('0000136','LR00001','0001-01-01 00:00:00'),
 ('0000137','GE00001','0001-01-01 00:00:00'),
 ('0000138','CS00003','0001-01-01 00:00:00'),
 ('0000139','OY00001','0001-01-01 00:00:00'),
 ('0000140','AL00002','0001-01-01 00:00:00'),
 ('0000141','GA00001','0001-01-01 00:00:00'),
 ('0000142','LJ00001','0001-01-01 00:00:00'),
 ('0000143','CR00001','0001-01-01 00:00:00'),
 ('0000144','BB00001','0001-01-01 00:00:00'),
 ('0000145','OS00001','0001-01-01 00:00:00'),
 ('0000146','TG00001','0001-01-01 00:00:00'),
 ('0000147','PY00002','0001-01-01 00:00:00'),
 ('0000148','ZS00001','0001-01-01 00:00:00'),
 ('0000149','GJ00003','0001-01-01 00:00:00'),
 ('0000150','ZC00001','0001-01-01 00:00:00');
INSERT INTO `pruebaceps` (`codprueba`,`codaspirante`,`fecharealizacion`) VALUES 
 ('0000151','GT00001','0001-01-01 00:00:00'),
 ('0000152','GE00002','0001-01-01 00:00:00'),
 ('0000153','MI00001','0001-01-01 00:00:00'),
 ('0000154','OS00002','0001-01-01 00:00:00'),
 ('0000155','CE00003','0001-01-01 00:00:00'),
 ('0000156','CS00004','0001-01-01 00:00:00'),
 ('0000157','GH00001','0001-01-01 00:00:00'),
 ('0000158','LS00001','0001-01-01 00:00:00'),
 ('0000159','MB00001','0001-01-01 00:00:00'),
 ('0000160','GM00001','0001-01-01 00:00:00'),
 ('0000162','CC00003','0001-01-01 00:00:00'),
 ('0000163','GS00002','0001-01-01 00:00:00'),
 ('0000164','CS00002','0001-01-01 00:00:00'),
 ('0000165','SC00001','0001-01-01 00:00:00'),
 ('0000166','CM00004','0001-01-01 00:00:00'),
 ('0000167','BJ00001','0001-01-01 00:00:00'),
 ('0000168','MC00001','0001-01-01 00:00:00'),
 ('0000169','BG00001','0001-01-01 00:00:00'),
 ('0000170','OD00001','0001-01-01 00:00:00'),
 ('0000171','MR00002','0001-01-01 00:00:00'),
 ('0000172','MJ00004','0001-01-01 00:00:00');
INSERT INTO `pruebaceps` (`codprueba`,`codaspirante`,`fecharealizacion`) VALUES 
 ('0000173','LI00001','0001-01-01 00:00:00'),
 ('0000174','RA00001','0001-01-01 00:00:00'),
 ('0000175','TO00001','0001-01-01 00:00:00'),
 ('0000176','VM00001','0001-01-01 00:00:00'),
 ('0000177','MG00003','0001-01-01 00:00:00'),
 ('0000178','GE00003','0001-01-01 00:00:00'),
 ('0000179','GY00001','0001-01-01 00:00:00'),
 ('0000180','SH00001','0001-01-01 00:00:00'),
 ('0000181','RN00002','0001-01-01 00:00:00'),
 ('0000182','JJ00001','0001-01-01 00:00:00'),
 ('0000183','DI00001','0001-01-01 00:00:00'),
 ('0000184','DG00001','0001-01-01 00:00:00'),
 ('0000185','CA00001','0001-01-01 00:00:00'),
 ('0000186','CM00005','0001-01-01 00:00:00'),
 ('0000187','RJ00007','0001-01-01 00:00:00'),
 ('0000188','AM00003','0001-01-01 00:00:00'),
 ('0000189','DM00001','0001-01-01 00:00:00'),
 ('0000190','BE00001','0001-01-01 00:00:00'),
 ('0000191','MD00002','0001-01-01 00:00:00'),
 ('0000192','GN00001','0001-01-01 00:00:00'),
 ('0000193','GD00001','0001-01-01 00:00:00');
INSERT INTO `pruebaceps` (`codprueba`,`codaspirante`,`fecharealizacion`) VALUES 
 ('0000194','VN00001','0001-01-01 00:00:00'),
 ('0000195','OR00001','0001-01-01 00:00:00'),
 ('0000196','OE00001','0001-01-01 00:00:00'),
 ('0000197','SM00002','0001-01-01 00:00:00'),
 ('0000199','GR00001','0001-01-01 00:00:00'),
 ('0000200','GR00002','0001-01-01 00:00:00'),
 ('0000201','FN00001','0001-01-01 00:00:00'),
 ('0000202','ED00001','0001-01-01 00:00:00'),
 ('0000203','LJ00002','0001-01-01 00:00:00'),
 ('0000204','MC00002','0001-01-01 00:00:00'),
 ('0000205','MY00001','0001-01-01 00:00:00'),
 ('0000206','ML00001','0001-01-01 00:00:00'),
 ('0000207','SC00002','0001-01-01 00:00:00'),
 ('0000208','GD00002','0001-01-01 00:00:00'),
 ('0000209','FE00001','0001-01-01 00:00:00'),
 ('0000210','PE00003','0001-01-01 00:00:00'),
 ('0000211','HC00001','0001-01-01 00:00:00'),
 ('0000212','HR00001','0001-01-01 00:00:00'),
 ('0000213','MW00002','0001-01-01 00:00:00'),
 ('0000214','TR00001','0001-01-01 00:00:00'),
 ('0000215','FY00001','0001-01-01 00:00:00');
INSERT INTO `pruebaceps` (`codprueba`,`codaspirante`,`fecharealizacion`) VALUES 
 ('0000216','VG00004','0001-01-01 00:00:00'),
 ('0000217','VM00002','0001-01-01 00:00:00'),
 ('0000218','GG00001','0001-01-01 00:00:00'),
 ('0000219','FF00001','0001-01-01 00:00:00'),
 ('0000220','CY00002','0001-01-01 00:00:00'),
 ('0000221','AN00002','0001-01-01 00:00:00'),
 ('0000222','AH00001','0001-01-01 00:00:00'),
 ('0000223','GJ00004','0001-01-01 00:00:00'),
 ('0000224','RM00002','0001-01-01 00:00:00'),
 ('0000225','LE00001','0001-01-01 00:00:00'),
 ('0000226','RS00002','0001-01-01 00:00:00'),
 ('0000227','VN00002','0001-01-01 00:00:00'),
 ('0000228','MO00001','0001-01-01 00:00:00'),
 ('0000229','RL00001','0001-01-01 00:00:00'),
 ('0000230','VR00002','0001-01-01 00:00:00'),
 ('0000231','JX00001','0001-01-01 00:00:00'),
 ('0000232','CC00001','0001-01-01 00:00:00'),
 ('0000233','QC00001','0001-01-01 00:00:00'),
 ('0000234','GJ00001','0001-01-01 00:00:00'),
 ('0000235','FR00001','0001-01-01 00:00:00'),
 ('0000236','MR00003','0001-01-01 00:00:00');
INSERT INTO `pruebaceps` (`codprueba`,`codaspirante`,`fecharealizacion`) VALUES 
 ('0000237','TF00001','0001-01-01 00:00:00');
/*!40000 ALTER TABLE `pruebaceps` ENABLE KEYS */;


--
-- Definition of table `pruebaraven`
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
INSERT INTO `pruebaraven` (`codprueba`,`codaspirante`,`fecharealizacion`) VALUES 
 ('0000007','BN00001','0001-01-01 00:00:00'),
 ('0000008','SA00001','0001-01-01 00:00:00'),
 ('0000009','PO00001','0001-01-01 00:00:00'),
 ('0000010','FO00001','0001-01-01 00:00:00'),
 ('0000011','VG00001','0001-01-01 00:00:00'),
 ('0000012','MS00001','0001-01-01 00:00:00'),
 ('0000013','GS00001','0001-01-01 00:00:00'),
 ('0000014','ZT00001','0001-01-01 00:00:00'),
 ('0000015','GJ00002','0001-01-01 00:00:00'),
 ('0000016','MG00001','0001-01-01 00:00:00'),
 ('0000017','LD00001','0001-01-01 00:00:00'),
 ('0000018','BC00001','0001-01-01 00:00:00'),
 ('0000019','RJ00001','0001-01-01 00:00:00'),
 ('0000020','SS00001','0001-01-01 00:00:00'),
 ('0000021','AB00001','0001-01-01 00:00:00'),
 ('0000022','RI00001','0001-01-01 00:00:00'),
 ('0000023','DA00001','0001-01-01 00:00:00'),
 ('0000024','GI00001','0001-01-01 00:00:00'),
 ('0000025','AJ00001','0001-01-01 00:00:00'),
 ('0000026','CN00001','0001-01-01 00:00:00'),
 ('0000027','NM00001','0001-01-01 00:00:00');
INSERT INTO `pruebaraven` (`codprueba`,`codaspirante`,`fecharealizacion`) VALUES 
 ('0000028','MM00001','0001-01-01 00:00:00'),
 ('0000029','AJ00002','0001-01-01 00:00:00'),
 ('0000030','UL00001','0001-01-01 00:00:00'),
 ('0000031','RK00001','0001-01-01 00:00:00'),
 ('0000032','EK00001','0001-01-01 00:00:00'),
 ('0000033','SM00001','0001-01-01 00:00:00'),
 ('0000034','CC00002','0001-01-01 00:00:00'),
 ('0000035','CM00001','0001-01-01 00:00:00'),
 ('0000036','LY00001','0001-01-01 00:00:00'),
 ('0000037','RJ00002','0001-01-01 00:00:00'),
 ('0000038','AN00001','0001-01-01 00:00:00'),
 ('0000039','CM00002','0001-01-01 00:00:00'),
 ('0000040','AV00001','0001-01-01 00:00:00'),
 ('0000041','PD00001','0001-01-01 00:00:00'),
 ('0000042','CY00001','0001-01-01 00:00:00'),
 ('0000043','MS00002','0001-01-01 00:00:00'),
 ('0000044','VC00001','0001-01-01 00:00:00'),
 ('0000045','PY00001','0001-01-01 00:00:00'),
 ('0000046','AZ00001','0001-01-01 00:00:00'),
 ('0000047','LW00001','0001-01-01 00:00:00'),
 ('0000048','CD00001','0001-01-01 00:00:00');
INSERT INTO `pruebaraven` (`codprueba`,`codaspirante`,`fecharealizacion`) VALUES 
 ('0000049','MJ00003','0001-01-01 00:00:00'),
 ('0000050','RJ00003','0001-01-01 00:00:00'),
 ('0000051','MJ00002','0001-01-01 00:00:00'),
 ('0000052','CE00001','0001-01-01 00:00:00'),
 ('0000053','MM00002','0001-01-01 00:00:00'),
 ('0000054','SR00001','0001-01-01 00:00:00'),
 ('0000055','PI00001','0001-01-01 00:00:00'),
 ('0000056','MJ00001','0001-01-01 00:00:00'),
 ('0000057','LN00001','0001-01-01 00:00:00'),
 ('0000058','HD00001','0001-01-01 00:00:00'),
 ('0000059','FJ00001','0001-01-01 00:00:00'),
 ('0000060','CO00001','0001-01-01 00:00:00'),
 ('0000061','PF00001','0001-01-01 00:00:00'),
 ('0000062','RN00001','0001-01-01 00:00:00'),
 ('0000063','MK00001','0001-01-01 00:00:00'),
 ('0000064','RF00001','0001-01-01 00:00:00'),
 ('0000065','HH00001','0001-01-01 00:00:00'),
 ('0000066','ME00001','0001-01-01 00:00:00'),
 ('0000067','RJ00004','0001-01-01 00:00:00'),
 ('0000068','CM00003','0001-01-01 00:00:00'),
 ('0000069','AK00001','0001-01-01 00:00:00');
INSERT INTO `pruebaraven` (`codprueba`,`codaspirante`,`fecharealizacion`) VALUES 
 ('0000070','FA00001','0001-01-01 00:00:00'),
 ('0000071','MM00004','0001-01-01 00:00:00'),
 ('0000072','SK00001','0001-01-01 00:00:00'),
 ('0000073','CW00001','0001-01-01 00:00:00'),
 ('0000074','VK00001','0001-01-01 00:00:00'),
 ('0000075','FJ00002','0001-01-01 00:00:00'),
 ('0000076','CJ00001','0001-01-01 00:00:00'),
 ('0000077','CE00002','0001-01-01 00:00:00'),
 ('0000078','FH00001','0001-01-01 00:00:00'),
 ('0000079','CH00001','0001-01-01 00:00:00'),
 ('0000080','RO00001','0001-01-01 00:00:00'),
 ('0000081','BA00001','0001-01-01 00:00:00'),
 ('0000082','MA00001','0001-01-01 00:00:00'),
 ('0000083','MM00003','0001-01-01 00:00:00'),
 ('0000084','VR00001','0001-01-01 00:00:00'),
 ('0000085','MA00002','0001-01-01 00:00:00'),
 ('0000086','VS00001','0001-01-01 00:00:00'),
 ('0000087','VA00001','0001-01-01 00:00:00'),
 ('0000088','MM00005','0001-01-01 00:00:00'),
 ('0000089','PA00001','0001-01-01 00:00:00'),
 ('0000090','CL00002','0001-01-01 00:00:00');
INSERT INTO `pruebaraven` (`codprueba`,`codaspirante`,`fecharealizacion`) VALUES 
 ('0000091','ME00003','0001-01-01 00:00:00'),
 ('0000092','CS00001','0001-01-01 00:00:00'),
 ('0000093','DW00001','0001-01-01 00:00:00'),
 ('0000094','MM00007','0001-01-01 00:00:00'),
 ('0000095','VA00002','0001-01-01 00:00:00'),
 ('0000096','AA00002','0001-01-01 00:00:00'),
 ('0000097','CL00001','0001-01-01 00:00:00'),
 ('0000098','BR00001','0001-01-01 00:00:00'),
 ('0000099','DJ00001','0001-01-01 00:00:00'),
 ('0000100','RM00001','0001-01-01 00:00:00'),
 ('0000101','AL00001','0001-01-01 00:00:00'),
 ('0000102','OI00001','0001-01-01 00:00:00'),
 ('0000103','SL00001','0001-01-01 00:00:00'),
 ('0000104','PZ00001','0001-01-01 00:00:00'),
 ('0000105','PE00001','0001-01-01 00:00:00'),
 ('0000106','HH00002','0001-01-01 00:00:00'),
 ('0000107','RJ00006','0001-01-01 00:00:00'),
 ('0000108','RS00001','0001-01-01 00:00:00'),
 ('0000109','BN00002','0001-01-01 00:00:00'),
 ('0000110','GK00001','0001-01-01 00:00:00'),
 ('0000111','MA00003','0001-01-01 00:00:00');
INSERT INTO `pruebaraven` (`codprueba`,`codaspirante`,`fecharealizacion`) VALUES 
 ('0000112','LK00001','0001-01-01 00:00:00'),
 ('0000113','TE00001','0001-01-01 00:00:00'),
 ('0000114','VG00003','0001-01-01 00:00:00'),
 ('0000115','MR00001','0001-01-01 00:00:00'),
 ('0000116','BA00002','0001-01-01 00:00:00'),
 ('0000117','MW00001','0001-01-01 00:00:00'),
 ('0000118','AM00001','0001-01-01 00:00:00'),
 ('0000119','MM00006','0001-01-01 00:00:00'),
 ('0000120','LM00001','0001-01-01 00:00:00'),
 ('0000121','ZN00001','0001-01-01 00:00:00'),
 ('0000122','MS00003','0001-01-01 00:00:00'),
 ('0000123','RK00002','0001-01-01 00:00:00'),
 ('0000124','CD00002','0001-01-01 00:00:00'),
 ('0000125','VG00002','0001-01-01 00:00:00'),
 ('0000126','JA00001','0001-01-01 00:00:00'),
 ('0000127','RJ00005','0001-01-01 00:00:00'),
 ('0000128','ME00002','0001-01-01 00:00:00'),
 ('0000129','AA00001','0001-01-01 00:00:00'),
 ('0000130','PG00001','0001-01-01 00:00:00'),
 ('0000131','MG00002','0001-01-01 00:00:00'),
 ('0000132','MD00001','0001-01-01 00:00:00');
INSERT INTO `pruebaraven` (`codprueba`,`codaspirante`,`fecharealizacion`) VALUES 
 ('0000133','PE00002','0001-01-01 00:00:00'),
 ('0000134','LD00002','0001-01-01 00:00:00'),
 ('0000135','AM00002','0001-01-01 00:00:00'),
 ('0000136','CI00001','0001-01-01 00:00:00'),
 ('0000137','SL00002','0001-01-01 00:00:00'),
 ('0000138','FC00001','0001-01-01 00:00:00'),
 ('0000139','CK00001','0001-01-01 00:00:00'),
 ('0000140','LR00001','0001-01-01 00:00:00'),
 ('0000141','GE00001','0001-01-01 00:00:00'),
 ('0000142','CS00003','0001-01-01 00:00:00'),
 ('0000143','OY00001','0001-01-01 00:00:00'),
 ('0000144','AL00002','0001-01-01 00:00:00'),
 ('0000145','GA00001','0001-01-01 00:00:00'),
 ('0000146','LJ00001','0001-01-01 00:00:00'),
 ('0000147','CR00001','0001-01-01 00:00:00'),
 ('0000148','BB00001','0001-01-01 00:00:00'),
 ('0000149','OS00001','0001-01-01 00:00:00'),
 ('0000150','TG00001','0001-01-01 00:00:00'),
 ('0000151','PY00002','0001-01-01 00:00:00'),
 ('0000152','ZS00001','0001-01-01 00:00:00'),
 ('0000153','GJ00003','0001-01-01 00:00:00');
INSERT INTO `pruebaraven` (`codprueba`,`codaspirante`,`fecharealizacion`) VALUES 
 ('0000154','ZC00001','0001-01-01 00:00:00'),
 ('0000155','GT00001','0001-01-01 00:00:00'),
 ('0000156','GE00002','0001-01-01 00:00:00'),
 ('0000157','MI00001','0001-01-01 00:00:00'),
 ('0000158','OS00002','0001-01-01 00:00:00'),
 ('0000159','CE00003','0001-01-01 00:00:00'),
 ('0000160','CS00004','0001-01-01 00:00:00'),
 ('0000161','GH00001','0001-01-01 00:00:00'),
 ('0000162','LS00001','0001-01-01 00:00:00'),
 ('0000163','MB00001','0001-01-01 00:00:00'),
 ('0000164','GM00001','0001-01-01 00:00:00'),
 ('0000165','CC00003','0001-01-01 00:00:00'),
 ('0000166','GS00002','0001-01-01 00:00:00'),
 ('0000167','CS00002','0001-01-01 00:00:00'),
 ('0000168','SC00001','0001-01-01 00:00:00'),
 ('0000169','CM00004','0001-01-01 00:00:00'),
 ('0000170','BJ00001','0001-01-01 00:00:00'),
 ('0000171','MC00001','0001-01-01 00:00:00'),
 ('0000172','BG00001','0001-01-01 00:00:00'),
 ('0000173','OD00001','0001-01-01 00:00:00'),
 ('0000174','MR00002','0001-01-01 00:00:00');
INSERT INTO `pruebaraven` (`codprueba`,`codaspirante`,`fecharealizacion`) VALUES 
 ('0000175','MJ00004','0001-01-01 00:00:00'),
 ('0000176','LI00001','0001-01-01 00:00:00'),
 ('0000177','RA00001','0001-01-01 00:00:00'),
 ('0000178','TO00001','0001-01-01 00:00:00'),
 ('0000179','VM00001','0001-01-01 00:00:00'),
 ('0000180','MG00003','0001-01-01 00:00:00'),
 ('0000181','GE00003','0001-01-01 00:00:00'),
 ('0000182','GY00001','0001-01-01 00:00:00'),
 ('0000183','SH00001','0001-01-01 00:00:00'),
 ('0000184','RN00002','0001-01-01 00:00:00'),
 ('0000185','JJ00001','0001-01-01 00:00:00'),
 ('0000186','DI00001','0001-01-01 00:00:00'),
 ('0000187','DG00001','0001-01-01 00:00:00'),
 ('0000188','CA00001','0001-01-01 00:00:00'),
 ('0000189','CM00005','0001-01-01 00:00:00'),
 ('0000190','RJ00007','0001-01-01 00:00:00'),
 ('0000191','AM00003','0001-01-01 00:00:00'),
 ('0000192','DM00001','0001-01-01 00:00:00'),
 ('0000193','BE00001','0001-01-01 00:00:00'),
 ('0000194','MD00002','0001-01-01 00:00:00'),
 ('0000195','GN00001','0001-01-01 00:00:00');
INSERT INTO `pruebaraven` (`codprueba`,`codaspirante`,`fecharealizacion`) VALUES 
 ('0000196','GD00001','0001-01-01 00:00:00'),
 ('0000197','VN00001','0001-01-01 00:00:00'),
 ('0000198','OR00001','0001-01-01 00:00:00'),
 ('0000199','OE00001','0001-01-01 00:00:00'),
 ('0000200','SM00002','0001-01-01 00:00:00'),
 ('0000201','GR00001','0001-01-01 00:00:00'),
 ('0000202','GR00002','0001-01-01 00:00:00'),
 ('0000203','FN00001','0001-01-01 00:00:00'),
 ('0000204','ED00001','0001-01-01 00:00:00'),
 ('0000205','LJ00002','0001-01-01 00:00:00'),
 ('0000206','MC00002','0001-01-01 00:00:00'),
 ('0000207','MY00001','0001-01-01 00:00:00'),
 ('0000208','ML00001','0001-01-01 00:00:00'),
 ('0000209','SC00002','0001-01-01 00:00:00'),
 ('0000210','GD00002','0001-01-01 00:00:00'),
 ('0000211','FE00001','0001-01-01 00:00:00'),
 ('0000212','PE00003','0001-01-01 00:00:00'),
 ('0000213','HC00001','0001-01-01 00:00:00'),
 ('0000214','HR00001','0001-01-01 00:00:00'),
 ('0000215','MW00002','0001-01-01 00:00:00'),
 ('0000216','TR00001','0001-01-01 00:00:00');
INSERT INTO `pruebaraven` (`codprueba`,`codaspirante`,`fecharealizacion`) VALUES 
 ('0000217','FY00001','0001-01-01 00:00:00'),
 ('0000218','VG00004','0001-01-01 00:00:00'),
 ('0000219','VM00002','0001-01-01 00:00:00'),
 ('0000220','GG00001','0001-01-01 00:00:00'),
 ('0000221','FF00001','0001-01-01 00:00:00'),
 ('0000222','CY00002','0001-01-01 00:00:00'),
 ('0000223','AN00002','0001-01-01 00:00:00'),
 ('0000224','AH00001','0001-01-01 00:00:00'),
 ('0000225','GJ00004','0001-01-01 00:00:00'),
 ('0000226','RM00002','0001-01-01 00:00:00'),
 ('0000227','LE00001','0001-01-01 00:00:00'),
 ('0000228','RS00002','0001-01-01 00:00:00'),
 ('0000229','VN00002','0001-01-01 00:00:00'),
 ('0000230','MO00001','0001-01-01 00:00:00'),
 ('0000231','RL00001','0001-01-01 00:00:00'),
 ('0000232','VR00002','0001-01-01 00:00:00'),
 ('0000233','JX00001','0001-01-01 00:00:00'),
 ('0000234','CC00001','0001-01-01 00:00:00'),
 ('0000235','QC00001','0001-01-01 00:00:00'),
 ('0000236','GJ00001','0001-01-01 00:00:00'),
 ('0000237','FR00001','0001-01-01 00:00:00');
INSERT INTO `pruebaraven` (`codprueba`,`codaspirante`,`fecharealizacion`) VALUES 
 ('0000238','MR00003','0001-01-01 00:00:00'),
 ('0000239','TF00001','0001-01-01 00:00:00');
/*!40000 ALTER TABLE `pruebaraven` ENABLE KEYS */;


--
-- Definition of table `respuestas`
--

DROP TABLE IF EXISTS `respuestas`;
CREATE TABLE `respuestas` (
  `codigo` char(7) NOT NULL,
  `npregunta` int(10) NOT NULL,
  `respuesta_asp` int(10) NOT NULL,
  `codprueba` char(7) NOT NULL,
  PRIMARY KEY  (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `respuestas`
--

/*!40000 ALTER TABLE `respuestas` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuestas` ENABLE KEYS */;


--
-- Definition of table `resultadosceps`
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
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000001',100,90,1,1,15,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nDespreocupacion. Distraccion. Ligereza. Excesiva comunicatividad.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',1,'GJ00002'),
 ('0000002',90,25,10,50,80,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',50,'LD00001'),
 ('0000003',95,70,10,10,35,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'VG00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000004',85,50,60,15,10,'Humor controlado.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',15,'FO00001'),
 ('0000005',99,70,5,15,35,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',15,'PO00001'),
 ('0000006',100,65,5,1,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',1,'SA00001'),
 ('0000007',95,40,40,10,40,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.            \r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'BN00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000008',99,65,40,50,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.            \r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',50,'GS00001'),
 ('0000009',85,40,40,20,10,'Humor controlado.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.            \r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',20,'ZT00001'),
 ('0000010',99,70,55,20,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',20,'MS00001'),
 ('0000011',45,10,20,30,75,'Tendencia a los altibajos de humor sin motivos.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',30,'MG00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000012',90,70,25,10,85,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',10,'BC00001'),
 ('0000013',45,15,15,10,75,'Tendencia a los altibajos de humor sin motivos.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',10,'RJ00001'),
 ('0000014',40,15,35,20,80,'Tendencia a los altibajos de humor sin motivos.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.            \r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',20,'SS00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000015',80,40,55,40,50,'Humor controlado.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',40,'AB00001'),
 ('0000016',30,55,40,30,50,'Tendencia a los altibajos de humor sin motivos.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.            \r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',30,'RI00001'),
 ('0000017',40,50,45,60,85,'Tendencia a los altibajos de humor sin motivos.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.            \r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',60,'DA00001'),
 ('0000018',85,15,20,10,85,'Humor controlado.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',10,'GI00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000019',90,80,5,10,50,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nLocuacidad, habilidad para dirigir reuniones. Animacion de caracter.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'AJ00001'),
 ('0000020',99,70,1,1,15,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',1,'CN00001'),
 ('0000021',70,50,25,5,75,'Estabilidad emocional.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',5,'NM00001'),
 ('0000022',95,65,25,5,30,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',5,'MM00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000023',40,70,70,60,70,'Tendencia a los altibajos de humor sin motivos.\r\nOptimista. Sociable, equilibrado.\r\nCombatividad suficiente. Energía para el mando.\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',60,'AJ00002'),
 ('0000024',95,70,5,5,45,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',5,'UL00001'),
 ('0000025',65,50,60,20,10,'Estabilidad emocional.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',20,'RK00001'),
 ('0000026',40,70,60,90,45,'Tendencia a los altibajos de humor sin motivos.\r\nOptimista. Sociable, equilibrado.\r\nCombatividad suficiente. Energía para el mando.\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',90,'EK00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000027',70,50,40,15,65,'Estabilidad emocional.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.            \r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',15,'SM00001'),
 ('0000028',30,45,75,60,15,'Tendencia a los altibajos de humor sin motivos.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',60,'CC00002'),
 ('0000029',75,15,70,30,10,'Estabilidad emocional.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',30,'CM00001'),
 ('0000030',90,45,55,60,75,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',60,'LY00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000031',65,85,15,15,80,'Estabilidad emocional.\r\nLocuacidad, habilidad para dirigir reuniones. Animacion de caracter.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',15,'RJ00002'),
 ('0000032',85,70,5,60,15,'Humor controlado.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',60,'AN00001'),
 ('0000033',100,45,15,15,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',15,'CM00002'),
 ('0000034',40,40,75,20,10,'Tendencia a los altibajos de humor sin motivos.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',20,'AV00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000035',25,45,70,30,30,'Grave inestabilidad. Cambios emocionales injustificados, de indole depresiva. No interviene la voluntad del sujeto.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',30,'PD00001'),
 ('0000036',90,50,20,10,15,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'CY00001'),
 ('0000037',60,40,55,10,15,'Estabilidad emocional.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'MS00002'),
 ('0000038',75,50,55,50,15,'Estabilidad emocional.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',50,'VC00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000039',60,25,40,15,15,'Estabilidad emocional.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.            \r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',15,'PY00001'),
 ('0000040',99,80,10,5,15,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nLocuacidad, habilidad para dirigir reuniones. Animacion de caracter.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',5,'AZ00001'),
 ('0000041',95,80,5,10,15,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nLocuacidad, habilidad para dirigir reuniones. Animacion de caracter.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'LW00001'),
 ('0000042',70,40,65,30,50,'Estabilidad emocional.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',30,'CD00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000043',99,50,20,20,15,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',20,'MJ00003'),
 ('0000044',75,20,55,10,85,'Estabilidad emocional.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',10,'RJ00003'),
 ('0000045',75,25,45,10,10,'Estabilidad emocional.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.            \r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'MJ00002'),
 ('0000046',100,70,20,5,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',5,'CE00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000047',90,10,55,1,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',1,'MM00002'),
 ('0000048',80,40,55,10,10,'Humor controlado.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'SR00001'),
 ('0000049',70,65,25,10,35,'Estabilidad emocional.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'PI00001'),
 ('0000050',15,45,65,85,35,'Grave inestabilidad. Cambios emocionales injustificados, de indole depresiva. No interviene la voluntad del sujeto.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',85,'MJ00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000051',45,20,70,70,10,'Tendencia a los altibajos de humor sin motivos.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nCombatividad suficiente. Energía para el mando.\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',70,'LN00001'),
 ('0000052',99,85,25,50,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nLocuacidad, habilidad para dirigir reuniones. Animacion de caracter.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',50,'HD00001'),
 ('0000053',95,50,20,10,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'FJ00001'),
 ('0000054',95,50,10,40,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',40,'CO00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000055',15,10,45,60,10,'Grave inestabilidad. Cambios emocionales injustificados, de indole depresiva. No interviene la voluntad del sujeto.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.            \r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',60,'PF00001'),
 ('0000056',90,65,15,10,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'RN00001'),
 ('0000057',95,65,40,30,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.            \r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',30,'MK00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000058',95,45,40,5,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.            \r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',5,'RF00001'),
 ('0000059',65,70,20,5,10,'Estabilidad emocional.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',5,'HH00001'),
 ('0000060',90,70,35,10,30,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.            \r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'ME00001'),
 ('0000061',95,40,45,10,15,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.            \r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'RJ00004');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000062',10,15,60,90,30,'Grave inestabilidad. Cambios emocionales injustificados, de indole depresiva. No interviene la voluntad del sujeto.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nCombatividad suficiente. Energía para el mando.\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',90,'CM00003'),
 ('0000063',80,70,45,70,10,'Humor controlado.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.            \r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',70,'AK00001'),
 ('0000064',40,40,60,40,15,'Tendencia a los altibajos de humor sin motivos.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',40,'FA00001'),
 ('0000065',100,75,5,1,15,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',1,'MM00004');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000066',45,70,80,10,15,'Tendencia a los altibajos de humor sin motivos.\r\nOptimista. Sociable, equilibrado.\r\nTendencia hacia la agresividad. Tenacidad y suficiencia.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'SK00001'),
 ('0000067',10,25,35,40,15,'Grave inestabilidad. Cambios emocionales injustificados, de indole depresiva. No interviene la voluntad del sujeto.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.            \r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',40,'CW00001'),
 ('0000068',85,85,15,20,10,'Humor controlado.\r\nLocuacidad, habilidad para dirigir reuniones. Animacion de caracter.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',20,'VK00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000069',99,55,10,30,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',30,'FJ00002'),
 ('0000070',85,65,60,60,10,'Humor controlado.\r\nOptimista. Sociable, equilibrado.\r\nCombatividad suficiente. Energía para el mando.\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',60,'CJ00001'),
 ('0000072',100,75,15,5,30,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',5,'CE00002'),
 ('0000073',90,40,35,5,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.            \r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',5,'FH00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000074',70,70,25,60,10,'Estabilidad emocional.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',60,'CH00001'),
 ('0000075',90,45,65,60,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',60,'RO00001'),
 ('0000076',75,50,80,95,60,'Estabilidad emocional.\r\nTendencia a la inhibicion social.\r\nTendencia hacia la agresividad. Tenacidad y suficiencia.\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',95,'BA00001'),
 ('0000077',80,65,75,20,15,'Humor controlado.\r\nOptimista. Sociable, equilibrado.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',20,'MA00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000078',95,50,35,10,15,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.            \r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'MM00003'),
 ('0000079',30,50,60,30,50,'Tendencia a los altibajos de humor sin motivos.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',30,'VR00001'),
 ('0000080',80,65,55,5,10,'Humor controlado.\r\nOptimista. Sociable, equilibrado.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',5,'MA00002'),
 ('0000081',5,20,95,70,50,'Grave inestabilidad. Cambios emocionales injustificados, de indole depresiva. No interviene la voluntad del sujeto.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nAlto nivel de aspiraciones. Yo supervalorado. Tenacidad rígida. Agresividad y suspicacia.\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',70,'VS00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000082',90,25,35,70,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.            \r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',70,'VA00001'),
 ('0000083',25,15,65,20,30,'Grave inestabilidad. Cambios emocionales injustificados, de indole depresiva. No interviene la voluntad del sujeto.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',20,'MM00005'),
 ('0000085',90,55,55,10,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'PA00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000086',100,70,5,10,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'CL00002'),
 ('0000087',25,20,65,20,40,'Grave inestabilidad. Cambios emocionales injustificados, de indole depresiva. No interviene la voluntad del sujeto.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',20,'ME00003'),
 ('0000088',90,75,60,10,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'CS00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000090',85,20,10,40,80,'Humor controlado.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',40,'DW00001'),
 ('0000091',80,5,10,50,95,'Humor controlado.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',50,'MM00007'),
 ('0000092',95,55,25,10,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'VA00002');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000093',60,5,40,40,45,'Estabilidad emocional.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',40,'AA00002'),
 ('0000094',80,25,40,5,30,'Humor controlado.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',5,'BR00001'),
 ('0000095',99,50,60,10,70,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',10,'DJ00001'),
 ('0000096',75,25,10,20,15,'Estabilidad emocional.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',20,'RM00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000097',99,40,5,10,50,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'AL00001'),
 ('0000098',30,10,5,50,99,'Tendencia a los altibajos de humor sin motivos.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',50,'OI00001'),
 ('0000099',5,45,90,40,15,'Grave inestabilidad. Cambios emocionales injustificados, de indole depresiva. No interviene la voluntad del sujeto.\r\nTendencia a la inhibicion social.\r\nAlto nivel de aspiraciones. Yo supervalorado. Tenacidad rígida. Agresividad y suspicacia.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',40,'SL00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000100',70,30,55,50,30,'Estabilidad emocional.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',50,'PZ00001'),
 ('0000101',25,65,70,90,30,'Grave inestabilidad. Cambios emocionales injustificados, de indole depresiva. No interviene la voluntad del sujeto.\r\nOptimista. Sociable, equilibrado.\r\nCombatividad suficiente. Energía para el mando.\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',90,'PE00001'),
 ('0000102',10,40,55,95,15,'Grave inestabilidad. Cambios emocionales injustificados, de indole depresiva. No interviene la voluntad del sujeto.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',95,'HH00002'),
 ('0000103',95,55,10,15,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',15,'RJ00006');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000104',99,55,10,15,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',15,'RS00001'),
 ('0000105',65,50,55,40,45,'Estabilidad emocional.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',40,'BN00002'),
 ('0000106',70,70,35,15,50,'Estabilidad emocional.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',15,'GK00001'),
 ('0000107',45,15,35,5,100,'Tendencia a los altibajos de humor sin motivos.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',5,'MA00003');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000108',90,75,25,10,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'LK00001'),
 ('0000109',95,50,5,5,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',5,'TE00001'),
 ('0000110',100,85,1,5,15,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nLocuacidad, habilidad para dirigir reuniones. Animacion de caracter.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',5,'VG00003'),
 ('0000111',99,65,5,10,40,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'MR00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000112',90,50,45,20,15,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',20,'BA00002'),
 ('0000113',45,70,25,10,80,'Tendencia a los altibajos de humor sin motivos.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',10,'MW00001'),
 ('0000114',99,45,10,20,35,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',20,'AM00001'),
 ('0000115',10,30,75,70,10,'Grave inestabilidad. Cambios emocionales injustificados, de indole depresiva. No interviene la voluntad del sujeto.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',70,'MM00006');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000116',80,20,35,30,10,'Humor controlado.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',30,'LM00001'),
 ('0000117',99,65,5,10,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'ZN00001'),
 ('0000118',70,70,55,95,30,'Estabilidad emocional.\r\nOptimista. Sociable, equilibrado.\r\nCombatividad suficiente. Energía para el mando.\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',95,'MS00003'),
 ('0000119',95,45,5,10,80,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',10,'RK00002');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000120',30,50,65,10,50,'Tendencia a los altibajos de humor sin motivos.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'CD00002'),
 ('0000121',90,65,10,10,30,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'VG00002'),
 ('0000122',65,50,15,40,40,'Estabilidad emocional.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',40,'JA00001'),
 ('0000123',80,65,55,1,85,'Humor controlado.\r\nOptimista. Sociable, equilibrado.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',1,'RJ00005');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000124',40,40,65,60,80,'Tendencia a los altibajos de humor sin motivos.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',60,'ME00002'),
 ('0000125',95,70,60,10,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'AA00001'),
 ('0000126',75,30,5,40,35,'Estabilidad emocional.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',40,'PG00001'),
 ('0000127',95,65,55,15,60,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',15,'MG00002');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000128',90,40,5,40,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',40,'MD00001'),
 ('0000129',65,50,75,85,10,'Estabilidad emocional.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',85,'PE00002'),
 ('0000130',95,30,45,20,15,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',20,'LD00002'),
 ('0000131',60,40,75,10,10,'Estabilidad emocional.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'AM00002');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000132',70,80,15,40,30,'Estabilidad emocional.\r\nLocuacidad, habilidad para dirigir reuniones. Animacion de caracter.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',40,'CI00001'),
 ('0000133',60,15,55,60,35,'Estabilidad emocional.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nCombatividad suficiente. Energía para el mando.\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',60,'SL00002'),
 ('0000134',90,50,60,20,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',20,'FC00001'),
 ('0000135',60,50,10,70,30,'Estabilidad emocional.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',70,'CK00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000136',30,45,45,10,35,'Tendencia a los altibajos de humor sin motivos.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'LR00001'),
 ('0000137',25,65,60,5,65,'Grave inestabilidad. Cambios emocionales injustificados, de indole depresiva. No interviene la voluntad del sujeto.\r\nOptimista. Sociable, equilibrado.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',5,'GE00001'),
 ('0000138',60,10,75,50,10,'Estabilidad emocional.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',50,'CS00003'),
 ('0000139',95,20,25,20,50,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',20,'OY00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000140',95,70,5,5,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',5,'AL00002'),
 ('0000141',10,15,5,20,10,'Grave inestabilidad. Cambios emocionales injustificados, de indole depresiva. No interviene la voluntad del sujeto.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',20,'GA00001'),
 ('0000142',95,45,25,10,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'LJ00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000143',25,75,55,30,10,'Grave inestabilidad. Cambios emocionales injustificados, de indole depresiva. No interviene la voluntad del sujeto.\r\nOptimista. Sociable, equilibrado.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',30,'CR00001'),
 ('0000144',40,25,10,50,30,'Tendencia a los altibajos de humor sin motivos.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',50,'BB00001'),
 ('0000145',30,30,45,40,15,'Tendencia a los altibajos de humor sin motivos.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',40,'OS00001'),
 ('0000146',30,10,5,10,45,'Tendencia a los altibajos de humor sin motivos.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'TG00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000147',75,50,10,15,10,'Estabilidad emocional.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',15,'PY00002'),
 ('0000148',45,5,85,50,35,'Tendencia a los altibajos de humor sin motivos.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nTendencia hacia la agresividad. Tenacidad y suficiencia.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',50,'ZS00001'),
 ('0000149',65,55,10,15,10,'Estabilidad emocional.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',15,'GJ00003'),
 ('0000150',70,70,65,10,10,'Estabilidad emocional.\r\nOptimista. Sociable, equilibrado.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'ZC00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000151',60,10,45,5,10,'Estabilidad emocional.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',5,'GT00001'),
 ('0000152',65,15,5,10,10,'Estabilidad emocional.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'GE00002'),
 ('0000153',60,15,20,10,30,'Estabilidad emocional.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'MI00001'),
 ('0000154',15,50,40,80,60,'Grave inestabilidad. Cambios emocionales injustificados, de indole depresiva. No interviene la voluntad del sujeto.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',80,'OS00002');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000155',65,50,85,30,10,'Estabilidad emocional.\r\nTendencia a la inhibicion social.\r\nTendencia hacia la agresividad. Tenacidad y suficiencia.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',30,'CE00003'),
 ('0000156',90,15,10,30,15,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',30,'CS00004'),
 ('0000157',15,30,40,10,40,'Grave inestabilidad. Cambios emocionales injustificados, de indole depresiva. No interviene la voluntad del sujeto.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'GH00001'),
 ('0000158',80,20,10,40,10,'Humor controlado.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',40,'LS00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000159',70,25,40,15,70,'Estabilidad emocional.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',15,'MB00001'),
 ('0000160',80,50,45,10,10,'Humor controlado.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'GM00001'),
 ('0000162',80,30,20,15,10,'Humor controlado.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',15,'CC00003'),
 ('0000163',30,50,75,15,15,'Tendencia a los altibajos de humor sin motivos.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',15,'GS00002');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000164',10,70,40,15,10,'Grave inestabilidad. Cambios emocionales injustificados, de indole depresiva. No interviene la voluntad del sujeto.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',15,'CS00002'),
 ('0000165',80,20,5,15,10,'Humor controlado.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',15,'SC00001'),
 ('0000166',10,1,65,15,35,'Grave inestabilidad. Cambios emocionales injustificados, de indole depresiva. No interviene la voluntad del sujeto.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',15,'CM00004'),
 ('0000167',65,40,55,50,10,'Estabilidad emocional.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',50,'BJ00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000168',75,45,75,10,15,'Estabilidad emocional.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'MC00001'),
 ('0000169',15,15,25,30,80,'Grave inestabilidad. Cambios emocionales injustificados, de indole depresiva. No interviene la voluntad del sujeto.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',30,'BG00001'),
 ('0000170',99,50,15,5,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',5,'OD00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000171',65,70,25,20,15,'Estabilidad emocional.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',20,'MR00002'),
 ('0000172',90,50,90,10,15,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nTendencia a la inhibicion social.\r\nAlto nivel de aspiraciones. Yo supervalorado. Tenacidad rígida. Agresividad y suspicacia.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'MJ00004'),
 ('0000173',95,90,5,1,40,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nDespreocupacion. Distraccion. Ligereza. Excesiva comunicatividad.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',1,'LI00001'),
 ('0000174',99,70,40,10,45,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'RA00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000175',75,70,60,10,85,'Estabilidad emocional.\r\nOptimista. Sociable, equilibrado.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',10,'TO00001'),
 ('0000176',45,10,40,15,40,'Tendencia a los altibajos de humor sin motivos.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',15,'VM00001'),
 ('0000177',65,15,55,15,15,'Estabilidad emocional.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',15,'MG00003'),
 ('0000178',90,65,60,40,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',40,'GE00003');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000179',95,70,20,10,70,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',10,'GY00001'),
 ('0000180',95,55,20,5,65,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',5,'SH00001'),
 ('0000181',80,70,5,50,35,'Humor controlado.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',50,'RN00002');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000182',85,90,25,20,40,'Humor controlado.\r\nDespreocupacion. Distraccion. Ligereza. Excesiva comunicatividad.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',20,'JJ00001'),
 ('0000183',90,90,25,40,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nDespreocupacion. Distraccion. Ligereza. Excesiva comunicatividad.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',40,'DI00001'),
 ('0000184',30,45,80,15,15,'Tendencia a los altibajos de humor sin motivos.\r\nTendencia a la inhibicion social.\r\nTendencia hacia la agresividad. Tenacidad y suficiencia.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',15,'DG00001'),
 ('0000185',30,55,90,95,35,'Tendencia a los altibajos de humor sin motivos.\r\nOptimista. Sociable, equilibrado.\r\nAlto nivel de aspiraciones. Yo supervalorado. Tenacidad rígida. Agresividad y suspicacia.\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',95,'CA00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000186',95,45,15,10,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'CM00005'),
 ('0000187',80,45,45,10,10,'Humor controlado.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'RJ00007'),
 ('0000188',90,50,20,15,40,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',15,'AM00003'),
 ('0000189',75,20,45,15,35,'Estabilidad emocional.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',15,'DM00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000190',99,70,20,10,50,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'BE00001'),
 ('0000191',75,15,60,40,15,'Estabilidad emocional.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',40,'MD00002'),
 ('0000192',10,10,25,30,90,'Grave inestabilidad. Cambios emocionales injustificados, de indole depresiva. No interviene la voluntad del sujeto.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',30,'GN00001'),
 ('0000193',65,20,15,10,99,'Estabilidad emocional.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',10,'GD00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000194',5,20,25,5,99,'Grave inestabilidad. Cambios emocionales injustificados, de indole depresiva. No interviene la voluntad del sujeto.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',5,'VN00001'),
 ('0000195',99,65,15,5,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',5,'OR00001'),
 ('0000196',60,15,10,40,65,'Estabilidad emocional.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',40,'OE00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000197',45,10,95,85,10,'Tendencia a los altibajos de humor sin motivos.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nAlto nivel de aspiraciones. Yo supervalorado. Tenacidad rígida. Agresividad y suspicacia.\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',85,'SM00002'),
 ('0000199',95,55,70,10,70,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',10,'GR00001'),
 ('0000200',40,55,20,70,90,'Tendencia a los altibajos de humor sin motivos.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',70,'GR00002'),
 ('0000201',10,50,40,30,50,'Grave inestabilidad. Cambios emocionales injustificados, de indole depresiva. No interviene la voluntad del sujeto.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',30,'FN00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000202',60,40,45,70,15,'Estabilidad emocional.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',70,'ED00001'),
 ('0000203',65,70,20,5,10,'Estabilidad emocional.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',5,'LJ00002'),
 ('0000204',25,15,75,70,10,'Grave inestabilidad. Cambios emocionales injustificados, de indole depresiva. No interviene la voluntad del sujeto.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nCombatividad suficiente. Energía para el mando.\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',70,'MC00002'),
 ('0000205',15,45,80,40,50,'Grave inestabilidad. Cambios emocionales injustificados, de indole depresiva. No interviene la voluntad del sujeto.\r\nTendencia a la inhibicion social.\r\nTendencia hacia la agresividad. Tenacidad y suficiencia.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',40,'MY00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000206',40,10,10,10,95,'Tendencia a los altibajos de humor sin motivos.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',10,'ML00001'),
 ('0000207',70,15,5,10,50,'Estabilidad emocional.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'SC00002'),
 ('0000208',5,50,10,60,45,'Grave inestabilidad. Cambios emocionales injustificados, de indole depresiva. No interviene la voluntad del sujeto.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',60,'GD00002');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000209',70,45,5,10,15,'Estabilidad emocional.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'FE00001'),
 ('0000210',30,20,60,20,15,'Tendencia a los altibajos de humor sin motivos.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',20,'PE00003'),
 ('0000211',65,20,60,50,10,'Estabilidad emocional.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',50,'HC00001'),
 ('0000212',85,50,40,20,85,'Humor controlado.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',20,'HR00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000213',95,65,5,15,45,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',15,'MW00002'),
 ('0000214',75,70,35,20,10,'Estabilidad emocional.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',20,'TR00001'),
 ('0000215',100,50,5,10,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'FY00001'),
 ('0000216',10,20,90,60,35,'Grave inestabilidad. Cambios emocionales injustificados, de indole depresiva. No interviene la voluntad del sujeto.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nAlto nivel de aspiraciones. Yo supervalorado. Tenacidad rígida. Agresividad y suspicacia.\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',60,'VG00004');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000217',99,50,5,5,40,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',5,'VM00002'),
 ('0000218',95,25,25,20,35,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',20,'GG00001'),
 ('0000219',40,15,40,10,30,'Tendencia a los altibajos de humor sin motivos.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'FF00001'),
 ('0000220',30,5,85,60,80,'Tendencia a los altibajos de humor sin motivos.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nTendencia hacia la agresividad. Tenacidad y suficiencia.\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',60,'CY00002');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000221',95,40,20,20,70,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',20,'AN00002'),
 ('0000222',90,65,75,20,15,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',20,'AH00001'),
 ('0000223',65,75,70,30,35,'Estabilidad emocional.\r\nOptimista. Sociable, equilibrado.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',30,'GJ00004'),
 ('0000224',80,70,45,10,15,'Humor controlado.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'RM00002');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000225',75,65,60,60,15,'Estabilidad emocional.\r\nOptimista. Sociable, equilibrado.\r\nCombatividad suficiente. Energía para el mando.\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',60,'LE00001'),
 ('0000226',99,70,40,10,15,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'RS00002'),
 ('0000227',10,30,65,85,30,'Grave inestabilidad. Cambios emocionales injustificados, de indole depresiva. No interviene la voluntad del sujeto.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',85,'VN00002'),
 ('0000228',60,40,45,70,35,'Estabilidad emocional.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',70,'MO00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000229',45,45,55,10,15,'Tendencia a los altibajos de humor sin motivos.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'RL00001'),
 ('0000230',99,75,5,1,15,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',1,'VR00002'),
 ('0000231',95,80,15,50,50,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nLocuacidad, habilidad para dirigir reuniones. Animacion de caracter.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',50,'JX00001'),
 ('0000232',10,30,99,85,10,'Grave inestabilidad. Cambios emocionales injustificados, de indole depresiva. No interviene la voluntad del sujeto.\r\nTendencia a la inhibicion social.\r\nAlto nivel de aspiraciones. Yo supervalorado. Tenacidad rígida. Agresividad y suspicacia.\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',85,'CC00001');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000233',85,20,10,30,70,'Humor controlado.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nIndecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo.',30,'QC00001'),
 ('0000234',80,40,20,5,10,'Humor controlado.\r\nTendencia a la inhibicion social.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',5,'GJ00001'),
 ('0000235',75,50,65,90,10,'Estabilidad emocional.\r\nTendencia a la inhibicion social.\r\nCombatividad suficiente. Energía para el mando.\r\nAutenticidad en las respuestas o asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',90,'FR00001'),
 ('0000236',90,70,40,15,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nOptimista. Sociable, equilibrado.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',15,'MR00003');
INSERT INTO `resultadosceps` (`codresult`,`pcontrol`,`pextrover`,`pparanoi`,`psincer`,`pdecision`,`diagnostico`,`faltasin`,`codaspirante`) VALUES 
 ('0000237',90,5,5,10,10,'Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva.\r\nPesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion.\r\nPersonalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable\r\nDuda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales.\r\nSeguridad. Decisión. Personalidad rígida.',10,'TF00001');
/*!40000 ALTER TABLE `resultadosceps` ENABLE KEYS */;


--
-- Definition of table `resultadosraven`
--

DROP TABLE IF EXISTS `resultadosraven`;
CREATE TABLE `resultadosraven` (
  `codresult` char(7) NOT NULL default '',
  `consistencia` varchar(15) NOT NULL default '',
  `percentil` int(10) unsigned NOT NULL default '0',
  `diagnostico` text NOT NULL,
  `codaspirante` char(7) NOT NULL,
  `puntaje` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`codresult`),
  KEY `FK_codasp` (`codaspirante`),
  CONSTRAINT `FK_codasp` FOREIGN KEY (`codaspirante`) REFERENCES `aspirantes` (`codigo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resultadosraven`
--

/*!40000 ALTER TABLE `resultadosraven` DISABLE KEYS */;
INSERT INTO `resultadosraven` (`codresult`,`consistencia`,`percentil`,`diagnostico`,`codaspirante`,`puntaje`) VALUES 
 ('0000007','verdadera',75,'DEFINIDAMENTE SUPERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','BN00001',52),
 ('0000008','verdadera',75,'DEFINIDAMENTE SUPERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','SA00001',49),
 ('0000009','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','PO00001',43),
 ('0000010','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','FO00001',41),
 ('0000011','verdadera',75,'DEFINIDAMENTE SUPERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','VG00001',49),
 ('0000012','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','MS00001',43),
 ('0000013','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','GS00001',42),
 ('0000014','verdadera',10,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','ZT00001',24),
 ('0000015','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','GJ00002',41),
 ('0000016','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','MG00001',44),
 ('0000017','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','LD00001',40);
INSERT INTO `resultadosraven` (`codresult`,`consistencia`,`percentil`,`diagnostico`,`codaspirante`,`puntaje`) VALUES 
 ('0000018','verdadera',5,'DEFICIENTE MENTAL','BC00001',27),
 ('0000019','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','RJ00001',43),
 ('0000020','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','SS00001',45),
 ('0000021','verdadera',5,'DEFICIENTE MENTAL','AB00001',25),
 ('0000022','verdadera',10,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','RI00001',38),
 ('0000023','verdadera',10,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','DA00001',36),
 ('0000024','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','GI00001',41),
 ('0000025','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','AJ00001',50),
 ('0000026','verdadera',5,'DEFICIENTE MENTAL','CN00001',25),
 ('0000027','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','NM00001',49),
 ('0000028','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','MM00001',45),
 ('0000029','verdadera',5,'DEFICIENTE MENTAL','AJ00002',31);
INSERT INTO `resultadosraven` (`codresult`,`consistencia`,`percentil`,`diagnostico`,`codaspirante`,`puntaje`) VALUES 
 ('0000030','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','UL00001',48),
 ('0000031','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','RK00001',49),
 ('0000032','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','EK00001',44),
 ('0000033','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','SM00001',51),
 ('0000034','verdadera',10,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','CC00002',40),
 ('0000035','falso',0,'NO SE PUEDE DAR UN DIAGNOSTICO','CM00001',8),
 ('0000036','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','LY00001',46),
 ('0000037','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','RJ00002',47),
 ('0000038','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','AN00001',46),
 ('0000039','verdadera',75,'DEFINIDAMENTE SUPERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','CM00002',50),
 ('0000040','verdadera',5,'DEFICIENTE MENTAL','AV00001',17),
 ('0000041','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','PD00001',44);
INSERT INTO `resultadosraven` (`codresult`,`consistencia`,`percentil`,`diagnostico`,`codaspirante`,`puntaje`) VALUES 
 ('0000042','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','CY00001',39),
 ('0000043','verdadera',75,'DEFINIDAMENTE SUPERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','MS00002',49),
 ('0000044','verdadera',75,'DEFINIDAMENTE SUPERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','VC00001',50),
 ('0000045','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','PY00001',51),
 ('0000046','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','AZ00001',46),
 ('0000047','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','LW00001',45),
 ('0000048','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','CD00001',47),
 ('0000049','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','MJ00003',44),
 ('0000050','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','RJ00003',47),
 ('0000051','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','MJ00002',47),
 ('0000052','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','CE00001',45);
INSERT INTO `resultadosraven` (`codresult`,`consistencia`,`percentil`,`diagnostico`,`codaspirante`,`puntaje`) VALUES 
 ('0000053','verdadera',90,'DEFINIDAMENTE SUPERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','MM00002',54),
 ('0000054','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','SR00001',40),
 ('0000055','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','PI00001',43),
 ('0000056','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','MJ00001',47),
 ('0000057','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','LN00001',48),
 ('0000058','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','HD00001',50),
 ('0000059','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','FJ00001',47),
 ('0000060','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','CO00001',43),
 ('0000061','verdadera',10,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','PF00001',37),
 ('0000062','verdadera',75,'DEFINIDAMENTE SUPERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','RN00001',53),
 ('0000063','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','MK00001',39);
INSERT INTO `resultadosraven` (`codresult`,`consistencia`,`percentil`,`diagnostico`,`codaspirante`,`puntaje`) VALUES 
 ('0000064','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','RF00001',49),
 ('0000065','verdadera',95,'INTELECTUALMENTE SUPERIOR','HH00001',57),
 ('0000066','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','ME00001',42),
 ('0000067','verdadera',75,'DEFINIDAMENTE SUPERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','RJ00004',52),
 ('0000068','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','CM00003',48),
 ('0000069','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','AK00001',51),
 ('0000070','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','FA00001',41),
 ('0000071','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','MM00004',46),
 ('0000072','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','SK00001',42),
 ('0000073','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','CW00001',46),
 ('0000074','verdadera',90,'DEFINIDAMENTE SUPERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','VK00001',55),
 ('0000075','verdadera',75,'DEFINIDAMENTE SUPERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','FJ00002',51);
INSERT INTO `resultadosraven` (`codresult`,`consistencia`,`percentil`,`diagnostico`,`codaspirante`,`puntaje`) VALUES 
 ('0000076','verdadera',95,'INTELECTUALMENTE SUPERIOR','CJ00001',56),
 ('0000077','verdadera',90,'DEFINIDAMENTE SUPERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','CE00002',55),
 ('0000078','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','FH00001',51),
 ('0000079','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','CH00001',39),
 ('0000080','verdadera',75,'DEFINIDAMENTE SUPERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','RO00001',51),
 ('0000081','verdadera',75,'DEFINIDAMENTE SUPERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','BA00001',53),
 ('0000082','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','MA00001',47),
 ('0000083','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','MM00003',37),
 ('0000084','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','VR00001',47),
 ('0000085','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','MA00002',34),
 ('0000086','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','VS00001',46);
INSERT INTO `resultadosraven` (`codresult`,`consistencia`,`percentil`,`diagnostico`,`codaspirante`,`puntaje`) VALUES 
 ('0000087','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','VA00001',49),
 ('0000088','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','MM00005',38),
 ('0000089','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','PA00001',37),
 ('0000090','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','CL00002',46),
 ('0000091','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','ME00003',37),
 ('0000092','verdadera',75,'DEFINIDAMENTE SUPERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','CS00001',50),
 ('0000093','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','DW00001',43),
 ('0000094','verdadera',5,'DEFICIENTE MENTAL','MM00007',34),
 ('0000095','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','VA00002',45),
 ('0000096','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','AA00002',43),
 ('0000097','falso',0,'NO SE PUEDE DAR UN DIAGNOSTICO','CL00001',14),
 ('0000098','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','BR00001',45);
INSERT INTO `resultadosraven` (`codresult`,`consistencia`,`percentil`,`diagnostico`,`codaspirante`,`puntaje`) VALUES 
 ('0000099','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','DJ00001',49),
 ('0000100','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','RM00001',48),
 ('0000101','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','AL00001',49),
 ('0000102','verdadera',10,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','OI00001',36),
 ('0000103','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','SL00001',48),
 ('0000104','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','PZ00001',48),
 ('0000105','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','PE00001',45),
 ('0000106','verdadera',10,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','HH00002',37),
 ('0000107','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','RJ00006',42),
 ('0000108','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','RS00001',44),
 ('0000109','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','BN00002',44),
 ('0000110','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','GK00001',49);
INSERT INTO `resultadosraven` (`codresult`,`consistencia`,`percentil`,`diagnostico`,`codaspirante`,`puntaje`) VALUES 
 ('0000111','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','MA00003',41),
 ('0000112','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','LK00001',38),
 ('0000113','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','TE00001',39),
 ('0000114','verdadera',10,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','VG00003',33),
 ('0000115','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','MR00001',39),
 ('0000116','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','BA00002',47),
 ('0000117','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','MW00001',43),
 ('0000118','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','AM00001',40),
 ('0000119','verdadera',5,'DEFICIENTE MENTAL','MM00006',27),
 ('0000120','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','LM00001',47),
 ('0000121','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','ZN00001',45),
 ('0000122','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','MS00003',41);
INSERT INTO `resultadosraven` (`codresult`,`consistencia`,`percentil`,`diagnostico`,`codaspirante`,`puntaje`) VALUES 
 ('0000123','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','RK00002',37),
 ('0000124','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','CD00002',46),
 ('0000125','verdadera',75,'DEFINIDAMENTE SUPERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','VG00002',52),
 ('0000126','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','JA00001',46),
 ('0000127','verdadera',10,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','RJ00005',38),
 ('0000128','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','ME00002',46),
 ('0000129','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','AA00001',50),
 ('0000130','verdadera',5,'DEFICIENTE MENTAL','PG00001',30),
 ('0000131','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','MG00002',47),
 ('0000132','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','MD00001',49),
 ('0000133','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','PE00002',42),
 ('0000134','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','LD00002',38);
INSERT INTO `resultadosraven` (`codresult`,`consistencia`,`percentil`,`diagnostico`,`codaspirante`,`puntaje`) VALUES 
 ('0000135','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','AM00002',43),
 ('0000136','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','CI00001',36),
 ('0000137','verdadera',10,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','SL00002',35),
 ('0000138','verdadera',10,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','FC00001',27),
 ('0000139','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','CK00001',49),
 ('0000140','verdadera',5,'DEFICIENTE MENTAL','LR00001',28),
 ('0000141','verdadera',10,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','GE00001',36),
 ('0000142','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','CS00003',47),
 ('0000143','verdadera',5,'DEFICIENTE MENTAL','OY00001',25),
 ('0000144','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','AL00002',42),
 ('0000145','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','GA00001',43),
 ('0000146','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','LJ00001',42);
INSERT INTO `resultadosraven` (`codresult`,`consistencia`,`percentil`,`diagnostico`,`codaspirante`,`puntaje`) VALUES 
 ('0000147','verdadera',5,'DEFICIENTE MENTAL','CR00001',20),
 ('0000148','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','BB00001',48),
 ('0000149','verdadera',10,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','OS00001',35),
 ('0000150','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','TG00001',44),
 ('0000151','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','PY00002',44),
 ('0000152','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','ZS00001',37),
 ('0000153','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','GJ00003',46),
 ('0000154','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','ZC00001',45),
 ('0000155','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','GT00001',34),
 ('0000156','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','GE00002',44),
 ('0000157','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','MI00001',47);
INSERT INTO `resultadosraven` (`codresult`,`consistencia`,`percentil`,`diagnostico`,`codaspirante`,`puntaje`) VALUES 
 ('0000158','verdadera',5,'DEFICIENTE MENTAL','OS00002',18),
 ('0000159','verdadera',5,'DEFICIENTE MENTAL','CE00003',32),
 ('0000160','verdadera',10,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','CS00004',38),
 ('0000161','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','GH00001',38),
 ('0000162','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','LS00001',39),
 ('0000163','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','MB00001',43),
 ('0000164','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','GM00001',43),
 ('0000165','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','CC00003',46),
 ('0000166','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','GS00002',42),
 ('0000167','verdadera',5,'DEFICIENTE MENTAL','CS00002',25),
 ('0000168','verdadera',75,'DEFINIDAMENTE SUPERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','SC00001',53),
 ('0000169','verdadera',5,'DEFICIENTE MENTAL','CM00004',27);
INSERT INTO `resultadosraven` (`codresult`,`consistencia`,`percentil`,`diagnostico`,`codaspirante`,`puntaje`) VALUES 
 ('0000170','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','BJ00001',48),
 ('0000171','verdadera',10,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','MC00001',35),
 ('0000172','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','BG00001',40),
 ('0000173','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','OD00001',43),
 ('0000174','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','MR00002',42),
 ('0000175','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','MJ00004',47),
 ('0000176','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','LI00001',46),
 ('0000177','verdadera',10,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','RA00001',36),
 ('0000178','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','TO00001',42),
 ('0000179','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','VM00001',36),
 ('0000180','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','MG00003',45);
INSERT INTO `resultadosraven` (`codresult`,`consistencia`,`percentil`,`diagnostico`,`codaspirante`,`puntaje`) VALUES 
 ('0000181','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','GE00003',42),
 ('0000182','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','GY00001',39),
 ('0000183','falso',0,'NO SE PUEDE DAR UN DIAGNOSTICO','SH00001',11),
 ('0000184','verdadera',10,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','RN00002',35),
 ('0000185','verdadera',10,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','JJ00001',34),
 ('0000186','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','DI00001',49),
 ('0000187','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','DG00001',44),
 ('0000188','verdadera',10,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','CA00001',33),
 ('0000189','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','CM00005',37),
 ('0000190','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','RJ00007',46),
 ('0000191','verdadera',75,'DEFINIDAMENTE SUPERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','AM00003',53);
INSERT INTO `resultadosraven` (`codresult`,`consistencia`,`percentil`,`diagnostico`,`codaspirante`,`puntaje`) VALUES 
 ('0000192','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','DM00001',45),
 ('0000193','verdadera',75,'DEFINIDAMENTE SUPERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','BE00001',50),
 ('0000194','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','MD00002',40),
 ('0000195','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','GN00001',41),
 ('0000196','verdadera',5,'DEFICIENTE MENTAL','GD00001',26),
 ('0000197','verdadera',10,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','VN00001',38),
 ('0000198','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','OR00001',44),
 ('0000199','verdadera',5,'DEFICIENTE MENTAL','OE00001',26),
 ('0000200','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','SM00002',46),
 ('0000201','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','GR00001',42),
 ('0000202','verdadera',10,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','GR00002',26);
INSERT INTO `resultadosraven` (`codresult`,`consistencia`,`percentil`,`diagnostico`,`codaspirante`,`puntaje`) VALUES 
 ('0000203','verdadera',10,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','FN00001',38),
 ('0000204','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','ED00001',48),
 ('0000205','falso',0,'NO SE PUEDE DAR UN DIAGNOSTICO','LJ00002',7),
 ('0000206','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','MC00002',47),
 ('0000207','verdadera',5,'DEFICIENTE MENTAL','MY00001',30),
 ('0000208','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','ML00001',40),
 ('0000209','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','SC00002',40),
 ('0000210','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','GD00002',42),
 ('0000211','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','FE00001',49),
 ('0000212','verdadera',5,'DEFICIENTE MENTAL','PE00003',23),
 ('0000213','verdadera',5,'DEFICIENTE MENTAL','HC00001',23),
 ('0000214','verdadera',10,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','HR00001',36),
 ('0000215','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','MW00002',41);
INSERT INTO `resultadosraven` (`codresult`,`consistencia`,`percentil`,`diagnostico`,`codaspirante`,`puntaje`) VALUES 
 ('0000216','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','TR00001',48),
 ('0000217','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','FY00001',46),
 ('0000218','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','VG00004',38),
 ('0000219','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','VM00002',41),
 ('0000220','verdadera',75,'DEFINIDAMENTE SUPERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','GG00001',52),
 ('0000221','verdadera',5,'DEFICIENTE MENTAL','FF00001',31),
 ('0000222','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','CY00002',36),
 ('0000223','verdadera',95,'INTELECTUALMENTE SUPERIOR','AN00002',54),
 ('0000224','verdadera',75,'DEFINIDAMENTE SUPERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','AH00001',52),
 ('0000225','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','GJ00004',45),
 ('0000226','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','RM00002',40);
INSERT INTO `resultadosraven` (`codresult`,`consistencia`,`percentil`,`diagnostico`,`codaspirante`,`puntaje`) VALUES 
 ('0000227','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','LE00001',44),
 ('0000228','verdadera',5,'DEFICIENTE MENTAL','RS00002',23),
 ('0000229','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','VN00002',45),
 ('0000230','verdadera',10,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','MO00001',37),
 ('0000231','falso',0,'NO SE PUEDE DAR UN DIAGNOSTICO','RL00001',12),
 ('0000232','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','VR00002',35),
 ('0000233','verdadera',5,'DEFICIENTE MENTAL','JX00001',27),
 ('0000234','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','CC00001',43),
 ('0000235','verdadera',25,'DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','QC00001',42),
 ('0000236','verdadera',75,'DEFINIDAMENTE SUPERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO','GJ00001',54),
 ('0000237','verdadera',50,'INTELECTUALMENTE TERMINO MEDIO','FR00001',46);
INSERT INTO `resultadosraven` (`codresult`,`consistencia`,`percentil`,`diagnostico`,`codaspirante`,`puntaje`) VALUES 
 ('0000238','falso',0,'NO SE PUEDE DAR UN DIAGNOSTICO','MR00003',14),
 ('0000239','verdadera',95,'INTELECTUALMENTE SUPERIOR','TF00001',59);
/*!40000 ALTER TABLE `resultadosraven` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
