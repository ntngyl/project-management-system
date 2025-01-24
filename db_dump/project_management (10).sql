-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2025 at 02:00 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `batch_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('spatie.permission.cache', 'a:3:{s:5:\"alias\";a:3:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";}s:11:\"permissions\";a:40:{i:0;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:16:\"view-own-project\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:3;s:1:\"b\";s:21:\"view-assigned-project\";s:1:\"c\";s:3:\"web\";}i:2;a:3:{s:1:\"a\";i:4;s:1:\"b\";s:19:\"view-global-project\";s:1:\"c\";s:3:\"web\";}i:3;a:3:{s:1:\"a\";i:5;s:1:\"b\";s:16:\"edit-own-project\";s:1:\"c\";s:3:\"web\";}i:4;a:3:{s:1:\"a\";i:6;s:1:\"b\";s:21:\"edit-assigned-project\";s:1:\"c\";s:3:\"web\";}i:5;a:3:{s:1:\"a\";i:7;s:1:\"b\";s:19:\"edit-global-project\";s:1:\"c\";s:3:\"web\";}i:6;a:3:{s:1:\"a\";i:8;s:1:\"b\";s:18:\"delete-own-project\";s:1:\"c\";s:3:\"web\";}i:7;a:3:{s:1:\"a\";i:9;s:1:\"b\";s:23:\"delete-assigned-project\";s:1:\"c\";s:3:\"web\";}i:8;a:3:{s:1:\"a\";i:10;s:1:\"b\";s:21:\"delete-global-project\";s:1:\"c\";s:3:\"web\";}i:9;a:3:{s:1:\"a\";i:11;s:1:\"b\";s:13:\"view-own-task\";s:1:\"c\";s:3:\"web\";}i:10;a:3:{s:1:\"a\";i:12;s:1:\"b\";s:18:\"view-assigned-task\";s:1:\"c\";s:3:\"web\";}i:11;a:3:{s:1:\"a\";i:13;s:1:\"b\";s:16:\"view-global-task\";s:1:\"c\";s:3:\"web\";}i:12;a:3:{s:1:\"a\";i:14;s:1:\"b\";s:13:\"edit-own-task\";s:1:\"c\";s:3:\"web\";}i:13;a:3:{s:1:\"a\";i:15;s:1:\"b\";s:18:\"edit-assigned-task\";s:1:\"c\";s:3:\"web\";}i:14;a:3:{s:1:\"a\";i:16;s:1:\"b\";s:16:\"edit-global-task\";s:1:\"c\";s:3:\"web\";}i:15;a:3:{s:1:\"a\";i:17;s:1:\"b\";s:15:\"delete-own-task\";s:1:\"c\";s:3:\"web\";}i:16;a:3:{s:1:\"a\";i:18;s:1:\"b\";s:20:\"delete-assigned-task\";s:1:\"c\";s:3:\"web\";}i:17;a:3:{s:1:\"a\";i:19;s:1:\"b\";s:18:\"delete-global-task\";s:1:\"c\";s:3:\"web\";}i:18;a:3:{s:1:\"a\";i:20;s:1:\"b\";s:17:\"view-own-document\";s:1:\"c\";s:3:\"web\";}i:19;a:3:{s:1:\"a\";i:21;s:1:\"b\";s:22:\"view-assigned-document\";s:1:\"c\";s:3:\"web\";}i:20;a:3:{s:1:\"a\";i:22;s:1:\"b\";s:20:\"view-global-document\";s:1:\"c\";s:3:\"web\";}i:21;a:3:{s:1:\"a\";i:23;s:1:\"b\";s:17:\"edit-own-document\";s:1:\"c\";s:3:\"web\";}i:22;a:3:{s:1:\"a\";i:24;s:1:\"b\";s:22:\"edit-assigned-document\";s:1:\"c\";s:3:\"web\";}i:23;a:3:{s:1:\"a\";i:25;s:1:\"b\";s:20:\"edit-global-document\";s:1:\"c\";s:3:\"web\";}i:24;a:3:{s:1:\"a\";i:26;s:1:\"b\";s:19:\"delete-own-document\";s:1:\"c\";s:3:\"web\";}i:25;a:3:{s:1:\"a\";i:27;s:1:\"b\";s:24:\"delete-assigned-document\";s:1:\"c\";s:3:\"web\";}i:26;a:3:{s:1:\"a\";i:28;s:1:\"b\";s:22:\"delete-global-document\";s:1:\"c\";s:3:\"web\";}i:27;a:3:{s:1:\"a\";i:29;s:1:\"b\";s:13:\"view-own-item\";s:1:\"c\";s:3:\"web\";}i:28;a:3:{s:1:\"a\";i:30;s:1:\"b\";s:18:\"view-assigned-item\";s:1:\"c\";s:3:\"web\";}i:29;a:3:{s:1:\"a\";i:31;s:1:\"b\";s:16:\"view-global-item\";s:1:\"c\";s:3:\"web\";}i:30;a:3:{s:1:\"a\";i:32;s:1:\"b\";s:13:\"edit-own-item\";s:1:\"c\";s:3:\"web\";}i:31;a:3:{s:1:\"a\";i:33;s:1:\"b\";s:18:\"edit-assigned-item\";s:1:\"c\";s:3:\"web\";}i:32;a:3:{s:1:\"a\";i:34;s:1:\"b\";s:16:\"edit-global-item\";s:1:\"c\";s:3:\"web\";}i:33;a:3:{s:1:\"a\";i:35;s:1:\"b\";s:15:\"delete-own-item\";s:1:\"c\";s:3:\"web\";}i:34;a:3:{s:1:\"a\";i:36;s:1:\"b\";s:20:\"delete-assigned-item\";s:1:\"c\";s:3:\"web\";}i:35;a:3:{s:1:\"a\";i:37;s:1:\"b\";s:18:\"delete-global-item\";s:1:\"c\";s:3:\"web\";}i:36;a:3:{s:1:\"a\";i:38;s:1:\"b\";s:14:\"create-project\";s:1:\"c\";s:3:\"web\";}i:37;a:3:{s:1:\"a\";i:39;s:1:\"b\";s:11:\"create-task\";s:1:\"c\";s:3:\"web\";}i:38;a:3:{s:1:\"a\";i:40;s:1:\"b\";s:15:\"create-document\";s:1:\"c\";s:3:\"web\";}i:39;a:3:{s:1:\"a\";i:41;s:1:\"b\";s:11:\"create-item\";s:1:\"c\";s:3:\"web\";}}s:5:\"roles\";a:0:{}}', 1736950071);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `type` enum('item','document','task') NOT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `type` enum('end_client','epc') NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `contact_person`, `email`, `phone`, `type`, `status`, `metadata`, `created_at`, `updated_at`) VALUES
(1, 'Nitin Goyal', 'Nitin Goyal', 'nitin@mrig.in', '09987246925', 'end_client', 'active', NULL, '2025-01-13 08:38:22', '2025-01-13 08:38:22');

-- --------------------------------------------------------

--
-- Table structure for table `configurations`
--

CREATE TABLE `configurations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `configurations`
--

