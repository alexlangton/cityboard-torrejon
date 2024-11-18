-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for cityboardtorrejon
CREATE DATABASE IF NOT EXISTS `cityboardtorrejon` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `cityboardtorrejon`;

-- Dumping structure for table cityboardtorrejon.carteles
CREATE TABLE IF NOT EXISTS `carteles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del cartel',
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre del cartel',
  `latitud` decimal(10,7) unsigned DEFAULT NULL COMMENT 'Latitud geográfica del cartel',
  `longitud` decimal(10,7) NOT NULL COMMENT 'Longitud geográfica del cartel',
  `id_tipocartel` int(11) NOT NULL COMMENT 'Id de tipo de cartel',
  `rotativo` mediumtext COLLATE utf8mb4_unicode_ci COMMENT 'Texto rotativo o desplazante de cartel',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_latitud_longitud` (`latitud`,`longitud`),
  KEY `FK_carteles_c_tiposcarteles` (`id_tipocartel`),
  CONSTRAINT `FK_carteles_c_tiposcarteles` FOREIGN KEY (`id_tipocartel`) REFERENCES `c_tiposcarteles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cityboardtorrejon.carteles: ~4 rows (approximately)
/*!40000 ALTER TABLE `carteles` DISABLE KEYS */;
INSERT IGNORE INTO `carteles` (`id`, `nombre`, `latitud`, `longitud`, `id_tipocartel`, `rotativo`) VALUES
	(1, 'Juzgados', 40.4581746, -3.4835560, 2, '¡DESCUBRE TORREJÓN! EXPLORA CULTURA, GASTRONOMÍA Y NATURALEZA – #VIVATORREJÓN Y SUS PAISANOS!!'),
	(2, 'Cartel 4', 40.4513001, -3.4698002, 3, 'TORREJÓN TE ESPERA: EVENTOS, PARQUES Y MUCHO MÁS – ¡DISFRÚTALO!'),
	(3, 'Cartel 2', 40.4458556, -3.4928928, 3, 'VIVE TORREJÓN: HISTORIA, SABORES Y NATURALEZA A TU ALCANCE'),
	(4, 'kkkkkk', 40.4426216, -3.4575384, 3, 'TORREJÓN, CIUDAD DE OPORTUNIDADES: VEN Y DESCÚBRELO');
/*!40000 ALTER TABLE `carteles` ENABLE KEYS */;

-- Dumping structure for table cityboardtorrejon.c_estados
CREATE TABLE IF NOT EXISTS `c_estados` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del estado',
  `nombre_estado` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Nombre del estado',
  `descripcion` mediumtext COLLATE utf8mb4_unicode_ci COMMENT 'Descripción del estado',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cityboardtorrejon.c_estados: ~45 rows (approximately)
/*!40000 ALTER TABLE `c_estados` DISABLE KEYS */;
INSERT IGNORE INTO `c_estados` (`id`, `nombre_estado`, `descripcion`) VALUES
	(1, 'activo', 'El cartel está activo y funcionando correctamente'),
	(2, 'inactivo', 'El cartel está inactivo y no está mostrando contenido'),
	(3, 'mantenimiento', 'El cartel está en mantenimiento'),
	(4, 'desinstalado', 'El cartel ha sido desinstalado'),
	(5, 'error', 'El cartel presenta un error técnico'),
	(6, 'activo', 'El cartel está activo y funcionando correctamente'),
	(7, 'inactivo', 'El cartel está inactivo y no está mostrando contenido'),
	(8, 'mantenimiento', 'El cartel está en mantenimiento'),
	(9, 'desinstalado', 'El cartel ha sido desinstalado'),
	(10, 'error', 'El cartel presenta un error técnico'),
	(11, 'activo', 'El cartel está activo y funcionando correctamente'),
	(12, 'inactivo', 'El cartel está inactivo y no está mostrando contenido'),
	(13, 'mantenimiento', 'El cartel está en mantenimiento'),
	(14, 'desinstalado', 'El cartel ha sido desinstalado'),
	(15, 'error', 'El cartel presenta un error técnico'),
	(16, 'activo', 'El cartel está activo y funcionando correctamente'),
	(17, 'inactivo', 'El cartel está inactivo y no está mostrando contenido'),
	(18, 'mantenimiento', 'El cartel está en mantenimiento'),
	(19, 'desinstalado', 'El cartel ha sido desinstalado'),
	(20, 'error', 'El cartel presenta un error técnico'),
	(21, 'activo', 'El cartel está activo y funcionando correctamente'),
	(22, 'inactivo', 'El cartel está inactivo y no está mostrando contenido'),
	(23, 'mantenimiento', 'El cartel está en mantenimiento'),
	(24, 'desinstalado', 'El cartel ha sido desinstalado'),
	(25, 'error', 'El cartel presenta un error técnico'),
	(26, 'activo', 'El cartel está activo y funcionando correctamente'),
	(27, 'inactivo', 'El cartel está inactivo y no está mostrando contenido'),
	(28, 'mantenimiento', 'El cartel está en mantenimiento'),
	(29, 'desinstalado', 'El cartel ha sido desinstalado'),
	(30, 'error', 'El cartel presenta un error técnico'),
	(31, 'activo', 'El cartel está activo y funcionando correctamente'),
	(32, 'inactivo', 'El cartel está inactivo y no está mostrando contenido'),
	(33, 'mantenimiento', 'El cartel está en mantenimiento'),
	(34, 'desinstalado', 'El cartel ha sido desinstalado'),
	(35, 'error', 'El cartel presenta un error técnico'),
	(36, 'activo', 'El cartel está activo y funcionando correctamente'),
	(37, 'inactivo', 'El cartel está inactivo y no está mostrando contenido'),
	(38, 'mantenimiento', 'El cartel está en mantenimiento'),
	(39, 'desinstalado', 'El cartel ha sido desinstalado'),
	(40, 'error', 'El cartel presenta un error técnico'),
	(41, 'activo', 'El cartel está activo y funcionando correctamente'),
	(42, 'inactivo', 'El cartel está inactivo y no está mostrando contenido'),
	(43, 'mantenimiento', 'El cartel está en mantenimiento'),
	(44, 'desinstalado', 'El cartel ha sido desinstalado'),
	(45, 'error', 'El cartel presenta un error técnico');
/*!40000 ALTER TABLE `c_estados` ENABLE KEYS */;

-- Dumping structure for table cityboardtorrejon.c_tiposcarteles
CREATE TABLE IF NOT EXISTS `c_tiposcarteles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del tipo de cartel',
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Descripción del tipo de cartel',
  `atributos` mediumtext COLLATE utf8mb4_unicode_ci COMMENT 'Atributos adicionales del tipo de cartel',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Tabla que almacena los diferentes tipos de carteles';

