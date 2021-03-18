-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2021 at 02:19 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ncf_db`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_factura` (IN `id_tipo_ncf` INT(11), IN `rnc` VARCHAR(12), IN `nombre` VARCHAR(500), IN `monto` DOUBLE)  begin
	DECLARE ncf_completo varchar(19);	
	DECLARE tipo_ncf varchar(10);
	DECLARE valorDesde int;
    DECLARE numDoc varchar(8);
   
  /* Buscando datos del tipo: tipo ncf*/

 set tipo_ncf = (SELECT TIPO from tipo_ncf where ID_NFC = id_tipo_ncf); 
   set valorDesde = (SELECT DESDE from tipo_ncf where ID_NFC = id_tipo_ncf);
   /*Generando el ncf y el numDoc*/
   set numDoc = LPAD(valorDesde+1,8,0);
   set ncf_completo = concat(tipo_ncf, '', numDoc);
  
  /*Insertar datos de factura*/
  INSERT INTO `factura`(`ID`, `RNC`, `NOMBRE_COMPANIA`, `NFC_TIP`, `NCF`, `HORA`, `FEC_DOC`, `MONTO`, `NUM_DOC`) 
  VALUES (0,rnc,nombre,id_tipo_ncf,ncf_completo,NOW(),now(),monto,numDoc);
 
 /* Actualizando el desde en el registro seleccionado en */
   update ncf_db.tipo_ncf set DESDE = valorDesde + 1 where ID_NFC = id_tipo_ncf;
  
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_rnc_data` (IN `rnc` INT, IN `name` VARCHAR(45))  BEGIN
insert into RNC_DATA values(rnc,name);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `create_tipo_ncf` (IN `nombre` VARCHAR(1000), IN `tipo` VARCHAR(1000), IN `fecha_vence` DATE, IN `desde` INT(11), IN `hasta` INT(11), IN `cta` VARCHAR(265))  begin
	insert into ncf_db.tipo_ncf values(0,nombre,tipo,fecha_vence,desde,hasta,cta);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_tipo_ncf` (IN `id` INT(11))  begin
	delete from ncf_db.tipo_ncf where ID_NFC = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_tipo_ncf` (IN `id` INT(11), IN `nombre` VARCHAR(1000), IN `tipo` VARCHAR(1000), IN `fecha_vence` DATE, IN `desde` INT(11), IN `hasta` INT(11), IN `cta` VARCHAR(265))  begin
	update tipo_ncf set NOMBRE_TIPO_NFC = nombre, TIPO = tipo, FECHA_VENCE = fecha_vence, DESDE =desde, HASTA = hasta, CTA = cta where ID_NFC = id; 
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `factura`
--

CREATE TABLE `factura` (
  `ID` int(11) NOT NULL,
  `RNC` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `NOMBRE_COMPANIA` text COLLATE utf8_spanish_ci NOT NULL,
  `NFC_TIP` int(11) NOT NULL DEFAULT 0,
  `NCF` varchar(19) COLLATE utf8_spanish_ci DEFAULT '0',
  `HORA` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FEC_DOC` date DEFAULT NULL,
  `MONTO` double NOT NULL DEFAULT 0,
  `NUM_DOC` varchar(8) COLLATE utf8_spanish_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `factura`
--

