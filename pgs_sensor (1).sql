-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2024 at 12:24 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pgs_sensor`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_emailaddress`
--

CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_emailconfirmation`
--

CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `floor_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `sensor_id` int(11) NOT NULL,
  `issue` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `floor_id`, `zone_id`, `sensor_id`, `issue`, `created_at`) VALUES
(46011, 1, 1, 28, 'Faulty', '2024-05-10 10:13:59'),
(46012, 1, 1, 33, 'Faulty', '2024-05-10 10:13:59'),
(46013, 1, 1, 34, 'Faulty', '2024-05-10 10:13:59'),
(46014, 1, 2, 17, 'Faulty', '2024-05-10 10:14:00'),
(46015, 1, 4, 20, 'Faulty', '2024-05-10 10:14:02'),
(46016, 1, 4, 23, 'Faulty', '2024-05-10 10:14:02'),
(46017, 1, 5, 11, 'Faulty', '2024-05-10 10:14:03'),
(46019, 1, 1, 29, 'Faulty', '2024-05-10 10:14:13'),
(46028, 1, 3, 6, 'Faulty', '2024-05-10 10:14:21'),
(46034, 1, 4, 34, 'Faulty', '2024-05-10 10:14:27'),
(46045, 1, 2, 11, 'Faulty', '2024-05-10 10:14:47'),
(46055, 1, 2, 9, 'Faulty', '2024-05-10 10:15:02'),
(46062, 1, 4, 38, 'Faulty', '2024-05-10 10:15:09'),
(46068, 1, 5, 10, 'Faulty', '2024-05-10 10:15:15'),
(46079, 1, 4, 30, 'Faulty', '2024-05-10 10:15:29'),
(46080, 1, 5, 7, 'Faulty', '2024-05-10 10:15:29'),
(46081, 1, 5, 20, 'Faulty', '2024-05-10 10:15:29'),
(46085, 1, 2, 4, 'Faulty', '2024-05-10 10:15:35'),
(46095, 1, 1, 25, 'Faulty', '2024-05-10 10:15:46'),
(46096, 1, 1, 26, 'Faulty', '2024-05-10 10:15:46'),
(46097, 1, 1, 27, 'Faulty', '2024-05-10 10:15:46'),
(46098, 1, 2, 16, 'Faulty', '2024-05-10 10:15:47'),
(46099, 1, 3, 8, 'Faulty', '2024-05-10 10:15:47'),
(46100, 1, 3, 15, 'Faulty', '2024-05-10 10:15:47'),
(46101, 1, 3, 19, 'Faulty', '2024-05-10 10:15:47'),
(46102, 1, 3, 20, 'Faulty', '2024-05-10 10:15:48'),
(46103, 1, 4, 24, 'Faulty', '2024-05-10 10:15:48'),
(46107, 1, 2, 8, 'Faulty', '2024-05-10 10:15:50');

-- --------------------------------------------------------