-- Dumping data for table cityboardtorrejon.c_tiposcarteles: ~4 rows (approximately)
/*!40000 ALTER TABLE `c_tiposcarteles` DISABLE KEYS */;
INSERT IGNORE INTO `c_tiposcarteles` (`id`, `descripcion`, `atributos`) VALUES
	(1, 'Cartel Torrejón', '{\r\n  "ocupacionParkings": [\r\n    {\r\n      "nombre": "Parking A",\r\n      "ocupacion": 120\r\n    },\r\n    {\r\n      "nombre": "Parking B",\r\n      "ocupacion": 85\r\n    },\r\n    {\r\n      "nombre": "Parking C",\r\n      "ocupacion": 150\r\n    },\r\n    {\r\n      "nombre": "Parking D",\r\n      "ocupacion": 60\r\n    }\r\n  ]\r\n}\r\n'),
	(2, 'Cartel Mini', '{\r\n  "ocupacionParkings": [\r\n    {\r\n      "nombre": "Parking A",\r\n      "ocupacion": 120\r\n    },\r\n    {\r\n      "nombre": "Parking B",\r\n      "ocupacion": 85\r\n    },\r\n    {\r\n      "nombre": "Parking C",\r\n      "ocupacion": 150\r\n    },\r\n    {\r\n      "nombre": "Parking D",\r\n      "ocupacion": 60\r\n    }\r\n  ]\r\n}\r\n'),
	(3, 'Cartel Torrejón sin rotulo', '{\r\n  "ocupacionParkings": [\r\n    {\r\n      "nombre": "Parking A",\r\n      "ocupacion": 120\r\n    },\r\n    {\r\n      "nombre": "Parking B",\r\n      "ocupacion": 85\r\n    },\r\n    {\r\n      "nombre": "Parking C",\r\n      "ocupacion": 150\r\n    },\r\n    {\r\n      "nombre": "Parking D",\r\n      "ocupacion": 60\r\n    }\r\n  ]\r\n}\r\n'),
	(19, 'k', '{\r\n  "ocupacionParkings": [\r\n    {\r\n      "nombre": "Parking A",\r\n      "ocupacion": 120\r\n    },\r\n    {\r\n      "nombre": "Parking B",\r\n      "ocupacion": 85\r\n    },\r\n    {\r\n      "nombre": "Parking C",\r\n      "ocupacion": 150\r\n    },\r\n    {\r\n      "nombre": "Parking D",\r\n      "ocupacion": 60\r\n    }\r\n  ]\r\n}\r\n');
/*!40000 ALTER TABLE `c_tiposcarteles` ENABLE KEYS */;

-- Dumping structure for table cityboardtorrejon.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del usuario',
  `nombre` varchar(255) NOT NULL COMMENT 'Nombre completo del usuario',
  `email` varchar(255) NOT NULL UNIQUE COMMENT 'Correo electrónico único del usuario',
  `pass` varchar(255) NOT NULL COMMENT 'Contraseña del usuario encriptada',
  `token` varchar(255) DEFAULT NULL COMMENT 'Token de autenticación del usuario',
  `ultimo_inicio_sesion` datetime DEFAULT NULL COMMENT 'Fecha y hora del último acceso del usuario',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Datos iniciales para la tabla usuarios (opcional)
INSERT INTO `usuarios` (`nombre`, `email`, `pass`) VALUES
('Admin', 'admin@cityboard.es', '08e0d1d321c2dec865ecb12199e0d35a70958bdf909a171a5c0f982073d0d126');