INSERT INTO `factura` (`ID`, `RNC`, `NOMBRE_COMPANIA`, `NFC_TIP`, `NCF`, `HORA`, `FEC_DOC`, `MONTO`, `NUM_DOC`) VALUES
(2, '101071559', 'JUAN AMELL SRL', 1, 'B0100000006', '2021-03-05 15:30:44', '2021-03-05', 2500, '00000006'),
(3, '101071559', 'JUAN AMELL SRL', 1, 'B0100000007', '2021-03-05 15:31:21', '2021-03-05', 3500, '00000007'),
(4, '101071559', 'JUAN AMELL SRL', 1, 'B0100000008', '2021-03-05 15:31:28', '2021-03-05', 6990, '00000008'),
(5, '101071559', 'JUAN AMELL SRL', 1, 'B0100000009', '2021-03-05 15:31:29', '2021-03-05', 6990, '00000009'),
(6, '101071559', 'JUAN AMELL SRL', 1, 'B0100000010', '2021-03-05 15:31:30', '2021-03-05', 6990, '00000010'),
(7, '101071559', 'JUAN AMELL SRL', 1, 'B0100000011', '2021-03-05 15:31:30', '2021-03-05', 6990, '00000011'),
(8, '101071559', 'JUAN AMELL SRL', 1, 'B0100000012', '2021-03-05 15:31:30', '2021-03-05', 6990, '00000012'),
(9, '101071559', 'JUAN AMELL SRL', 1, 'B0100000013', '2021-03-05 15:31:30', '2021-03-05', 6990, '00000013'),
(10, '101071559', 'JUAN AMELL SRL', 1, 'B0100000014', '2021-03-05 15:31:31', '2021-03-05', 6990, '00000014'),
(11, '101071559', 'JUAN AMELL SRL', 1, 'B0100000015', '2021-03-05 15:31:31', '2021-03-05', 6990, '00000015'),
(12, '101071559', 'JUAN AMELL SRL', 1, 'B0100000016', '2021-03-05 15:31:31', '2021-03-05', 6990, '00000016'),
(13, '101071559', 'JUAN AMELL SRL', 1, 'B0100000017', '2021-03-05 15:31:31', '2021-03-05', 6990, '00000017'),
(14, '101071559', 'JUAN AMELL SRL', 1, 'B0100000018', '2021-03-05 15:31:31', '2021-03-05', 6990, '00000018'),
(15, '101071559', 'JUAN AMELL SRL', 1, 'B0100000019', '2021-03-05 15:31:32', '2021-03-05', 6990, '00000019'),
(16, '101071559', 'JUAN AMELL SRL', 1, 'B0100000020', '2021-03-05 15:31:32', '2021-03-05', 6990, '00000020'),
(17, '101071559', 'JUAN AMELL SRL', 1, 'B0100000021', '2021-03-05 15:31:32', '2021-03-05', 6990, '00000021'),
(18, '101071559', 'JUAN AMELL SRL', 1, 'B0100000022', '2021-03-05 15:31:32', '2021-03-05', 6990, '00000022'),
(19, '101071559', 'JUAN AMELL SRL', 1, 'B0100000023', '2021-03-05 15:31:32', '2021-03-05', 6990, '00000023'),
(20, '101071559', 'JUAN AMELL SRL', 1, 'B0100000024', '2021-03-05 15:31:32', '2021-03-05', 6990, '00000024'),
(21, '101071559', 'JUAN AMELL SRL', 1, 'B0100000025', '2021-03-05 15:31:32', '2021-03-05', 6990, '00000025'),
(22, '101071559', 'JUAN AMELL SRL', 1, 'B0100000026', '2021-03-05 15:31:33', '2021-03-05', 6990, '00000026'),
(23, '101071559', 'JUAN AMELL SRL', 1, 'B0100000027', '2021-03-05 15:31:33', '2021-03-05', 6990, '00000027'),
(24, '101071559', 'JUAN AMELL SRL', 1, 'B0100000028', '2021-03-05 15:31:33', '2021-03-05', 6990, '00000028'),
(25, '101071559', 'JUAN AMELL SRL', 1, 'B0100000029', '2021-03-05 15:31:33', '2021-03-05', 6990, '00000029'),
(26, '101071559', 'JUAN AMELL SRL', 1, 'B0100000030', '2021-03-05 15:31:33', '2021-03-05', 6990, '00000030'),
(27, '101071559', 'JUAN AMELL SRL', 1, 'B0100000031', '2021-03-05 15:31:34', '2021-03-05', 6990, '00000031'),
(28, '101071559', 'JUAN AMELL SRL', 1, 'B0100000032', '2021-03-05 15:31:34', '2021-03-05', 6990, '00000032'),
(29, '101071559', 'JUAN AMELL SRL', 1, 'B0100000033', '2021-03-05 15:31:34', '2021-03-05', 6990, '00000033'),
(30, '101071559', 'JUAN AMELL SRL', 1, 'B0100000034', '2021-03-05 15:31:34', '2021-03-05', 6990, '00000034'),
(31, '101071559', 'JUAN AMELL SRL', 1, 'B0100000035', '2021-03-05 15:31:35', '2021-03-05', 6990, '00000035'),
(32, '101071559', 'JUAN AMELL SRL', 1, 'B0100000036', '2021-03-05 15:31:35', '2021-03-05', 6990, '00000036'),
(33, '101071559', 'JUAN AMELL SRL', 1, 'B0100000037', '2021-03-05 15:31:35', '2021-03-05', 6990, '00000037'),
(34, '101071559', 'JUAN AMELL SRL', 1, 'B0100000038', '2021-03-05 15:31:35', '2021-03-05', 6990, '00000038'),
(35, '101071559', 'JUAN AMELL SRL', 1, 'B0100000039', '2021-03-05 15:31:36', '2021-03-05', 6990, '00000039'),
(36, '101071559', 'JUAN AMELL SRL', 1, 'B0100000040', '2021-03-05 15:31:36', '2021-03-05', 6990, '00000040'),
(37, '101071559', 'JUAN AMELL SRL', 1, 'B0100000041', '2021-03-05 15:31:36', '2021-03-05', 6990, '00000041'),
(38, '101071559', 'JUAN AMELL SRL', 1, 'B0100000042', '2021-03-05 15:31:36', '2021-03-05', 6990, '00000042'),
(39, '101071559', 'JUAN AMELL SRL', 1, 'B0100000043', '2021-03-05 15:31:36', '2021-03-05', 6990, '00000043'),
(40, '101071559', 'JUAN AMELL SRL', 1, 'B0100000044', '2021-03-05 15:31:36', '2021-03-05', 6990, '00000044'),
(41, '101071559', 'JUAN AMELL SRL', 1, 'B0100000045', '2021-03-05 15:31:36', '2021-03-05', 6990, '00000045'),
(42, '101071559', 'JUAN AMELL SRL', 1, 'B0100000046', '2021-03-05 15:31:36', '2021-03-05', 6990, '00000046'),
(43, '101071559', 'JUAN AMELL SRL', 1, 'B0100000047', '2021-03-05 15:31:36', '2021-03-05', 6990, '00000047'),
(44, '101071559', 'JUAN AMELL SRL', 1, 'B0100000048', '2021-03-05 15:31:37', '2021-03-05', 6990, '00000048'),
(45, '101071559', 'JUAN AMELL SRL', 1, 'B0100000049', '2021-03-05 15:31:37', '2021-03-05', 6990, '00000049'),
(46, '101071559', 'JUAN AMELL SRL', 1, 'B0100000050', '2021-03-05 15:31:37', '2021-03-05', 6990, '00000050'),
(47, '101071559', 'JUAN AMELL SRL', 1, 'B0100000051', '2021-03-05 15:31:37', '2021-03-05', 6990, '00000051'),
(48, '101071559', 'JUAN AMELL SRL', 1, 'B0100000052', '2021-03-05 15:31:37', '2021-03-05', 6990, '00000052'),
(49, '101071559', 'JUAN AMELL SRL', 1, 'B0100000053', '2021-03-05 15:31:37', '2021-03-05', 6990, '00000053'),
(50, '101071559', 'JUAN AMELL SRL', 1, 'B0100000054', '2021-03-05 15:31:37', '2021-03-05', 6990, '00000054'),
(51, '101071559', 'JUAN AMELL SRL', 1, 'B0100000055', '2021-03-05 15:31:37', '2021-03-05', 6990, '00000055'),
(52, '101071559', 'JUAN AMELL SRL', 1, 'B0100000056', '2021-03-05 15:31:37', '2021-03-05', 6990, '00000056'),
(53, '101071559', 'JUAN AMELL SRL', 1, 'B0100000057', '2021-03-05 15:31:37', '2021-03-05', 6990, '00000057'),
(54, '101071559', 'JUAN AMELL SRL', 1, 'B0100000058', '2021-03-05 15:31:38', '2021-03-05', 6990, '00000058'),
(55, '101071559', 'JUAN AMELL SRL', 1, 'B0100000059', '2021-03-05 15:31:38', '2021-03-05', 6990, '00000059'),
(56, '101071559', 'JUAN AMELL SRL', 1, 'B0100000060', '2021-03-05 15:31:38', '2021-03-05', 6990, '00000060'),
(57, '101071559', 'JUAN AMELL SRL', 1, 'B0100000061', '2021-03-05 15:31:38', '2021-03-05', 6990, '00000061'),
(58, '101071559', 'JUAN AMELL SRL', 1, 'B0100000062', '2021-03-05 15:31:38', '2021-03-05', 6990, '00000062'),
(59, '101071559', 'JUAN AMELL SRL', 1, 'B0100000063', '2021-03-05 15:31:38', '2021-03-05', 6990, '00000063'),
(60, '101071559', 'JUAN AMELL SRL', 1, 'B0100000064', '2021-03-05 15:31:38', '2021-03-05', 6990, '00000064'),
(61, '101071559', 'JUAN AMELL SRL', 1, 'B0100000065', '2021-03-05 15:31:38', '2021-03-05', 6990, '00000065'),
(62, '101071559', 'JUAN AMELL SRL', 1, 'B0100000066', '2021-03-05 15:31:38', '2021-03-05', 6990, '00000066'),
(63, '101071559', 'JUAN AMELL SRL', 1, 'B0100000067', '2021-03-05 15:31:39', '2021-03-05', 6990, '00000067'),
(64, '101071559', 'JUAN AMELL SRL', 1, 'B0100000068', '2021-03-05 15:31:39', '2021-03-05', 6990, '00000068'),
(65, '101071559', 'JUAN AMELL SRL', 1, 'B0100000069', '2021-03-05 15:31:39', '2021-03-05', 6990, '00000069'),
(66, '101071559', 'JUAN AMELL SRL', 1, 'B0100000070', '2021-03-05 15:31:39', '2021-03-05', 6990, '00000070'),
(67, '101071559', 'JUAN AMELL SRL', 1, 'B0100000071', '2021-03-05 15:31:39', '2021-03-05', 6990, '00000071'),
(68, '101071559', 'JUAN AMELL SRL', 1, 'B0100000072', '2021-03-05 15:31:39', '2021-03-05', 6990, '00000072'),
(69, '101071559', 'JUAN AMELL SRL', 1, 'B0100000073', '2021-03-05 15:31:39', '2021-03-05', 6990, '00000073'),
(70, '101071559', 'JUAN AMELL SRL', 1, 'B0100000074', '2021-03-05 15:31:39', '2021-03-05', 6990, '00000074'),
(71, '101071559', 'JUAN AMELL SRL', 1, 'B0100000075', '2021-03-05 15:31:39', '2021-03-05', 6990, '00000075'),
(72, '101071559', 'JUAN AMELL SRL', 1, 'B0100000076', '2021-03-05 15:31:39', '2021-03-05', 6990, '00000076'),
(73, '101071559', 'JUAN AMELL SRL', 1, 'B0100000077', '2021-03-05 15:31:39', '2021-03-05', 6990, '00000077'),
(74, '101071559', 'JUAN AMELL SRL', 1, 'B0100000078', '2021-03-05 15:31:40', '2021-03-05', 6990, '00000078'),
(75, '101071559', 'JUAN AMELL SRL', 1, 'B0100000079', '2021-03-05 15:31:40', '2021-03-05', 6990, '00000079'),
(76, '101071559', 'JUAN AMELL SRL', 1, 'B0100000080', '2021-03-05 15:31:40', '2021-03-05', 6990, '00000080'),
(77, '101071559', 'JUAN AMELL SRL', 1, 'B0100000081', '2021-03-05 15:31:40', '2021-03-05', 6990, '00000081'),
(78, '101071559', 'JUAN AMELL SRL', 1, 'B0100000082', '2021-03-05 15:31:40', '2021-03-05', 6990, '00000082'),
(79, '101071559', 'JUAN AMELL SRL', 1, 'B0100000083', '2021-03-05 15:31:40', '2021-03-05', 6990, '00000083'),
(80, '101071559', 'JUAN AMELL SRL', 1, 'B0100000084', '2021-03-05 15:31:40', '2021-03-05', 6990, '00000084'),
(81, '101071559', 'JUAN AMELL SRL', 1, 'B0100000085', '2021-03-05 15:31:40', '2021-03-05', 6990, '00000085'),
(82, '101071559', 'JUAN AMELL SRL', 1, 'B0100000086', '2021-03-05 15:31:40', '2021-03-05', 6990, '00000086'),
(83, '101071559', 'JUAN AMELL SRL', 1, 'B0100000087', '2021-03-05 15:31:40', '2021-03-05', 6990, '00000087'),
(84, '101071559', 'JUAN AMELL SRL', 1, 'B0100000088', '2021-03-05 15:31:40', '2021-03-05', 6990, '00000088'),
(85, '101071559', 'JUAN AMELL SRL', 1, 'B0100000089', '2021-03-05 15:31:40', '2021-03-05', 6990, '00000089'),
(86, '101071559', 'JUAN AMELL SRL', 1, 'B0100000090', '2021-03-05 15:31:40', '2021-03-05', 6990, '00000090'),
(87, '101071559', 'JUAN AMELL SRL', 1, 'B0100000091', '2021-03-05 15:31:40', '2021-03-05', 6990, '00000091'),
(88, '101071559', 'JUAN AMELL SRL', 1, 'B0100000092', '2021-03-05 15:31:40', '2021-03-05', 6990, '00000092'),
(89, '101071559', 'JUAN AMELL SRL', 1, 'B0100000093', '2021-03-05 15:31:40', '2021-03-05', 6990, '00000093'),
(90, '101071559', 'JUAN AMELL SRL', 1, 'B0100000094', '2021-03-05 15:31:40', '2021-03-05', 6990, '00000094'),
(91, '101071559', 'JUAN AMELL SRL', 1, 'B0100000095', '2021-03-05 15:31:41', '2021-03-05', 6990, '00000095'),
(92, '101071559', 'JUAN AMELL SRL', 1, 'B0100000096', '2021-03-05 15:31:41', '2021-03-05', 6990, '00000096'),
(93, '101071559', 'JUAN AMELL SRL', 1, 'B0100000097', '2021-03-05 15:31:41', '2021-03-05', 6990, '00000097'),
(94, '101071559', 'JUAN AMELL SRL', 1, 'B0100000098', '2021-03-05 15:31:41', '2021-03-05', 6990, '00000098'),
(95, '101071559', 'JUAN AMELL SRL', 1, 'B0100000099', '2021-03-05 15:31:41', '2021-03-05', 6990, '00000099'),
(96, '101071559', 'JUAN AMELL SRL', 1, 'B0100000100', '2021-03-05 15:31:41', '2021-03-05', 6990, '00000100'),
(97, '101071559', 'JUAN AMELL SRL', 1, 'B0100000101', '2021-03-05 15:31:41', '2021-03-05', 6990, '00000101'),
(98, '101071559', 'JUAN AMELL SRL', 1, 'B0100000102', '2021-03-05 15:31:42', '2021-03-05', 6990, '00000102'),
(99, '101071559', 'JUAN AMELL SRL', 1, 'B0100000103', '2021-03-05 15:31:45', '2021-03-05', 6990, '00000103'),
(100, '101071559', 'JUAN AMELL SRL', 1, 'B0100000104', '2021-03-05 15:31:46', '2021-03-05', 6990, '00000104'),
(101, '101071559', 'JUAN AMELL SRL', 1, 'B0100000105', '2021-03-05 15:31:47', '2021-03-05', 6990, '00000105'),
(102, '101071559', 'JUAN AMELL SRL', 1, 'B0100000106', '2021-03-05 15:31:52', '2021-03-05', 6990, '00000106'),
(103, '101071559', 'JUAN AMELL SRL', 1, 'B0100000107', '2021-03-05 15:31:53', '2021-03-05', 6990, '00000107'),
(104, '101071559', 'JUAN AMELL SRL', 1, 'B0100000108', '2021-03-05 15:31:54', '2021-03-05', 6990, '00000108'),
(105, '101071559', 'JUAN AMELL SRL', 1, 'B0100000109', '2021-03-05 15:31:55', '2021-03-05', 6990, '00000109'),
(106, '101071559', 'JUAN AMELL SRL', 1, 'B0100000110', '2021-03-05 15:31:55', '2021-03-05', 6990, '00000110'),
(107, '101071559', 'JUAN AMELL SRL', 1, 'B0100000111', '2021-03-05 15:31:56', '2021-03-05', 6990, '00000111'),
(108, '101071559', 'JUAN AMELL SRL', 1, 'B0100000112', '2021-03-05 15:31:56', '2021-03-05', 6990, '00000112'),
(109, '101071559', 'JUAN AMELL SRL', 1, 'B0100000113', '2021-03-05 15:31:56', '2021-03-05', 6990, '00000113'),
(110, '101071559', 'JUAN AMELL SRL', 1, 'B0100000114', '2021-03-05 15:31:56', '2021-03-05', 6990, '00000114'),
(111, '101071559', 'JUAN AMELL SRL', 1, 'B0100000115', '2021-03-05 15:31:56', '2021-03-05', 6990, '00000115'),
(112, '101071559', 'JUAN AMELL SRL', 1, 'B0100000116', '2021-03-05 15:31:57', '2021-03-05', 6990, '00000116'),
(113, '101071559', 'JUAN AMELL SRL', 1, 'B0100000117', '2021-03-05 15:31:57', '2021-03-05', 6990, '00000117'),
(114, '101071559', 'JUAN AMELL SRL', 1, 'B0100000118', '2021-03-05 15:31:57', '2021-03-05', 6990, '00000118'),
(115, '101071559', 'JUAN AMELL SRL', 1, 'B0100000119', '2021-03-05 15:31:57', '2021-03-05', 6990, '00000119'),
(116, '101071559', 'JUAN AMELL SRL', 1, 'B0100000120', '2021-03-05 15:31:57', '2021-03-05', 6990, '00000120'),
(117, '101071559', 'JUAN AMELL SRL', 1, 'B0100000121', '2021-03-05 15:31:57', '2021-03-05', 6990, '00000121'),
(118, '101071559', 'JUAN AMELL SRL', 1, 'B0100000122', '2021-03-05 15:31:57', '2021-03-05', 6990, '00000122'),
(119, '101071559', 'JUAN AMELL SRL', 1, 'B0100000123', '2021-03-05 15:31:57', '2021-03-05', 6990, '00000123'),
(120, '101071559', 'JUAN AMELL SRL', 1, 'B0100000124', '2021-03-05 15:31:57', '2021-03-05', 6990, '00000124'),
(121, '101071559', 'JUAN AMELL SRL', 1, 'B0100000125', '2021-03-05 15:31:58', '2021-03-05', 6990, '00000125'),
(122, '101071559', 'JUAN AMELL SRL', 1, 'B0100000126', '2021-03-05 15:31:58', '2021-03-05', 6990, '00000126'),
(123, '101071559', 'JUAN AMELL SRL', 1, 'B0100000127', '2021-03-05 15:31:58', '2021-03-05', 6990, '00000127'),
(124, '101071559', 'JUAN AMELL SRL', 1, 'B0100000128', '2021-03-05 15:31:58', '2021-03-05', 6990, '00000128'),
(125, '101071559', 'JUAN AMELL SRL', 1, 'B0100000129', '2021-03-05 15:31:58', '2021-03-05', 6990, '00000129'),
(126, '101071559', 'JUAN AMELL SRL', 1, 'B0100000130', '2021-03-05 15:31:58', '2021-03-05', 6990, '00000130'),
(127, '101071559', 'JUAN AMELL SRL', 1, 'B0100000131', '2021-03-05 15:31:58', '2021-03-05', 6990, '00000131'),
(128, '101071559', 'JUAN AMELL SRL', 1, 'B0100000132', '2021-03-05 15:31:58', '2021-03-05', 6990, '00000132'),
(129, '101071559', 'JUAN AMELL SRL', 1, 'B0100000133', '2021-03-05 15:31:58', '2021-03-05', 6990, '00000133'),
(130, '101071559', 'JUAN AMELL SRL', 1, 'B0100000134', '2021-03-05 15:31:59', '2021-03-05', 6990, '00000134'),
(131, '101071559', 'JUAN AMELL SRL', 1, 'B0100000135', '2021-03-05 15:31:59', '2021-03-05', 6990, '00000135'),
(132, '101071559', 'JUAN AMELL SRL', 1, 'B0100000136', '2021-03-05 15:31:59', '2021-03-05', 6990, '00000136'),
(133, '101071559', 'JUAN AMELL SRL', 1, 'B0100000137', '2021-03-05 15:31:59', '2021-03-05', 6990, '00000137'),
(134, '101071559', 'JUAN AMELL SRL', 1, 'B0100000138', '2021-03-05 15:31:59', '2021-03-05', 6990, '00000138'),
(135, '101071559', 'JUAN AMELL SRL', 1, 'B0100000139', '2021-03-05 15:31:59', '2021-03-05', 6990, '00000139'),
(136, '101071559', 'JUAN AMELL SRL', 1, 'B0100000140', '2021-03-05 15:31:59', '2021-03-05', 6990, '00000140'),
(137, '101071559', 'JUAN AMELL SRL', 1, 'B0100000141', '2021-03-05 15:31:59', '2021-03-05', 6990, '00000141'),
(138, '101071559', 'JUAN AMELL SRL', 1, 'B0100000142', '2021-03-05 15:31:59', '2021-03-05', 6990, '00000142'),
(139, '101071559', 'JUAN AMELL SRL', 1, 'B0100000143', '2021-03-05 15:58:25', '2021-03-05', 2500, '00000143');

