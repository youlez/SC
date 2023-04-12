-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.13-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para sc
CREATE DATABASE IF NOT EXISTS `sc` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `sc`;

-- Volcando estructura para tabla sc.conductores
CREATE TABLE IF NOT EXISTS `conductores` (
  `id_conductor` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identificacion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellido` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` bigint(20) unsigned DEFAULT NULL,
  `direccion` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_conductor`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sc.conductores: ~0 rows (aproximadamente)
INSERT INTO `conductores` (`id_conductor`, `identificacion`, `apellido`, `nombre`, `telefono`, `direccion`, `created_at`, `updated_at`) VALUES
	(1, '1073238687', 'P', 'A', 12345, 'CRA', NULL, NULL),
	(4, '212135', 'dff', 'dv', 1232, 'sdfd', '2023-04-13 02:50:48', '2023-04-13 02:50:48'),
	(5, 'e343', 'dfd', 'edf', 3434, 'dsffd', '2023-04-13 02:55:33', '2023-04-13 02:55:33'),
	(6, '3434', 'dfd', 'df', 343, 'sdsf', '2023-04-13 02:59:09', '2023-04-13 02:59:09'),
	(7, '234234', 'sdf', 'ds', 3453, 'dfggfg', '2023-04-13 02:59:58', '2023-04-13 02:59:58');

-- Volcando estructura para tabla sc.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sc.failed_jobs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla sc.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sc.migrations: ~5 rows (aproximadamente)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(6, '2014_10_12_000000_create_users_table', 1),
	(7, '2014_10_12_100000_create_password_resets_table', 1),
	(8, '2019_08_19_000000_create_failed_jobs_table', 1),
	(9, '2023_04_12_155929_create_conductores_table', 1),
	(10, '2023_04_12_160736_create_vehiculos_table', 1);

-- Volcando estructura para tabla sc.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sc.password_resets: ~0 rows (aproximadamente)

-- Volcando estructura para tabla sc.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sc.users: ~0 rows (aproximadamente)

-- Volcando estructura para tabla sc.vehiculos
CREATE TABLE IF NOT EXISTS `vehiculos` (
  `id_vehiculo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_id_conductor` int(10) unsigned DEFAULT NULL,
  `placa` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modelo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacidad` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_vehiculo`),
  KEY `vehiculos_fk_id_conductor_foreign` (`fk_id_conductor`),
  CONSTRAINT `vehiculos_fk_id_conductor_foreign` FOREIGN KEY (`fk_id_conductor`) REFERENCES `conductores` (`id_conductor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sc.vehiculos: ~0 rows (aproximadamente)
INSERT INTO `vehiculos` (`id_vehiculo`, `fk_id_conductor`, `placa`, `modelo`, `capacidad`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'dgfg', 'dfgd', '20 Kg', NULL, '2023-04-13 03:39:11');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