INSERT INTO `configurations` (`id`, `type`, `key`, `label`, `is_active`, `sort_order`, `metadata`, `created_at`, `updated_at`) VALUES
(1, 'project_type', 'standard', 'Standard Product', 1, 1, NULL, '2025-01-12 12:38:27', '2025-01-12 12:38:27'),
(2, 'project_type', 'skid_mounted', 'Skid Mounted System', 1, 2, NULL, '2025-01-12 12:38:27', '2025-01-12 12:38:27'),
(3, 'project_type', 'custom', 'Custom Project', 1, 3, NULL, '2025-01-12 12:38:27', '2025-01-12 12:38:27'),
(4, 'document_type', 'rfq', 'RFQ Document', 1, 1, NULL, '2025-01-12 12:38:27', '2025-01-12 12:38:27'),
(5, 'document_type', 'technical_specification', 'Technical Specification', 1, 2, NULL, '2025-01-12 12:38:27', '2025-01-12 12:38:27'),
(6, 'status', 'planned', 'Planned', 1, 0, NULL, NULL, NULL),
(7, 'status', 'in_progress', 'In Progress', 1, 0, NULL, NULL, NULL),
(8, 'status', 'completed', 'Completed', 1, 0, NULL, NULL, NULL),
(9, 'status', 'on_hold', 'On Hold', 1, 0, NULL, NULL, NULL),
(10, 'priority', 'low', 'Low', 1, 0, NULL, NULL, NULL),
(11, 'priority', 'medium', 'Medium', 1, 0, NULL, NULL, NULL),
(12, 'priority', 'high', 'High', 1, 0, NULL, NULL, NULL),
(13, 'priority', 'critical', 'Critical', 1, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `lookup_type` varchar(255) DEFAULT NULL,
  `entity_type` varchar(255) NOT NULL,
  `sort_order` bigint(20) UNSIGNED DEFAULT NULL,
  `validation_rules` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`validation_rules`)),
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `system_defined` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_fields`
--

INSERT INTO `custom_fields` (`id`, `code`, `name`, `type`, `lookup_type`, `entity_type`, `sort_order`, `validation_rules`, `active`, `system_defined`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'test_custom_field', 'test custom field', 'text', NULL, 'App\\Models\\Project', NULL, '[]', 1, 0, NULL, '2025-01-13 08:32:17', '2025-01-13 08:32:17');

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_options`
--

CREATE TABLE `custom_field_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `custom_field_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sort_order` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_values`
--

