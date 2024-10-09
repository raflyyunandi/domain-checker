-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 09, 2024 at 08:34 AM
-- Server version: 5.7.40
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `domain_checker`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `domain` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `user_id`, `domain`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 'tokotesting.com', '100000.00', '2024-10-09 00:46:31', '2024-10-09 00:46:31'),
(2, 1, 'tokotesting.com', '100000.00', '2024-10-09 00:59:59', '2024-10-09 00:59:59'),
(3, 1, 'tokotesting.com', '100000.00', '2024-10-09 01:00:05', '2024-10-09 01:00:05'),
(4, 2, 'tokotesting.com', '100000.00', '2024-10-09 01:01:31', '2024-10-09 01:01:31'),
(5, 2, 'tokotesting.com', '100000.00', '2024-10-09 01:01:41', '2024-10-09 01:01:41'),
(6, 3, 'tokotesting.com', '100000.00', '2024-10-09 01:07:35', '2024-10-09 01:07:35'),
(7, 4, 'tokotesting.com', '100000.00', '2024-10-09 01:15:23', '2024-10-09 01:15:23'),
(8, 4, 'tokotesting.com', '100000.00', '2024-10-09 01:15:24', '2024-10-09 01:15:24'),
(9, 4, 'tokotesting.com', '100000.00', '2024-10-09 01:15:26', '2024-10-09 01:15:26'),
(10, 4, 'tokotesting.com', '100000.00', '2024-10-09 01:15:54', '2024-10-09 01:15:54'),
(11, 1, 'tokotesting.com', '100000.00', '2024-10-09 01:29:15', '2024-10-09 01:29:15');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_10_09_070051_create_invoices_table', 2),
(5, '2024_10_09_070324_create_whois_records_table', 3),
(6, '2024_10_09_073636_make_whois_data_nullable_in_whois_records_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('C6NkkP4ID0xPwgi46BCv21tMw8q0MQjnZflBC2t0', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYzIydmY1bVBVN3E4VnI2OEZTNFZ0TjZ2eW43NUVXWEU0TUc2UnNlbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9pbnZvaWNlLzExIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1728462581);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Rafly Yunandi A', 'admin@gmail.com', NULL, '$2y$12$bp08K3r6NDILU0n0jgAvlONTjBP3IBUvcPECXLZHYyEhLKrux4r6q', NULL, '2024-10-09 00:46:00', '2024-10-09 00:46:00'),
(2, 'Rafly Yunandi A', 'raflyyunandia@gmail.com', NULL, '$2y$12$l0dJDG2TJRQWlnVuNY.Siu0N.E1kZdrEHhXrakW8wLyEJvkvZ0k/O', NULL, '2024-10-09 01:01:31', '2024-10-09 01:01:31'),
(3, 'Susu', 'susu@gmail.com', NULL, '$2y$12$4asGwkGvFWxUlGVpZ/Yjs.ZFO4q9grC62YGrd4fAyXsZyj2pf4I8W', NULL, '2024-10-09 01:07:35', '2024-10-09 01:07:35'),
(4, 'Aku', 'aku@gmail.com', NULL, '$2y$12$m0yUQJTLNb4jWpYGYTAo/OU6X752NnW.F0U5XiEJtVeoJJqOgIGV6', NULL, '2024-10-09 01:15:23', '2024-10-09 01:15:23');

-- --------------------------------------------------------

--
-- Table structure for table `whois_records`
--