-- Dumping structure for table cityboardtorrejon.parametros_cartel
CREATE TABLE IF NOT EXISTS `parametros_cartel` (
  `fecha_actualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha y hora de la última actualización',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único de cada parámetro',
  `id_cartel` int(11) NOT NULL COMMENT 'Referencia al ID del cartel relacionado',
  `clave` varchar(255) NOT NULL COMMENT 'Nombre del parámetro o clave',
  `valor` text NOT NULL COMMENT 'Valor asociado al parámetro',
  PRIMARY KEY (`id`),
  KEY `fk_parametros_cartel_id_cartel` (`id_cartel`),
  CONSTRAINT `fk_parametros_cartel_id_cartel` FOREIGN KEY (`id_cartel`) REFERENCES `carteles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los parámetros y configuraciones de un cartel';

-- Dumping data for table cityboardtorrejon.parametros_cartel: ~0 rows (approximately)
/*!40000 ALTER TABLE `parametros_cartel` DISABLE KEYS */;
/*!40000 ALTER TABLE `parametros_cartel` ENABLE KEYS */;

-- Dumping structure for table cityboardtorrejon.parametros_counters
CREATE TABLE IF NOT EXISTS `parametros_counters` (
  `codinsclo` varchar(50) NOT NULL COMMENT 'Código de instalación en la nube',
  `id` int(11) NOT NULL COMMENT 'Identificador único del contador',
  `fecha_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha y hora de la última actualización',
  `description` varchar(255) NOT NULL COMMENT 'Descripción del contador',
  `value_expression` varchar(50) DEFAULT NULL COMMENT 'Expresión del valor (si corresponde)',
  `value` int(11) DEFAULT NULL COMMENT 'Valor del contador',
  PRIMARY KEY (`id`,`codinsclo`,`description`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena información sobre los contadores de espacios (Parámetros y sus valores)';

-- Dumping data for table cityboardtorrejon.parametros_counters: ~10 rows (approximately)
/*!40000 ALTER TABLE `parametros_counters` DISABLE KEYS */;
INSERT IGNORE INTO `parametros_counters` (`codinsclo`, `id`, `fecha_actualizacion`, `description`, `value_expression`, `value`) VALUES
	('1067', 1, '2024-10-14 17:14:01', 'Contador reservas dentro', '', 6),
	('1362', 1, '2024-10-15 10:46:00', 'Total plazas libres', 'PLZ1', 1),
	('1363', 1, '2024-10-15 10:44:01', 'Total plazas libres', 'TPL', 8),
	('1364', 1, '2024-10-15 10:46:01', 'Total plazas libres', 'TPL', 29),
	('1365', 1, '2024-10-15 10:42:01', 'Plazas libres rotacion', 'PLZ1', 714),
	('1067', 2, '2024-10-14 17:14:01', 'Plazas totales', 'TPA', 600),
	('1067', 3, '2024-10-14 17:56:01', 'Plazas libres', 'TPL', 590),
	('1067', 4, '2024-10-14 17:56:01', 'Plazas ocupadas', 'TPO', 10),
	('1067', 5, '2024-10-14 18:28:01', 'vehicleEntranceCount', '', 0),
	('1067', 6, '2024-10-14 17:14:01', 'vehicleExitCount', '', 0);
/*!40000 ALTER TABLE `parametros_counters` ENABLE KEYS */;

-- Dumping structure for table cityboardtorrejon.parametros_signs
CREATE TABLE IF NOT EXISTS `parametros_signs` (
  `codinsclo` varchar(50) NOT NULL COMMENT 'Código de instalación en la nube',
  `id` int(11) NOT NULL COMMENT 'Identificador único del cartel',
  `fecha_actualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha y hora de la última actualización',
  `description` varchar(255) NOT NULL COMMENT 'Descripción del cartel',
  `activation_expression` varchar(255) DEFAULT NULL COMMENT 'Expresión de activación del cartel',
  `activated` tinyint(1) NOT NULL COMMENT 'Estado de activación del cartel (0 o 1)',
  `forced` tinyint(1) NOT NULL COMMENT 'Estado forzado del cartel (0 o 1)',
  PRIMARY KEY (`id`,`description`,`codinsclo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena información sobre los carteles (Parámetros y sus valores)';

-- Dumping data for table cityboardtorrejon.parametros_signs: ~4 rows (approximately)
/*!40000 ALTER TABLE `parametros_signs` DISABLE KEYS */;
INSERT IGNORE INTO `parametros_signs` (`codinsclo`, `id`, `fecha_actualizacion`, `description`, `activation_expression`, `activated`, `forced`) VALUES
	('1067', 1, '2024-10-15 10:46:01', 'Cartel 1', 'PLZ1 <= 0', 0, 0),
	('1363', 1, '2024-10-15 10:46:01', 'Cartel 1', 'TPL <= 0', 0, 1),
	('1364', 1, '2024-10-15 10:46:01', 'Cartel 1', 'TPL <= 0', 0, 0),
	('1362', 1, '2024-10-15 10:46:00', 'Cartel P', 'PLZ1 <= 0', 0, 0);
/*!40000 ALTER TABLE `parametros_signs` ENABLE KEYS */;

-- Dumping structure for table cityboardtorrejon.parametros_zones
CREATE TABLE IF NOT EXISTS `parametros_zones` (
  `codinsclo` varchar(50) NOT NULL COMMENT 'Código de instalación en la nube',
  `id` int(11) NOT NULL COMMENT 'Identificador único de la zona',
  `fecha_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha y hora de la última actualización',
  `description` varchar(255) NOT NULL COMMENT 'Descripción de la zona',
  `total_spaces` int(11) NOT NULL COMMENT 'Total de plazas en la zona',
  `available_spaces` int(11) NOT NULL COMMENT 'Espacios disponibles en la zona',
  `occupied_spaces` int(11) NOT NULL COMMENT 'Espacios ocupados en la zona',
  PRIMARY KEY (`id`,`description`,`codinsclo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena información sobre las zonas de estacionamiento (Parámetros y sus valores)';

-- Dumping data for table cityboardtorrejon.parametros_zones: ~13 rows (approximately)
/*!40000 ALTER TABLE `parametros_zones` DISABLE KEYS */;
INSERT IGNORE INTO `parametros_zones` (`codinsclo`, `id`, `fecha_actualizacion`, `description`, `total_spaces`, `available_spaces`, `occupied_spaces`) VALUES
	('1363', 1, '2024-10-15 10:44:01', 'PLAZAS', 100, 8, 92),
	('1364', 1, '2024-10-15 10:46:01', 'PLAZAS', 247, 29, 218),
	('1067', 1, '2024-10-14 17:56:01', 'Rotacion', 544, 534, 10),
	('1362', 1, '2024-10-15 10:46:00', 'Rotación', 100, 1, 99),
	('1365', 1, '2024-10-15 10:42:01', 'Rotación', 585, 714, -129),
	('1067', 2, '2024-10-14 17:20:34', 'Abonados', 150, 150, 0),
	('1362', 2, '2024-10-15 10:32:00', 'Abonados', 200, 15, 185),
	('1067', 3, '2024-10-14 17:20:34', 'Reservas', 10, 10, 0),
	('1067', 5, '2024-10-14 17:20:34', 'Apps', 500, 500, 0),
	('1067', 6, '2024-10-14 17:20:34', 'Prueba 1', 250, 250, 0),
	('1067', 7, '2024-10-14 17:20:34', 'Prueba 2', 250, 250, 0),
	('1067', 8, '2024-10-14 17:20:34', 'Feria', 2, 2, 0),
	('1067', 9, '2024-10-14 17:20:34', 'Carnaval', 10, 10, 0);
/*!40000 ALTER TABLE `parametros_zones` ENABLE KEYS */;

-- Dumping structure for table cityboardtorrejon.parkings
CREATE TABLE IF NOT EXISTS `parkings` (
  `codinsclo` bigint(20) NOT NULL COMMENT 'Código de instalación en la nube',
  `latitud` decimal(10,7) DEFAULT NULL COMMENT 'Latitud geográfica del cartel',
  `longitud` decimal(10,7) DEFAULT NULL COMMENT 'Longitud geográfica del cartel',
  `nombre` varchar(255) NOT NULL COMMENT 'Nombre del parking',
  `direccion` varchar(255) DEFAULT NULL COMMENT 'Dirección del parking',
  `ciudad` varchar(100) DEFAULT NULL COMMENT 'Ciudad donde está ubicado el parking',
  `codigo_postal` varchar(10) DEFAULT NULL COMMENT 'Código postal del parking',
  `json_counters` text COMMENT 'Json obtenido de SagaCloudServidor',
  `ultima_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha y hora de la última actualización',
  PRIMARY KEY (`codinsclo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cityboardtorrejon.parkings: ~4 rows (approximately)
/*!40000 ALTER TABLE `parkings` DISABLE KEYS */;
INSERT IGNORE INTO `parkings` (`codinsclo`, `latitud`, `longitud`, `nombre`, `direccion`, `ciudad`, `codigo_postal`, `json_counters`, `ultima_actualizacion`) VALUES
	(1362, 40.4632256, -3.4638016, 'PARQUE CENTRAL', 'C/ Cervantes nº 9', 'Torrejon de Ardoz', '28850', '{"zones":[{"id":1,"description":"Rotaci\\u00F3n","total_spaces":100,"available_spaces":61,"occupied_spaces":39}, {"id":2,"description":"Abonados","total_spaces":200,"available_spaces":23,"occupied_spaces":177}],"counters":[{"id":1,"description":"Total plazas libres","value_expression":"PLZ1","value":61}],"signs":[{"id":1,"description":"Cartel P","activation_expression":"PLZ1 <= 0","activated":0,"forced":0}]}', '2024-11-06 13:47:00'),
	(1363, 40.4557132, -3.4824138, 'PLAZA ESPAÑA', 'PZA. ESPAÑA S/N', 'TORREJON DE ARDOZ', '28850', '{"zones":[{"id":1,"description":"PLAZAS","total_spaces":100,"available_spaces":6,"occupied_spaces":94}],"counters":[{"id":1,"description":"Total plazas libres","value_expression":"TPL","value":6}],"signs":[{"id":1,"description":"Cartel 1","activation_expression":"TPL <= 0","activated":0,"forced":1}]}', '2024-11-06 13:49:00'),
	(1364, 40.4461946, -3.4814858, 'PLAZA MAYOR2', 'PLAZA MAYOR S/M', 'TORREJÓN DE ARDOZ', '28850', '{"zones":[{"id":1,"description":"PLAZAS","total_spaces":247,"available_spaces":46,"occupied_spaces":201}],"counters":[{"id":1,"description":"Total plazas libres","value_expression":"TPL","value":46}],"signs":[{"id":1,"description":"Cartel 1","activation_expression":"TPL <= 0","activated":0,"forced":0}]}', '2024-11-06 13:49:00'),
	(1365, 40.4426216, -3.7083743, 'SOTO HENARES', 'FELIX CANDELA 54 5 A', 'MADRID', '28055', '{"zones":[{"id":1,"description":"Rotaci\\u00F3n","total_spaces":585,"available_spaces":265,"occupied_spaces":320}],"counters":[{"id":1,"description":"Plazas libres rotacion","value_expression":"PLZ1","value":265}],"signs":[]}', '2024-11-06 13:49:00');
/*!40000 ALTER TABLE `parkings` ENABLE KEYS */;

-- Dumping structure for table cityboardtorrejon.variables
CREATE TABLE IF NOT EXISTS `variables` (
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha y hora de la última actualización',
  `clave` varchar(100) NOT NULL COMMENT 'Clave del parámetro',
  `valor` text NOT NULL COMMENT 'Valor del parámetro',
  PRIMARY KEY (`clave`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabla de parámetros con claves, valores y fecha de actualización';

-- Dumping data for table cityboardtorrejon.variables: ~225 rows (approximately)
/*!40000 ALTER TABLE `variables` DISABLE KEYS */;
INSERT IGNORE INTO `variables` (`fecha`, `clave`, `valor`) VALUES
	('2024-10-24 18:10:16', '1035.counters.1.description', 'Total plazas ocupadas'),
	('2024-10-24 18:10:16', '1035.counters.1.value', '322'),
	('2024-10-24 18:10:16', '1035.counters.1.value_expression', 'TPO'),
	('2024-10-24 18:10:16', '1035.counters.2.description', 'Total plazas libres'),
	('2024-10-24 18:10:16', '1035.counters.2.value', '1388'),
	('2024-10-24 18:10:16', '1035.counters.2.value_expression', 'PLZ2 + PLZ1 + PLZ3 + PLZ4'),
	('2024-10-24 18:10:16', '1035.counters.3.description', 'Plazas Libres Rotación Subs.'),
	('2024-10-24 18:10:16', '1035.counters.3.value', '475'),
	('2024-10-24 18:10:16', '1035.counters.3.value_expression', 'PLZ1'),
	('2024-10-24 18:10:16', '1035.counters.4.description', 'Plazas libres Abonados Subs.'),
	('2024-10-24 18:10:16', '1035.counters.4.value', '337'),
	('2024-10-24 18:10:16', '1035.counters.4.value_expression', 'PLZ2'),
	('2024-10-24 18:10:16', '1035.counters.5.description', 'Plazas libres Rotación Superficie'),
	('2024-10-24 18:10:16', '1035.counters.5.value', '491'),
	('2024-10-24 18:10:16', '1035.counters.5.value_expression', 'PLZ3'),
	('2024-10-24 18:10:16', '1035.counters.6.description', 'Abonados Superficie'),
	('2024-10-24 18:10:16', '1035.counters.6.value', '85'),
	('2024-10-24 18:10:16', '1035.counters.6.value_expression', 'PLZ4'),
	('2024-10-24 18:10:16', '1035.zones.1.available_spaces', '475'),
	('2024-10-24 18:10:16', '1035.zones.1.description', 'Rotacion Subterraneo'),
	('2024-10-24 18:10:16', '1035.zones.1.occupied_spaces', '25'),
	('2024-10-24 18:10:16', '1035.zones.1.total_spaces', '500'),
	('2024-10-24 18:10:16', '1035.zones.2.available_spaces', '337'),
	('2024-10-24 18:10:16', '1035.zones.2.description', 'Abonados Subterraneo'),
	('2024-10-24 18:10:16', '1035.zones.2.occupied_spaces', '133'),
	('2024-10-24 18:10:16', '1035.zones.2.total_spaces', '470'),
	('2024-10-24 18:10:16', '1035.zones.3.available_spaces', '491'),
	('2024-10-24 18:10:16', '1035.zones.3.description', 'Rotacion Superficie'),
	('2024-10-24 18:10:16', '1035.zones.3.occupied_spaces', '109'),
	('2024-10-24 18:10:16', '1035.zones.3.total_spaces', '600'),
	('2024-10-24 18:10:16', '1035.zones.4.available_spaces', '85'),
	('2024-10-24 18:10:16', '1035.zones.4.description', 'Abonados Superficie'),
	('2024-10-24 18:10:16', '1035.zones.4.occupied_spaces', '55'),
	('2024-10-24 18:10:16', '1035.zones.4.total_spaces', '140'),
	('2024-10-28 12:56:01', '1067.counters.1.description', 'Contador reservas dentro'),
	('2024-10-29 09:49:01', '1067.counters.1.value', '5'),
	('2024-10-28 12:56:02', '1067.counters.1.value_expression', ''),
	('2024-10-28 12:56:02', '1067.counters.2.description', 'Plazas totales'),
	('2024-10-28 12:56:02', '1067.counters.2.value', '600'),
	('2024-10-28 12:56:02', '1067.counters.2.value_expression', 'TPA'),
	('2024-10-28 12:56:02', '1067.counters.3.description', 'Plazas libres'),
	('2024-10-29 12:19:01', '1067.counters.3.value', '556'),
	('2024-10-28 12:56:02', '1067.counters.3.value_expression', 'TPL'),
	('2024-10-28 12:56:02', '1067.counters.4.description', 'Plazas ocupadas'),
	('2024-10-29 12:19:01', '1067.counters.4.value', '44'),
	('2024-10-28 12:56:02', '1067.counters.4.value_expression', 'TPO'),
	('2024-10-28 12:56:02', '1067.counters.5.description', 'vehicleEntranceCount'),
	('2024-10-29 12:49:01', '1067.counters.5.value', '0'),
	('2024-10-28 12:56:02', '1067.counters.5.value_expression', ''),
	('2024-10-28 12:56:02', '1067.counters.6.description', 'vehicleExitCount'),
	('2024-10-28 12:56:02', '1067.counters.6.value', '0'),
	('2024-10-28 12:56:02', '1067.counters.6.value_expression', ''),
	('2024-10-29 14:17:02', '1067.signs.1.activated', '0'),
	('2024-10-28 12:56:02', '1067.signs.1.activation_expression', 'PLZ1 <= 0'),
	('2024-10-28 12:56:02', '1067.signs.1.description', 'Cartel 1'),
	('2024-10-29 13:54:02', '1067.signs.1.forced', '1'),
	('2024-10-29 12:19:01', '1067.zones.1.available_spaces', '500'),
	('2024-10-28 12:56:02', '1067.zones.1.description', 'Rotacion'),
	('2024-10-29 12:19:01', '1067.zones.1.occupied_spaces', '44'),
	('2024-10-28 12:56:02', '1067.zones.1.total_spaces', '544'),
	('2024-10-28 12:56:02', '1067.zones.2.available_spaces', '150'),
	('2024-10-28 12:56:02', '1067.zones.2.description', 'Abonados'),
	('2024-10-28 12:56:02', '1067.zones.2.occupied_spaces', '0'),
	('2024-10-28 12:56:02', '1067.zones.2.total_spaces', '150'),
	('2024-10-28 12:56:02', '1067.zones.3.available_spaces', '10'),
	('2024-10-28 12:56:02', '1067.zones.3.description', 'Reservas'),
	('2024-10-28 12:56:02', '1067.zones.3.occupied_spaces', '0'),
	('2024-10-28 12:56:02', '1067.zones.3.total_spaces', '10'),
	('2024-10-28 12:56:02', '1067.zones.5.available_spaces', '500'),
	('2024-10-28 12:56:02', '1067.zones.5.description', 'Apps'),
	('2024-10-28 12:56:02', '1067.zones.5.occupied_spaces', '0'),
	('2024-10-28 12:56:02', '1067.zones.5.total_spaces', '500'),
	('2024-10-28 12:56:02', '1067.zones.6.available_spaces', '250'),
	('2024-10-28 12:56:02', '1067.zones.6.description', 'Prueba 1'),
	('2024-10-28 12:56:02', '1067.zones.6.occupied_spaces', '0'),
	('2024-10-28 12:56:02', '1067.zones.6.total_spaces', '250'),
	('2024-10-28 12:56:02', '1067.zones.7.available_spaces', '250'),
	('2024-10-28 12:56:02', '1067.zones.7.description', 'Prueba 2'),
	('2024-10-28 12:56:02', '1067.zones.7.occupied_spaces', '0'),
	('2024-10-28 12:56:02', '1067.zones.7.total_spaces', '250'),
	('2024-10-28 12:56:02', '1067.zones.8.available_spaces', '2'),
	('2024-10-28 12:56:02', '1067.zones.8.description', 'Feria'),
	('2024-10-28 12:56:02', '1067.zones.8.occupied_spaces', '0'),
	('2024-10-28 12:56:02', '1067.zones.8.total_spaces', '2'),
	('2024-10-28 12:56:02', '1067.zones.9.available_spaces', '10'),
	('2024-10-28 12:56:02', '1067.zones.9.description', 'Carnaval'),
	('2024-10-28 12:56:02', '1067.zones.9.occupied_spaces', '0'),
	('2024-10-28 12:56:02', '1067.zones.9.total_spaces', '10'),
	('2024-10-15 17:37:23', '1362.counters.1.description', 'Total plazas libres'),
	('2024-10-31 13:01:00', '1362.counters.1.value', '20'),
	('2024-10-15 17:37:23', '1362.counters.1.value_expression', 'PLZ1'),
	('2024-10-30 11:07:01', '1362.signs.1.activated', '0'),
	('2024-10-15 17:37:23', '1362.signs.1.activation_expression', 'PLZ1 <= 0'),
	('2024-10-15 17:37:23', '1362.signs.1.description', 'Cartel P'),
	('2024-10-30 11:09:00', '1362.signs.1.forced', '0'),
	('2024-10-31 13:01:00', '1362.zones.1.available_spaces', '20'),
	('2024-10-15 17:37:23', '1362.zones.1.description', 'Rotación'),
	('2024-10-31 13:01:00', '1362.zones.1.occupied_spaces', '80'),
	('2024-10-15 17:37:23', '1362.zones.1.total_spaces', '100'),
	('2024-10-31 12:51:00', '1362.zones.2.available_spaces', '15'),
	('2024-10-15 17:37:23', '1362.zones.2.description', 'Abonados'),
	('2024-10-31 12:51:00', '1362.zones.2.occupied_spaces', '185'),
	('2024-10-15 17:37:23', '1362.zones.2.total_spaces', '200'),
	('2024-10-15 17:37:23', '1363.counters.1.description', 'Total plazas libres'),
	('2024-10-31 13:01:00', '1363.counters.1.value', '7'),
	('2024-10-15 17:37:23', '1363.counters.1.value_expression', 'TPL'),
	('2024-10-31 07:21:00', '1363.signs.1.activated', '0'),
	('2024-10-15 17:37:24', '1363.signs.1.activation_expression', 'TPL <= 0'),
	('2024-10-15 17:37:24', '1363.signs.1.description', 'Cartel 1'),
	('2024-10-15 17:37:24', '1363.signs.1.forced', '1'),
	('2024-10-31 13:01:00', '1363.zones.1.available_spaces', '7'),
	('2024-10-15 17:37:23', '1363.zones.1.description', 'PLAZAS'),
	('2024-10-31 13:01:00', '1363.zones.1.occupied_spaces', '93'),
	('2024-10-15 17:37:23', '1363.zones.1.total_spaces', '100'),
	('2024-10-15 17:37:24', '1364.counters.1.description', 'Total plazas libres'),
	('2024-10-31 12:58:01', '1364.counters.1.value', '62'),
	('2024-10-15 17:37:24', '1364.counters.1.value_expression', 'TPL'),
	('2024-10-15 17:37:24', '1364.signs.1.activated', '0'),
	('2024-10-15 17:37:24', '1364.signs.1.activation_expression', 'TPL <= 0'),
	('2024-10-15 17:37:24', '1364.signs.1.description', 'Cartel 1'),
	('2024-10-15 17:37:24', '1364.signs.1.forced', '0'),
	('2024-10-31 12:58:01', '1364.zones.1.available_spaces', '62'),
	('2024-10-15 17:37:24', '1364.zones.1.description', 'PLAZAS'),
	('2024-10-31 12:58:01', '1364.zones.1.occupied_spaces', '185'),
	('2024-10-15 17:37:24', '1364.zones.1.total_spaces', '247'),
	('2024-10-15 17:37:24', '1365.counters.1.description', 'Plazas libres rotacion'),
	('2024-10-31 13:00:02', '1365.counters.1.value', '280'),
	('2024-10-15 17:37:24', '1365.counters.1.value_expression', 'PLZ1'),
	('2024-10-31 13:00:02', '1365.zones.1.available_spaces', '280'),
	('2024-10-15 17:37:24', '1365.zones.1.description', 'Rotación'),
	('2024-10-31 13:00:02', '1365.zones.1.occupied_spaces', '305'),
	('2024-10-15 17:37:24', '1365.zones.1.total_spaces', '585'),
	('2024-10-29 18:22:02', '903.counters.1.description', 'Club'),
	('2024-10-29 18:22:02', '903.counters.1.value', '3'),
	('2024-10-29 18:22:02', '903.counters.1.value_expression', ''),
	('2024-10-29 18:22:02', '903.counters.10.description', 'Total plazas ocupadas'),
	('2024-10-29 18:23:02', '903.counters.10.value', '151'),
	('2024-10-29 18:22:02', '903.counters.10.value_expression', 'POZ1'),
	('2024-10-29 18:22:02', '903.counters.11.description', 'ROTACION'),
	('2024-10-29 18:24:01', '903.counters.11.value', '95'),
	('2024-10-29 18:22:02', '903.counters.11.value_expression', ''),
	('2024-10-29 18:22:02', '903.counters.2.description', 'Motos'),
	('2024-10-29 18:22:02', '903.counters.2.value', '12'),
	('2024-10-29 18:22:02', '903.counters.2.value_expression', ''),
	('2024-10-29 18:22:02', '903.counters.3.description', 'Propietarios'),
	('2024-10-29 18:22:02', '903.counters.3.value', '120'),
	('2024-10-29 18:22:02', '903.counters.3.value_expression', ''),
	('2024-10-29 18:22:02', '903.counters.4.description', 'Mañanas'),
	('2024-10-29 18:22:02', '903.counters.4.value', '0'),
	('2024-10-29 18:22:02', '903.counters.4.value_expression', ''),
	('2024-10-29 18:22:02', '903.counters.5.description', 'Mañana y Tarde'),
	('2024-10-29 18:22:02', '903.counters.5.value', '3'),
	('2024-10-29 18:22:02', '903.counters.5.value_expression', ''),
	('2024-10-29 18:22:02', '903.counters.6.description', 'Nocturno'),
	('2024-10-29 18:22:02', '903.counters.6.value', '0'),
	('2024-10-29 18:22:02', '903.counters.6.value_expression', ''),
	('2024-10-29 18:22:02', '903.counters.7.description', 'Tarde'),
	('2024-10-29 18:22:02', '903.counters.7.value', '0'),
	('2024-10-29 18:22:02', '903.counters.7.value_expression', ''),
	('2024-10-29 18:22:02', '903.counters.8.description', '24 Horas'),
	('2024-10-29 18:22:02', '903.counters.8.value', '44'),
	('2024-10-29 18:22:02', '903.counters.8.value_expression', ''),
	('2024-10-29 18:22:02', '903.counters.9.description', 'Total plazas libres'),
	('2024-10-29 18:23:02', '903.counters.9.value', '188'),
	('2024-10-29 18:22:02', '903.counters.9.value_expression', 'PLZ1'),
	('2024-10-29 18:22:02', '903.signs.1.activated', '0'),
	('2024-10-29 18:22:02', '903.signs.1.activation_expression', 'PLZ1 <= 0'),
	('2024-10-29 18:22:02', '903.signs.1.description', 'ENTRADA ARROYO'),
	('2024-10-29 18:22:02', '903.signs.1.forced', '0'),
	('2024-10-29 18:22:02', '903.signs.2.activated', '0'),
	('2024-10-29 18:22:02', '903.signs.2.activation_expression', 'PLZ1 <= 0'),
	('2024-10-29 18:22:02', '903.signs.2.description', 'ENTRADA LAGUILLO'),
	('2024-10-29 18:22:02', '903.signs.2.forced', '0'),
	('2024-10-29 18:23:02', '903.zones.1.available_spaces', '188'),
	('2024-10-29 18:22:02', '903.zones.1.description', 'Rotación y Abonados'),
	('2024-10-29 18:23:02', '903.zones.1.occupied_spaces', '151'),
	('2024-10-29 18:22:02', '903.zones.1.total_spaces', '339'),
	('2024-10-29 18:22:02', '903.zones.2.available_spaces', '88'),
	('2024-10-29 18:22:02', '903.zones.2.description', 'Propietarios'),
	('2024-10-29 18:22:02', '903.zones.2.occupied_spaces', '92'),
	('2024-10-29 18:22:02', '903.zones.2.total_spaces', '180'),
	('2024-10-29 18:25:02', '904.counters.1.description', 'Total Plazas Libres'),
	('2024-10-29 18:25:02', '904.counters.1.value', '197'),
	('2024-10-29 18:25:02', '904.counters.1.value_expression', 'TPL'),
	('2024-10-29 18:25:02', '904.counters.2.description', 'Productos codgrupro 2 o 90 estpre 3'),
	('2024-10-29 18:25:02', '904.counters.2.value', '146'),
	('2024-10-29 18:25:02', '904.counters.2.value_expression', ''),
	('2024-10-29 18:25:02', '904.counters.3.description', 'Free Spaces'),
	('2024-10-29 18:25:02', '904.counters.3.value', '1280'),
	('2024-10-29 18:25:02', '904.counters.3.value_expression', 'PLZ1'),
	('2024-10-29 18:25:03', '904.counters.4.description', 'Morning Subscriber'),
	('2024-10-29 18:25:03', '904.counters.4.value', '0'),
	('2024-10-29 18:25:03', '904.counters.4.value_expression', ''),
	('2024-10-29 18:38:01', '904.signs.1.activated', '0'),
	('2024-10-29 18:25:03', '904.signs.1.activation_expression', 'PLZ1 <= 0'),
	('2024-10-29 18:25:03', '904.signs.1.description', 'Cartel "P"'),
	('2024-10-29 18:38:01', '904.signs.1.forced', '0'),
	('2024-10-29 18:25:03', '904.signs.2.activated', '0'),
	('2024-10-29 18:25:03', '904.signs.2.activation_expression', 'TPL <= 0'),
	('2024-10-29 18:25:03', '904.signs.2.description', 'Cartel Norte'),
	('2024-10-29 18:25:03', '904.signs.2.forced', '0'),
	('2024-10-29 18:25:03', '904.zones.1.available_spaces', '1280'),
	('2024-10-29 18:25:03', '904.zones.1.description', 'Rotation + Subscribers'),
	('2024-10-29 18:25:03', '904.zones.1.occupied_spaces', '-280'),
	('2024-10-29 18:25:03', '904.zones.1.total_spaces', '1000'),
	('2024-10-29 18:25:03', '904.zones.2.available_spaces', '67'),
	('2024-10-29 18:25:03', '904.zones.2.description', 'Abonados'),
	('2024-10-29 18:25:03', '904.zones.2.occupied_spaces', '83'),
	('2024-10-29 18:25:03', '904.zones.2.total_spaces', '150'),
	('2024-10-29 18:25:03', '904.zones.3.available_spaces', '0'),
	('2024-10-29 18:25:03', '904.zones.3.description', 'Bolsa EQUINSA PAY'),
	('2024-10-29 18:25:03', '904.zones.3.occupied_spaces', '100'),
	('2024-10-29 18:25:03', '904.zones.3.total_spaces', '100'),
	('2024-10-29 18:25:03', '904.zones.4.available_spaces', '0'),
	('2024-10-29 18:25:03', '904.zones.4.description', '24 h Subscriber'),
	('2024-10-29 18:25:03', '904.zones.4.occupied_spaces', '50'),
	('2024-10-29 18:25:03', '904.zones.4.total_spaces', '50'),
	('2024-10-29 18:25:03', '904.zones.5.available_spaces', '0'),
	('2024-10-29 18:25:03', '904.zones.5.description', 'Zona Oscura'),
	('2024-10-29 18:25:03', '904.zones.5.occupied_spaces', '250'),
	('2024-10-29 18:25:03', '904.zones.5.total_spaces', '250'),
	('2024-10-29 18:25:03', '904.zones.6.available_spaces', '0'),
	('2024-10-29 18:25:03', '904.zones.6.description', 'Zona ElParking'),
	('2024-10-29 18:25:03', '904.zones.6.occupied_spaces', '250'),
	('2024-10-29 18:25:03', '904.zones.6.total_spaces', '250');
/*!40000 ALTER TABLE `variables` ENABLE KEYS */;

-- Dumping structure for table cityboardtorrejon.variables_calculadas
CREATE TABLE IF NOT EXISTS `variables_calculadas` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único de la variable',
  `clave` varchar(255) NOT NULL COMMENT 'Nombre descriptivo de la variable calculada',
  `script` text NOT NULL COMMENT 'Código PHP que realiza el cálculo de la variable',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabla que almacena variables calculadas con scripts en PHP';

-- Dumping data for table cityboardtorrejon.variables_calculadas: ~4 rows (approximately)
/*!40000 ALTER TABLE `variables_calculadas` DISABLE KEYS */;
INSERT IGNORE INTO `variables_calculadas` (`id`, `clave`, `script`) VALUES
	(1, '1362.zones.2.color', 'if ({{1362.zones.2.available_spaces}} < ({{1362.zones.2.total_spaces}} / 10)) {echo \'{{compara}}\';} else {echo \'green\';} '),
	(2, 'Color2', '$availableSpaces = {1362.zones.2.available_spaces};\n$totalSpaces = {1362.zones.2.total_spaces};\n$color = ($availableSpaces < ($totalSpaces / 20)) ? \'red\' : \'yellow\';\necho $color;'),
	(3, 'compara', 'if (1>0){echo \'a\';}'),
	(4, '1363.zones.2.color', 'if ({{1363.zones.2.available_spaces}} < ({{1363.zones.2.total_spaces}} / 10)) {echo \'{{compara}}\';} else {echo \'green\';} ');
/*!40000 ALTER TABLE `variables_calculadas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