CREATE TABLE `custom_field_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `entity_type` varchar(255) NOT NULL,
  `entity_id` bigint(20) UNSIGNED NOT NULL,
  `custom_field_id` bigint(20) UNSIGNED NOT NULL,
  `string_value` varchar(255) DEFAULT NULL,
  `text_value` text DEFAULT NULL,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int(11) DEFAULT NULL,
  `float_value` double DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `json_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`json_value`)),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_field_values`
--

INSERT INTO `custom_field_values` (`id`, `entity_type`, `entity_id`, `custom_field_id`, `string_value`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `date_value`, `datetime_value`, `json_value`, `deleted_at`) VALUES
(1, 'App\\Models\\Project', 1, 1, NULL, 'Test Custom Field', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'App\\Models\\Project', 2, 1, NULL, 'Test Custom Field', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'App\\Models\\Project', 3, 1, NULL, 'Test Custom Field', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'App\\Models\\Project', 4, 1, NULL, 'Test Custom Field', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_controllers`
--

CREATE TABLE `document_controllers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `document_number` varchar(255) NOT NULL,
  `type` enum('rfq','technical_specification','scope_of_work','technical_queries','vendor_offers','drawings','engineering','quality','commercial','general') NOT NULL,
  `status` enum('draft','under_review','approved','rejected') NOT NULL,
  `version` varchar(255) NOT NULL DEFAULT '1.0',
  `prepared_by` varchar(255) DEFAULT NULL,
  `reviewed_by` varchar(255) DEFAULT NULL,
  `approved_by` varchar(255) DEFAULT NULL,
  `submission_date` date DEFAULT NULL,
  `approval_date` date DEFAULT NULL,
  `is_initial_document` tinyint(1) NOT NULL DEFAULT 0,
  `priority` enum('high','medium','low') DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `procurement_status` enum('pending','ordered','received','fabricated') NOT NULL DEFAULT 'pending',
  `description` text DEFAULT NULL,
  `lead_time` int(11) NOT NULL DEFAULT 0,
  `required_delivery_date` datetime DEFAULT NULL,
  `is_critical` tinyint(1) NOT NULL DEFAULT 0,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '1_create_process_approval_flows_table', 1),
(5, '2024_12_21_125748_create_permission_tables', 1),
(6, '2024_12_21_125755_create_media_table', 1),
(7, '2024_12_21_125800_create_activity_log_table', 1),
(8, '2024_12_21_125801_add_event_column_to_activity_log_table', 1),
(9, '2024_12_21_125802_add_batch_uuid_column_to_activity_log_table', 1),
(10, '2024_12_31_132745_update_permissions_guard_name_length', 1),
(11, '2024_12_31_132927_update_permissions_name_length', 1),
(12, '2024_12_31_133440_create_departments_table', 1),
(13, '2024_12_31_133932_create_clients_table', 1),
(14, '2025_01_02_060237_create_user_departments_table', 1),
(15, '2025_01_02_060809_create_projects_table', 1),
(16, '2025_01_02_060843_create_categories_table', 1),
(17, '2025_01_02_060851_create_vendors_table', 1),
(18, '2025_01_02_061030_create_items_table', 1),
(19, '2025_01_02_061916_create_document_controllers_table', 1),
(20, '2025_01_02_062339_create_project_members_table', 1),
(21, '2025_01_02_062709_create_configurations_table', 1),
(22, '2025_01_02_145341_create_tasks_table', 1),
(23, '2025_01_03_060619_create_task_dependencies_table', 1),
(24, '2025_01_03_060643_create_task_assignments_table', 1),
(25, '2025_01_04_120628_create_custom_fields_table', 1),
(26, '2025_01_12_000001_create_positions_table', 1),
(27, '2025_01_12_000002_create_user_project_positions_table', 1),
(28, '2025_01_12_000003_create_user_project_permissions_table', 1),
(29, '2_create_process_approval_flow_steps_table', 1),
(30, '3_create_process_approvals_table', 1),
(31, '4_create_process_approval_statuses_table', 1),
(38, '2025_01_13_085758_add_created_by_to_projects_tasks_items_documents', 2),
(39, '2025_01_13_125214_add_priority_and_critical_path_to_tasks', 2),
(40, '2025_01_13_125238_add_procurement_fields_to_items', 2),
(41, '5_add_tenant_ids_to_approval_tables', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 2),
(4, 'App\\Models\\User', 2),
(5, 'App\\Models\\User', 2),
(6, 'App\\Models\\User', 2),
(7, 'App\\Models\\User', 2),
(8, 'App\\Models\\User', 2),
(9, 'App\\Models\\User', 2),
(10, 'App\\Models\\User', 2),
(11, 'App\\Models\\User', 2),
(12, 'App\\Models\\User', 2),
(13, 'App\\Models\\User', 2),
(14, 'App\\Models\\User', 2),
(15, 'App\\Models\\User', 2),
(16, 'App\\Models\\User', 2),
(17, 'App\\Models\\User', 2),
(18, 'App\\Models\\User', 2),
(19, 'App\\Models\\User', 2),
(20, 'App\\Models\\User', 2),
(21, 'App\\Models\\User', 2),
(22, 'App\\Models\\User', 2),
(23, 'App\\Models\\User', 2),
(24, 'App\\Models\\User', 2),
(25, 'App\\Models\\User', 2),
(26, 'App\\Models\\User', 2),
(27, 'App\\Models\\User', 2),
(28, 'App\\Models\\User', 2),
(29, 'App\\Models\\User', 2),
(30, 'App\\Models\\User', 2),
(31, 'App\\Models\\User', 2),
(32, 'App\\Models\\User', 2),
(33, 'App\\Models\\User', 2),
(34, 'App\\Models\\User', 2),
(35, 'App\\Models\\User', 2),
(36, 'App\\Models\\User', 2),
(37, 'App\\Models\\User', 2),
(38, 'App\\Models\\User', 2),
(39, 'App\\Models\\User', 2),
(40, 'App\\Models\\User', 2),
(41, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(2, 'view-own-project', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(3, 'view-assigned-project', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(4, 'view-global-project', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(5, 'edit-own-project', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(6, 'edit-assigned-project', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(7, 'edit-global-project', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(8, 'delete-own-project', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(9, 'delete-assigned-project', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(10, 'delete-global-project', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(11, 'view-own-task', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(12, 'view-assigned-task', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(13, 'view-global-task', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(14, 'edit-own-task', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(15, 'edit-assigned-task', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(16, 'edit-global-task', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(17, 'delete-own-task', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(18, 'delete-assigned-task', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(19, 'delete-global-task', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(20, 'view-own-document', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(21, 'view-assigned-document', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(22, 'view-global-document', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(23, 'edit-own-document', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(24, 'edit-assigned-document', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(25, 'edit-global-document', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(26, 'delete-own-document', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(27, 'delete-assigned-document', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(28, 'delete-global-document', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(29, 'view-own-item', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(30, 'view-assigned-item', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(31, 'view-global-item', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(32, 'edit-own-item', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(33, 'edit-assigned-item', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(34, 'edit-global-item', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(35, 'delete-own-item', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(36, 'delete-assigned-item', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(37, 'delete-global-item', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(38, 'create-project', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(39, 'create-task', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(40, 'create-document', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17'),
(41, 'create-item', 'web', '2025-01-13 03:17:17', '2025-01-13 03:17:17');

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `name`, `role`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'Test Position', NULL, '[\"manage projects\"]', '2025-01-13 02:50:29', '2025-01-13 02:50:29');

-- --------------------------------------------------------

--
-- Table structure for table `process_approvals`
--

CREATE TABLE `process_approvals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `approvable_type` varchar(255) NOT NULL,
  `approvable_id` bigint(20) UNSIGNED NOT NULL,
  `process_approval_flow_step_id` bigint(20) UNSIGNED DEFAULT NULL,
  `approval_action` varchar(12) NOT NULL DEFAULT 'Approved',
  `approver_name` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `tenant_id` varchar(38) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `process_approval_flows`