--
-- Table structure for table `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add Token', 7, 'add_token'),
(26, 'Can change Token', 7, 'change_token'),
(27, 'Can delete Token', 7, 'delete_token'),
(28, 'Can view Token', 7, 'view_token'),
(29, 'Can add token', 8, 'add_tokenproxy'),
(30, 'Can change token', 8, 'change_tokenproxy'),
(31, 'Can delete token', 8, 'delete_tokenproxy'),
(32, 'Can view token', 8, 'view_tokenproxy'),
(33, 'Can add social application', 9, 'add_socialapp'),
(34, 'Can change social application', 9, 'change_socialapp'),
(35, 'Can delete social application', 9, 'delete_socialapp'),
(36, 'Can view social application', 9, 'view_socialapp'),
(37, 'Can add social account', 10, 'add_socialaccount'),
(38, 'Can change social account', 10, 'change_socialaccount'),
(39, 'Can delete social account', 10, 'delete_socialaccount'),
(40, 'Can view social account', 10, 'view_socialaccount'),
(41, 'Can add social application token', 11, 'add_socialtoken'),
(42, 'Can change social application token', 11, 'change_socialtoken'),
(43, 'Can delete social application token', 11, 'delete_socialtoken'),
(44, 'Can view social application token', 11, 'view_socialtoken'),
(45, 'Can add email address', 12, 'add_emailaddress'),
(46, 'Can change email address', 12, 'change_emailaddress'),
(47, 'Can delete email address', 12, 'delete_emailaddress'),
(48, 'Can view email address', 12, 'view_emailaddress'),
(49, 'Can add email confirmation', 13, 'add_emailconfirmation'),
(50, 'Can change email confirmation', 13, 'change_emailconfirmation'),
(51, 'Can delete email confirmation', 13, 'delete_emailconfirmation'),
(52, 'Can view email confirmation', 13, 'view_emailconfirmation'),
(53, 'Can add floor management', 14, 'add_floormanagement'),
(54, 'Can change floor management', 14, 'change_floormanagement'),
(55, 'Can delete floor management', 14, 'delete_floormanagement'),
(56, 'Can view floor management', 14, 'view_floormanagement'),
(57, 'Can add activity log', 15, 'add_activitylog'),
(58, 'Can change activity log', 15, 'change_activitylog'),
(59, 'Can delete activity log', 15, 'delete_activitylog'),
(60, 'Can view activity log', 15, 'view_activitylog'),
(61, 'Can add floor', 16, 'add_floor'),
(62, 'Can change floor', 16, 'change_floor'),
(63, 'Can delete floor', 16, 'delete_floor'),
(64, 'Can view floor', 16, 'view_floor'),
(65, 'Can add line chart', 17, 'add_linechart'),
(66, 'Can change line chart', 17, 'change_linechart'),
(67, 'Can delete line chart', 17, 'delete_linechart'),
(68, 'Can view line chart', 17, 'view_linechart'),
(69, 'Can add sensor', 18, 'add_sensor'),
(70, 'Can change sensor', 18, 'change_sensor'),
(71, 'Can delete sensor', 18, 'delete_sensor'),
(72, 'Can view sensor', 18, 'view_sensor'),
(73, 'Can add zone', 19, 'add_zone'),
(74, 'Can change zone', 19, 'change_zone'),
(75, 'Can delete zone', 19, 'delete_zone'),
(76, 'Can view zone', 19, 'view_zone');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(12, 'account', 'emailaddress'),
(13, 'account', 'emailconfirmation'),
(1, 'admin', 'logentry'),
(10, 'allauth', 'socialaccount'),
(9, 'allauth', 'socialapp'),
(11, 'allauth', 'socialtoken'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'authtoken', 'token'),
(8, 'authtoken', 'tokenproxy'),
(5, 'contenttypes', 'contenttype'),
(15, 'dashboard_data', 'activitylog'),
(16, 'dashboard_data', 'floor'),
(17, 'dashboard_data', 'linechart'),
(18, 'dashboard_data', 'sensor'),
(19, 'dashboard_data', 'zone'),
(14, 'floor_management', 'floormanagement'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-02-12 17:29:30.624520'),
(2, 'auth', '0001_initial', '2024-02-12 17:29:31.663623'),
(3, 'account', '0001_initial', '2024-02-12 17:29:32.047001'),
(4, 'account', '0002_email_max_length', '2024-02-12 17:29:32.105367'),
(5, 'account', '0003_alter_emailaddress_create_unique_verified_email', '2024-02-12 17:29:32.109177'),
(6, 'account', '0004_alter_emailaddress_drop_unique_email', '2024-02-12 17:29:32.138863'),
(7, 'account', '0005_emailaddress_idx_upper_email', '2024-02-12 17:29:32.171122'),
(8, 'admin', '0001_initial', '2024-02-12 17:29:32.440376'),
(9, 'admin', '0002_logentry_remove_auto_add', '2024-02-12 17:29:32.470773'),
(10, 'admin', '0003_logentry_add_action_flag_choices', '2024-02-12 17:29:32.518987'),
(11, 'contenttypes', '0002_remove_content_type_name', '2024-02-12 17:29:32.660286'),
(12, 'auth', '0002_alter_permission_name_max_length', '2024-02-12 17:29:32.791655'),
(13, 'auth', '0003_alter_user_email_max_length', '2024-02-12 17:29:32.818711'),
(14, 'auth', '0004_alter_user_username_opts', '2024-02-12 17:29:32.849495'),
(15, 'auth', '0005_alter_user_last_login_null', '2024-02-12 17:29:32.929155'),
(16, 'auth', '0006_require_contenttypes_0002', '2024-02-12 17:29:32.929155'),
(17, 'auth', '0007_alter_validators_add_error_messages', '2024-02-12 17:29:32.973977'),
(18, 'auth', '0008_alter_user_username_max_length', '2024-02-12 17:29:33.054919'),
(19, 'auth', '0009_alter_user_last_name_max_length', '2024-02-12 17:29:33.102335'),
(20, 'auth', '0010_alter_group_name_max_length', '2024-02-12 17:29:33.156394'),
(21, 'auth', '0011_update_proxy_permissions', '2024-02-12 17:29:33.215879'),
(22, 'auth', '0012_alter_user_first_name_max_length', '2024-02-12 17:29:33.293036'),
(23, 'authtoken', '0001_initial', '2024-02-12 17:29:33.466389'),
(24, 'authtoken', '0002_auto_20160226_1747', '2024-02-12 17:29:33.594552'),
(25, 'authtoken', '0003_tokenproxy', '2024-02-12 17:29:33.608584'),
(26, 'dashboard_data', '0001_initial_migration', '2024-02-12 17:29:33.788474'),
(27, 'dashboard_data', '0002_add_unique_key_constraint', '2024-02-12 17:29:33.843333'),
(28, 'floor_management', '0001_add_floor_management_table', '2024-02-12 17:29:33.880097'),
(29, 'floor_management', '0002_alter_floormanagement_available_and_more', '2024-02-12 17:29:34.261833'),
(30, 'sessions', '0001_initial', '2024-02-12 17:29:34.337974');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `floor`
--

CREATE TABLE `floor` (
  `id` int(11) NOT NULL,
  `parking_name` varchar(255) DEFAULT NULL,
  `floor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `floor_management`