-- --------------------------------------------------------

--
-- Table structure for table `rnc_data`
--

CREATE TABLE `rnc_data` (
  `RNC` int(11) NOT NULL,
  `NOMBRE` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_ncf`
--

CREATE TABLE `tipo_ncf` (
  `ID_NFC` int(11) NOT NULL,
  `NOMBRE_TIPO_NFC` varchar(1000) COLLATE utf8_spanish_ci NOT NULL,
  `TIPO` varchar(1000) COLLATE utf8_spanish_ci NOT NULL,
  `FECHA_VENCE` date NOT NULL,
  `DESDE` int(11) NOT NULL,
  `HASTA` int(11) NOT NULL,
  `CTA` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Minimo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `tipo_ncf`
--

INSERT INTO `tipo_ncf` (`ID_NFC`, `NOMBRE_TIPO_NFC`, `TIPO`, `FECHA_VENCE`, `DESDE`, `HASTA`, `CTA`, `Minimo`) VALUES
(1, 'COMPROBANTE FISCAL', 'B01', '2025-08-01', 143, 633, 'A', 0),
(3, 'Factura de Crédito Fiscal', 'A01', '2025-09-23', 933, 1300, 'B', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `factura_FK` (`NFC_TIP`);

--
-- Indexes for table `rnc_data`
--
ALTER TABLE `rnc_data`
  ADD PRIMARY KEY (`RNC`);

--
-- Indexes for table `tipo_ncf`
--
ALTER TABLE `tipo_ncf`
  ADD PRIMARY KEY (`ID_NFC`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `factura`
--
ALTER TABLE `factura`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `tipo_ncf`
--
ALTER TABLE `tipo_ncf`
  MODIFY `ID_NFC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_FK` FOREIGN KEY (`NFC_TIP`) REFERENCES `tipo_ncf` (`ID_NFC`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;