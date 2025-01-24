-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2025 at 12:48 PM
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
('da4b9237bacccdf19c0760cab7aec4a8359010b0', 'i:1;', 1736793087),
('da4b9237bacccdf19c0760cab7aec4a8359010b0:timer', 'i:1736793087;', 1736793087),
('livewire-rate-limiter:a5953fb5e1c86b5792734a0b4775a77519f2794f', 'i:1;', 1736789269),
('livewire-rate-limiter:a5953fb5e1c86b5792734a0b4775a77519f2794f:timer', 'i:1736789269;', 1736789269),
('spatie.permission.cache', 'a:3:{s:5:\"alias\";a:3:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";}s:11:\"permissions\";a:40:{i:0;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:16:\"view-own-project\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:3;s:1:\"b\";s:21:\"view-assigned-project\";s:1:\"c\";s:3:\"web\";}i:2;a:3:{s:1:\"a\";i:4;s:1:\"b\";s:19:\"view-global-project\";s:1:\"c\";s:3:\"web\";}i:3;a:3:{s:1:\"a\";i:5;s:1:\"b\";s:16:\"edit-own-project\";s:1:\"c\";s:3:\"web\";}i:4;a:3:{s:1:\"a\";i:6;s:1:\"b\";s:21:\"edit-assigned-project\";s:1:\"c\";s:3:\"web\";}i:5;a:3:{s:1:\"a\";i:7;s:1:\"b\";s:19:\"edit-global-project\";s:1:\"c\";s:3:\"web\";}i:6;a:3:{s:1:\"a\";i:8;s:1:\"b\";s:18:\"delete-own-project\";s:1:\"c\";s:3:\"web\";}i:7;a:3:{s:1:\"a\";i:9;s:1:\"b\";s:23:\"delete-assigned-project\";s:1:\"c\";s:3:\"web\";}i:8;a:3:{s:1:\"a\";i:10;s:1:\"b\";s:21:\"delete-global-project\";s:1:\"c\";s:3:\"web\";}i:9;a:3:{s:1:\"a\";i:11;s:1:\"b\";s:13:\"view-own-task\";s:1:\"c\";s:3:\"web\";}i:10;a:3:{s:1:\"a\";i:12;s:1:\"b\";s:18:\"view-assigned-task\";s:1:\"c\";s:3:\"web\";}i:11;a:3:{s:1:\"a\";i:13;s:1:\"b\";s:16:\"view-global-task\";s:1:\"c\";s:3:\"web\";}i:12;a:3:{s:1:\"a\";i:14;s:1:\"b\";s:13:\"edit-own-task\";s:1:\"c\";s:3:\"web\";}i:13;a:3:{s:1:\"a\";i:15;s:1:\"b\";s:18:\"edit-assigned-task\";s:1:\"c\";s:3:\"web\";}i:14;a:3:{s:1:\"a\";i:16;s:1:\"b\";s:16:\"edit-global-task\";s:1:\"c\";s:3:\"web\";}i:15;a:3:{s:1:\"a\";i:17;s:1:\"b\";s:15:\"delete-own-task\";s:1:\"c\";s:3:\"web\";}i:16;a:3:{s:1:\"a\";i:18;s:1:\"b\";s:20:\"delete-assigned-task\";s:1:\"c\";s:3:\"web\";}i:17;a:3:{s:1:\"a\";i:19;s:1:\"b\";s:18:\"delete-global-task\";s:1:\"c\";s:3:\"web\";}i:18;a:3:{s:1:\"a\";i:20;s:1:\"b\";s:17:\"view-own-document\";s:1:\"c\";s:3:\"web\";}i:19;a:3:{s:1:\"a\";i:21;s:1:\"b\";s:22:\"view-assigned-document\";s:1:\"c\";s:3:\"web\";}i:20;a:3:{s:1:\"a\";i:22;s:1:\"b\";s:20:\"view-global-document\";s:1:\"c\";s:3:\"web\";}i:21;a:3:{s:1:\"a\";i:23;s:1:\"b\";s:17:\"edit-own-document\";s:1:\"c\";s:3:\"web\";}i:22;a:3:{s:1:\"a\";i:24;s:1:\"b\";s:22:\"edit-assigned-document\";s:1:\"c\";s:3:\"web\";}i:23;a:3:{s:1:\"a\";i:25;s:1:\"b\";s:20:\"edit-global-document\";s:1:\"c\";s:3:\"web\";}i:24;a:3:{s:1:\"a\";i:26;s:1:\"b\";s:19:\"delete-own-document\";s:1:\"c\";s:3:\"web\";}i:25;a:3:{s:1:\"a\";i:27;s:1:\"b\";s:24:\"delete-assigned-document\";s:1:\"c\";s:3:\"web\";}i:26;a:3:{s:1:\"a\";i:28;s:1:\"b\";s:22:\"delete-global-document\";s:1:\"c\";s:3:\"web\";}i:27;a:3:{s:1:\"a\";i:29;s:1:\"b\";s:13:\"view-own-item\";s:1:\"c\";s:3:\"web\";}i:28;a:3:{s:1:\"a\";i:30;s:1:\"b\";s:18:\"view-assigned-item\";s:1:\"c\";s:3:\"web\";}i:29;a:3:{s:1:\"a\";i:31;s:1:\"b\";s:16:\"view-global-item\";s:1:\"c\";s:3:\"web\";}i:30;a:3:{s:1:\"a\";i:32;s:1:\"b\";s:13:\"edit-own-item\";s:1:\"c\";s:3:\"web\";}i:31;a:3:{s:1:\"a\";i:33;s:1:\"b\";s:18:\"edit-assigned-item\";s:1:\"c\";s:3:\"web\";}i:32;a:3:{s:1:\"a\";i:34;s:1:\"b\";s:16:\"edit-global-item\";s:1:\"c\";s:3:\"web\";}i:33;a:3:{s:1:\"a\";i:35;s:1:\"b\";s:15:\"delete-own-item\";s:1:\"c\";s:3:\"web\";}i:34;a:3:{s:1:\"a\";i:36;s:1:\"b\";s:20:\"delete-assigned-item\";s:1:\"c\";s:3:\"web\";}i:35;a:3:{s:1:\"a\";i:37;s:1:\"b\";s:18:\"delete-global-item\";s:1:\"c\";s:3:\"web\";}i:36;a:3:{s:1:\"a\";i:38;s:1:\"b\";s:14:\"create-project\";s:1:\"c\";s:3:\"web\";}i:37;a:3:{s:1:\"a\";i:39;s:1:\"b\";s:11:\"create-task\";s:1:\"c\";s:3:\"web\";}i:38;a:3:{s:1:\"a\";i:40;s:1:\"b\";s:15:\"create-document\";s:1:\"c\";s:3:\"web\";}i:39;a:3:{s:1:\"a\";i:41;s:1:\"b\";s:11:\"create-item\";s:1:\"c\";s:3:\"web\";}}s:5:\"roles\";a:0:{}}', 1736864167);

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
('16nmAdL1LrAavXNfxHF6ojQYnybF2x1p19eeIUL7', NULL, '78.108.178.104', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMW1DcENLaTBiOHozT1dnZ3o4V2U4WGs1REYzSkxKOVkyY0RUb0ZUOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736832596),
('1w4bWDN8I1ze1BRifVXqBsrIuZhVG5KwAVVKrTjK', NULL, '192.168.101.11', 'HomeNet/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib2E4eEMxREJZUG9Sa0dpaVlMYzM4eklsUjlHYmZndkRPRVFLNWIxSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xOTIuMTY4LjEwMS4xMSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736833747),
('2gs6CvlMwZb5jvePsbANyxM21duneK4fwraanL8s', NULL, '78.108.178.104', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRTNLNGEwNFYwV2ZPd0swamVmQ1NCeTFkN2x3TW5kejV0amF4YnVWZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736844988),
('2lIEfcT69kd0bffzZS6rf5hnpIhEwtTJFSIFriMU', NULL, '147.185.133.7', 'Expanse, a Palo Alto Networks company, searches across the global IPv4 space multiple times per day to identify customers&#39; presences on the Internet. If you would like to be excluded from our scans, please send IP addresses/domains to: scaninfo@paloaltonetworks.com', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZFhQMzdxZmZIeHVSVHV4bFhjTjByOFMzOXlDdTk2WDMyUVVmOEJ1MSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vNTkuOTkuMTU1LjI0NyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736848023),
('3bwFGdm9LzE0ZnvgfBI6cakI9jEkCjMhmKm2HYqO', NULL, '78.108.178.104', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidUZsWmlwMXp0MmFpa09rZ215cDU4eWtZV3J0MUNLYmRtTUQ2OGYydyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736844619),
('3sukoFxmFG8OhGBeHMcBvRY4zqVijrYjGTvUt4T2', NULL, '209.126.85.224', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT3pWcndLZmpuVVFYbVQ4ZUZnUk9saEtEQUdOUjVNS2tiN2RLdEVGSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTQ6Imh0dHA6Ly9nZnhzLmluIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736844942),
('4C6Pk5JvBpsAzw9ETLweUQdJNqldhVebiIQHRvYp', NULL, '172.68.205.196', 'Mozilla/5.0 (compatible; InternetMeasurement/1.0; +https://internet-measurement.com/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSDBTZ3dtTmlDVzl2TmEwdERJSkZNc2dwek11RGp3MldQekY3S1FQSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTc6Imh0dHA6Ly93YS5nZnhzLmluIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736851409),
('75suGno0dKCFP53NlhVzEO2oXLUar5ZYqLVYRrZN', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS2hKSlF2TjlrZVhqWXFwN2pqVVN6NTdIb00yT3BhS3FOUUNTS21XNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736835799),
('79BgBa6l8aXGuK4rGGCpJITl1UrCVzIjixI9CKLC', NULL, '78.108.178.104', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibk1TVmhkNUJEQXhYVWFFbHF2TE5WRzdhUlB5OE1Nb0tTVElWbHNuYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736844384),
('80GEV6MXxoiz5USSCrPsKJfHDvmzgcd0gkCLYuDe', NULL, '78.108.178.104', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVpGTEVrdXNBVnF6UlE2UGc4WU1naDRheTJkOEdCbUExR3pwanVGVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736832477),
('8BXE5HYilOyiSNTw2EXJx6t0mrWOeqp3giMwc1xW', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTHdSbTVhMkRncFRFbnZPcTdKckpoanZrM2d0ZnZXbVRra29mMXdQMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736831549),
('8ob6Yie3QPqwUffZj7PYqVolS3w2QRid8GYVE10v', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYTdKS2lrUEJROXJNeU5FaDB5ZnBveUEwY0NzU3NzUXRkRlZEVElOSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736838211),
('8P7msQW3nXfYhHyEB1tXmKKlvua8dExU43JWekYt', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicjU2RFZzMjFKMzdZRmpFNmdZM2Z0SFlXRUhjRGpZVXBLZ2VsR21EUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736849261),
('8srHz0PW5d8zcFpdZRzMgGW51okOiECn0aIXmZVz', NULL, '185.16.39.104', '', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZHh1bXJnZGp1TnVKMWJVVXJobmFJRWJKQ2dUenM0QW5QZjJXbzVHMCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736827945),
('9OMftwTJuVXt9BBDanFlvSXK3t25FT3fu1f28UTc', NULL, '64.62.197.22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 YaBrowser/23.1.2.987 Yowser/2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHhObXJ0YU5qeFowaXdEUEJtVVg4SzQwcDQzRktyTDFENkFvRnZ3ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vNTkuOTkuMTU1LjI0NyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736852398),
('AGrnYy1JBfRFZ3hewhZB6p4dODfVOj1jIAJccIgN', NULL, '179.43.191.146', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 Edg/90.0.818.46', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSWRFNkxDalRxdGVTYXc2QXJ4Z09XQnZWZTl2S3N3YzI3QUxCVnFLNiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736840277),
('aojMywSxUGXLQrtuKx4YlVwZwHENQET6cKIhpTOb', NULL, '209.126.85.224', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieUcwRFlmWFM0SGZia0RyN2djNGt4WkZsaHZYNVBSRFpQdFRtTE5hUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTQ6Imh0dHA6Ly9nZnhzLmluIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736844938),
('bEZbq9cUiF7mhJX5JqhrXLZZWRDkFmTSdibVW1m3', NULL, '185.196.220.253', 'Hello World', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidUtKWFZaYzNpbUw1UnFTMnJEOFlvaU42V2ZsUGxQajBrTXRJWFo5SyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736834095),
('BPVuEtfY3m8FoN0Jqtq09jqP5GwH5zfbSbCzLGlu', NULL, '78.108.178.104', 'Mozilla/5.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ21xdFNSN3BIZ1dwV0xsbXhiQm5lRURXOVNTanFGSld5blEzR21hOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736833185),
('buDHLg8zvST8vQfETGFAOH5dU7cIWBD5vVAYjYqO', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0dsS0N1blFYZW5kREhlU09rWVJUbmE2dTI5d0NvTDFCY2VGRDZTbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736853830),
('Ccs3qXTMuLtSEDzaYFTnm36xpdaBG3OO7bLWEFwt', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibDFmcFM2MklRR2NsRlQ4Yk9CUjVTTUg3UzFJekhSdHlTTUxPZW0xYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736848069),
('dntEY920BoyopAvkb0ObnOZOWUyfnRX0Cf9Y952N', NULL, '162.216.150.69', 'Expanse, a Palo Alto Networks company, searches across the global IPv4 space multiple times per day to identify customers&#39; presences on the Internet. If you would like to be excluded from our scans, please send IP addresses/domains to: scaninfo@paloaltonetworks.com', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHFnaTVkQkx1TWw2NEhKSkc3ZlY3aExQSkRUNXAyTDRoTVM5eG1NYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736836727),
('etgTLEGMUhSztTzzEQsRO5df1UgCx6Be4IMtNLbW', NULL, '95.214.55.226', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRDVIU0JmSUN2YkN6Q2Rvc2dWdmZlR3lOQVhwWm95NlZBSXJubEVYRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736839709),
('EvAMcVoz7yPSYo7jOa09Q6eC3DjnwkrEfy6mXxKJ', 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoicFBlYUJ5bE9MNzdiTjUxV3NMRjlBVUt6REFLODVjVnpRUUQzSkE1aCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEyJEVjUFU5QzdoU3I1TTNqbXUzY3QuWGVZa3dZbGhXcTdaeDNaaDQuNDFSWDJzQzFXVGVhZkVPIjtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozODoiaHR0cDovL2xvY2FsaG9zdC9hZG1pbi9wcm9qZWN0cy9jcmVhdGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1736835101),
('f13CE9PewKrFTnwm7hKzuto9iAreR62jMmn2P7Ud', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzNPNUVTRXZvTHJHOUoxZVZTbWFPV203c05tSnVzMHNIOFZlUkZNVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736834185),
('gm9utMAnZg0OVB7T9GarKvCic74rhrlVAGBbU7pK', NULL, '176.123.10.110', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSG5NV1ZPSkY3bXd5UzE4N2Q0ajhlbUhVMTBNT0l1d1VKaUlxaU5tVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTU6Imh0dHBzOi8vbXJpZy5pbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736845246),
('GmlG3YAYQF9RQO2zDknx8zlwpiOu30GchEORUDwn', NULL, '172.225.200.91', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_1_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.1 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidjNRaEozbGFMRHJSVmpoUGx4WklLQmZZWlpKNnJKb2N5SnN2dGVObyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTQ6Imh0dHA6Ly9tcmlnLmluIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736838419),
('GNHsFErPj1QH4e0e7Vwv2LxqRjutZicedFtnc99Z', NULL, '172.69.194.128', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:106.0) Gecko/20100101 Firefox/106.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzFnbGRTaVdwbjRvb0tFaURuZHhQNkxLRlNKcEZmSWhrQkxxd3Z5ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHBzOi8vd2EuZ2Z4cy5pbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736840498),
('hFfAl9xaSYQS4Q04Ytx00qL5uLGtNxx6qFw3NxRK', NULL, '185.242.226.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ21aT2VUY0FZdjlFenBodkRJR0pHbm9lbDFZUzc3V1BZM0x0ekpHbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736829351),
('HfXdsqDxK34MbxLhOUkVtkyGWuAkIlcg81xX3iuH', NULL, '109.205.213.198', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN3FsdjNLNjVOczBYOGdIRUlZRDROWTVwV0lOR3MzNzhZQmNsb1ZZNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736843990),
('hIaByj2w6DK1aZ9s84xBDDIYUfxidYOPlpa5YikY', NULL, '109.205.213.198', 'Hello World', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUE55dGZCVTMxRjVoQlB1MllkTFk3SnF0emx5RnFYWUdqaXJ5amlaQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736844621),
('Hjb64wP6tqCKtTB4hr3stwxe44PdY34QHvBgWkMm', NULL, '5.181.190.248', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMUdzOUpibTlsemxyMk1qeHUxZ3Z1UDJxYnVHMGtEWTVyQkFKbloyYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736839313),
('HPPZUZwkcaXGJSNrG3KjmHzIr7EE6QChGCd16iyT', NULL, '172.71.135.17', 'Expanse, a Palo Alto Networks company, searches across the global IPv4 space multiple times per day to identify customers&#39; presences on the Internet. If you would like to be excluded from our scans, please send IP addresses/domains to: scaninfo@paloaltonetworks.com', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicm02NURhdUVOM3NldDhpVUNHbjAzRDBIQ2lXYXpoTFJEbWNGNTVzcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHBzOi8vd2EuZ2Z4cy5pbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736843006),
('hrONBB1q4JHVchpSa2Z7glZe0huPBQ53mLkYCxB7', NULL, '78.108.178.104', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXZ3Y3FCSVQ0dWJvNnF2cWZmR1YzVGxNZVh1aUxRNHpPcnl5enNnSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736832195),
('hrxoqBlUOsG1ITOYxGKiRRYpALqN3qCpXxwDCfnq', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2owZnlDd0NaTXAxNW5vcHV0bkV0SzlqdHZqR1BnTllmVnJzMHhuSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736847130),
('IbYrYd3qfQwWr0sO0HjSd59e0dIcETACXrLsIkSp', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1k0eWhBZVhtdnBpQ0hKY2JZdEVCbmpRVzMzYVBkVG9FVHFIY2VqbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736842906),
('JGiH3IoKVLsNVNn4eN7ZtyFWLVKwoqjzcJz6incK', NULL, '167.94.146.62', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRDJZV0tSbG1VUmkxSVdiVG1vVlgySzd0S1BieVhwQ3dmUktteVNKVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736843810),
('kdfAC2NWFrczT5onJ0e2vuLhvEcRrBzHTHzVizse', NULL, '45.148.10.242', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 Edg/90.0.818.46', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVTNld25adlJ3NDhlSEI5dTN5THB4QzAwODFOWkhpbFFwb2FiVDNKSyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736831798),
('KJr2hpCfAmTYdqH6maQSSrvegQOko46FRuUvtRan', NULL, '218.248.240.68', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibk8yZ0Nvd2pONUU5NzBGcEJQbUNkR1dyQ2I3ZnBBTGw0MDFnOVFCcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736841564),
('kmpN6tBgasDMCwjvRIbp7EsFPxTZbaO2SD5sstCA', NULL, '5.181.190.248', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUDhzRktkRkpMWmxXWHVNcjhobU5HcjA4Vk4zS2ZEZkduTTEyRWVodSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736830889),
('KUJm5floWj4U3vS373750Nzqq7OPWbiTLamCZFwS', NULL, '209.126.85.224', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibzdvYVdEanlhRkxDS2dQSGxDOUowcllhYjJTdVVFWkNFNHp3Nk4zdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTQ6Imh0dHA6Ly9nZnhzLmluIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736844931),
('L53s5gfQDgguIqqTlqdbrBzBT2dpKV9tOJ8FZloN', NULL, '146.190.174.94', 'Mozilla/5.0 (compatible)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaUI3cFl3WnJHakNCR2dwT0c2OEZaM3ZJblFyVEZsMXdJdW5lQ3BrVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9zZXJ2ZXIuZ2Z4cy5pbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736835492),
('lb0BvHplgWCTDoS0D4j26TX2AncHyIIs2X5GlvJB', NULL, '114.166.28.148', 'curl/7.88.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3Y5UjBpd0thcWdVWlk0eUVNZVJmV29qMDY1dEs3a1hmcUcxZHRKYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736850720),
('LNYDGL22A8Idhy7sbLbqUIcQC8TalJZU4V4COjkw', NULL, '45.132.194.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:128.0) Gecko/20100101 Firefox/128.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU0hrOWswTHRncWFjTWV5a0k5WFhOMzVQVWtYMHJWS0lWM3g1alZSMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736833685),
('LoYdcJeeO7tCu9cTzWpbKJDEDpeRasGGsh57ZE4f', NULL, '78.108.178.104', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTnVOemdENGV3VGs4bUVwZjZiT2R3UWdJcUtpS1g1TzJ3TTlXaTVINiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736831973),
('LR22UehVfstJnbDgaHai0SCkOzjy7ZiDV6EhnzAS', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTDRPSzcxcUo3d0VPU2NzeGN2YjBBYTZQeFZLNkF5SGowbmR2c2xVdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736841852),
('LXxmXHEE9QVfr8BRMN5LARBCVnwMNzabTStYDZfR', NULL, '109.205.213.198', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 Edg/90.0.818.46', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicnhpeUE3NEhDZmg0S2gwaWJmb3g1aEtCcGNnVDVTZVlJTzdNUzBZZCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736833481),
('mCbVstqXMgdZ0OSniCptkD2qlMzmapLo6q90y4NG', NULL, '78.108.178.104', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT25vSkM5QkU2SEJTdzYxdjdoR0lGZU1GcmtkNWVOZnR0dmZUakhGciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736832399),
('MOdqSW6plygYOC98spNL8vkrmeRhqDd6w5GhP7Su', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidDdxSzhhYmJxM2NsZUQ3UnRKVjFhVEN0TXk1VWkyUkhIY2dVeWY1VSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736841438),
('NBgLkG6QB59CuZV5ySyWEiTeDc52VsHHJEied99N', NULL, '185.16.39.104', '', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYjJQSHdHeERRN3ZWTXNmekFqbjczNTc0VWhlVng1Rzl4Q29ocnhXeiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736845263),
('nEm60vmM5XyQSVmhvF7LRvDyB5dTUtWI3wIYi2LB', NULL, '45.148.10.242', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 Edg/90.0.818.46', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiR3RubjFIZkNRekcyWTREY0lUVnJBdVFZSFVLWUJJUXliTjVaYXliMCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736849390),
('NhkQJNrafvPKRm9aS9GQSkwTbUnJjOWJUYTvJUnI', NULL, '109.205.213.198', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicEpzOGVHRW1vY2U5aDBkSkZlWE9hQU5CUTNSekRMUXI1dHVwQjZpMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736830573),
('nsMx19xDJW0WsY5bqHsjPEDaBcIDJgBMYWaMO9ko', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFNpMXZFV0J1eXBiYUN3TmhEbE5pWTB4THlTZ05CZmJBcHRBR2lYRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736839307),
('OYLZ7eUjthNnRZKeLSwK4qcIpOhLMTRO221X6h9B', NULL, '78.108.178.104', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ09jRHdGTlY0anJHbndXTFREcU5SQVIwZ3pObUlDMTYxSmI2QU9DZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736832680),
('P6O7SvQppv9w6zpIKqUzVEKTDHDdHFqXhrJB2mRL', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ01kN01xT1l2eVpKSnJFSVl2Njh5SWE5N3JIemhxYmx2dDk2cVdSbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736844891),
('PEQ9rQKWdPBJo9UavaIAoFOoi0HTinYBSndixLbL', NULL, '45.148.10.242', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 Edg/90.0.818.46', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoickhwQzFEZGJmcUM5Y2E0YzhNSERQMnA1S1VKNlNjcU1YeFBZbVNlcyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736855108),
('PFYAK3Uh8BMMAuGuJ38VKG4LcJ8oBb0e955RFJ2n', NULL, '78.108.178.104', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibUp4SnhkcnRVTDNZZFFWTnUxM3RSUXEzNXVMR0R1Skg0QXl0UFhhNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736844795),
('PZnu1cHNikg848UhRYJcrAUdoEqbFT8WELvVCfFy', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYk9KUFBoaXJSY20wYUpsR3dFcXphQ0Q0NnhoekNQMEdwQlJkaVVFYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736832882),
('Q74uJ30KFN11rUlH3Mp3NrB2WemRW4cnjkz9ObKy', NULL, '167.172.41.58', 'Mozilla/5.0 (compatible)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSDBrcEh6R2FTdkttOHVuZktBTm5yMGF3Mkh4RmZFWTVkdHI5OWM3NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vNTkuOTkuMTU1LjI0NyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736835849),
('Q7O3vQDodJN7R0CUSk0tiNnmNPsdQVBBYJJvVuAW', NULL, '109.205.213.198', 'Hello World', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVRjVjhoeEl3OXc5Nlg3TlVjeXF1Sk15YWIwZG5HWEtuaXBGRkd0SyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736830664),
('QAxEUEzzCKfqwHQtW4uDaVA2rukU4avV1V7jXGWJ', NULL, '95.214.55.226', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidnNYY2Q0RmtkUjVYUUVJcTMxNXNGdFpDVEY1Tk9ncERMdkR4WWx3NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736847149),
('Qc0u55H7gyRRvC0evCnEm2dCGUV1wjzXYrOGa7dP', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR05HMERTbWd0NXlnSlR4NG9uNndhbThqTkU0dFdYRGR3OWZsaDliNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736851063),
('QC2JAlzigAvEIIxx5bUs4Mm0MqaoLFt4QWp1DeOy', NULL, '142.93.187.147', 'Mozilla/5.0 (compatible)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHZkOVJKNlg5d0dQR1lFTE5KMXBrelJxd2FvOExWMkdTZUFiWTBHTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vNTkuOTkuMTU1LjI0NyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736842755),
('QrJSA1RAU63lUblgbmbzj9sCeuOhwkXuDDCxgMD9', NULL, '192.42.116.14', 'Opera/9.80 (Windows NT 6.2; Win64; x64) Presto/2.12.388 Version/12.16', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ21rS2hFSFVVUHVaMlNLem5mQlR2N1o4emMwZ0loOXNFbW5HeWtEUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTQ6Imh0dHA6Ly9tcmlnLmluIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736847097),
('r2JWylJ5V3r3h8if2tOMxKdqZzFRQs47IyoVg8v4', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibFJUUXdEeDVxU0VHbWo4OUVjTmJ1UzJOQUlRVTJPYTV1RWFkNGtiVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736852241),
('rIrmPzPaCgVFN1h7gvLaTJe4kyC0hPudF63SRr9Z', NULL, '45.132.194.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:128.0) Gecko/20100101 Firefox/128.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRllSc0UwMmdhRU5peERxdU9jcnBpSzhBUEdRZklTRkNENk5yd3pVRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vNTkuOTkuMTU1LjI0NyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736833684),
('RVeSFDf8YDGdcJmackDiZ5poEGohqoOXBZenqsLV', NULL, '78.108.178.104', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTDEzb1lnQlZMd1AxakFIOUx3UHlkelh3WXJyMHg4NHFnSUVyQlZQWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736844188),
('RxdNuNFmaMdKlwv6W0IlRGh3thsdZkZrWrgFfJtw', NULL, '167.94.146.62', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOTluU3RVbGZZNGtoUHMzTjBRT2NqMmYxMTNNazR6RnI0VENsM21MciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736843819),
('RyP84ttlQfAhNhuobOKm6RANs1sEbxLiWppREJZN', NULL, '172.68.211.149', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVTJzenpraTh4YkhEQjlTR2FjMUxFM0wwRWE0NGt5SERFYlpEbEtSUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHBzOi8vbXJpZy5nZnhzLmluIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736831084),
('RZnhzPpEFLXYbAkWEWdurpQG7MNZnd7jJhuDke6q', NULL, '78.108.178.104', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWEZPYTdmZUVMRllZalJZY21HQWhqU21XUFh1RUhUQlVuMW9hVjN4RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736844503),
('SUAuzkkBk7bxv9VVksUcnKNJgATfpkjCMVO94yW1', NULL, '193.34.212.75', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicm92aHR5ZFA5YnVyZjNHbTQ3OXFHSXhWd3R6a0NSdWUzVWtPQ0xEaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736842778),
('tFJs50h0l48Yu9Zq6dHuOSEqcYXXW3e42PlwrMyD', 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTHpRSnpMRjgwZG5LbWJha29BNFI2MFhzNTF5TWJ3V2p1NXRlQThjOSI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEyJEVjUFU5QzdoU3I1TTNqbXUzY3QuWGVZa3dZbGhXcTdaeDNaaDQuNDFSWDJzQzFXVGVhZkVPIjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozODoiaHR0cDovL2xvY2FsaG9zdC9hZG1pbi9wcm9qZWN0cy9jcmVhdGUiO319', 1736851155),
('Tl2eUYwWN0p57DtJyJeE7JYiZ7wC666W3xUs8Qig', NULL, '54.36.148.167', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNnlVVVFXZ3RJWkZ5cEpUa2NYeGt1blQ0UDlzRnJjbUVkRU13VHV3QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTU6Imh0dHBzOi8vbXJpZy5pbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736855181),
('tQfTwJysdDQMsdzkG4O37CmcDK1cx7dUo4Fdgoqn', NULL, '46.19.138.234', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 Edg/90.0.818.46', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiQTY2bzBCV2J6bDJZZzZjaG9IQ3RmZW1DbTZOaFhGaTJxbmxEZjV6SiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736841915),
('TtGnAyU7bebzPBumgwva4zUzetdJjdfxj4NnDXUX', NULL, '193.34.212.75', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiam9zSVZ6V05Rc0psUTM3eVVGVHlTVGZjWW81WjhVanI5Q2RvQ1J3YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736835141),
('tzfrXGW0xMH1sK0LNHBoQ3nHrSmKC9SfJEdgxe9k', NULL, '138.199.55.47', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZkQ2enJDbXJPWjZYMEl4OUs1Y0tYTzdPU09JTTR6WXFxWXJFQTBQYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTU6Imh0dHBzOi8vZ2Z4cy5pbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736842744),
('U5pQcVwkHPn6NzfVSN6fxRcWQmiUsD0dDV5g6cNa', NULL, '172.105.121.17', 'Mozilla/5.0 (X11; Linux x86_64) Chrome/98.0.4758.132 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR0JCVlpDSnBVc3VPNUxaMm15M0cyQUNjU1RFV3RtTjRUTWtObDVFaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vNTkuOTkuMTU1LjI0NyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736842600),
('uAWXviVkS4mkleHkovKjLpsa6yrz4dFWd6VkJaVY', NULL, '78.108.178.104', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOXB1UkxKWXpla3V5UGF5R2Q4RlM2WUcyRmJ0aDRGZDNCQlo4OThmMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736844290),
('uxdoLasJyN6AmmVSEgsrcgIAPhHlsIpn4v3Cj6O0', NULL, '193.34.212.75', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUjVGZjlHUlVpWDlIWWZNbXNLTzVmSml2Z2UxWkVlUHd5bVFLRkY3NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736850576),
('uyXEoVu6kqqrvoKmPtXqnrJkfcvTUur1YWxlmlVV', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHBRREtsSVZrZzNjemxLV3NCNU9EN0FZRTZRc2RlRDZkSjJrMEo2UyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736836891),
('v9D5ocEvZR1EIhwJc2zmEYwTgO0xaWDPLklKM403', NULL, '43.157.156.190', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSko0ZnlqcjlBZlFxS05KcXRFVTNNaVdTQ3I4bG53WjFVcG1NYXZERyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736848361),
('VAfA1aYwCL281J8ToRuF7X3MgfhmYgpSXlb1ukZd', NULL, '78.108.178.104', 'Mozilla/5.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVlBaRjZuczU4OFlBTzZLSDljbVFEaFV4c08zVFl4WmpCSDRKY0hJTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736845511),
('vF4eegiqOtzLiuLTGSnQV9x2sxdq0FR2bJYj8mQm', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiME9qU2lPS2JXcUJTcE5qQmgyS2t4VVI1d0lzZWJnWmx6ZWxyanhteCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736845313),
('VklM7UrkiLg1JbWGqzIDBalR4rbfNwkMrz7qKW7u', NULL, '44.220.188.159', 'Mozilla/5.0 (Windows NT 6.2;en-US) AppleWebKit/537.32.36 (KHTML, live Gecko) Chrome/57.0.3103.61 Safari/537.32', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0FHSGdQSGF5NWpFbUU3a2RTY2xxQzRNYzlxZkd1YWtBZFVyNWVWbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vNTkuOTkuMTU1LjI0NyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736853910),
('w7LT3h2dvpEes5MkHTYE4qWI54teoJiCGubpWAW6', NULL, '146.190.174.94', 'Mozilla/5.0 (compatible)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZDNaSll4NzljRk52dGNPVnNBZkI3T2JiclBNMkZtWmpVUGxHNFRUSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vc2VydmVyLmdmeHMuaW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1736835496),
('WaIuGBn2tEr6xloeNIJezD69B6h3GDwIepQYSTSA', NULL, '176.123.10.110', 'Mozilla/5.0 (Linux; U; Android 2.1; en-us; HTC Legend Build/cupcake) AppleWebKit/530.17 (KHTML, like Gecko) Version/4.0 Mobile Safari/530.17', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWHFlSU1yOUF4VkF1T3FUS2pJZm9WdjRBdDd5TWI0aERreU0yRUhxRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTQ6Imh0dHA6Ly9tcmlnLmluIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736845252),
('WAsp8FLjJEpeweDuciS8Ueq0Yeoxv2eJkBlZLCHl', NULL, '78.108.178.104', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3BBQXN3S3NFSDRaMFlsRkJVZkFKRlROVU9UbDVkcERyRHExUWx3TSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736844698),
('wHMrbBP3WSYmebrC9yu7y3FrGVmvKBu1yttufCHG', NULL, '45.148.10.242', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 Edg/90.0.818.46', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNkN3bWxTMUY5Q2k0Tm1WSmFaS0VTR3kzYXNhc20xNllZaGdmYnpjVCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736843322),
('Xg1mdjioTRzHLlnryRK6BrQlHeHsaOrhcA6RBrAi', NULL, '43.133.139.6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVW1BUndMNUttTzNoVnZjZzY3TmZnSlJtaTE2b1BBSUM2OE10dmd5NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTQ6Imh0dHA6Ly9nZnhzLmluIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736828553),
('XM1Zbv7WEBzjc2IPhz0MTIb4Qu91vR47cCdgqpHT', NULL, '209.126.85.224', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic094MHZkbDBrcUdHU2xpeW5MMEdLNU0zVGdueFZsSGJmSDVFUExndyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTQ6Imh0dHA6Ly9nZnhzLmluIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736844947),
('xMbuzYDJmLaCnZD04aeYoxfy5bvByBD9gySUa3Dx', NULL, '45.148.10.242', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 Edg/90.0.818.46', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYkdSb1FKWUFzQVJBTkVSRHlBSTlsZnFlOTRiOWZOelRPaUVWY256USI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736838493),
('yboSShqOlx2zJXMrXMHS25P8T5mM4GC3wEsbDcBx', NULL, '5.181.190.248', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWmZ0WTVuc01tNkQ4VWNDT29PM000T3pSTHVaRVp1TDBzMzVEWXprMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736851177),
('yEtf6lmqAl4dwccG3vUxRv4BVyRTpqQjGvxkMExh', NULL, '5.181.190.248', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkVNamRHRUU0RE54WFJZcWdTRnUzWWFaQ2NzQzduYlkxdTBzQTE5MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vNTkuOTkuMTU1LjI0NyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1736852012),
('yh0kpyp9VJkQiZs2i5BpWPrSKBEn1x0099sg2wOc', NULL, '209.126.85.224', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidUdLMkxDWWxxRE84aGRhYnFnZDNBd1lWa2VlYmc2dmg1b0lVRHNQayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTQ6Imh0dHA6Ly9nZnhzLmluIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736844923),
('YKyR3E43HWMM4qVfsHjstFqJCLDKvlN0Y1fAe5jR', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaDFRVjZoYThqUTRsRGN3ZUZaZmlFRkZHNmZPTXNUTWY2SE1Tbnl0aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736852874),
('zCqGCjMDCCgxzvrS2VMfh9NNutlBPjUJ6tZsb1Kj', NULL, '78.108.178.104', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUVZOa0V2cXh0ZTk1NlFVMEJHSnp6WVpjWVVDMlFBSGRCcHp4d09lcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736831898),
('ZEov2K8cUFUUPAmMUpGPSsTd5q3yx9sBo82zxIbr', NULL, '43.153.123.4', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ1FQUE5uRXpXWkNUZlVhRVl4aDJob2xGQlVxcmIxdFdtQ3VuWVJiNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTQ6Imh0dHA6Ly9tcmlnLmluIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736828598),
('ZKNZ9XtrBbHQuncPJcvF4rFGAus5SahoOR34aBQQ', NULL, '149.50.103.48', 'Hello World/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRjJhcE5mU2xGWW9rV0dIMHdiSjZiZ2RiZ2h3V1JGWktpaHhSRXZFdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736834520),
('Zn2GEePmRyBZIaWOmE3ikWzo3aK5J0XnFhAqY67x', NULL, '78.108.178.104', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2FQTFRRUUhvRW5rcG5MY1hVM3hscVNVbDd6WmZNOXVuUFhHMnJiaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736832076),
('zUPJeYXi1NzPny90NMqd3o0lqxvVWnEAAH7dh5Ri', NULL, '78.108.178.104', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZW5nV3ZHNGY5YVE1enBJeXhEQWVvVXJKdGdrZjZDcXpPNXdyTUxuRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly81OS45OS4xNTUuMjQ3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736844897);

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