--

CREATE TABLE `floor_management` (
  `id` bigint(20) NOT NULL,
  `floor_id` int(10) UNSIGNED NOT NULL CHECK (`floor_id` >= 0),
  `connected_parking` varchar(255) NOT NULL,
  `floor_name` varchar(255) NOT NULL,
  `total_slots` int(10) UNSIGNED DEFAULT NULL,
  `available` int(10) UNSIGNED DEFAULT NULL,
  `occupied` int(10) UNSIGNED DEFAULT NULL,
  `sensors` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `line_chart`
--

CREATE TABLE `line_chart` (
  `id` int(11) NOT NULL,
  `floor_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `total_available` int(11) NOT NULL,
  `total_vacant` int(11) NOT NULL,
  `total_faulty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `line_chart`
--

INSERT INTO `line_chart` (`id`, `floor_id`, `zone_id`, `total_available`, `total_vacant`, `total_faulty`) VALUES
(41815, 1, 1, 34, 18, 3),
(41816, 1, 2, 19, 16, 1),
(41817, 1, 3, 26, 26, 0),
(41818, 1, 4, 39, 31, 2),
(41819, 1, 5, 23, 20, 1),
(41820, 1, 1, 34, 17, 4),
(41821, 1, 2, 19, 16, 1),
(41822, 1, 3, 26, 26, 0),
(41823, 1, 4, 39, 33, 0),
(41824, 1, 5, 23, 21, 0),
(41825, 1, 1, 34, 17, 4),
(41826, 1, 2, 19, 16, 1),
(41827, 1, 3, 26, 25, 1),
(41828, 1, 4, 39, 33, 0),
(41829, 1, 5, 23, 21, 0),
(41830, 1, 1, 34, 18, 3),
(41831, 1, 2, 19, 16, 1),
(41832, 1, 3, 26, 25, 1),
(41833, 1, 4, 39, 32, 1),
(41834, 1, 5, 23, 21, 0),
(41835, 1, 1, 34, 18, 3),
(41836, 1, 4, 39, 32, 1),
(41837, 1, 5, 23, 21, 0),
(41838, 1, 1, 34, 18, 3),
(41839, 1, 4, 39, 33, 0),
(41840, 1, 5, 23, 21, 0),
(41841, 1, 1, 34, 18, 3),
(41842, 1, 2, 19, 15, 2),
(41843, 1, 4, 39, 33, 0),
(41844, 1, 5, 23, 21, 0),
(41845, 1, 1, 34, 18, 3),
(41846, 1, 2, 19, 15, 2),
(41847, 1, 3, 26, 26, 0),
(41848, 1, 4, 39, 33, 0),
(41849, 1, 5, 23, 21, 0),
(41850, 1, 1, 34, 18, 3),
(41851, 1, 2, 19, 15, 2),
(41852, 1, 3, 26, 26, 0),
(41853, 1, 4, 39, 33, 0),
(41854, 1, 5, 23, 21, 0),
(41855, 1, 1, 34, 18, 3),
(41856, 1, 2, 19, 15, 2),
(41857, 1, 4, 39, 32, 1),
(41858, 1, 5, 23, 21, 0),
(41859, 1, 1, 34, 18, 3),
(41860, 1, 2, 19, 16, 1),
(41861, 1, 4, 39, 32, 1),
(41862, 1, 5, 23, 20, 1),
(41863, 1, 1, 34, 18, 3),
(41864, 1, 2, 19, 16, 1),
(41865, 1, 4, 39, 32, 1),
(41866, 1, 5, 23, 20, 1),
(41867, 1, 1, 34, 18, 3),
(41868, 1, 2, 19, 16, 1),
(41869, 1, 4, 39, 32, 1),
(41870, 1, 5, 23, 19, 2),
(41871, 1, 1, 34, 18, 3),
(41872, 1, 2, 19, 15, 2),
(41873, 1, 4, 39, 32, 1),
(41874, 1, 5, 23, 19, 2),
(41875, 1, 1, 34, 18, 3),
(41876, 1, 2, 19, 15, 2),
(41877, 1, 4, 39, 33, 0),
(41878, 1, 5, 23, 21, 0),
(41879, 1, 1, 27, 15, 3),
(41880, 1, 2, 23, 14, 1),
(41881, 1, 3, 27, 17, 4),
(41882, 1, 4, 40, 39, 1),
(41883, 1, 5, 22, 20, 0),
(41884, 1, 1, 34, 18, 3),
(41885, 1, 2, 19, 15, 2),
(41886, 1, 4, 39, 33, 0),
(41887, 1, 5, 23, 21, 0),
(41888, 1, 1, 27, 15, 3),
(41889, 1, 2, 23, 14, 1),
(41890, 1, 3, 27, 17, 4),
(41891, 1, 4, 40, 38, 1),
(41892, 1, 5, 22, 20, 0),
(41893, 1, 1, 34, 18, 3),
(41894, 1, 2, 19, 15, 2),
(41895, 1, 4, 39, 33, 0),
(41896, 1, 5, 23, 21, 0),
(41897, 1, 1, 27, 15, 3),
(41898, 1, 2, 23, 14, 1),
(41899, 1, 3, 27, 17, 4),
(41900, 1, 4, 40, 38, 1),
(41901, 1, 5, 22, 20, 0),
(41902, 1, 1, 34, 18, 3),
(41903, 1, 2, 19, 15, 2),
(41904, 1, 4, 39, 33, 0),
(41905, 1, 5, 23, 21, 0),
(41906, 1, 1, 27, 15, 3),
(41907, 1, 2, 23, 14, 1),
(41908, 1, 3, 27, 17, 4),
(41909, 1, 4, 40, 38, 1),
(41910, 1, 5, 22, 20, 0),
(41911, 1, 1, 34, 18, 3),
(41912, 1, 4, 39, 33, 0),
(41913, 1, 5, 23, 21, 0),
(41914, 1, 1, 27, 15, 3),
(41915, 1, 2, 23, 14, 1),
(41916, 1, 3, 27, 17, 4),
(41917, 1, 4, 40, 38, 1),
(41918, 1, 5, 22, 20, 0),
(41919, 1, 1, 34, 18, 3),
(41920, 1, 1, 27, 15, 3),
(41921, 1, 2, 23, 14, 1),
(41922, 1, 3, 27, 17, 4),
(41923, 1, 4, 40, 38, 1),
(41924, 1, 5, 22, 20, 0),
(41925, 1, 1, 34, 17, 4),
(41926, 1, 2, 19, 16, 1),
(41927, 1, 1, 27, 15, 3),
(41928, 1, 2, 23, 14, 1),
(41929, 1, 3, 27, 17, 4),
(41930, 1, 4, 40, 38, 1),
(41931, 1, 5, 22, 20, 0),
(41932, 1, 1, 34, 17, 4),
(41933, 1, 2, 19, 16, 1),
(41934, 1, 4, 39, 33, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sensor`
--

CREATE TABLE `sensor` (
  `id` int(11) NOT NULL,
  `floor_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `sensor_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sensor`
--

INSERT INTO `sensor` (`id`, `floor_id`, `zone_id`, `sensor_id`, `status`, `count`, `last_updated`) VALUES
(2631, 1, 1, 1, 0, 15, '2024-05-10 10:16:28'),
(2632, 1, 1, 2, 0, 15, '2024-05-10 10:16:28'),
(2633, 1, 1, 3, 1, 1, '2024-05-10 10:13:58'),
(2634, 1, 1, 4, 1, 1, '2024-05-10 10:13:58'),
(2635, 1, 1, 5, 1, 1, '2024-05-10 10:13:58'),
(2636, 1, 1, 6, 0, 1, '2024-05-10 10:13:58'),
(2637, 1, 1, 7, 0, 15, '2024-05-10 10:16:28'),
(2638, 1, 1, 8, 0, 1, '2024-05-10 10:13:58'),
(2639, 1, 1, 9, 0, 15, '2024-05-10 10:16:28'),
(2640, 1, 1, 10, 0, 1, '2024-05-10 10:13:58'),
(2641, 1, 1, 11, 0, 1, '2024-05-10 10:13:58'),
(2642, 1, 1, 12, 0, 1, '2024-05-10 10:13:58'),
(2643, 1, 1, 13, 1, 15, '2024-05-10 10:16:28'),
(2644, 1, 1, 14, 1, 15, '2024-05-10 10:16:28'),
(2645, 1, 1, 15, 1, 15, '2024-05-10 10:16:28'),
(2646, 1, 1, 16, 0, 1, '2024-05-10 10:13:58'),
(2647, 1, 1, 17, 1, 15, '2024-05-10 10:16:28'),
(2648, 1, 1, 18, 1, 15, '2024-05-10 10:16:28'),
(2649, 1, 1, 19, 1, 15, '2024-05-10 10:16:28'),
(2650, 1, 1, 20, 0, 1, '2024-05-10 10:13:59'),
(2651, 1, 1, 21, 0, 1, '2024-05-10 10:13:59'),
(2652, 1, 1, 22, 1, 1, '2024-05-10 10:13:59'),
(2653, 1, 1, 23, 0, 1, '2024-05-10 10:13:59'),
(2654, 1, 1, 24, 0, 15, '2024-05-10 10:16:28'),
(2655, 1, 1, 25, 1, 15, '2024-05-10 10:16:28'),
(2656, 1, 1, 26, 0, 15, '2024-05-10 10:16:28'),
(2657, 1, 1, 27, 0, 15, '2024-05-10 10:16:28'),
(2658, 1, 1, 28, 3, 1, '2024-05-10 10:13:59'),
(2659, 1, 1, 29, 3, 4, '2024-05-10 10:16:22'),
(2660, 1, 1, 30, 0, 1, '2024-05-10 10:13:59'),
(2661, 1, 1, 31, 1, 1, '2024-05-10 10:13:59'),
(2662, 1, 1, 32, 1, 1, '2024-05-10 10:13:59'),
(2663, 1, 1, 33, 3, 1, '2024-05-10 10:13:59'),
(2664, 1, 1, 34, 3, 1, '2024-05-10 10:13:59'),
(2665, 1, 2, 1, 0, 11, '2024-05-10 10:16:28'),
(2666, 1, 2, 2, 1, 1, '2024-05-10 10:13:59'),
(2667, 1, 2, 3, 0, 11, '2024-05-10 10:16:28'),
(2668, 1, 2, 4, 0, 12, '2024-05-10 10:16:28'),
(2669, 1, 2, 5, 0, 11, '2024-05-10 10:16:28'),
(2670, 1, 2, 6, 0, 1, '2024-05-10 10:13:59'),
(2671, 1, 2, 7, 0, 11, '2024-05-10 10:16:28'),
(2672, 1, 2, 8, 0, 7, '2024-05-10 10:16:07'),
(2673, 1, 2, 9, 0, 3, '2024-05-10 10:15:15'),
(2674, 1, 2, 10, 0, 1, '2024-05-10 10:13:59'),
(2675, 1, 2, 11, 0, 3, '2024-05-10 10:15:02'),
(2676, 1, 2, 12, 1, 11, '2024-05-10 10:16:28'),
(2677, 1, 2, 13, 0, 1, '2024-05-10 10:14:00'),
(2678, 1, 2, 14, 0, 1, '2024-05-10 10:14:00'),
(2679, 1, 2, 15, 0, 1, '2024-05-10 10:14:00'),
(2680, 1, 2, 16, 0, 11, '2024-05-10 10:16:28'),
(2681, 1, 2, 17, 3, 11, '2024-05-10 10:16:28'),
(2682, 1, 2, 18, 0, 1, '2024-05-10 10:14:00'),
(2683, 1, 2, 19, 0, 11, '2024-05-10 10:16:28'),
(2684, 1, 3, 1, 1, 2, '2024-05-10 10:15:47'),
(2685, 1, 3, 2, 1, 2, '2024-05-10 10:15:47'),
(2686, 1, 3, 3, 0, 1, '2024-05-10 10:14:00'),
(2687, 1, 3, 4, 0, 1, '2024-05-10 10:14:00'),
(2688, 1, 3, 5, 1, 2, '2024-05-10 10:15:47'),
(2689, 1, 3, 6, 1, 4, '2024-05-10 10:15:47'),
(2690, 1, 3, 7, 0, 1, '2024-05-10 10:14:00'),
(2691, 1, 3, 8, 3, 2, '2024-05-10 10:15:47'),
(2692, 1, 3, 9, 0, 1, '2024-05-10 10:14:00'),
(2693, 1, 3, 10, 0, 1, '2024-05-10 10:14:00'),
(2694, 1, 3, 11, 0, 1, '2024-05-10 10:14:00'),
(2695, 1, 3, 12, 1, 2, '2024-05-10 10:15:47'),
(2696, 1, 3, 13, 0, 1, '2024-05-10 10:14:00'),
(2697, 1, 3, 14, 0, 1, '2024-05-10 10:14:00'),
(2698, 1, 3, 15, 3, 2, '2024-05-10 10:15:47'),
(2699, 1, 3, 16, 0, 1, '2024-05-10 10:14:01'),
(2700, 1, 3, 17, 1, 2, '2024-05-10 10:15:47'),
(2701, 1, 3, 18, 0, 1, '2024-05-10 10:14:01'),
(2702, 1, 3, 19, 3, 2, '2024-05-10 10:15:47'),
(2703, 1, 3, 20, 3, 2, '2024-05-10 10:15:47'),
(2704, 1, 3, 21, 0, 1, '2024-05-10 10:14:01'),
(2705, 1, 3, 22, 0, 1, '2024-05-10 10:14:01'),
(2706, 1, 3, 23, 0, 1, '2024-05-10 10:14:01'),
(2707, 1, 3, 24, 0, 1, '2024-05-10 10:14:01'),
(2708, 1, 3, 25, 0, 1, '2024-05-10 10:14:01'),
(2709, 1, 3, 26, 0, 1, '2024-05-10 10:14:01'),
(2710, 1, 4, 1, 0, 1, '2024-05-10 10:14:01'),
(2711, 1, 4, 2, 0, 1, '2024-05-10 10:14:01'),
(2712, 1, 4, 3, 0, 1, '2024-05-10 10:14:01'),
(2713, 1, 4, 4, 0, 1, '2024-05-10 10:14:01'),
(2714, 1, 4, 5, 0, 1, '2024-05-10 10:14:01'),
(2715, 1, 4, 6, 0, 1, '2024-05-10 10:14:01'),
(2716, 1, 4, 7, 0, 1, '2024-05-10 10:14:01'),
(2717, 1, 4, 8, 0, 1, '2024-05-10 10:14:01'),
(2718, 1, 4, 9, 0, 1, '2024-05-10 10:14:01'),
(2719, 1, 4, 10, 1, 11, '2024-05-10 10:16:29'),
(2720, 1, 4, 11, 0, 1, '2024-05-10 10:14:02'),
(2721, 1, 4, 12, 0, 1, '2024-05-10 10:14:02'),
(2722, 1, 4, 13, 0, 9, '2024-05-10 10:16:29'),
(2723, 1, 4, 14, 0, 1, '2024-05-10 10:14:02'),
(2724, 1, 4, 15, 0, 1, '2024-05-10 10:14:02'),
(2725, 1, 4, 16, 1, 11, '2024-05-10 10:16:29'),
(2726, 1, 4, 17, 0, 1, '2024-05-10 10:14:02'),
(2727, 1, 4, 18, 0, 1, '2024-05-10 10:14:02'),
(2728, 1, 4, 19, 0, 1, '2024-05-10 10:14:02'),
(2729, 1, 4, 20, 0, 2, '2024-05-10 10:14:14'),
(2730, 1, 4, 21, 0, 1, '2024-05-10 10:14:02'),
(2731, 1, 4, 22, 1, 11, '2024-05-10 10:16:29'),
(2732, 1, 4, 23, 0, 2, '2024-05-10 10:14:14'),
(2733, 1, 4, 24, 1, 11, '2024-05-10 10:16:29'),
(2734, 1, 4, 25, 0, 1, '2024-05-10 10:14:02'),
(2735, 1, 4, 26, 0, 1, '2024-05-10 10:14:02'),
(2736, 1, 4, 27, 0, 1, '2024-05-10 10:14:02'),
(2737, 1, 4, 28, 0, 1, '2024-05-10 10:14:02'),
(2738, 1, 4, 29, 1, 11, '2024-05-10 10:16:29'),
(2739, 1, 4, 30, 0, 11, '2024-05-10 10:16:29'),
(2740, 1, 4, 31, 1, 11, '2024-05-10 10:16:29'),
(2741, 1, 4, 32, 0, 1, '2024-05-10 10:14:02'),
(2742, 1, 4, 33, 0, 1, '2024-05-10 10:14:02'),
(2743, 1, 4, 34, 0, 3, '2024-05-10 10:14:40'),
(2744, 1, 4, 35, 0, 1, '2024-05-10 10:14:03'),
(2745, 1, 4, 36, 0, 1, '2024-05-10 10:14:03'),
(2746, 1, 4, 37, 0, 1, '2024-05-10 10:14:03'),
(2747, 1, 4, 38, 0, 3, '2024-05-10 10:15:29'),
(2748, 1, 4, 39, 0, 1, '2024-05-10 10:14:03'),
(2749, 1, 5, 1, 0, 1, '2024-05-10 10:14:03'),
(2750, 1, 5, 2, 0, 1, '2024-05-10 10:14:03'),
(2751, 1, 5, 3, 0, 1, '2024-05-10 10:14:03'),
(2752, 1, 5, 4, 0, 1, '2024-05-10 10:14:03'),
(2753, 1, 5, 5, 0, 1, '2024-05-10 10:14:03'),
(2754, 1, 5, 6, 0, 1, '2024-05-10 10:14:03'),
(2755, 1, 5, 7, 0, 3, '2024-05-10 10:15:42'),
(2756, 1, 5, 8, 0, 1, '2024-05-10 10:14:03'),
(2757, 1, 5, 9, 0, 1, '2024-05-10 10:14:03'),
(2758, 1, 5, 10, 0, 3, '2024-05-10 10:15:29'),
(2759, 1, 5, 11, 0, 2, '2024-05-10 10:14:14'),
(2760, 1, 5, 12, 0, 1, '2024-05-10 10:14:03'),
(2761, 1, 5, 13, 0, 1, '2024-05-10 10:14:03'),
(2762, 1, 5, 14, 1, 10, '2024-05-10 10:16:13'),
(2763, 1, 5, 15, 0, 1, '2024-05-10 10:14:03'),
(2764, 1, 5, 16, 0, 1, '2024-05-10 10:14:03'),
(2765, 1, 5, 17, 1, 1, '2024-05-10 10:14:03'),
(2766, 1, 5, 18, 0, 1, '2024-05-10 10:14:03'),
(2767, 1, 5, 19, 0, 10, '2024-05-10 10:16:13'),
(2768, 1, 5, 20, 0, 3, '2024-05-10 10:15:42'),
(2769, 1, 5, 21, 0, 1, '2024-05-10 10:14:04'),
(2770, 1, 5, 22, 0, 1, '2024-05-10 10:14:04'),
(2771, 1, 5, 23, 0, 1, '2024-05-10 10:14:04'),
(2819, 1, 2, 20, 0, 1, '2024-05-10 10:15:47'),
(2820, 1, 2, 21, 0, 1, '2024-05-10 10:15:47'),
(2821, 1, 2, 22, 0, 1, '2024-05-10 10:15:47'),
(2822, 1, 2, 23, 0, 1, '2024-05-10 10:15:47'),
(2833, 1, 3, 27, 0, 1, '2024-05-10 10:15:48'),
(2840, 1, 4, 40, 0, 1, '2024-05-10 10:15:48');

-- --------------------------------------------------------

--
-- Table structure for table `zone`
--

CREATE TABLE `zone` (
  `id` int(11) NOT NULL,
  `floor_id` int(11) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `sensor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_emailaddress_user_id_email_987c8728_uniq` (`user_id`,`email`);

--
-- Indexes for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`);

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_log_entry` (`floor_id`,`zone_id`,`sensor_id`);

--
-- Indexes for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `floor`
--
ALTER TABLE `floor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `floor_management`
--
ALTER TABLE `floor_management`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `line_chart`
--
ALTER TABLE `line_chart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sensor`
--
ALTER TABLE `sensor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `floor_id` (`floor_id`,`zone_id`,`sensor_id`);

--
-- Indexes for table `zone`
--
ALTER TABLE `zone`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46189;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `floor`
--
ALTER TABLE `floor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `floor_management`
--
ALTER TABLE `floor_management`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `line_chart`
--
ALTER TABLE `line_chart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41935;

--
-- AUTO_INCREMENT for table `sensor`
--
ALTER TABLE `sensor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3199;

--
-- AUTO_INCREMENT for table `zone`
--
ALTER TABLE `zone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`);

--
-- Constraints for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