DROP TABLE IF EXISTS `whois_records`;
CREATE TABLE IF NOT EXISTS `whois_records` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `domain` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `whois_data` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `whois_records_domain_unique` (`domain`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `whois_records`
--

INSERT INTO `whois_records` (`id`, `domain`, `whois_data`, `status`, `created_at`, `updated_at`) VALUES
(1, 'testing123.com', ' ---   Domain Name: TESTING123.COM<br />\r\n   Registry Domain ID: 980193876_DOMAIN_COM-VRSN<br />\r\n   Registrar WHOIS Server: whois.godaddy.com<br />\r\n   Registrar URL: http://www.godaddy.com<br />\r\n   Updated Date: 2024-05-18T13:00:59Z<br />\r\n   Creation Date: 2007-05-17T18:23:34Z<br />\r\n   Registry Expiry Date: 2025-05-17T18:23:34Z<br />\r\n   Registrar: GoDaddy.com, LLC<br />\r\n   Registrar IANA ID: 146<br />\r\n   Registrar Abuse Contact Email: abuse@godaddy.com<br />\r\n   Registrar Abuse Contact Phone: 480-624-2505<br />\r\n   Domain Status: clientDeleteProhibited https://icann.org/epp#clientDeleteProhibited<br />\r\n   Domain Status: clientRenewProhibited https://icann.org/epp#clientRenewProhibited<br />\r\n   Domain Status: clientTransferProhibited https://icann.org/epp#clientTransferProhibited<br />\r\n   Domain Status: clientUpdateProhibited https://icann.org/epp#clientUpdateProhibited<br />\r\n   Name Server: NS27.DOMAINCONTROL.COM<br />\r\n   Name Server: NS28.DOMAINCONTROL.COM<br />\r\n   DNSSEC: unsigned<br />\r\n   URL of the ICANN Whois Inaccuracy Complaint Form: https://www.icann.org/wicf/<br />\r\n&gt;&gt;&gt; Last update of whois database: 2024-10-09T07:49:04Z &lt;&lt;&lt;<br />\r\n<br />\r\nFor more information on Whois status codes, please visit https://icann.org/epp<br />\r\n<br />\r\nNOTICE: The expiration date displayed in this record is the date the<br />\r\nregistrar\'s sponsorship of the domain name registration in the registry is<br />\r\ncurrently set to expire. This date does not necessarily reflect the expiration<br />\r\ndate of the domain name registrant\'s agreement with the sponsoring<br />\r\nregistrar.  Users may consult the sponsoring registrar\'s Whois database to<br />\r\nview the registrar\'s reported date of expiration for this registration.<br />\r\n<br />\r\nTERMS OF USE: You are not authorized to access or query our Whois<br />\r\ndatabase through the use of electronic processes that are high-volume and<br />\r\nautomated except as reasonably necessary to register domain names or<br />\r\nmodify existing registrations; the Data in VeriSign Global Registry<br />\r\nServices\' (\"VeriSign\") Whois database is provided by VeriSign for<br />\r\ninformation purposes only, and to assist persons in obtaining information<br />\r\nabout or related to a domain name registration record. VeriSign does not<br />\r\nguarantee its accuracy. By submitting a Whois query, you agree to abide<br />\r\nby the following terms of use: You agree that you may use this Data only<br />\r\nfor lawful purposes and that under no circumstances will you use this Data<br />\r\nto: (1) allow, enable, or otherwise support the transmission of mass<br />\r\nunsolicited, commercial advertising or solicitations via e-mail, telephone,<br />\r\nor facsimile; or (2) enable high volume, automated, electronic processes<br />\r\nthat apply to VeriSign (or its computer systems). The compilation,<br />\r\nrepackaging, dissemination or other use of this Data is expressly<br />\r\nprohibited without the prior written consent of VeriSign. You agree not to<br />\r\nuse electronic processes that are automated and high-volume to access or<br />\r\nquery the Whois database except as reasonably necessary to register<br />\r\ndomain names or modify existing registrations. VeriSign reserves the right<br />\r\nto restrict your access to the Whois database in its sole discretion to ensure<br />\r\noperational stability.  VeriSign may restrict or terminate your access to the<br />\r\nWhois database for failure to abide by these terms of use. VeriSign<br />\r\nreserves the right to modify these terms at any time.<br />\r\n<br />\r\nThe Registry database contains ONLY .COM, .NET, .EDU domains and<br />\r\nRegistrars.<br />\r\n', 'unavailable', '2024-10-09 00:31:54', '2024-10-09 00:49:25'),
(2, 'aku123.com', ' ---   Domain Name: AKU123.COM<br />\r\n   Registry Domain ID: 2909461692_DOMAIN_COM-VRSN<br />\r\n   Registrar WHOIS Server: whois.namesilo.com<br />\r\n   Registrar URL: http://www.namesilo.com<br />\r\n   Updated Date: 2024-08-24T08:02:04Z<br />\r\n   Creation Date: 2024-08-20T00:45:39Z<br />\r\n   Registry Expiry Date: 2025-08-20T00:45:39Z<br />\r\n   Registrar: NameSilo, LLC<br />\r\n   Registrar IANA ID: 1479<br />\r\n   Registrar Abuse Contact Email: abuse@namesilo.com<br />\r\n   Registrar Abuse Contact Phone: +1.4805240066<br />\r\n   Domain Status: clientTransferProhibited https://icann.org/epp#clientTransferProhibited<br />\r\n   Name Server: NS1.ULTAHOOST.CYOU<br />\r\n   Name Server: NS2.ULTAHOOST.CYOU<br />\r\n   DNSSEC: unsigned<br />\r\n   URL of the ICANN Whois Inaccuracy Complaint Form: https://www.icann.org/wicf/<br />\r\n&gt;&gt;&gt; Last update of whois database: 2024-10-09T07:32:39Z &lt;&lt;&lt;<br />\r\n<br />\r\nFor more information on Whois status codes, please visit https://icann.org/epp<br />\r\n<br />\r\nNOTICE: The expiration date displayed in this record is the date the<br />\r\nregistrar\'s sponsorship of the domain name registration in the registry is<br />\r\ncurrently set to expire. This date does not necessarily reflect the expiration<br />\r\ndate of the domain name registrant\'s agreement with the sponsoring<br />\r\nregistrar.  Users may consult the sponsoring registrar\'s Whois database to<br />\r\nview the registrar\'s reported date of expiration for this registration.<br />\r\n<br />\r\nTERMS OF USE: You are not authorized to access or query our Whois<br />\r\ndatabase through the use of electronic processes that are high-volume and<br />\r\nautomated except as reasonably necessary to register domain names or<br />\r\nmodify existing registrations; the Data in VeriSign Global Registry<br />\r\nServices\' (\"VeriSign\") Whois database is provided by VeriSign for<br />\r\ninformation purposes only, and to assist persons in obtaining information<br />\r\nabout or related to a domain name registration record. VeriSign does not<br />\r\nguarantee its accuracy. By submitting a Whois query, you agree to abide<br />\r\nby the following terms of use: You agree that you may use this Data only<br />\r\nfor lawful purposes and that under no circumstances will you use this Data<br />\r\nto: (1) allow, enable, or otherwise support the transmission of mass<br />\r\nunsolicited, commercial advertising or solicitations via e-mail, telephone,<br />\r\nor facsimile; or (2) enable high volume, automated, electronic processes<br />\r\nthat apply to VeriSign (or its computer systems). The compilation,<br />\r\nrepackaging, dissemination or other use of this Data is expressly<br />\r\nprohibited without the prior written consent of VeriSign. You agree not to<br />\r\nuse electronic processes that are automated and high-volume to access or<br />\r\nquery the Whois database except as reasonably necessary to register<br />\r\ndomain names or modify existing registrations. VeriSign reserves the right<br />\r\nto restrict your access to the Whois database in its sole discretion to ensure<br />\r\noperational stability.  VeriSign may restrict or terminate your access to the<br />\r\nWhois database for failure to abide by these terms of use. VeriSign<br />\r\nreserves the right to modify these terms at any time.<br />\r\n<br />\r\nThe Registry database contains ONLY .COM, .NET, .EDU domains and<br />\r\nRegistrars.<br />\r\n', 'unavailable', '2024-10-09 00:32:51', '2024-10-09 00:32:51'),
(3, 'tokotesting.com', 'No whois data available', 'available', '2024-10-09 00:37:03', '2024-10-09 00:37:03');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
