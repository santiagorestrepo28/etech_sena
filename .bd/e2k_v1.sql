-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: e2k_v1
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acudiente`
--

DROP TABLE IF EXISTS `acudiente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acudiente` (
  `ID_ACUDIENTE` bigint NOT NULL,
  `IDENTIFICACION_P` bigint DEFAULT NULL,
  `ID_PARENTESCO` bigint DEFAULT NULL,
  `NOMBRE_A` varchar(40) DEFAULT NULL,
  `APELLIDO_A` varchar(40) DEFAULT NULL,
  `TELEFONO_A` varchar(255) DEFAULT NULL,
  `CORREO_A` varchar(100) DEFAULT NULL,
  `CIUDAD_A` varchar(20) DEFAULT NULL,
  `DIRECCION_A` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_ACUDIENTE`),
  UNIQUE KEY `UQ_TELEFONO_A` (`TELEFONO_A`),
  UNIQUE KEY `UQ_CORREO_A` (`CORREO_A`),
  KEY `ID_PARENTESCO` (`ID_PARENTESCO`),
  KEY `acudiente_ibfk_2` (`IDENTIFICACION_P`),
  CONSTRAINT `acudiente_ibfk_1` FOREIGN KEY (`ID_PARENTESCO`) REFERENCES `parentesco` (`ID_PARENTESCO`),
  CONSTRAINT `acudiente_ibfk_2` FOREIGN KEY (`IDENTIFICACION_P`) REFERENCES `dts_paciente` (`IDENTIFICACION_P`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acudiente`
--

LOCK TABLES `acudiente` WRITE;
/*!40000 ALTER TABLE `acudiente` DISABLE KEYS */;
INSERT INTO `acudiente` VALUES (6578291,1019156798,102,'Geraldine','Parra','3037682912','geraldine@gmail.com','Bogotá','Venecia');
/*!40000 ALTER TABLE `acudiente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agenda`
--

DROP TABLE IF EXISTS `agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agenda` (
  `ID_AGENDA` bigint NOT NULL AUTO_INCREMENT,
  `ID_PROFESIONAL` bigint DEFAULT NULL,
  `IDENTIFICACION_P` bigint DEFAULT NULL,
  `ID_SERVICIO` bigint DEFAULT NULL,
  `ID_TURNO` bigint DEFAULT NULL,
  `INICIO_FH` datetime DEFAULT NULL,
  `FIN_FH` datetime DEFAULT NULL,
  `DIARIO_FH` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_AGENDA`),
  KEY `IDENTIFICACION_P` (`IDENTIFICACION_P`),
  KEY `ID_SERVICIO` (`ID_SERVICIO`),
  KEY `ID_TURNO` (`ID_TURNO`),
  KEY `ID_PROFESIONAL` (`ID_PROFESIONAL`),
  CONSTRAINT `agenda_ibfk_1` FOREIGN KEY (`IDENTIFICACION_P`) REFERENCES `dts_paciente` (`IDENTIFICACION_P`),
  CONSTRAINT `agenda_ibfk_2` FOREIGN KEY (`ID_SERVICIO`) REFERENCES `servicio` (`ID_SERVICIO`),
  CONSTRAINT `agenda_ibfk_3` FOREIGN KEY (`ID_TURNO`) REFERENCES `turno` (`ID_TURNO`),
  CONSTRAINT `agenda_ibfk_4` FOREIGN KEY (`ID_PROFESIONAL`) REFERENCES `empleado` (`ID_PROFESIONAL`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda`
--

LOCK TABLES `agenda` WRITE;
/*!40000 ALTER TABLE `agenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `agenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `conteo_ingreso_hoy`
--

DROP TABLE IF EXISTS `conteo_ingreso_hoy`;
/*!50001 DROP VIEW IF EXISTS `conteo_ingreso_hoy`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `conteo_ingreso_hoy` AS SELECT 
 1 AS `Conteo de Ingresos Hoy`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `diario_agenda`
--

DROP TABLE IF EXISTS `diario_agenda`;
/*!50001 DROP VIEW IF EXISTS `diario_agenda`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `diario_agenda` AS SELECT 
 1 AS `conteo`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `dts_paciente`
--

DROP TABLE IF EXISTS `dts_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dts_paciente` (
  `IDENTIFICACION_P` bigint NOT NULL,
  `T_ID` varchar(50) DEFAULT NULL,
  `NOMBRE_P` varchar(50) DEFAULT NULL,
  `APELLIDO_P` varchar(50) DEFAULT NULL,
  `DIRECCION_P` varchar(100) DEFAULT NULL,
  `RH_P` varchar(255) DEFAULT NULL,
  `ID_EPS` bigint DEFAULT NULL,
  `SEXO` varchar(15) DEFAULT NULL,
  `EDAD` int DEFAULT NULL,
  `F_NAC` date DEFAULT NULL,
  `ALERGIA` varchar(100) DEFAULT NULL,
  `NIVEL_ALIMENTACION` varchar(30) DEFAULT NULL,
  `NIVEL_BAÑO` varchar(30) DEFAULT NULL,
  `NIVEL_AUTONOMIA` varchar(20) DEFAULT NULL,
  `ant_med` longblob,
  `PAÑAL` varchar(255) DEFAULT NULL,
  `AUDIFONOS` varchar(255) DEFAULT NULL,
  `MARCA_PASOS` varchar(255) DEFAULT NULL,
  `PROTESIS_DENTAL` varchar(255) DEFAULT NULL,
  `FECHA_INGRESO` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IS_DELETED` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`IDENTIFICACION_P`),
  KEY `ID_EPS` (`ID_EPS`),
  CONSTRAINT `dts_paciente_ibfk_1` FOREIGN KEY (`ID_EPS`) REFERENCES `eps` (`ID_EPS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dts_paciente`
--

LOCK TABLES `dts_paciente` WRITE;
/*!40000 ALTER TABLE `dts_paciente` DISABLE KEYS */;
INSERT INTO `dts_paciente` VALUES (1019156798,'C.C','Santiago','Restrepo','cra 24 b #42-80','O+',2,'Masculino',21,'2002-12-28','Gluten','Independiente','Independiente','Completa',NULL,'No','No','No','No','2024-09-17 02:21:07',0);
/*!40000 ALTER TABLE `dts_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `ID_PROFESIONAL` bigint NOT NULL,
  `IDENTIFICACION` bigint NOT NULL,
  PRIMARY KEY (`ID_PROFESIONAL`),
  KEY `fk_empleado_usuario` (`IDENTIFICACION`),
  CONSTRAINT `fk_empleado_usuario` FOREIGN KEY (`IDENTIFICACION`) REFERENCES `usuario` (`IDENTIFICACION`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (10011223,10011223),(11223344,11223344);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eps`
--

DROP TABLE IF EXISTS `eps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eps` (
  `ID_EPS` bigint NOT NULL,
  `EPS` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_EPS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eps`
--

LOCK TABLES `eps` WRITE;
/*!40000 ALTER TABLE `eps` DISABLE KEYS */;
INSERT INTO `eps` VALUES (1,'Coosalud'),(2,'Nueva EPS'),(3,'Mutual Ser'),(4,'Aliansalud EPS'),(5,'Salud Total'),(6,'EPS Sanitas'),(7,'EPS SURA'),(8,'Famisanar'),(9,'Salud Mia'),(10,'Compensar'),(11,'Asmet Salud'),(12,'Capital Salud EPS'),(13,'Salud Bolivar EPS');
/*!40000 ALTER TABLE `eps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hist_paciente`
--

DROP TABLE IF EXISTS `hist_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hist_paciente` (
  `ID_HPACIENTE` bigint NOT NULL,
  `IDENTIFICACION_P` bigint DEFAULT NULL,
  `ID_PROFESIONAL` bigint DEFAULT NULL,
  `ID_SV` bigint DEFAULT NULL,
  `F_HIST` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ACTIVIDAD` varchar(150) DEFAULT NULL,
  `MEDICAMENTO` varchar(100) DEFAULT NULL,
  `NOTA_ENFER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_HPACIENTE`),
  KEY `IDENTIFICACION_P` (`IDENTIFICACION_P`),
  KEY `ID_SV` (`ID_SV`),
  KEY `ID_PROFESIONAL` (`ID_PROFESIONAL`),
  CONSTRAINT `hist_paciente_ibfk_1` FOREIGN KEY (`IDENTIFICACION_P`) REFERENCES `dts_paciente` (`IDENTIFICACION_P`),
  CONSTRAINT `hist_paciente_ibfk_2` FOREIGN KEY (`ID_SV`) REFERENCES `signo_vital` (`ID_SV`),
  CONSTRAINT `hist_paciente_ibfk_3` FOREIGN KEY (`ID_PROFESIONAL`) REFERENCES `empleado` (`ID_PROFESIONAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hist_paciente`
--

LOCK TABLES `hist_paciente` WRITE;
/*!40000 ALTER TABLE `hist_paciente` DISABLE KEYS */;
/*!40000 ALTER TABLE `hist_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ingreso_hoy`
--

DROP TABLE IF EXISTS `ingreso_hoy`;
/*!50001 DROP VIEW IF EXISTS `ingreso_hoy`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ingreso_hoy` AS SELECT 
 1 AS `Nombre del Paciente`,
 1 AS `Nombre del Acudiente`,
 1 AS `Ubicación`,
 1 AS `Teléfono del Acudiente`,
 1 AS `Correo del Acudiente`,
 1 AS `Conteo de Pacientes`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `parentesco`
--

DROP TABLE IF EXISTS `parentesco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parentesco` (
  `ID_PARENTESCO` bigint NOT NULL,
  `T_PARENTESCO` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID_PARENTESCO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parentesco`
--

LOCK TABLES `parentesco` WRITE;
/*!40000 ALTER TABLE `parentesco` DISABLE KEYS */;
INSERT INTO `parentesco` VALUES (100,'Madre'),(101,'Padre'),(102,'Hermano/a'),(103,'Abuelo/a'),(104,'Cónyuge'),(105,'Hijo/a'),(106,'Tío/a');
/*!40000 ALTER TABLE `parentesco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `ID_ROL` bigint NOT NULL,
  `T_ROL` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_ROL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'administrador'),(2,'empleado');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio` (
  `ID_SERVICIO` bigint NOT NULL,
  `T_SERVICIO` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID_SERVICIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (200,'Enfermeria Domiciliaria'),(201,'Terapia Respiratoria'),(202,'Fisioterapia'),(203,'Inyectologia'),(204,'Cuidador');
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signo_vital`
--

DROP TABLE IF EXISTS `signo_vital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `signo_vital` (
  `ID_SV` bigint NOT NULL AUTO_INCREMENT,
  `FC_BPM` tinyint DEFAULT NULL,
  `PA_MMHG` varchar(20) DEFAULT NULL,
  `TEMP_C` tinyint DEFAULT NULL,
  `SPO2_PCT` tinyint DEFAULT NULL,
  `FR_RPM` tinyint DEFAULT NULL,
  `GLU_MGDL` tinyint DEFAULT NULL,
  PRIMARY KEY (`ID_SV`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signo_vital`
--

LOCK TABLES `signo_vital` WRITE;
/*!40000 ALTER TABLE `signo_vital` DISABLE KEYS */;
/*!40000 ALTER TABLE `signo_vital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turno`
--

DROP TABLE IF EXISTS `turno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turno` (
  `ID_TURNO` bigint NOT NULL,
  `T_ASIGNACION` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_TURNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turno`
--

LOCK TABLES `turno` WRITE;
/*!40000 ALTER TABLE `turno` DISABLE KEYS */;
INSERT INTO `turno` VALUES (500,'8 Horas'),(501,'12 Horas'),(502,'24 Horas'),(503,'48 Horas');
/*!40000 ALTER TABLE `turno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `IDENTIFICACION` bigint NOT NULL,
  `ID_ROL` bigint DEFAULT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `APELLIDO` varchar(50) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `CORREO_ELEC` varchar(100) DEFAULT NULL,
  `CONTRASEÑA` varchar(20) DEFAULT NULL,
  `DIRECCION` varchar(100) DEFAULT NULL,
  `rh` varchar(255) DEFAULT NULL,
  `IS_DELETED` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`IDENTIFICACION`),
  KEY `ID_ROL` (`ID_ROL`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`ID_ROL`) REFERENCES `rol` (`ID_ROL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (10011223,2,'Gabriel','Mendoza','3001122334','gabriel@gmail.com','Gabriel10','Avenida 11','B-',0),(11223344,2,'Mariana','Gonzalez','3112233445','mariana@gmail.com','Mariana11','Callejon 23','A+',0),(52072773,1,'Eladio','Restrepo','302456785','eladio@gmail.com','Eladio56','Calle 123','O+',0),(56794587,1,'Kleyner','De Luca','311496087','kleyner@gmail.com','Kleyner56','calle 100','A+',0);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'e2k_v1'
--

--
-- Dumping routines for database 'e2k_v1'
--
/*!50003 DROP PROCEDURE IF EXISTS `AgendamientoEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AgendamientoEmpleado`(IN identificacionEmpleado BIGINT)
BEGIN
    SELECT 
        u.IDENTIFICACION AS `Identificacion Empleado`,
        u.NOMBRE AS `Nombre Empleado`,
        u.APELLIDO AS `Apellido Empleado`,
        dp.IDENTIFICACION_P AS `Identificacion Paciente`,
        dp.NOMBRE_P AS `Nombre Paciente`,
        dp.APELLIDO_P AS `Apellido Paciente`,
        dp.DIRECCION_P AS `Direccion Paciente`,
        s.T_SERVICIO AS `Tipo de Servicio`,
        t.T_ASIGNACION AS `Tipo de Turno`,
        a.INICIO_FH AS `Inicio Horario`,
        a.FIN_FH AS `Fin Horario`
    FROM 
        usuario u
    INNER JOIN empleado e ON u.IDENTIFICACION = e.IDENTIFICACION
    INNER JOIN agenda a ON e.ID_PROFESIONAL = a.ID_PROFESIONAL
    INNER JOIN dts_paciente dp ON a.IDENTIFICACION_P = dp.IDENTIFICACION_P
    INNER JOIN servicio s ON a.ID_SERVICIO = s.ID_SERVICIO
    INNER JOIN turno t ON a.ID_TURNO = t.ID_TURNO
    WHERE 
        u.IDENTIFICACION = identificacionEmpleado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BorrarPacienteYAcudiente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BorrarPacienteYAcudiente`(
    IN p_IDENTIFICACION_P BIGINT, 
    IN p_ID_ACUDIENTE BIGINT    
)
BEGIN
    -- Eliminar el acudiente
    DELETE FROM acudiente WHERE IDENTIFICACION_P = p_IDENTIFICACION_P AND ID_ACUDIENTE = p_ID_ACUDIENTE;

    -- Eliminar el paciente
    DELETE FROM dts_paciente WHERE IDENTIFICACION_P = p_IDENTIFICACION_P;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarAgenda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarAgenda`(
    IN _idAgenda BIGINT,
    IN _diario DATETIME,
    IN _inicioFH DATETIME,
    IN _finFH DATETIME
)
BEGIN
    UPDATE agenda SET
        DIARIO_FH = _diario,
        INICIO_FH = _inicioFH,
        FIN_FH = _finFH
    WHERE
        ID_AGENDA = _idAgenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarEmpleado`(
    IN p_IDENTIFICACION_OLD BIGINT, -- Identificación original
    IN p_IDENTIFICACION_NEW BIGINT, -- Nueva identificación
    IN p_ID_ROL INT,
    IN p_NOMBRE VARCHAR(50),
    IN p_APELLIDO VARCHAR(50),
    IN p_TELEFONO VARCHAR(255),
    IN p_CORREO_ELEC VARCHAR(100),
    IN p_CONTRASEÑA VARCHAR(20),
    IN p_DIRECCION VARCHAR(100),
    IN p_RH VARCHAR(255)
)
BEGIN
    -- Actualizar si el empleado con la identificación original existe
    IF EXISTS (SELECT 1 FROM usuario WHERE IDENTIFICACION = p_IDENTIFICACION_OLD) THEN
        UPDATE usuario
        SET 
            IDENTIFICACION = p_IDENTIFICACION_NEW,  -- Cambiar la identificación
            ID_ROL = p_ID_ROL,
            NOMBRE = p_NOMBRE,
            APELLIDO = p_APELLIDO,
            TELEFONO = p_TELEFONO,
            CORREO_ELEC = p_CORREO_ELEC,
            CONTRASEÑA = p_CONTRASEÑA,
            DIRECCION = p_DIRECCION,
            RH = p_RH
        WHERE IDENTIFICACION = p_IDENTIFICACION_OLD;
    ELSE
        -- Insertar nuevo empleado si no existe
        INSERT INTO usuario (
            IDENTIFICACION, ID_ROL, NOMBRE, APELLIDO, TELEFONO, CORREO_ELEC, CONTRASEÑA, DIRECCION, RH
        ) VALUES (
            p_IDENTIFICACION_NEW, p_ID_ROL, p_NOMBRE, p_APELLIDO, p_TELEFONO, p_CORREO_ELEC, p_CONTRASEÑA, p_DIRECCION, p_RH
        );
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditarPaciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarPaciente`(
    IN p_IDENTIFICACION_P BIGINT,   -- Cambio de INT a BIGINT
    IN p_T_ID VARCHAR(50),
    IN p_NOMBRE_P VARCHAR(50),
    IN p_APELLIDO_P VARCHAR(50),
    IN p_DIRECCION_P VARCHAR(100),
    IN p_rh_p VARCHAR(255),
    IN p_ID_EPS BIGINT,             -- Cambio de INT a BIGINT
    IN p_SEXO VARCHAR(15),
    IN p_edad INT,
    IN p_F_NAC DATE,
    IN p_ALERGIA VARCHAR(100),
    IN p_NIVEL_ALIMENTACION VARCHAR(30),
    IN p_NIVEL_BAÑO VARCHAR(30),
    IN p_NIVEL_AUTONOMIA VARCHAR(20),
    IN p_ant_med LONGBLOB,
    IN p_pañal VARCHAR(255),
    IN p_audifonos VARCHAR(255),
    IN p_marca_pasos VARCHAR(255),
    IN p_protesis_dental VARCHAR(255),
    IN p_id_acudiente BIGINT,       -- BIGINT está bien aquí
    IN p_ID_PARENTESCO BIGINT,      -- Cambio de INT a BIGINT
    IN p_NOMBRE_A VARCHAR(40),
    IN p_APELLIDO_A VARCHAR(40),
    IN p_telefono_a VARCHAR(255),
    IN p_CORREO_A VARCHAR(100),
    IN p_CIUDAD_A VARCHAR(20),
    IN p_DIRECCION_A VARCHAR(100)
)
BEGIN
    -- Insertar o actualizar la información del paciente
    IF EXISTS (SELECT 1 FROM dts_paciente WHERE IDENTIFICACION_P = p_IDENTIFICACION_P) THEN
        -- Actualizar paciente existente
        UPDATE dts_paciente
        SET 
            T_ID = p_T_ID,
            NOMBRE_P = p_NOMBRE_P,
            APELLIDO_P = p_APELLIDO_P,
            DIRECCION_P = p_DIRECCION_P,
            rh_p = p_rh_p,
            ID_EPS = p_ID_EPS,
            SEXO = p_SEXO,
            edad = p_edad,
            F_NAC = p_F_NAC,
            ALERGIA = p_ALERGIA,
            NIVEL_ALIMENTACION = p_NIVEL_ALIMENTACION,
            NIVEL_BAÑO = p_NIVEL_BAÑO,
            NIVEL_AUTONOMIA = p_NIVEL_AUTONOMIA,
            ant_med = p_ant_med,
            pañal = p_pañal,
            audifonos = p_audifonos,
            marca_pasos = p_marca_pasos,
            protesis_dental = p_protesis_dental
        WHERE IDENTIFICACION_P = p_IDENTIFICACION_P;
    ELSE
        -- Insertar nuevo paciente
        INSERT INTO dts_paciente (
            IDENTIFICACION_P, T_ID, NOMBRE_P, APELLIDO_P, DIRECCION_P, rh_p, 
            ID_EPS, SEXO, edad, F_NAC, ALERGIA, NIVEL_ALIMENTACION, 
            NIVEL_BAÑO, NIVEL_AUTONOMIA, ant_med, pañal, audifonos, 
            marca_pasos, protesis_dental
        ) VALUES (
            p_IDENTIFICACION_P, p_T_ID, p_NOMBRE_P, p_APELLIDO_P, p_DIRECCION_P, p_rh_p, 
            p_ID_EPS, p_SEXO, p_edad, p_F_NAC, p_ALERGIA, p_NIVEL_ALIMENTACION, 
            p_NIVEL_BAÑO, p_NIVEL_AUTONOMIA, p_ant_med, p_pañal, p_audifonos, 
            p_marca_pasos, p_protesis_dental
        );
    END IF;

    -- Insertar o actualizar la información del acudiente
    IF EXISTS (SELECT 1 FROM acudiente WHERE id_acudiente = p_id_acudiente) THEN
        -- Actualizar acudiente existente
        UPDATE acudiente
        SET 
            IDENTIFICACION_P = p_IDENTIFICACION_P,
            ID_PARENTESCO = p_ID_PARENTESCO,
            NOMBRE_A = p_NOMBRE_A,
            APELLIDO_A = p_APELLIDO_A,
            telefono_a = p_telefono_a,
            CORREO_A = p_CORREO_A,
            CIUDAD_A = p_CIUDAD_A,
            DIRECCION_A = p_DIRECCION_A
        WHERE id_acudiente = p_id_acudiente;
    ELSE
        -- Insertar nuevo acudiente
        INSERT INTO acudiente (
            id_acudiente, IDENTIFICACION_P, ID_PARENTESCO, NOMBRE_A, 
            APELLIDO_A, telefono_a, CORREO_A, CIUDAD_A, DIRECCION_A
        ) VALUES (
            p_id_acudiente, p_IDENTIFICACION_P, p_ID_PARENTESCO, p_NOMBRE_A, 
            p_APELLIDO_A, p_telefono_a, p_CORREO_A, p_CIUDAD_A, p_DIRECCION_A
        );
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarPaciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarPaciente`(
    IN identificacionPaciente BIGINT
)
BEGIN
    UPDATE dts_paciente
    SET IS_DELETED = TRUE
    WHERE IDENTIFICACION_P = identificacionPaciente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MostrarPaciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarPaciente`()
BEGIN
    SELECT 
        p.IDENTIFICACION_P,
        p.T_ID,
        p.NOMBRE_P,
        p.APELLIDO_P,
        p.DIRECCION_P,
        p.rh_p,
        p.SEXO,
        p.edad,
        p.F_NAC,
        p.ALERGIA,
        p.NIVEL_ALIMENTACION,
        p.NIVEL_BAÑO,
        p.NIVEL_AUTONOMIA,
        p.ANT_MED,
        p.pañal,
        p.audifonos,
        p.marca_pasos,
        p.protesis_dental,
        p.fecha_ingreso,
        e.EPS,
        pa.T_PARENTESCO,
        a.id_acudiente,
        a.NOMBRE_A,
        a.APELLIDO_A,
        a.telefono_a,
        a.CORREO_A,
        a.CIUDAD_A,
        a.DIRECCION_A
    FROM dts_paciente p
    LEFT JOIN eps e ON p.ID_EPS = e.ID_EPS
    LEFT JOIN acudiente a ON p.IDENTIFICACION_P = a.IDENTIFICACION_P
    LEFT JOIN parentesco pa ON a.ID_PARENTESCO = pa.ID_PARENTESCO
    WHERE p.IS_DELETED = FALSE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MostrarPacientePorId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarPacientePorId`(IN pacienteId BIGINT)
BEGIN
    SELECT 
        p.IDENTIFICACION_P,
        p.T_ID,
        p.NOMBRE_P,
        p.APELLIDO_P,
        p.DIRECCION_P,
        p.rh_p,
        p.SEXO,
        p.edad,
        p.F_NAC,
        p.ALERGIA,
        p.NIVEL_ALIMENTACION,
        p.NIVEL_BAÑO,
        p.NIVEL_AUTONOMIA,
        p.ANT_MED,
        p.pañal,
        p.audifonos,
        p.marca_pasos,
        p.protesis_dental,
        p.fecha_ingreso,
        e.EPS,
        pa.T_PARENTESCO,
        a.id_acudiente,
        a.NOMBRE_A,
        a.APELLIDO_A,
        a.telefono_a,
        a.CORREO_A,
        a.CIUDAD_A,
        a.DIRECCION_A
    FROM dts_paciente p
    LEFT JOIN eps e ON p.ID_EPS = e.ID_EPS
    LEFT JOIN acudiente a ON p.IDENTIFICACION_P = a.IDENTIFICACION_P
    LEFT JOIN parentesco pa ON a.ID_PARENTESCO = pa.ID_PARENTESCO
    WHERE p.IDENTIFICACION_P = pacienteId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NotaEnfermeria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `NotaEnfermeria`(
    -- `Signo Vital`
    IN _FC_BPM TINYINT,
    IN _PA_MMHG VARCHAR(20),
    IN _TEMP_C TINYINT,
    IN _SPO2_PCT TINYINT,
    IN _FR_RPM TINYINT,
    IN _GLU_MGDL TINYINT,
    
    -- `Historia Paciente`
    IN _IDENTIFICACION_P BIGINT,    -- Cambio de INT a BIGINT
    IN _ID_PROFESIONAL BIGINT,      -- Cambio de INT a BIGINT
    IN _ACTIVIDAD VARCHAR(150),
    IN _MEDICAMENTO VARCHAR(100),
    IN _NOTA_ENFER VARCHAR(255)
)
BEGIN
    -- Inserta en `signo_vital`
    INSERT INTO signo_vital (FC_BPM, PA_MMHG, TEMP_C, SPO2_PCT, FR_RPM, GLU_MGDL)
    VALUES (_FC_BPM, _PA_MMHG, _TEMP_C, _SPO2_PCT, _FR_RPM, _GLU_MGDL);
    
    -- Obtiene el último ID insertado
    SET @UltimoID_SV = LAST_INSERT_ID();
    
    -- Inserta en `hist_paciente`
    INSERT INTO hist_paciente (ID_HPACIENTE, IDENTIFICACION_P, ID_PROFESIONAL, ID_SV, F_HIST, ACTIVIDAD, MEDICAMENTO, NOTA_ENFER)
    VALUES (@UltimoID_SV, _IDENTIFICACION_P, _ID_PROFESIONAL, @UltimoID_SV, NOW(), _ACTIVIDAD, _MEDICAMENTO, _NOTA_ENFER);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PerfilPaciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PerfilPaciente`(IN identificacionEmpleado BIGINT)
BEGIN
    SELECT 
        u.NOMBRE AS 'Nombre Empleado',
        u.APELLIDO AS 'Apellido Empleado',
        u.IDENTIFICACION AS 'ID Empleado',
        dp.NOMBRE_P AS 'Nombre Paciente', 
        dp.APELLIDO_P AS 'Apellido Paciente',
        dp.IDENTIFICACION_P AS 'ID Paciente',
        dp.DIRECCION_P AS 'Direccion',
        dp.rh_p AS 'Rh Paciente',
        e.EPS AS 'Nombre EPS',
        dp.SEXO AS 'Sexo Paciente',
        dp.edad AS 'Edad Paciente',
        dp.ALERGIA AS 'Alergia Paciente',
        dp.NIVEL_ALIMENTACION AS 'Nivel Alimentacion',
        dp.NIVEL_BAÑO AS 'Nivel Bano',
        dp.NIVEL_AUTONOMIA AS 'Nivel Autonomia',
        dp.ANT_MED AS 'Antecedentes Medicos',
        dp.pañal AS 'Panal',
        p.T_PARENTESCO AS 'Parentesco',
        a.NOMBRE_A AS 'Nombre Acudiente',
        a.APELLIDO_A AS 'Apellido Acudiente',
        a.telefono_a AS 'Telefono Acudiente',
        a.CIUDAD_A AS 'Ciudad Acudiente',
        dp.audifonos AS 'Audifonos',
        dp.marca_pasos AS 'Marca Pasos',
        dp.protesis_dental AS 'Protesis Dental'
    FROM 
        usuario u
        INNER JOIN empleado em ON u.IDENTIFICACION = em.IDENTIFICACION
        INNER JOIN agenda ag ON em.ID_PROFESIONAL = ag.ID_PROFESIONAL
        INNER JOIN dts_paciente dp ON ag.IDENTIFICACION_P = dp.IDENTIFICACION_P
        INNER JOIN acudiente a ON dp.IDENTIFICACION_P = a.IDENTIFICACION_P
        INNER JOIN eps e ON dp.ID_EPS = e.ID_EPS
        INNER JOIN parentesco p ON a.ID_PARENTESCO = p.ID_PARENTESCO
    WHERE 
        u.IDENTIFICACION = identificacionEmpleado
    ORDER BY 
        ag.INICIO_FH DESC 
    LIMIT 1; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReporteAgenda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReporteAgenda`()
BEGIN
    SELECT
        a.ID_AGENDA AS 'ID_AGENDA',
        a.DIARIO_FH AS 'DIARIO',
        CONCAT(u.NOMBRE, ' ', u.APELLIDO) AS 'Empleado',
        CONCAT(dp.NOMBRE_P, ' ', dp.APELLIDO_P) AS 'Paciente',
        s.T_SERVICIO AS 'Tipo de Servicio',
        t.T_ASIGNACION AS 'Tipo de Turno',
        a.INICIO_FH AS 'Fecha Inicio',
        a.FIN_FH AS 'Fecha Fin'
    FROM
        agenda a
        JOIN usuario u ON a.ID_PROFESIONAL = u.IDENTIFICACION   -- Tipo BIGINT en la columna
        JOIN dts_paciente dp ON a.IDENTIFICACION_P = dp.IDENTIFICACION_P  -- Tipo BIGINT en la columna
        JOIN servicio s ON a.ID_SERVICIO = s.ID_SERVICIO
        JOIN turno t ON a.ID_TURNO = t.ID_TURNO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReporteEnfermeria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReporteEnfermeria`()
BEGIN
    SELECT
        -- 0: ID de la agenda
        a.ID_AGENDA AS 'ID Agenda',
        
        -- 1: ID de la historia clínica
        h.ID_HPACIENTE AS 'ID Historia Clínica',
        
        -- 2: ID del paciente
        p.IDENTIFICACION_P AS 'ID Paciente',
        
        -- 3: Nombre del paciente
        p.NOMBRE_P AS 'Nombre Paciente',
        
        -- 4: Apellido del paciente
        p.APELLIDO_P AS 'Apellido Paciente',
        
        -- 5: Dirección del paciente
        p.DIRECCION_P AS 'Dirección',
        
        -- 6: Grupo sanguíneo del paciente
        p.RH_P AS 'Grupo Sanguíneo',
        
        -- 7: Sexo del paciente
        p.SEXO AS 'Sexo',
        
        -- 8: Edad del paciente
        p.EDAD AS 'Edad',
        
        -- 9: Alergias del paciente
        p.ALERGIA AS 'Alergias',
        
        -- 10: EPS del paciente
        eps.EPS AS 'EPS',
        
        -- 11: Identificación del empleado (profesional que atiende)
        e.IDENTIFICACION AS 'Identificación Empleado',
        
        -- 12: Nombre del profesional
        u.NOMBRE AS 'Nombre Profesional',
        
        -- 13: Apellido del profesional
        u.APELLIDO AS 'Apellido Profesional',
        
        -- 14: Servicio asignado
        s.T_SERVICIO AS 'Servicio',
        
        -- 15: Turno asignado
        t.T_ASIGNACION AS 'Turno',
        
        -- 16: Actividad registrada
        h.ACTIVIDAD AS 'Actividad',
        
        -- 17: Medicamento administrado
        h.MEDICAMENTO AS 'Medicamento',
        
        -- 18: Nota de enfermería
        h.NOTA_ENFER AS 'Nota Enfermería',
        
        -- 19: Frecuencia cardíaca (BPM)
        sv.FC_BPM AS 'Frecuencia Cardiaca (BPM)',
        
        -- 20: Presión arterial (mmHg)
        sv.PA_MMHG AS 'Presión Arterial (mmHg)',
        
        -- 21: Temperatura corporal (°C)
        sv.TEMP_C AS 'Temperatura (°C)',
        
        -- 22: Saturación de oxígeno (%)
        sv.SPO2_PCT AS 'Saturación Oxígeno (%)',
        
        -- 23: Frecuencia respiratoria (RPM)
        sv.FR_RPM AS 'Frecuencia Respiratoria (RPM)',
        
        -- 24: Nivel de glucosa en sangre (mg/dL)
        sv.GLU_MGDL AS 'Glucosa (mg/dL)',
        
        -- 25: Fecha y hora del registro de la historia
        h.F_HIST AS 'Fecha Historia'
    FROM
        hist_paciente h
    JOIN
        dts_paciente p ON h.IDENTIFICACION_P = p.IDENTIFICACION_P
    LEFT JOIN
        eps ON p.ID_EPS = eps.ID_EPS
    LEFT JOIN
        empleado e ON h.ID_PROFESIONAL = e.ID_PROFESIONAL
    LEFT JOIN
        usuario u ON e.IDENTIFICACION = u.IDENTIFICACION
    LEFT JOIN
        signo_vital sv ON h.ID_SV = sv.ID_SV
    LEFT JOIN
        agenda a ON p.IDENTIFICACION_P = a.IDENTIFICACION_P
    LEFT JOIN
        servicio s ON a.ID_SERVICIO = s.ID_SERVICIO
    LEFT JOIN
        turno t ON a.ID_TURNO = t.ID_TURNO
    ORDER BY
        h.F_HIST DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReporteEnfermeriaPorId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReporteEnfermeriaPorId`(
    IN idHistoriaClinica BIGINT -- ID de la historia clínica
)
BEGIN
    SELECT
        a.ID_AGENDA AS 'ID Agenda',
        h.ID_HPACIENTE AS 'ID Historia Clínica',
        p.IDENTIFICACION_P AS 'ID Paciente',
        p.NOMBRE_P AS 'Nombre Paciente',
        p.APELLIDO_P AS 'Apellido Paciente',
        u.IDENTIFICACION AS 'ID Empleado',
        u.NOMBRE AS 'Nombre Profesional',
        u.APELLIDO AS 'Apellido Profesional',
        s.T_SERVICIO AS 'Servicio',
        t.T_ASIGNACION AS 'Turno',
        h.F_HIST AS 'Fecha Historia',
        sv.FC_BPM AS 'Frecuencia Cardiaca (BPM)',
        sv.PA_MMHG AS 'Presión Arterial (mmHg)',
        sv.TEMP_C AS 'Temperatura (°C)',
        sv.SPO2_PCT AS 'Saturación Oxígeno (%)',
        sv.FR_RPM AS 'Frecuencia Respiratoria (RPM)',
        sv.GLU_MGDL AS 'Glucosa (mg/dL)',
        h.MEDICAMENTO AS 'Medicamento',
        h.NOTA_ENFER AS 'Nota Enfermería',
        h.ACTIVIDAD AS 'Actividad'
    FROM
        hist_paciente h
    JOIN
        dts_paciente p ON h.IDENTIFICACION_P = p.IDENTIFICACION_P
    LEFT JOIN
        usuario u ON h.ID_PROFESIONAL = u.IDENTIFICACION
    LEFT JOIN
        signo_vital sv ON h.ID_SV = sv.ID_SV
    LEFT JOIN
        agenda a ON p.IDENTIFICACION_P = a.IDENTIFICACION_P
    LEFT JOIN
        servicio s ON a.ID_SERVICIO = s.ID_SERVICIO
    LEFT JOIN
        turno t ON a.ID_TURNO = t.ID_TURNO
    WHERE
        h.ID_HPACIENTE = idHistoriaClinica -- Solo filtramos por idHistoriaClinica
    ORDER BY
        h.F_HIST DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `conteo_ingreso_hoy`
--

/*!50001 DROP VIEW IF EXISTS `conteo_ingreso_hoy`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `conteo_ingreso_hoy` AS select count(0) AS `Conteo de Ingresos Hoy` from `dts_paciente` where (`dts_paciente`.`FECHA_INGRESO` >= curdate()) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `diario_agenda`
--

/*!50001 DROP VIEW IF EXISTS `diario_agenda`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `diario_agenda` AS select count(0) AS `conteo` from `agenda` where (cast(`agenda`.`DIARIO_FH` as date) = curdate()) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ingreso_hoy`
--

/*!50001 DROP VIEW IF EXISTS `ingreso_hoy`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ingreso_hoy` AS select concat(`p`.`NOMBRE_P`,' ',`p`.`APELLIDO_P`) AS `Nombre del Paciente`,concat(`a`.`NOMBRE_A`,' ',`a`.`APELLIDO_A`) AS `Nombre del Acudiente`,`p`.`DIRECCION_P` AS `Ubicación`,`a`.`TELEFONO_A` AS `Teléfono del Acudiente`,`a`.`CORREO_A` AS `Correo del Acudiente`,count(`p`.`IDENTIFICACION_P`) OVER ()  AS `Conteo de Pacientes` from (`dts_paciente` `p` join `acudiente` `a` on((`p`.`IDENTIFICACION_P` = `a`.`IDENTIFICACION_P`))) where (`p`.`FECHA_INGRESO` >= curdate()) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-17  3:05:37