--

CREATE TABLE `process_approval_flows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `approvable_type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `process_approval_flow_steps`
--

CREATE TABLE `process_approval_flow_steps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `process_approval_flow_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `order` int(11) DEFAULT NULL,
  `action` enum('APPROVE','VERIFY','CHECK') NOT NULL DEFAULT 'APPROVE',
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `tenant_id` varchar(38) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `process_approval_statuses`
--

CREATE TABLE `process_approval_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `approvable_type` varchar(255) NOT NULL,
  `approvable_id` bigint(20) UNSIGNED NOT NULL,
  `steps` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`steps`)),
  `status` varchar(10) NOT NULL DEFAULT 'Created',
  `creator_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tenant_id` varchar(38) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `project_number` varchar(255) NOT NULL,
  `project_type` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'planned',
  `priority` enum('high','medium','low') NOT NULL DEFAULT 'medium',
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `epc_id` bigint(20) UNSIGNED DEFAULT NULL,
  `project_manager_id` bigint(20) UNSIGNED DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `project_number`, `project_type`, `description`, `start_date`, `end_date`, `status`, `priority`, `client_id`, `epc_id`, `project_manager_id`, `metadata`, `created_at`, `updated_at`, `created_by`) VALUES
(1, 'Test Project', '123', 'custom', 'test description', '2025-01-01', '2025-01-31', 'planned', 'medium', 1, NULL, 2, NULL, '2025-01-13 08:46:07', '2025-01-13 08:46:07', 2),
(2, 'Test Project', '125', 'custom', 'test description', '2025-01-01', '2025-01-31', 'planned', 'medium', 1, NULL, 2, NULL, '2025-01-13 08:49:26', '2025-01-13 08:49:26', 2),
(3, 'Test Project1', '126', 'custom', 'test desc', '2025-01-02', '2025-01-31', 'in_progress', 'low', 1, NULL, 2, NULL, '2025-01-13 08:58:59', '2025-01-13 08:58:59', 2),
(4, 'Test Project1', '1261', 'custom', 'testdes', '2025-01-01', '2025-01-11', 'planned', 'low', 1, NULL, 2, NULL, '2025-01-13 12:49:48', '2025-01-13 12:49:48', 2);

-- --------------------------------------------------------

--
-- Table structure for table `project_members`
--

CREATE TABLE `project_members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super_admin', 'web', '2025-01-12 13:16:08', '2025-01-12 13:16:08'),
(2, 'admin', 'web', '2025-01-13 01:23:59', '2025-01-13 01:23:59');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0caOKoVRYFvStjWFoAxAqq4hubT4TqrX3jTcRrNE', NULL, '45.148.10.242', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 Edg/90.0.818.46', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiN1JzTGNyVWVSTFNGa2xwN1lSTHB0emoxeDNpMUEyeFFXWmYzc2dBcSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736943608),
('1AXF80jbmB0Klj86758TDYYbrlJULEFr5MY5szXQ', NULL, '139.59.19.244', 'Mozilla/5.0 (compatible)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWk5za2lzRVc3ZEd0REk1SHMxU3pzS1ROSkM5eHZpangzOUNYYVF6QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9ob3VzaWUuZ2Z4cy5pbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736943115),
('4gvHE6riGDgZIB8t4issQv3el1ePQr8YgLFLTTkR', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoialRFVGNJcU9MeU45cHBLSFZPRXRqN0k3WUd5M3pFSFBDazRIc0dKaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736934897),
('668d92rkYnvmCaVdU4yM0rmBMOgzrJ7bDAQliFUz', NULL, '66.249.66.15', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.6778.264 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUzZON3VIUUtSUjZSUEtrdkdKZGQwbDFEdVFEZFBWcDE5VEhPYk9oQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTU6Imh0dHBzOi8vZ2Z4cy5pbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736935871),
('7QYjKpngyKMBUhJWp5CuxCsNdAnjaaFGCqxuTjlK', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmJ0dWlVOW1tZTR1MGE0UDlXNkZpSDAzSlRQbURxWlJuQ0pmWGtPWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736942126),
('89tUFHJhEck1spe4VZKozmFDNJa6JjTpinG3mzHI', NULL, '3.91.206.193', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) Project-Resonance (http://project-resonance.com/) (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGxKN2hnRTFSYlpMQTZrVFdFa2g3c0RCS2d4YXdSdExBSFV1MmlGTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vNTkuOTkuMTU1LjI0NyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736942117),
('95AWKsLSBXQ8XC9zaxJRYJkU17t6s4LQvkFx85R7', NULL, '109.205.213.198', 'Hello World', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWxqTnNDbEtUbnI4dUVvajZjZHZubmx4cFd0NkozeFU2cGtIOU1xTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736940117),
('BBsMb2DkUsgj1XQxTfQA43wmEddSx2qp03cAPXni', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXU1RDhteTduN05nVFdreDFpMUJ5S2tHUG5hV1hUWUx2VkJXek9VRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736945407),
('CjNHZQqaLccbaCgXW2tfVCuodsrPLeEt1dbbKXf9', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYmdBRkdDRTN2QWNRU1U0RTJCSnlMVTN0NXdaUnhUelV5MG9JSTFvbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736942870),
('fWwLMhluAhbERkPHK85b87f1Zmd7n4QUQoiMbeSc', NULL, '185.242.226.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSlk1YUpsRU4wa2tiUVVWVDdVeWd4SXE5Unk0S2lveVF1dnRMNUJRYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736939046),
('g6k2rjOICnQpAmnTt8dx0pi4Vpwf6lNqzANDUawd', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMk9jbzY1MkFHU2dSdFZHeG9hVmh1aDA5M1BjckcwNUV6VjkzU3NvbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736936572),
('GQsjOEIh4ZSHWzhygkWYditMpnEQfjet42pcanLY', NULL, '45.148.10.242', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 Edg/90.0.818.46', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZjJId3NhNWdEQUpwRGJSaU5DZG1oZDg5V05kM3cxZjcyYVNqaHZXbCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736937688),
('hPqqq1LASuIiSu8AcZbrt6nvMODwPtpmHXfPQrgr', NULL, '185.180.140.101', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUU5lMWdYRUNDQ3BvYjJpRWhLcExIeEt4eFc2VGpLTDFwRkNCeG5McyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vNTkuOTkuMTU1LjI0NyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736941106),
('IC4DjylBWKi2RluudSe9y5TmfuLExLbThzEZZ7ge', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib2FWRVZrdzRJQjVwMW11VUVES21jeWZzNVpzcnNEMWNkNU4xMFQ2SCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736940192),
('ieD0IwXBK6VjN6O9mXdVxqSDgUzcnVD0DJHOnN1o', NULL, '170.106.82.209', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVzk0ZFo0dXJRUDd6MHJmM0hUWEtHOERmV2JJTjNISWFBUW9iMU56ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHA6Ly93d3cuZ2Z4cy5pbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736933423),
('JNxzVUtl2dvbCtgcULJ42G0yKAbSh9KvHGL66Lh4', NULL, '176.123.7.98', 'Microsoft URL Control - 6.00.8862', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM1M1U2JROUd6WEFRR0NJQjdFY3hFYlhuUXZ0UFI4OVJpclFIekJJVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTU6Imh0dHBzOi8vbXJpZy5pbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736937409),
('jVlhymW7URL3qGpjxtb4xhrwn9IH8e3HMQ72ZNoK', NULL, '159.65.113.181', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZlZNd2lHdkxvYWZSWldvYTJCWEc0MUZWVnFJTmVySXVoTDMzMDlWbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly8xMzguNjguOTguMTE2Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736935403),
('JypKsG3DqNJLd3EXWcQt0khzBbtHATFD0TVO7yxd', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiblNxdWVSMnhiSHlkMjBrUXFzNmZkT2o1cVdzd21TNXBzelk2WDB3YiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736943836),
('KuNItXCPpYu7V9DIONswmqeFh9iE3v3twvq3H2AS', NULL, '167.71.131.143', 'Mozilla/4.0 (compatible; MSIE 9.0; Windows NT 10.0; .NET4.0C; .NET4.0E; .NET CLR 2.0.50727; .NET CLR 3.0.30729; .NET CLR 3.5.30729)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUJoeWVqbUNiM2Ixa2hRd3VoRWdZSnRqZkRDb1ZHRENZVzVCMnNCNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vNTkuOTkuMTU1LjI0NyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736936852),
('lUE2N80nu7VyTo0lNLLT7npMqUWGBtywGXMjppPx', NULL, '15.188.51.115', 'Mozilla/5.0 (Linux; Android 7.0; SM-G892A Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNnZ3Wjl0NFdoY2RoT0lMQnBKcGMxTFpUM3g2OVYyRzc5c0FBUmhOMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTQ6Imh0dHA6Ly9tcmlnLmluIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736944672),
('MO3MXJjR119meWEaaid65hsevdmjjEG7ixYa9mNE', NULL, '176.123.7.98', 'Mozilla/5.0 (Linux; Android 9; SM-G965U) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.101 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUZJb1IxT2tKMzQwdkxxZkdtMVJCNVU4ZGVlTUNpYTZqQmZRV1dnNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTQ6Imh0dHA6Ly9tcmlnLmluIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736937411),
('Mq3VHfFGBHIC66QKQIwmoXxVOCBluK2PvKLu2lA6', NULL, '159.65.113.181', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0.1) Gecko/20100101 Firefox/60.0.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQm1XanJOMm9rUDlyeEVGUVpJMEdXNklsUUhLNk9qcndwRG5uOHljayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vMTM4LjY4Ljk4LjExNiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736935403),
('Mwm1UBitee3usaSj5lO0ZQx4icwehh9kQg59q7wA', NULL, '172.68.175.37', 'Mozilla/5.0 (compatible; wpbot/1.2; +https://forms.gle/ajBaxygz9jSR8p8G9)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUHNNNTk4VFpVNjBwV2hDb1VQUmhtalNxY3FhdW5NWTk2V1AxUkJWUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vYXBwLmdmeHMuaW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1736940485),
('Nxv1nhn8YGuCoAP3mgvfBbAw7dos75KMfmloFSo8', NULL, '109.205.213.198', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMkgzbFVJMjhUdVhCcFNOQWpOWW10c2pyckUyTFpIRWd5ampWanp1YSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736939539),
('PksG6mxHPfUBFbt68vYr8pNzSwjA4f9NqVZPC4Fy', NULL, '71.6.134.234', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSEFENjRxU3hPUzZ1eWdYVlFTTnJqamNKMFYxN1ZjUjFwMnFQb3lHWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHBzOi8vdWwuZ2Z4cy5pbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736942803),
('Qpy6StY2ID58N9XoNCXNiIWfGbAJSlq2HiATDu4x', NULL, '192.168.101.11', 'HomeNet/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2l0YVR6MnFrZXN2cEhDTm5KRUJvdlIyQ1BPcnJWMXI3RTU0R1BTRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xOTIuMTY4LjEwMS4xMSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736945694),
('qsnDKQY5yry94GWAvYKVgSJu1cW4N4DFTdgwMww1', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkpJbHlYcjBVMVYzazhMc3BBaXJJOE4xdUlGSlBvMnVqTExteDU3USI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736939517),
('U5mGYskPHEMWRfE0RTSZteJ2yVXnBzNpVYUdgq2h', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVmxmcjBpR2RvbGVHQ3FKd3NRTnZ0bnJFSXJUTGI2aTRNM1VVdHpleSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736938348),
('uy6xPJoQUpplOPPObPjX6URUMfVG5gFGuWP3Wlsu', NULL, '167.71.131.143', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHNoMnlTUHQwTnRzSnZYM1FlckxLWVd4TTRndXpJY0tnM2VvSWg0eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vNTkuOTkuMTU1LjI0NyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736936831),
('vcJfWp3tIVmPZMimFjtcdxbUh1HS9kAzPqItyoNV', NULL, '47.88.101.3', 'Mozilla/5.0 (Linux; Android 10; LIO-AN00 Build/HUAWEILIO-AN00; wv) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieENzMUF4bjZnQXAzd09yT0s2Sk5WM3VrMmFNNjVPN3BXdmVHb1AyZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736945544),
('WljYuJv7sLOUhthVKHwJpSfCT0Syy6qX2SHB6wVu', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNjBxRnVVOHlXQ0pLakJ0R2VsUnV0NzJhcTFDeWhYYmNxNGdXbmhLWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736933225),
('x2Ipr0o0fB6d5UjCW0dBKtHlJMwh4Ac179x5YMF3', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaTZ3bmMwVDFlcXF3bFFVd3pNOVB0c0ZBOWZNVElyNEFzbndVOEtvdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736936269),
('XY8a0I76h8j1RVVvA4pSafYWd8hvDviEZmM7evV3', NULL, '139.59.19.244', 'Mozilla/5.0 (compatible)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1ZINXVIZElmZDR1Wk9RVThuMWJBYXU4RjNGTEFPYU9JWmF6dHIwUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vaG91c2llLmdmeHMuaW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1736943117),
('zE1wuChdliYndqy407WBeI6iKUp00MsIWeJKUDF6', NULL, '141.95.243.200', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmtLckpMcHU4bkFOVHVlOEF6U0psMjJRYjh5U3ZleXBtSnNUNmljQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTQ6Imh0dHA6Ly9nZnhzLmluIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736933724);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `estimated_time` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` varchar(255) NOT NULL,
  `priority` varchar(255) NOT NULL,
  `is_critical` tinyint(1) NOT NULL DEFAULT 0,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_assignments`
--

CREATE TABLE `task_assignments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_dependencies`
--

CREATE TABLE `task_dependencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `dependency_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Nitin Goyal', 'nitin@mrig.in', NULL, '$2y$12$EcPU9C7hSr5M3jmu3ct.XeYkwYlhWq7Zx3Zh4.41RX2sC1WTeafEO', 'axElrOnLRZNr2wHCG7gBe9GNx4kU5xfYKSqO4RcqMPOBHvCXToAloX4FSseG', '2025-01-13 02:56:59', '2025-01-13 02:56:59');

-- --------------------------------------------------------

--
-- Table structure for table `user_departments`
--

CREATE TABLE `user_departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_project_permissions`
--

CREATE TABLE `user_project_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `resource_id` bigint(20) UNSIGNED NOT NULL,
  `resource_type` enum('task','document','item') NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_project_positions`
--

CREATE TABLE `user_project_positions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `position_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_project_positions`
--

INSERT INTO `user_project_positions` (`id`, `user_id`, `project_id`, `position_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, '2025-01-13 18:38:01', '2025-01-13 18:38:01');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive','blacklisted') NOT NULL,
  `evaluation_score` decimal(5,2) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configurations`
--
ALTER TABLE `configurations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `configurations_type_key_unique` (`type`,`key`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `custom_fields_code_entity_type_unique` (`code`,`entity_type`);

--
-- Indexes for table `custom_field_options`
--
ALTER TABLE `custom_field_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `custom_field_options_custom_field_id_name_unique` (`custom_field_id`,`name`);

--
-- Indexes for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `custom_field_values_entity_type_unique` (`entity_type`,`entity_id`,`custom_field_id`),
  ADD KEY `custom_field_values_entity_type_entity_id_index` (`entity_type`,`entity_id`),
  ADD KEY `custom_field_values_custom_field_id_foreign` (`custom_field_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_controllers`
--
ALTER TABLE `document_controllers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `document_controllers_document_number_unique` (`document_number`),
  ADD KEY `document_controllers_project_id_foreign` (`project_id`),
  ADD KEY `document_controllers_created_by_foreign` (`created_by`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_category_id_foreign` (`category_id`),
  ADD KEY `items_created_by_foreign` (`created_by`),
  ADD KEY `items_vendor_id_foreign` (`vendor_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `positions_name_unique` (`name`);

--
-- Indexes for table `process_approvals`
--
ALTER TABLE `process_approvals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `process_approvals_approvable_type_approvable_id_index` (`approvable_type`,`approvable_id`),
  ADD KEY `process_approvals_process_approval_flow_step_id_foreign` (`process_approval_flow_step_id`),
  ADD KEY `process_approvals_user_id_foreign` (`user_id`),
  ADD KEY `process_approvals_tenant_id_index` (`tenant_id`);

--
-- Indexes for table `process_approval_flows`
--
ALTER TABLE `process_approval_flows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `process_approval_flow_steps`
--
ALTER TABLE `process_approval_flow_steps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `process_approval_flow_steps_process_approval_flow_id_foreign` (`process_approval_flow_id`),
  ADD KEY `process_approval_flow_steps_role_id_index` (`role_id`),
  ADD KEY `process_approval_flow_steps_order_index` (`order`),
  ADD KEY `process_approval_flow_steps_tenant_id_index` (`tenant_id`);

--
-- Indexes for table `process_approval_statuses`
--
ALTER TABLE `process_approval_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `process_approval_statuses_approvable_type_approvable_id_index` (`approvable_type`,`approvable_id`),
  ADD KEY `process_approval_statuses_tenant_id_index` (`tenant_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `projects_project_number_unique` (`project_number`),
  ADD KEY `projects_client_id_foreign` (`client_id`),
  ADD KEY `projects_epc_id_foreign` (`epc_id`),
  ADD KEY `projects_project_manager_id_foreign` (`project_manager_id`),
  ADD KEY `projects_created_by_foreign` (`created_by`);

--
-- Indexes for table `project_members`
--
ALTER TABLE `project_members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `project_members_project_id_user_id_role_id_unique` (`project_id`,`user_id`,`role_id`),
  ADD KEY `project_members_user_id_foreign` (`user_id`),
  ADD KEY `project_members_role_id_foreign` (`role_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_project_id_foreign` (`project_id`),
  ADD KEY `tasks_created_by_foreign` (`created_by`);

--
-- Indexes for table `task_assignments`
--
ALTER TABLE `task_assignments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `task_assignments_task_id_user_id_unique` (`task_id`,`user_id`),
  ADD KEY `task_assignments_user_id_foreign` (`user_id`);

--
-- Indexes for table `task_dependencies`
--
ALTER TABLE `task_dependencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `task_dependencies_task_id_dependency_id_unique` (`task_id`,`dependency_id`),
  ADD KEY `task_dependencies_dependency_id_foreign` (`dependency_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_departments`
--
ALTER TABLE `user_departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_departments_user_id_department_id_unique` (`user_id`,`department_id`),
  ADD KEY `user_departments_department_id_foreign` (`department_id`);

--
-- Indexes for table `user_project_permissions`
--
ALTER TABLE `user_project_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_proj_res_type_unique` (`user_id`,`project_id`,`resource_id`,`resource_type`),
  ADD KEY `user_project_permissions_project_id_foreign` (`project_id`);

--
-- Indexes for table `user_project_positions`
--
ALTER TABLE `user_project_positions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_project_positions_user_id_foreign` (`user_id`),
  ADD KEY `user_project_positions_project_id_foreign` (`project_id`),
  ADD KEY `user_project_positions_position_id_foreign` (`position_id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `configurations`
--
ALTER TABLE `configurations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `custom_field_options`
--
ALTER TABLE `custom_field_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_controllers`
--
ALTER TABLE `document_controllers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `process_approvals`
--
ALTER TABLE `process_approvals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `process_approval_flows`
--
ALTER TABLE `process_approval_flows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `process_approval_flow_steps`
--
ALTER TABLE `process_approval_flow_steps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `process_approval_statuses`
--
ALTER TABLE `process_approval_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `project_members`
--
ALTER TABLE `project_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `task_assignments`
--
ALTER TABLE `task_assignments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_dependencies`
--
ALTER TABLE `task_dependencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_departments`
--
ALTER TABLE `user_departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_project_permissions`
--
ALTER TABLE `user_project_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_project_positions`
--
ALTER TABLE `user_project_positions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `custom_field_options`
--
ALTER TABLE `custom_field_options`
  ADD CONSTRAINT `custom_field_options_custom_field_id_foreign` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD CONSTRAINT `custom_field_values_custom_field_id_foreign` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `document_controllers`
--
ALTER TABLE `document_controllers`
  ADD CONSTRAINT `document_controllers_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `document_controllers_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `items_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `items_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `process_approvals`
--
ALTER TABLE `process_approvals`
  ADD CONSTRAINT `process_approvals_process_approval_flow_step_id_foreign` FOREIGN KEY (`process_approval_flow_step_id`) REFERENCES `process_approval_flow_steps` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `process_approvals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `process_approval_flow_steps`
--
ALTER TABLE `process_approval_flow_steps`
  ADD CONSTRAINT `process_approval_flow_steps_process_approval_flow_id_foreign` FOREIGN KEY (`process_approval_flow_id`) REFERENCES `process_approval_flows` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `projects_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `projects_epc_id_foreign` FOREIGN KEY (`epc_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `projects_project_manager_id_foreign` FOREIGN KEY (`project_manager_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `project_members`
--
ALTER TABLE `project_members`
  ADD CONSTRAINT `project_members_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `project_members_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `project_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task_assignments`
--
ALTER TABLE `task_assignments`
  ADD CONSTRAINT `task_assignments_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_assignments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task_dependencies`
--
ALTER TABLE `task_dependencies`
  ADD CONSTRAINT `task_dependencies_dependency_id_foreign` FOREIGN KEY (`dependency_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_dependencies_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_departments`
--
ALTER TABLE `user_departments`
  ADD CONSTRAINT `user_departments_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `user_departments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_project_permissions`
--
ALTER TABLE `user_project_permissions`
  ADD CONSTRAINT `user_project_permissions_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_project_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_project_positions`
--
ALTER TABLE `user_project_positions`
  ADD CONSTRAINT `user_project_positions_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_project_positions_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_project_positions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
