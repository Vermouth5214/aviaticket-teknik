-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Apr 2020 pada 08.45
-- Versi server: 10.3.15-MariaDB
-- Versi PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aviaticket_teknik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `access_control`
--

CREATE TABLE `access_control` (
  `id` int(11) NOT NULL,
  `user_level_id` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `user_modified` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `access_control`
--

INSERT INTO `access_control` (`id`, `user_level_id`, `module_id`, `content`, `user_modified`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'a', 1, '2018-10-10 02:28:44', '2018-10-10 02:28:44'),
(2, 1, 2, 'a', 1, '2018-10-10 02:28:44', '2018-10-10 02:28:44'),
(3, 1, 3, 'a', 1, '2018-10-10 02:28:44', '2018-10-10 02:28:44'),
(4, 2, 1, 'a', 1, '2018-10-10 02:28:49', '2018-10-10 02:28:49'),
(5, 2, 2, 'a', 1, '2018-10-10 02:28:49', '2018-10-10 02:28:49'),
(6, 2, 3, 'a', 1, '2018-10-10 02:28:49', '2018-10-10 02:28:49'),
(7, 3, 1, 'v', 1, '2018-10-10 02:28:54', '2018-10-10 02:28:54'),
(8, 3, 2, 'v', 1, '2018-10-10 02:28:54', '2018-10-10 02:28:54'),
(9, 3, 3, 'v', 1, '2018-10-10 02:28:54', '2018-10-10 02:28:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `assignee`
--

CREATE TABLE `assignee` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_modified` varchar(45) DEFAULT NULL,
  `active` int(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `assignee`
--

INSERT INTO `assignee` (`id`, `name`, `created_at`, `updated_at`, `user_modified`, `active`) VALUES
(1, 'donny', '2020-02-05 01:12:26', '2020-02-05 01:12:26', 'donny', 1),
(2, 'effie', '2020-02-05 01:12:31', '2020-02-05 01:12:31', 'donny', 1),
(4, 'TEK11', '2020-02-25 08:13:16', '2020-02-25 08:13:16', 'deviana', 1),
(5, 'TEK10', '2020-02-25 08:13:40', '2020-02-25 08:13:40', 'deviana', 1),
(6, 'TEK09', '2020-02-25 08:13:48', '2020-02-25 08:13:48', 'deviana', 1),
(7, 'TEK08', '2020-02-25 08:13:58', '2020-02-25 08:13:58', 'deviana', 1),
(8, 'TEK07', '2020-02-25 08:14:05', '2020-02-25 08:14:05', 'deviana', 1),
(9, 'TEK06', '2020-02-25 08:14:14', '2020-02-25 08:14:14', 'deviana', 1),
(10, 'TEK04', '2020-02-25 08:14:25', '2020-02-25 08:14:25', 'deviana', 1),
(11, 'TEK03', '2020-02-25 08:15:25', '2020-02-25 08:15:25', 'deviana', 1),
(12, 'TEK01', '2020-02-25 08:15:49', '2020-02-25 08:15:49', 'deviana', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category` varchar(45) NOT NULL,
  `active` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_modified` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`id`, `category`, `active`, `created_at`, `updated_at`, `user_modified`) VALUES
(3, 'Teknik - Building', 1, '2020-02-06 01:15:45', '2020-02-06 01:15:45', 'donny'),
(0, 'Teknik - Mechanical', 1, '2020-02-06 01:21:45', '2020-02-06 01:21:45', 'donny'),
(1, 'Teknik - Electricity', 1, '2020-02-06 01:23:00', '2020-02-06 01:23:00', 'donny'),
(2, 'Teknik - Utility', 1, '2020-02-06 01:23:14', '2020-02-06 01:23:14', 'donny'),
(4, 'Teknik - Project', 1, '2020-02-27 17:00:00', '0000-00-00 00:00:00', 'effie'),
(5, 'Teknik - Forklift/Car', 1, '2020-03-02 17:00:00', '0000-00-00 00:00:00', 'effie');

-- --------------------------------------------------------

--
-- Struktur dari tabel `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `comment` text NOT NULL,
  `type` enum('log','comment') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `attachment` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `media_library`
--

CREATE TABLE `media_library` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `url` varchar(300) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  `user_created` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `media_library`
--

INSERT INTO `media_library` (`id`, `name`, `type`, `url`, `size`, `user_created`, `created_at`, `updated_at`) VALUES
(0, 'noprofileimage', 'png', 'img/noprofileimage.png', '1159', 1, '2017-05-29 19:56:03', '2017-05-29 19:56:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(20) DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `user_modified` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `modules`
--

INSERT INTO `modules` (`id`, `name`, `slug`, `active`, `user_modified`, `created_at`, `updated_at`) VALUES
(1, 'Master User Level', 'users-level', 1, 1, '2017-10-17 07:07:07', '2017-10-17 07:43:43'),
(2, 'Master User', 'users-user', 1, 1, '2017-10-17 07:16:51', '2017-10-17 07:49:30'),
(3, 'Media Library', 'media-library', 1, 1, '2017-10-17 07:19:28', '2018-06-03 05:40:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` text DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` text DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text DEFAULT NULL,
  `last_activity` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('aqKw1X2kYlDuRCosY4Uo7HQZo53UBFyZNkOSqbgv', NULL, '192.168.104.2', 'Mozilla/5.0 (Linux; Android 9; Redmi 7A) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.136 Mobile Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoicUlySUhFdHNFdHFZYjdVS0VjTHk3SWQ5YW9NeGFuQ0tBWTdBRUFRciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMTcuMTAyLjc4LjIyNy90ZWtuaWsvcHVibGljL2JhY2tlbmQvZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo4OiJ1c2VyaW5mbyI7YTo3OntzOjg6InVzZXJuYW1lIjtzOjU6IlRFSzA3IjtzOjQ6InByaXYiO3M6NDoiVkFETSI7czo0OiJuYW1lIjtzOjg6Ik5hc3JvZGluIjtzOjU6ImVtYWlsIjtzOjE1OiJ0ZWswN0Bhdmlhbi5jb20iO3M6NjoicmVsZGFnIjtzOjU6IlRFSzA3IjtzOjQ6InRpcGUiO3M6NDoiQUdFTiI7czo0OiJhcmVhIjtOO319', 1586413676),
('QRlgaG6bmTrPK0vBaKMLixrVxaWe522ceVrLFW8o', NULL, '192.168.104.2', 'Mozilla/5.0 (Linux; Android 9; SKW-H0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.162 Mobile Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSnhST1FjdEZwOWhnbThWZFcwOWRHOXhoZnFYSDR1RVEwY09HY1NxTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMTcuMTAyLjc4LjIyNy90ZWtuaWsvcHVibGljL2JhY2tlbmQvdGlja2V0L2NyZWF0ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6ODoidXNlcmluZm8iO2E6Nzp7czo4OiJ1c2VybmFtZSI7czo1OiJSSk4wMiI7czo0OiJwcml2IjtzOjQ6IlVTRVIiO3M6NDoibmFtZSI7czo1OiJEaW1hcyI7czo1OiJlbWFpbCI7czoxNToicmpuMDJAYXZpYW4uY29tIjtzOjY6InJlbGRhZyI7czo1OiJSSk4wMiI7czo0OiJ0aXBlIjtzOjQ6IkFHRU4iO3M6NDoiYXJlYSI7Tjt9fQ==', 1586414259),
('1KzlxZNEzg1ggLftydLMcuvyiu6cFX9J1T9tDWcn', NULL, '192.168.104.2', 'Mozilla/5.0 (Linux; Android 7.1.1; CPH1729) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Mobile Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibjExb0JjSFV2Q29QYk5OMHlFWWJlQ1pjUVQwcFBYWm5XN3hSZkk5RyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly8xMTcuMTAyLjc4LjIyNy90ZWtuaWsvcHVibGljL2JhY2tlbmQvdGlja2V0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo4OiJ1c2VyaW5mbyI7YTo3OntzOjg6InVzZXJuYW1lIjtzOjU6IklKTjAxIjtzOjQ6InByaXYiO3M6NDoiVVNFUiI7czo0OiJuYW1lIjtzOjEwOiJQYWsgUmFobWFkIjtzOjU6ImVtYWlsIjtzOjE1OiJpam4wMUBhdmlhbi5jb20iO3M6NjoicmVsZGFnIjtzOjU6IklKTjAxIjtzOjQ6InRpcGUiO3M6NDoiQUdFTiI7czo0OiJhcmVhIjtOO319', 1586410074),
('aC4RIns0uXT3k136Y6Qoq4Z7s60SjJIsQPVnYChd', NULL, '192.168.104.2', 'Mozilla/5.0 (Linux; U; Android 7.1.1; en-US; SM-J510FN Build/NMF26X) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.108 UCBrowser/12.12.9.1225 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMnAzNXJiSjdINllCUWZ6b1ZjbklZUUVINU5ZVmk4STdubk1hQ0pFNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDk6Imh0dHA6Ly8xMTcuMTAyLjc4LjIyNy90ZWtuaWsvcHVibGljL2JhY2tlbmQvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1586410449),
('0PkLAUkwD3jcc32AMSzdHw1XMsRfuGfsCpOhqUyS', NULL, '192.168.110.104', 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVGRkUXExTXFrd2s3MHhuSFhlMFBQZWd5WXo2ZTExc2xqalNON3VYQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTQwOiJodHRwOi8vMTkyLjE2OC4xMTAuMTUyL3Rla25pay9wdWJsaWMvYmFja2VuZC90aWNrZXQ/YXNzaWduZWU9OTk5JmNhdGVnb3J5PTAmZW5kRGF0ZT0wOS0wNC0yMDIwJnN0YXJ0RGF0ZT0wMS0wNC0yMDIwJnN0YXR1cz05OTkmc3VibWl0PVN1Ym1pdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6ODoidXNlcmluZm8iO2E6Nzp7czo4OiJ1c2VybmFtZSI7czo1OiJURUswOCI7czo0OiJwcml2IjtzOjQ6IlZBRE0iO3M6NDoibmFtZSI7czo4OiJIYXJtYW50byI7czo1OiJlbWFpbCI7czoxNToidGVrMDhAYXZpYW4uY29tIjtzOjY6InJlbGRhZyI7czo1OiJURUswOCI7czo0OiJ0aXBlIjtzOjQ6IkFHRU4iO3M6NDoiYXJlYSI7Tjt9fQ==', 1586410732),
('K5q8tvIsgIHFRQ88YViuBOMfGe4KqZlk6FM48m6g', NULL, '10.10.4.43', 'Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSEtyZnEycGlKRldSQXNPNlRNYkdUcm9FSWIyTURSMkFGZHZiNURpcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTQyOiJodHRwOi8vMTkyLjE2OC4xMTAuMTUyL3Rla25pay9wdWJsaWMvYmFja2VuZC90aWNrZXQ/YXNzaWduZWU9OTk5JmNhdGVnb3J5PTk5OSZlbmREYXRlPTEwLTAzLTIwMjAmc3RhcnREYXRlPTAxLTAzLTIwMjAmc3RhdHVzPTk5OSZzdWJtaXQ9U3VibWl0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo4OiJ1c2VyaW5mbyI7YTo3OntzOjg6InVzZXJuYW1lIjtzOjU6IlRFSzA4IjtzOjQ6InByaXYiO3M6NDoiVkFETSI7czo0OiJuYW1lIjtzOjg6Ikhhcm1hbnRvIjtzOjU6ImVtYWlsIjtzOjE1OiJ0ZWswOEBhdmlhbi5jb20iO3M6NjoicmVsZGFnIjtzOjU6IlRFSzA4IjtzOjQ6InRpcGUiO3M6NDoiQUdFTiI7czo0OiJhcmVhIjtOO319', 1586406790),
('D2tEYfpNohZi9jCEzs2nk6wTYtW5tpHhUzQfTeWu', NULL, '192.168.104.2', 'Mozilla/5.0 (Linux; Android 9; SM-J701F Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/80.0.3987.162 Mobile Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibmhyUHcweENsZnk4dXVOQWVZUWlNcHBrRFA1aTU0R3M0UFM2MVNwWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly8xMTcuMTAyLjc4LjIyNy90ZWtuaWsvcHVibGljL2JhY2tlbmQvdGlja2V0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo4OiJ1c2VyaW5mbyI7YTo3OntzOjg6InVzZXJuYW1lIjtzOjU6IlBQQzAxIjtzOjQ6InByaXYiO3M6NDoiVVNFUiI7czo0OiJuYW1lIjtzOjc6IlBhayBZYW4iO3M6NToiZW1haWwiO3M6MjE6InBwY18xQGF2aWFuYnJhbmRzLmNvbSI7czo2OiJyZWxkYWciO3M6NToiUFBDMDEiO3M6NDoidGlwZSI7czo0OiJBR0VOIjtzOjQ6ImFyZWEiO047fX0=', 1586414014),
('HVAsAqZirDWJj2srdqIe6BbOPfaSh13bHq1bHU3c', NULL, '10.10.25.3', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiM3liUnduOTcwT2JhSkQwaFRGaWF5WFBHMGE4SzVEaFliQzl4ZWdQdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xOTIuMTY4LjExMC4xNTIvdGVrbmlrL3B1YmxpYy9iYWNrZW5kL3RpY2tldC8zOTAvZWRpdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6ODoidXNlcmluZm8iO2E6Nzp7czo4OiJ1c2VybmFtZSI7czo1OiJkb25ueSI7czo0OiJwcml2IjtzOjY6IlZTVVBFUiI7czo0OiJuYW1lIjtzOjU6IkRvbm55IjtzOjU6ImVtYWlsIjtzOjIwOiJpdF8yQGF2aWFuYnJhbmRzLmNvbSI7czo2OiJyZWxkYWciO3M6NToiZG9ubnkiO3M6NDoidGlwZSI7czoyOiJBRCI7czo0OiJhcmVhIjtzOjA6IiI7fX0=', 1586414026),
('ti7e3PH9lQv6zzrFwdIrhULFL0U6VOIKsz62leKe', NULL, '192.168.110.112', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZTB5T1BPcFRGZnFPVWw1YVJRMkd4bnFXV1c5TmFQblZkQmFWcWxXRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xOTIuMTY4LjExMC4xNTIvdGVrbmlrL3B1YmxpYy9iYWNrZW5kL3RpY2tldC8zNzgvZWRpdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6ODoidXNlcmluZm8iO2E6Nzp7czo4OiJ1c2VybmFtZSI7czo1OiJNUlAwMSI7czo0OiJwcml2IjtzOjQ6IlVTRVIiO3M6NDoibmFtZSI7czo2OiJXaXlhZGkiO3M6NToiZW1haWwiO3M6MTU6Ik1QUjAxQGF2aWFuLmNvbSI7czo2OiJyZWxkYWciO3M6NToiTVJQMDEiO3M6NDoidGlwZSI7czoyOiJBRCI7czo0OiJhcmVhIjtOO319', 1586412653),
('9nNB0WOB4O8dHd2TQg9XaLA7Ca5onU5X8NJSF37P', NULL, '192.168.110.126', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidDdod2FQSUZ2cjFLaE82bUdpQUVkYnFDY0dzU3JsY3hVcDB4OUpUTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly8xOTIuMTY4LjExMC4xNTIvdGVrbmlrL3B1YmxpYy9iYWNrZW5kL3RpY2tldCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6ODoidXNlcmluZm8iO2E6Nzp7czo4OiJ1c2VybmFtZSI7czo1OiJURUsxMCI7czo0OiJwcml2IjtzOjQ6IlZBRE0iO3M6NDoibmFtZSI7czo2OiJDaGFtaW0iO3M6NToiZW1haWwiO3M6MTU6InRlazEwQGF2aWFuLmNvbSI7czo2OiJyZWxkYWciO3M6NToiVEVLMTAiO3M6NDoidGlwZSI7czo0OiJBR0VOIjtzOjQ6ImFyZWEiO047fX0=', 1586413778),
('l1ScbAp0qxHDfPP2SENQr66OqvjQewOa41HOEDbe', NULL, '10.10.4.195', 'Mozilla/5.0 (Linux; Android 9; SM-T295) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', 'YTozOntzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo1MDoiaHR0cDovLzE5Mi4xNjguMTEwLjE1Mi90ZWtuaWsvcHVibGljL2JhY2tlbmQvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiRGxwM2VaalRpcEZqRHJXaXB4a21BWFhwWlRzNm0xM1VNajB5OWtJZCI7fQ==', 1586414613),
('Pv2u7JrM0qU5iuUanSqOsDFffhtnaefH2dkTYNnf', NULL, '10.10.4.197', 'Mozilla/5.0 (Linux; Android 9; SM-T295) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWnJQTHVUZ3lzWkNteEtIVElrcVhCUmt2UDFMcmY3SURNeGVlVTdSTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly8xOTIuMTY4LjExMC4xNTIvdGVrbmlrL3B1YmxpYy9iYWNrZW5kL3RpY2tldCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6ODoidXNlcmluZm8iO2E6Nzp7czo4OiJ1c2VybmFtZSI7czo1OiJQUEMwMSI7czo0OiJwcml2IjtzOjQ6IlVTRVIiO3M6NDoibmFtZSI7czo3OiJQYWsgWWFuIjtzOjU6ImVtYWlsIjtzOjIxOiJwcGNfMUBhdmlhbmJyYW5kcy5jb20iO3M6NjoicmVsZGFnIjtzOjU6IlBQQzAxIjtzOjQ6InRpcGUiO3M6NDoiQUdFTiI7czo0OiJhcmVhIjtOO319', 1586413945),
('Du2Wva56iQKDP17EFPdsOKTcQGddZDi9ixkFu5Qw', NULL, '10.10.4.197', 'Mozilla/5.0 (Linux; Android 9; SM-T295) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOXVwZHpFZjMxd2pVRkJZZVJlNWZBM2FTWFV6ekp3dGFzSkYxalFOQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly8xOTIuMTY4LjExMC4xNTIvdGVrbmlrL3B1YmxpYy9iYWNrZW5kL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1586413947),
('BCGqKMyto1GCGjblAKz7m6wOsLbQarFBjUgveHgm', NULL, '10.10.5.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'YTozOntzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo1MDoiaHR0cDovLzE5Mi4xNjguMTEwLjE1Mi90ZWtuaWsvcHVibGljL2JhY2tlbmQvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoidk9IVTM4YnlqaFJUVDQwbWVYVjNBYnM1UGtzMzJhZjllUnFLSkdjNyI7fQ==', 1586414261);

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `user_modified` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `user_modified`, `created_at`, `updated_at`) VALUES
(1, 'web_title', 'AVIA Ticket (TEKNIK)', 'Donny', '2017-06-13 00:27:16', '2020-02-04 08:41:36'),
(2, 'logo', 'img/logo.png', '1', '2017-06-13 00:27:16', '2018-06-03 05:58:24'),
(3, 'email_admin', 'admin@admin.com', 'Oei Donny', '2017-06-13 00:27:16', '2019-08-02 02:18:38'),
(4, 'web_description', '', 'Donny', '2017-07-23 23:56:28', '2020-02-04 08:41:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  `attachment_1` varchar(100) DEFAULT NULL,
  `attachment_2` varchar(100) DEFAULT NULL,
  `attachment_3` varchar(100) DEFAULT NULL,
  `prioritas` varchar(45) DEFAULT NULL,
  `start` date DEFAULT NULL,
  `assignee` varchar(50) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_jawab` varchar(50) DEFAULT NULL,
  `user_modified` varchar(50) DEFAULT NULL,
  `status` int(1) NOT NULL,
  `user_created` varchar(50) DEFAULT NULL,
  `active` int(1) NOT NULL,
  `no_ticket` varchar(45) DEFAULT NULL,
  `user_request_close` varchar(45) DEFAULT NULL,
  `request_close_date` datetime DEFAULT NULL,
  `user_close` varchar(45) DEFAULT NULL,
  `close_date` datetime DEFAULT NULL,
  `reldag` varchar(45) DEFAULT NULL,
  `SPK` varchar(45) DEFAULT NULL,
  `FACode` varchar(45) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ticket`
--

INSERT INTO `ticket` (`id`, `judul`, `keterangan`, `attachment_1`, `attachment_2`, `attachment_3`, `prioritas`, `start`, `assignee`, `category_id`, `created_at`, `updated_at`, `user_jawab`, `user_modified`, `status`, `user_created`, `active`, `no_ticket`, `user_request_close`, `request_close_date`, `user_close`, `close_date`, `reldag`, `SPK`, `FACode`) VALUES
(1, 'Perbaikan Mesin Filling no 3 (200 cc)', 'Perbaikan mesin Shaker rusak, rantai nyangkut', NULL, NULL, NULL, '30H', '2020-03-03', 'TEK08', 0, '2020-03-02 01:57:17', '2020-03-03 08:57:34', NULL, 'BMS01', 4, 'BMS01', 1, 'BMS01-2003-00001', 'HARMANTO', '2020-03-03 00:00:00', 'BMS01', '2020-03-03 15:57:34', 'BMS01', NULL, 'PM01592'),
(2, 'Perbaikan mesin karcher', 'Mesin karcher bocor', NULL, NULL, NULL, '30H', '2020-03-03', 'TEK08', 0, '2020-03-02 02:23:34', '2020-03-02 11:46:45', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00001', 'HARMANTO', '2020-03-02 00:00:00', 'RJN02', '2020-03-02 18:46:45', 'RJN02', NULL, 'PM00755'),
(3, 'Perbaikan Pompa', 'Penggantian pompa sigma', 'RJN02-2003-00002-1-IMG-20200302-WA0002.jpg', NULL, NULL, '30H', '2020-03-03', 'TEK08', 0, '2020-03-02 02:58:33', '2020-03-03 04:34:35', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00002', 'HARMANTO', '2020-03-03 00:00:00', 'RJN02', '2020-03-03 11:34:35', 'RJN02', NULL, 'PM01557'),
(4, 'Perbaikan mesin inkjet no 6', 'tinta tidak bisa keluar sempurna', NULL, NULL, NULL, '30H', '2020-03-02', 'TEK07', 1, '2020-03-02 03:11:04', '2020-03-03 04:47:59', NULL, 'BMS01', 4, 'BMS01', 1, 'BMS01-2003-00002', 'NASRODIN', '2020-03-02 00:00:00', 'BMS01', '2020-03-03 11:47:59', 'BMS01', NULL, 'PM00621'),
(8, 'Pompa Bocor', 'Tlg  diperbaiki kebocoran pada plendes pompa pengambilan ZK019 di rumah pompa rinjani (dekat IPAL)\r\n\r\nKeterangan lbh lanjut harap hubungi Slamet.H (gudang bahan Rinjani)', NULL, NULL, NULL, '30H', '2020-03-03', 'TEK08', 0, '2020-03-02 04:34:07', '2020-03-02 04:34:07', NULL, 'PPC01', 3, 'PPC01', 1, 'PPC01-2003-00001', 'HARMANTO', '2020-03-03 00:00:00', NULL, NULL, 'PPC01', NULL, 'PM02221'),
(6, 'Perbaikan HOPPER 05', 'Perbaikan vibrator hopper 05 , status rusak/tidak berfungsi', 'BME01-2003-00001-1-image.jpg', NULL, NULL, '30H', '2020-03-03', 'TEK08', 0, '2020-03-02 04:21:46', '2020-03-03 04:18:58', NULL, 'BME01', 4, 'BME01', 1, 'BME01-2003-00001', 'HARMANTO', '2020-03-02 00:00:00', 'BME01', '2020-03-03 11:18:58', 'BME01', NULL, 'PM01409'),
(7, 'Perbaikan mesin filling no 8', 'Perbaikan indicator timbangan status mati', NULL, NULL, NULL, '30H', '2020-03-02', 'TEK08', 0, '2020-03-02 04:27:56', '2020-03-03 01:18:15', NULL, 'BME01', 4, 'BME01', 1, 'BME01-2003-00002', NULL, NULL, 'BME01', '2020-03-03 08:18:15', 'BME01', NULL, 'PM01497'),
(9, 'Perbaikan mesin filling no 3', 'Perbaikan rantai kopling putus', 'BME01-2003-00003-1-image.jpg', NULL, NULL, '30H', '2020-03-03', 'TEK08', 0, '2020-03-02 04:35:24', '2020-03-03 04:18:32', NULL, 'BME01', 4, 'BME01', 1, 'BME01-2003-00003', 'HARMANTO', '2020-03-02 00:00:00', 'BME01', '2020-03-03 11:18:32', 'BME01', NULL, 'PM00406'),
(10, 'Pompa Bocor', 'Tlg  diperbaiki kebocoran pada plendes pompa automatic pengambilan ZK027 di rumah pompa rinjani (dekat IPAL)\r\n\r\nKeterangan lbh lanjut harap hubungi Slamet.H (gudang bahan Rinjani)', NULL, NULL, NULL, '30H', '2020-03-03', 'TEK08', 0, '2020-03-02 04:36:24', '2020-03-02 04:36:24', NULL, 'PPC01', 3, 'PPC01', 1, 'PPC01-2003-00002', 'HARMANTO', '2020-03-03 00:00:00', NULL, NULL, 'PPC01', NULL, 'PM02222'),
(11, 'Pompa Bocor', 'Tlg  diperbaiki kebocoran pada pompa pengambilan ZK001 di rumah pompa rinjani (dekat IPAL)\r\n\r\nKeterangan lbh lanjut harap hubungi Slamet.H (gudang bahan Rinjani)', NULL, NULL, NULL, '30H', '2020-03-03', 'TEK08', 0, '2020-03-02 04:40:01', '2020-03-03 04:26:47', NULL, 'PPC01', 4, 'PPC01', 1, 'PPC01-2003-00003', 'HARMANTO', '2020-03-02 00:00:00', 'PPC01', '2020-03-03 11:26:47', 'PPC01', NULL, 'PM02223'),
(12, 'ganti remes', 'pompa remesnya bocor', NULL, NULL, NULL, '30H', '2020-03-03', 'TEK08', 0, '2020-03-02 04:57:42', '2020-03-03 04:44:17', NULL, 'SMR01', 4, 'SMR01', 1, 'SMR01-2003-00001', 'HARMANTO', '2020-03-03 00:00:00', 'SMR01', '2020-03-03 11:44:17', 'SMR01', NULL, 'PM00969'),
(13, 'seker bocor', 'MESIN FILLING SEKER BOCOR', NULL, NULL, NULL, '30H', '2020-03-03', 'TEK08', 0, '2020-03-02 06:49:15', '2020-03-03 07:12:36', NULL, 'TDR01', 4, 'TDR01', 1, 'TDR01-2003-00001', 'HARMANTO', '2020-03-03 00:00:00', 'TDR01', '2020-03-03 14:12:36', 'TDR01', NULL, 'PM01062'),
(14, 'Perbaikan auger  1.1', 'Caunter untuk putaran screw error, dan timbangan tdak valid', NULL, NULL, NULL, '30H', '2020-03-03', 'TEK07', 1, '2020-03-02 07:01:44', '2020-03-05 08:15:42', NULL, 'MHM01', 4, 'MHM01', 1, 'MHM01-2003-00001', 'TEK07', '2020-03-03 00:00:00', 'MHM01', '2020-03-05 15:15:42', 'MHM01', NULL, 'PM00519'),
(15, 'Perbaikan pompa blagdon 3\" membran jebol', 'Perbaikan pompa blagdon 3\" membran jebol Mixer no 3', 'BME01-2003-00004-1-IMG-20200302-WA0001.jpeg', NULL, NULL, '30H', '2020-03-03', 'TEK08', 0, '2020-03-02 07:46:27', '2020-03-05 02:35:27', NULL, 'BME01', 4, 'BME01', 1, 'BME01-2003-00004', 'TEK08', '2020-03-04 00:00:00', 'BME01', '2020-03-05 09:35:27', 'BME01', NULL, 'PM00913'),
(16, 'TOA SPEAKER', 'TOA TIDAK BERFUNGSI,', NULL, NULL, NULL, '30H', '2020-03-03', 'TEK07', 1, '2020-03-02 08:25:27', '2020-03-02 08:25:27', NULL, 'MHM01', 2, 'MHM01', 1, 'MHM01-2003-00002', NULL, NULL, NULL, NULL, 'MHM01', NULL, 'OTHERS-FACTORY'),
(17, 'Peninggian Lantai', 'Peninggian Lantai (Pengecoran) bagian premix pasta bromo synthetic dengan ukuran 9,7m x 5,8m dengan tebal 12cm sesuai ukuran dari teknik (Richard)', 'PSDJ05-2003-00001-1-WhatsApp Image 2020-03-02 at 15.46.21(1).jpeg', 'PSDJ05-2003-00001-2-WhatsApp Image 2020-03-02 at 15.46.21.jpeg', NULL, '30H', '2020-03-02', 'TEK09', 3, '2020-03-02 08:51:43', '2020-03-02 08:51:43', NULL, 'PSDJ05', 2, 'PSDJ05', 1, 'PSDJ05-2003-00001', NULL, NULL, NULL, NULL, 'PSDJ05', NULL, 'PB00025'),
(18, 'PERBAIKAN AC DI MUSEUM AVIAN', 'UTARA SISI KANAN MATI', NULL, NULL, NULL, '30H', '2020-03-03', 'TEK03', 2, '2020-03-02 09:05:28', '2020-03-03 07:53:21', NULL, 'HRD12', 4, 'HRD12', 1, 'HRD12-2003-00001', 'RANDI AGUNG S', '2020-03-03 00:00:00', 'HRD12', '2020-03-03 14:53:21', 'HRD12', NULL, 'PV00062'),
(19, 'PERBAIKAN AC DI MUSEUM AVIAN', 'AC UTARA SISI KIRI', NULL, NULL, NULL, '30H', '2020-03-03', 'TEK03', 2, '2020-03-02 09:07:06', '2020-03-03 07:53:14', NULL, 'HRD12', 4, 'HRD12', 1, 'HRD12-2003-00002', 'RANDI AGUNG S', '2020-03-03 00:00:00', 'HRD12', '2020-03-03 14:53:14', 'HRD12', NULL, 'PV00484'),
(20, 'Mesin Filling no.1', 'Mohon untuk dibuatkan penutup star wheel ukuran sesuai dengan penutup star wheel pada mesin filling no.2 yang sudah dibuatkan.', NULL, NULL, NULL, '30H', '2020-03-03', 'TEK06', 4, '2020-03-03 01:37:14', '2020-03-09 07:01:50', NULL, 'SMR01', 4, 'SMR01', 1, 'SMR01-2003-00002', 'TEK06', '2020-03-09 00:00:00', 'SMR01', '2020-03-09 14:01:50', 'SMR01', NULL, 'PM01000'),
(21, 'Mesin Filling no.3', 'Mohon untuk dibuatkan penutup star wheel ukuran sesuai dengan penutup star wheel pada mesin filling no.2 yang sudah dibuatkan.', NULL, NULL, NULL, '30H', '2020-03-03', 'TEK06', 4, '2020-03-03 01:40:10', '2020-03-09 07:02:11', NULL, 'SMR01', 4, 'SMR01', 1, 'SMR01-2003-00003', 'TEK06', '2020-03-09 00:00:00', 'SMR01', '2020-03-09 14:02:11', 'SMR01', NULL, 'PM01001'),
(22, 'Mesin Filling no. 4', 'Mohon untuk dibuatkan penutup star wheel ukuran sesuai dengan penutup star wheel pada mesin filling no.2 yang sudah dibuatkan.', NULL, NULL, NULL, '30H', '2020-03-03', 'TEK06', 4, '2020-03-03 01:47:45', '2020-03-09 07:00:49', NULL, 'SMR01', 4, 'SMR01', 1, 'SMR01-2003-00004', 'TEK06', '2020-03-09 00:00:00', 'SMR01', '2020-03-09 14:00:49', 'SMR01', NULL, 'PM01002'),
(23, 'Mesin Filling no.7', 'Mohon untuk dibuatkan penutup star wheel ukuran sesuai dengan penutup star wheel pada mesin filling no.2 yang sudah dibuatkan.', NULL, NULL, NULL, '30H', '2020-03-03', 'TEK06', 4, '2020-03-03 01:49:07', '2020-03-09 07:01:06', NULL, 'SMR01', 4, 'SMR01', 1, 'SMR01-2003-00005', 'TEK06', '2020-03-09 00:00:00', 'SMR01', '2020-03-09 14:01:06', 'SMR01', NULL, 'PM01004'),
(24, 'Mesin Filling n0.8', 'Mohon untuk dibuatkan penutup star wheel ukuran sesuai dengan penutup star wheel pada mesin filling no.2 yang sudah dibuatkan.', NULL, NULL, NULL, '30H', '2020-03-03', 'TEK06', 4, '2020-03-03 01:50:21', '2020-03-09 07:01:22', NULL, 'SMR01', 4, 'SMR01', 1, 'SMR01-2003-00006', 'TEK06', '2020-03-09 00:00:00', 'SMR01', '2020-03-09 14:01:22', 'SMR01', NULL, 'PM01005'),
(34, 'SCREW SILO 1203', 'SELANG INPUT ANGIN KE PNEUMATIC PECAH', NULL, NULL, NULL, '30H', '2020-03-04', 'TEK08', 0, '2020-03-04 01:35:22', '2020-03-04 06:32:36', NULL, 'MHM01', 4, 'MHM01', 1, 'MHM01-2003-00003', NULL, NULL, 'MHM01', '2020-03-04 13:32:36', 'MHM01', NULL, 'OTHERS-FACTORY'),
(25, 'Bangunan Semeru', 'Pembuatan dan pemasangan pintu depan untuk akses barang jadi (request Pak Hermanto)', NULL, NULL, NULL, '30H', '2020-03-03', 'TEK06', 4, '2020-03-03 04:34:03', '2020-03-03 04:34:03', NULL, 'SMR01', 2, 'SMR01', 1, 'SMR01-2003-00007', NULL, NULL, NULL, NULL, 'SMR01', NULL, 'PB00018'),
(26, 'pembuatan jalur baru untuk kk 16 & sl 105 dari resin ke ijen', 'kebutuhan kk 16 = 1000kg/hari.\r\nsl 105 = 600kg/hari.\r\nsaat ini handling dengan cara drum dicrane dan diletakkan diatas trolley kemudian ditimbang membutuhkan waktu kurang lebih 15 menit/drum', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-03 06:23:03', '2020-03-03 06:23:03', NULL, 'IJN01', 1, 'IJN01', 1, 'IJN01-2003-00001', NULL, NULL, NULL, NULL, 'IJN01', NULL, 'PI00013'),
(27, 'PIPA CHILLER', 'PIPA CHILLER BOCOR', NULL, NULL, NULL, '30H', '2020-03-03', 'TEK08', 0, '2020-03-03 06:43:41', '2020-03-04 06:42:12', NULL, 'SMR01', 4, 'SMR01', 1, 'SMR01-2003-00008', 'HARMANTO', '2020-03-04 00:00:00', 'SMR01', '2020-03-04 13:42:12', 'SMR01', NULL, 'PM00670'),
(28, 'Modifikasi roda Bak Loading bahan Reaktor 1', 'Ganti ban bak loading bahan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-03 06:57:49', '2020-03-05 14:10:33', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00003', 'HARMANTO', '2020-03-03 00:00:00', 'RJN02', '2020-03-05 21:10:33', 'RJN02', NULL, 'PM02037'),
(29, 'perbaikan auto sealer', 'roll rusak tidak bisa berhenti', NULL, NULL, NULL, '30H', '2020-03-03', 'TEK07', 1, '2020-03-03 07:02:45', '2020-03-04 04:44:45', NULL, 'BMS01', 4, 'BMS01', 1, 'BMS01-2003-00003', NULL, NULL, 'BMS01', '2020-03-04 11:44:45', 'BMS01', NULL, 'PM00596'),
(30, 'PENGGANTIAN TUTUP TANGKI MENJADI STAINLESS STEEL', 'PENGGANTIAN TUTUP TANGKI MENJADI STAINLESS STEEL, UNTUK WEIGHING STORAGE KK252.\r\nDESAIN TUTUP MENYESUAIKAN. (PLANT HYGENE)', NULL, NULL, NULL, '90H', '2020-03-03', 'TEK06', 4, '2020-03-03 08:11:02', '2020-03-03 08:11:02', NULL, 'PSDJ05', 2, 'PSDJ05', 1, 'PSDJ05-2003-00002', NULL, NULL, NULL, NULL, 'PSDJ05', NULL, 'PM01175'),
(31, 'PENGGANTIAN TUTUP TANGKI MENJADI STAINLESS STEEL', 'PENGGANTIAN TUTUP TANGKI MENJADI STAINLESS STEEL, UNTUK TANGKI TINTING NO 12.\r\nDESAIN TUTUP MENYESUAIKAN. (PLANT HYGENE)', NULL, NULL, NULL, '90H', '2020-03-03', 'TEK06', 4, '2020-03-03 08:13:23', '2020-03-03 08:13:23', NULL, 'PSDJ05', 2, 'PSDJ05', 1, 'PSDJ05-2003-00003', NULL, NULL, NULL, NULL, 'PSDJ05', NULL, 'PM01246'),
(32, 'PEMBUATAN TUTUP TANGKI MENGGUNAKAN STAINLESS STEEL', 'MIXER MENGGUNAKAN SCRAPPER SEHINGGA BELUM ADA TUTUP.\r\nDIHARAPKAN TUTUP MENGGUNAKAN STAINLESS STEEL.', NULL, NULL, NULL, '90H', '2020-03-03', 'TEK06', 4, '2020-03-03 08:15:06', '2020-03-03 08:15:06', NULL, 'PSDJ05', 2, 'PSDJ05', 1, 'PSDJ05-2003-00004', NULL, NULL, NULL, NULL, 'PSDJ05', NULL, 'PM01145'),
(33, 'RENOVASI KANTOR SPV-MT MERAPI', '1. DINDING KANTOR BANYAK YANG SUDAH BOLONG , GAMBAR TEKNIK SUDAH READY (HIDAYAT - DRAFTER TEKNIK).\r\n2 .PENAMBAHAN AC UNTUK RUANG KERJA SPV.', 'PSDJ05-2003-00005-1-PHOTO-2020-03-03-15-18-44.jpg', 'PSDJ05-2003-00005-2-PHOTO-2020-03-03-15-18-45.jpg', 'PSDJ05-2003-00005-3-PHOTO-2020-03-03-15-19-13.jpg', '90H', '2020-03-17', 'TEK09', 3, '2020-03-03 08:33:13', '2020-03-03 08:33:13', NULL, 'PSDJ05', 2, 'PSDJ05', 1, 'PSDJ05-2003-00005', NULL, NULL, NULL, NULL, 'PSDJ05', NULL, 'PB00017'),
(35, 'MANUAL FEEDER 2.5', 'SENSOR ROTARY PEDAL  LEVEL SWITCH RUSAK', NULL, NULL, NULL, '30H', '2020-03-04', 'TEK07', 1, '2020-03-04 01:37:42', '2020-03-04 06:32:52', NULL, 'MHM01', 4, 'MHM01', 1, 'MHM01-2003-00004', NULL, NULL, 'MHM01', '2020-03-04 13:32:52', 'MHM01', NULL, 'OTHERS-FACTORY'),
(36, 'Handpallet gudang Retur', 'Tlg diperbaiki handpallet gudang retur yg hidrolisnya bermasalah(tidak kuat angkat beban)', NULL, NULL, NULL, '30H', '2020-03-04', 'TEK08', 0, '2020-03-04 02:38:09', '2020-03-06 08:23:00', NULL, 'PPC01', 4, 'PPC01', 1, 'PPC01-2003-00004', 'TEK08', '2020-03-05 00:00:00', 'PPC01', '2020-03-06 15:23:00', 'PPC01', NULL, 'OTHERS-FACTORY'),
(37, 'TEMPER NO.6', 'KERUSAKAN ESNTRIS AS RANTAI', NULL, NULL, NULL, '30H', '2020-03-04', 'TEK08', 0, '2020-03-04 04:30:50', '2020-03-05 03:38:24', NULL, 'MHM01', 4, 'MHM01', 1, 'MHM01-2003-00005', 'TEK08', '2020-03-05 00:00:00', 'MHM01', '2020-03-05 10:38:24', 'MHM01', NULL, 'OTHERS-FACTORY'),
(38, 'TEMPER NO.3', 'SPULL MOTOR PUTUS 1 PHASE', NULL, NULL, NULL, '30H', '2020-03-04', 'TEK07', 1, '2020-03-04 04:32:19', '2020-03-24 05:06:04', NULL, 'MHM01', 4, 'MHM01', 1, 'MHM01-2003-00006', NULL, NULL, 'MHM01', '2020-03-24 12:06:04', 'MHM01', NULL, 'OTHERS-FACTORY'),
(39, 'Perbaikan Forklift gudang penerimaan- PFL29', 'Tlg diperbaiki kampas kopling yg selip.\r\n\r\nNB:Forklift Gdg Penerimaan Kerinci(No Lambung PFL29- Operator: Agung)', NULL, NULL, NULL, '30H', '2020-03-04', 'TEK08', 0, '2020-03-04 06:55:36', '2020-03-04 07:56:09', NULL, 'PPC01', 4, 'PPC01', 1, 'PPC01-2003-00005', 'HARMANTO', '2020-03-04 00:00:00', 'PPC01', '2020-03-04 14:56:09', 'PPC01', NULL, 'PK00343'),
(40, 'Perbaikan Kalkulator G.Rinjani', 'Tlg diperbaiki kalkulator gdg Rinjani (Slamet.H) yg mati total', NULL, NULL, NULL, '30H', '2020-03-04', 'TEK07', 1, '2020-03-04 07:21:44', '2020-03-04 07:21:44', NULL, 'PPC01', 2, 'PPC01', 1, 'PPC01-2003-00006', NULL, NULL, NULL, NULL, 'PPC01', NULL, 'OTHERS-FACTORY'),
(44, 'Perbaikan Mesin Filling No 12', 'Mesin nyantol', NULL, NULL, NULL, '30H', '2020-03-05', 'TEK08', 0, '2020-03-05 01:34:41', '2020-03-05 04:09:28', NULL, 'BMS01', 4, 'BMS01', 1, 'BMS01-2003-00004', 'TEK08', '2020-03-05 00:00:00', 'BMS01', '2020-03-05 11:09:28', 'BMS01', NULL, 'PM01601'),
(41, 'Penambahan plat pada alas geledekan karna masih berlubang', 'Kesusahan saat pengambilan barang menggunakan geledekan yang masih berlubang', 'IJN01-2003-00002-1-IMG20200304080557.jpg', NULL, NULL, '30H', '2020-03-04', 'TEK06', 4, '2020-03-04 08:03:12', '2020-03-05 08:44:56', NULL, 'IJN01', 4, 'IJN01', 1, 'IJN01-2003-00002', 'TEK06', '2020-03-05 00:00:00', 'IJN01', '2020-03-05 15:44:56', 'IJN01', NULL, 'OTHERS-FACTORY'),
(42, 'FILTER BAG 1205', 'Filter bag bocor', NULL, NULL, NULL, '30H', '2020-03-04', 'TEK08', 0, '2020-03-04 08:11:15', '2020-03-06 02:12:53', NULL, 'MHM01', 4, 'MHM01', 1, 'MHM01-2003-00007', 'TEK08', '2020-03-04 00:00:00', 'MHM01', '2020-03-06 09:12:53', 'MHM01', NULL, 'OTHERS-FACTORY'),
(43, 'forklit 05', 'Ganti Accu baru', 'LOG01-2003-00001-1-Maintenance.xlsx', NULL, NULL, '30H', '2020-03-05', 'TEK08', 5, '2020-03-05 01:06:08', '2020-03-17 03:23:13', NULL, 'LOG01', 4, 'LOG01', 1, 'LOG01-2003-00001', 'TEK08', '2020-03-05 00:00:00', 'LOG01', '2020-03-17 10:23:13', 'LOG01', NULL, 'SK00012'),
(45, 'Penggantian roda timbangan moving no 17 karna rusak.', 'Roda Timbangan sulit belok ketika ada beban.', 'IJN01-2003-00003-1-IMG20200305092044.jpg', NULL, NULL, '30H', '2020-03-05', 'TEK08', 0, '2020-03-05 02:51:14', '2020-03-05 07:33:49', NULL, 'IJN01', 4, 'IJN01', 1, 'IJN01-2003-00003', 'TEK08', '2020-03-05 00:00:00', 'IJN01', '2020-03-05 14:33:49', 'IJN01', NULL, 'OTHERS-FACTORY'),
(46, 'Forklift 18', 'Ganti Oli Mesin', NULL, NULL, NULL, '30H', '2020-03-05', 'TEK08', 5, '2020-03-05 03:03:39', '2020-03-17 03:22:55', NULL, 'LOG01', 4, 'LOG01', 1, 'LOG01-2003-00002', '', '2020-03-11 00:00:00', 'LOG01', '2020-03-17 10:22:55', 'LOG01', NULL, 'PK00225'),
(47, 'Perbaikan motor feeding monomer', 'Motor Feeding monomer bocor', NULL, NULL, NULL, '30H', '2020-03-05', 'TEK08', 0, '2020-03-05 03:38:44', '2020-03-06 09:34:29', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00004', 'TEK08', '2020-03-06 00:00:00', 'RJN02', '2020-03-06 16:34:29', 'RJN02', NULL, 'PM00350'),
(48, 'Ganti camlock selang mesin filling no 2', 'Penggantian camlock selang mesin filling no 2 karena pecah(2 buah).', 'BME01-2003-00005-1-IMG_20200305_100317.jpg', NULL, NULL, '30H', '2020-03-05', 'TEK08', 0, '2020-03-05 03:39:54', '2020-03-10 04:03:32', NULL, 'BME01', 4, 'BME01', 1, 'BME01-2003-00005', NULL, NULL, 'BME01', '2020-03-10 11:03:32', 'BME01', NULL, 'PM00403'),
(49, 'Perbaikan pipa jalur boiler ke Reaktor 7', 'Pipa bocor', NULL, NULL, NULL, '30H', '2020-03-05', 'TEK06', 4, '2020-03-05 03:50:24', '2020-03-05 14:10:54', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00005', 'TEK06', '2020-03-05 00:00:00', 'RJN02', '2020-03-05 21:10:54', 'RJN02', NULL, 'PM02080'),
(50, 'Forklift 02', 'perbaikan kinpin rusak', NULL, NULL, NULL, '30H', '2020-03-05', 'TEK08', 5, '2020-03-05 05:59:09', '2020-03-17 03:22:36', NULL, 'LOG01', 4, 'LOG01', 1, 'LOG01-2003-00003', '', '2020-03-05 00:00:00', 'LOG01', '2020-03-17 10:22:36', 'LOG01', NULL, 'PK00365'),
(51, 'TIMBANGAN ERROR (TIDAK SAMA)', 'TIMBANGAN ERROR (TIDAK SAMA)', NULL, NULL, NULL, '30H', '2020-03-05', 'TEK07', 1, '2020-03-05 06:00:52', '2020-03-05 08:10:55', NULL, 'TDR01', 4, 'TDR01', 1, 'TDR01-2003-00002', 'TEK08', '2020-03-05 00:00:00', 'TDR01', '2020-03-05 15:10:55', 'TDR01', NULL, 'PM01064'),
(52, 'Reagen Softener carbon tank Boiler 1', 'Reagen Softener carbon tank boiler 1', NULL, NULL, NULL, '30H', '2020-03-05', 'TEK03', 2, '2020-03-05 06:14:48', '2020-03-06 04:28:00', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00006', 'TEK03', '2020-03-06 00:00:00', 'RJN02', '2020-03-06 11:28:00', 'RJN02', NULL, 'PB00064'),
(53, 'Penggantian tutup tangki menjadi Stainless steel', 'Penggantian tutup tangki padle menjadi stainless steel \r\n(Desain menyesuaikan Plant hygiene)', 'BME01-2003-00006-1-image.jpg', NULL, NULL, '30H', '2020-03-05', 'TEK06', 4, '2020-03-05 07:31:48', '2020-03-05 07:31:48', NULL, 'BME01', 2, 'BME01', 1, 'BME01-2003-00006', NULL, NULL, NULL, NULL, 'BME01', NULL, 'PM01457'),
(54, 'trolly ganti roda', 'ganti roda', NULL, NULL, NULL, '30H', '2020-03-05', 'TEK08', 0, '2020-03-05 07:54:03', '2020-03-06 03:52:45', NULL, 'SMR01', 4, 'SMR01', 1, 'SMR01-2003-00009', 'TEK08', '2020-03-05 00:00:00', 'SMR01', '2020-03-06 10:52:45', 'SMR01', NULL, 'OTHERS-FACTORY'),
(55, 'Perbaikan pompa blagdon 3\"', 'Perbaikan pompa blagdon 3\" membran jebol', NULL, NULL, NULL, '30H', '2020-03-05', 'TEK08', 0, '2020-03-05 08:02:52', '2020-03-12 02:24:40', NULL, 'BME01', 4, 'BME01', 1, 'BME01-2003-00007', 'TEK08', '2020-03-11 00:00:00', 'BME01', '2020-03-12 09:24:40', 'BME01', NULL, 'PM00775'),
(56, 'Perbaikan mesin filling no 10', 'Seal penekan tutup aus', NULL, NULL, NULL, '30H', '2020-03-05', 'TEK08', 0, '2020-03-05 08:05:27', '2020-03-05 08:29:54', NULL, 'BMS01', 4, 'BMS01', 1, 'BMS01-2003-00005', 'TEK08', '2020-03-05 00:00:00', 'BMS01', '2020-03-05 15:29:54', 'BMS01', NULL, 'PM01599'),
(57, 'Perbaikan mixer 23', 'Mixer 23 sil hidrolis bocor, oli habis', NULL, NULL, NULL, '30H', '2020-03-05', 'TEK08', 0, '2020-03-05 08:08:05', '2020-03-16 07:53:13', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00007', 'TEK08', '2020-03-16 00:00:00', 'RJN02', '2020-03-16 14:53:13', 'RJN02', NULL, 'PM01454'),
(58, 'Mesin Grindd Mill no.1', 'Mohon di buatkan tempat terbuat dari plat besi untuk menaruh glass beads mesin grind mill no.1. Dengan ukuran PxLxT 50x50x60 cm. Bagian atas terbuka dan diberi roda + pegangan. (Gambar dan ukuran terlampir)', 'SMR01-2003-00010-1-WhatsApp Image 2020-03-05 at 15.03.36(1).jpeg', NULL, NULL, '30H', '2020-03-05', 'TEK06', 4, '2020-03-05 08:08:54', '2020-03-12 08:27:28', NULL, 'SMR01', 4, 'SMR01', 1, 'SMR01-2003-00010', 'TEK06', '2020-03-12 00:00:00', 'SMR01', '2020-03-12 15:27:28', 'SMR01', NULL, 'PM00916'),
(59, 'Mesin Inkjet no.2', 'Mohon diperbaiki meja inkjet no. 2 karena kaki meja sudah hampir patah', NULL, NULL, NULL, '30H', '2020-03-05', 'TEK06', 4, '2020-03-05 08:11:40', '2020-03-12 08:27:14', NULL, 'SMR01', 4, 'SMR01', 1, 'SMR01-2003-00011', 'TEK06', '2020-03-12 00:00:00', 'SMR01', '2020-03-12 15:27:14', 'SMR01', NULL, 'PM01012'),
(60, 'Mesin Liftting kaleng', 'Penggantian tombol operasional pada mesin lifting kaleng dikarenakan sudah tidak berfungsi atau error', NULL, NULL, NULL, '30H', '2020-03-05', 'TEK07', 1, '2020-03-05 08:13:49', '2020-03-09 03:37:47', NULL, 'SMR01', 4, 'SMR01', 1, 'SMR01-2003-00012', 'TEK07', '2020-03-06 00:00:00', 'SMR01', '2020-03-09 10:37:47', 'SMR01', NULL, 'OTHERS-FACTORY'),
(61, 'Mesin Filling no.2', 'Mohon di buatkan trolly tempat tali rafia untuk mengikat dos barang jadi hasil mesin filling no.2. PxLxT 63x63x60 cm. Bagian atas terbuka. (Gambar terlampir)', 'SMR01-2003-00013-1-WhatsApp Image 2020-03-05 at 15.03.36(3).jpeg', NULL, NULL, '30H', '2020-03-05', 'TEK06', 4, '2020-03-05 08:17:48', '2020-03-12 08:27:02', NULL, 'SMR01', 4, 'SMR01', 1, 'SMR01-2003-00013', 'TEK06', '2020-03-12 00:00:00', 'SMR01', '2020-03-12 15:27:02', 'SMR01', NULL, 'PM01007'),
(62, 'Mesin filling 5 Ltr', 'Lampu sensor menyala terus', NULL, NULL, NULL, '30H', '2020-03-06', 'TEK07', 1, '2020-03-06 01:25:43', '2020-03-06 01:47:33', NULL, 'TDR01', 4, 'TDR01', 1, 'TDR01-2003-00003', NULL, NULL, 'TDR01', '2020-03-06 08:47:33', 'TDR01', NULL, 'PM01064'),
(63, 'PIPA AIR BAHAN', 'MOHON DIPERBAIKI PIPA AIR BAHAN YANG MENUJU TANGKI P3 KARENA BOCOR', NULL, NULL, NULL, '30H', '2020-03-06', 'TEK08', 0, '2020-03-06 01:31:08', '2020-03-09 03:59:12', NULL, 'MRP01', 4, 'MRP01', 1, 'MRP01-2003-00001', 'TEK08', '2020-03-06 00:00:00', 'MRP01', '2020-03-09 10:59:12', 'MRP01', NULL, 'PM01145'),
(64, 'Perbaikan mesin filling no 11', 'Ball valve buntu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-06 01:42:59', '2020-03-06 02:28:18', NULL, 'BMS01', 4, 'BMS01', 1, 'BMS01-2003-00006', 'TEK08', '2020-03-06 00:00:00', 'BMS01', '2020-03-06 09:28:18', 'BMS01', NULL, 'PM01600'),
(65, 'MANUAL FEEDER  1.5', 'PENGGANTIAN KAWAT AYAKAN MANUAL FEEDER, AYAKAN JEBOL', NULL, NULL, NULL, '30H', '2020-03-06', 'TEK08', 0, '2020-03-06 01:49:55', '2020-03-09 05:58:41', NULL, 'MHM01', 4, 'MHM01', 1, 'MHM01-2003-00008', 'TEK08', '2020-03-06 00:00:00', 'MHM01', '2020-03-09 12:58:41', 'MHM01', NULL, 'OTHERS-FACTORY'),
(66, 'mobil', 'Ban Luar Champiro Eco tubeless 175 / 65 R14 82T = 1 bj untuk Toyota Agya W 1844 S Rofiq resin.', 'LOG01-2003-00004-1-Maintenance.xlsx', NULL, NULL, '30H', '2020-03-06', 'TEK08', 5, '2020-03-06 01:56:27', '2020-03-06 01:56:27', NULL, 'LOG01', 3, 'LOG01', 1, 'LOG01-2003-00004', 'TEK08', '2020-04-01 00:00:00', NULL, NULL, 'LOG01', NULL, 'PK00370'),
(67, 'Perbaikan pompa sigma no 4 karna remes bocor.', 'Remes 8', 'IJN01-2003-00004-1-IMG20200306090039.jpg', NULL, NULL, '30H', '2020-03-06', 'TEK08', 0, '2020-03-06 02:04:42', '2020-03-09 02:06:51', NULL, 'IJN01', 4, 'IJN01', 1, 'IJN01-2003-00004', 'TEK08', '2020-03-06 00:00:00', 'IJN01', '2020-03-09 09:06:51', 'IJN01', NULL, 'PM01633'),
(68, 'TEMPAT PEMBUATAN ASPAL', '1. DIBUATKAN SOSORAN AREA PEMBUATAN ASPAL\r\n2. PENINGGIAN LANTAI DARI SISA PAVING LAMA DAN PAVING BONGKARAN \r\n3. LUASAN ± 10 x 7 m2', 'HRD12-2003-00003-1-SPK 06032020.pdf', NULL, NULL, '30H', '2020-03-06', 'TEK09', 3, '2020-03-06 02:41:53', '2020-03-06 02:41:53', NULL, 'HRD12', 3, 'HRD12', 1, 'HRD12-2003-00003', 'TEK09', '2020-04-03 00:00:00', NULL, NULL, 'HRD12', NULL, 'OTHERS-FACTORY'),
(69, 'Perbaikan Padle mixer tengki 43', 'penggantian ball valve buntu', NULL, NULL, NULL, '30H', '2020-03-06', 'TEK08', 0, '2020-03-06 03:16:39', '2020-03-06 09:06:53', NULL, 'BMS01', 4, 'BMS01', 1, 'BMS01-2003-00007', 'TEK08', '2020-03-06 00:00:00', 'BMS01', '2020-03-06 16:06:53', 'BMS01', NULL, 'PM00810'),
(70, 'GANTI SELANG MESIN BOA', '1. MENGGANTI SELANG MESIN BOA\r\n2. MENGGANTI NEPEL', NULL, NULL, NULL, '30H', '2020-03-06', 'TEK08', 0, '2020-03-06 04:14:24', '2020-03-09 03:21:30', NULL, 'TGR01', 4, 'TGR01', 1, 'TGR01-2003-00001', 'TEK08', '2020-03-09 00:00:00', 'TGR01', '2020-03-09 10:21:30', 'TGR01', NULL, 'PM01077'),
(71, 'Mesin filling 5 Ltr', 'As seker putus', NULL, NULL, NULL, '30H', '2020-03-06', 'TEK08', 0, '2020-03-06 07:10:08', '2020-03-10 06:12:41', NULL, 'TDR01', 4, 'TDR01', 1, 'TDR01-2003-00004', 'TEK08', '2020-03-06 00:00:00', 'TDR01', '2020-03-10 13:12:41', 'TDR01', NULL, 'PM01064'),
(72, 'Penggantian rak inject no 3', 'Rak inject (berroda) tipis dan potensi jatuh (sudah goyang goyang)\r\nMinta pergantian rak yang lebih kuat (Seperti existing)', NULL, NULL, NULL, '90H', '2020-03-06', 'TEK06', 4, '2020-03-06 07:17:46', '2020-03-17 08:26:19', NULL, 'BMS01', 4, 'BMS01', 1, 'BMS01-2003-00008', 'TEK06', '2020-03-13 00:00:00', 'BMS01', '2020-03-17 15:26:19', 'BMS01', NULL, 'PM00649'),
(73, 'Penggantian rak inject no 2', 'Rak inject (berroda) tipis dan potensi jatuh (sudah goyang goyang)\r\nMinta pergantian rak yang lebih kuat (Seperti existing)', NULL, NULL, NULL, '90H', '2020-03-06', 'TEK06', 4, '2020-03-06 07:20:02', '2020-03-17 08:26:40', NULL, 'BMS01', 4, 'BMS01', 1, 'BMS01-2003-00009', 'TEK06', '2020-03-13 00:00:00', 'BMS01', '2020-03-17 15:26:40', 'BMS01', NULL, 'PM00648'),
(74, 'Penggantian rak inject no 5', 'Rak inject (berroda) tipis dan potensi jatuh (sudah goyang goyang)\r\nMinta pergantian rak yang lebih kuat (Seperti existing)', NULL, NULL, NULL, '90H', '2020-03-06', 'TEK06', 4, '2020-03-06 07:20:59', '2020-03-17 08:26:52', NULL, 'BMS01', 4, 'BMS01', 1, 'BMS01-2003-00010', 'TEK06', '2020-03-13 00:00:00', 'BMS01', '2020-03-17 15:26:52', 'BMS01', NULL, 'PM00600'),
(75, 'Penggantian rak inject no 4', 'Rak inject (berroda) tipis dan potensi jatuh (sudah goyang goyang)\r\nMinta pergantian rak yang lebih kuat (Seperti existing)', NULL, NULL, NULL, '90H', '2020-03-06', 'TEK06', 4, '2020-03-06 07:21:57', '2020-03-17 08:27:09', NULL, 'BMS01', 4, 'BMS01', 1, 'BMS01-2003-00011', 'TEK06', '2020-03-13 00:00:00', 'BMS01', '2020-03-17 15:27:09', 'BMS01', NULL, 'PM00650'),
(76, 'Penggantian rak inject no 6', 'Rak inject (berroda) tipis dan potensi jatuh (sudah goyang goyang)\r\nMinta pergantian rak yang lebih kuat (Seperti existing)', NULL, NULL, NULL, '90H', '2020-03-06', 'TEK06', 4, '2020-03-06 07:22:53', '2020-03-17 08:27:19', NULL, 'BMS01', 4, 'BMS01', 1, 'BMS01-2003-00012', 'TEK06', '2020-03-13 00:00:00', 'BMS01', '2020-03-17 15:27:19', 'BMS01', NULL, 'PM00621'),
(77, 'Reagen Softener carbon tank Boiler 1', 'Reagen Softener carbon tank Boiler 1', NULL, NULL, NULL, '30H', '2020-03-06', 'TEK03', 2, '2020-03-06 07:30:40', '2020-03-17 07:33:21', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00008', 'TEK03', '2020-03-16 00:00:00', 'RJN02', '2020-03-17 14:33:21', 'RJN02', NULL, 'PM02098'),
(78, 'Perbaikan pompa feed katalis Reaktor 22', 'Perbaikan pompa feed katalis Reaktor 22 (motor pompa tdk berputar)', NULL, NULL, NULL, '30H', '2020-03-06', 'TEK08', 0, '2020-03-06 08:22:28', '2020-03-06 09:50:10', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00009', 'TEK08', '2020-03-06 00:00:00', 'RJN02', '2020-03-06 16:50:10', 'RJN02', NULL, 'PM02324'),
(79, 'JALUR OUTPUT FILTERBAG MAIN SILO', 'JALUR OUTPUT BUNTU KARENA BANYAK SISA MATERIAL YANG MENGENDAP PADA PIPA', NULL, NULL, NULL, '30H', '2020-03-09', 'TEK08', 0, '2020-03-09 00:43:20', '2020-03-19 03:40:19', NULL, 'MHM01', 4, 'MHM01', 1, 'MHM01-2003-00009', 'TEK08', '2020-03-18 00:00:00', 'MHM01', '2020-03-19 10:40:19', 'MHM01', NULL, 'OTHERS-FACTORY'),
(80, 'truck DN 8803 RA', 'perbaikan rem tdk berfungsi.', NULL, NULL, NULL, '30H', '2020-03-09', 'TEK08', 5, '2020-03-09 01:27:41', '2020-03-17 03:17:35', NULL, 'LOG01', 4, 'LOG01', 1, 'LOG01-2003-00005', 'TEK08', '2020-03-09 00:00:00', 'LOG01', '2020-03-17 10:17:35', 'LOG01', NULL, 'PK00427'),
(81, 'PERBAIKAN MESIN POTONG RUMPUT', 'MESIN POTONG RUMPUT MATI', NULL, NULL, NULL, '30H', '2020-03-09', 'TEK08', 5, '2020-03-09 02:12:38', '2020-03-09 04:49:10', NULL, 'HRD12', 4, 'HRD12', 1, 'HRD12-2003-00004', 'TEK08', '2020-03-09 00:00:00', 'HRD12', '2020-03-09 11:49:10', 'HRD12', NULL, 'OTHERS-FACTORY'),
(82, 'Perbaikan talang bocor', 'Mengganti Paralon yg pecah', NULL, NULL, NULL, '30H', '2020-03-09', 'TEK09', 3, '2020-03-09 02:13:06', '2020-03-11 05:54:14', NULL, 'LOG02', 4, 'LOG02', 1, 'LOG02-2003-00001', NULL, NULL, 'LOG02', '2020-03-11 12:54:14', 'LOG02', NULL, 'OTHERS-FACTORY'),
(83, 'PERBAIKAN FORKLIFT REACHTRUCK JUNGHAINRICH 35', 'PENGGANTIAN RODA BELAKANG', NULL, NULL, NULL, '30H', '2020-03-09', 'TEK08', 5, '2020-03-09 02:18:15', '2020-03-11 02:57:21', NULL, 'LOG02', 4, 'LOG02', 1, 'LOG02-2003-00002', 'TEK08', '2020-03-09 00:00:00', 'LOG02', '2020-03-11 09:57:21', 'LOG02', NULL, 'SK00023'),
(84, 'Forklift 12', 'perbaikkan pangkon rusak', NULL, NULL, NULL, '30H', '2020-03-09', 'TEK08', 5, '2020-03-09 02:44:04', '2020-03-17 03:17:23', NULL, 'LOG01', 4, 'LOG01', 1, 'LOG01-2003-00006', 'TEK08', '2020-03-09 00:00:00', 'LOG01', '2020-03-17 10:17:23', 'LOG01', NULL, 'PK00395'),
(85, 'Penggantian pipa transfer KK252 di gudang Merapi', 'Penggantian pipa transfer dari storage tank KK252 di gdg Merapi ke weighing prod,dari semula pipa galvanis menjadi pipa PVC.', NULL, NULL, NULL, '90H', '2020-03-09', 'TEK06', 4, '2020-03-09 03:14:54', '2020-03-09 03:14:54', NULL, 'PPC01', 2, 'PPC01', 1, 'PPC01-2003-00007', NULL, NULL, NULL, NULL, 'PPC01', NULL, 'PM01159'),
(86, 'Perbaikan atap teras gudang Kana (bocor)', 'Perbaikan atap depan pintu gerbang gdg Kana yg bocor.\r\n\r\nC/P : Pradico / Rudy', NULL, NULL, NULL, '30H', '2020-03-09', 'TEK09', 3, '2020-03-09 03:18:21', '2020-03-13 09:53:30', NULL, 'PPC01', 4, 'PPC01', 1, 'PPC01-2003-00008', NULL, NULL, 'PPC01', '2020-03-13 16:53:30', 'PPC01', NULL, 'PB00042'),
(87, 'LAMPU SERING NGETRIP', '1. MEMBENARKAN LAMPU SERING NGETRIP', NULL, NULL, NULL, '30H', '2020-03-09', 'TEK07', 1, '2020-03-09 03:32:14', '2020-03-11 06:29:39', NULL, 'TGR01', 4, 'TGR01', 1, 'TGR01-2003-00002', 'TEK07', '2020-03-10 00:00:00', 'TGR01', '2020-03-11 13:29:39', 'TGR01', NULL, 'OTHERS-FACTORY'),
(88, 'TIMBANGAN ERROR', '1. UNTUK VIPLAS 360', NULL, NULL, NULL, '30H', '2020-03-09', 'TEK07', 1, '2020-03-09 03:33:16', '2020-03-10 00:50:59', NULL, 'TGR01', 4, 'TGR01', 1, 'TGR01-2003-00003', 'TEK07', '2020-03-09 00:00:00', 'TGR01', '2020-03-10 07:50:59', 'TGR01', NULL, 'PM01672'),
(89, 'Maintenance Filter Udara', 'Saluran filter yang mengalirkan udara dari kompresor ke mesin, terisi air dan serbuk karat. Mohon dibantu untuk proses pembersihan nya, juga kebersihan kompresor terkait, supaya tidak merusak alat.\r\n\r\nInfo lebih lanjut bisa hubungi ext 537: Sylvia/Nastiti, mohon informasi sebelum melakukan pengecekan ke mesin tsb.\r\nTerima kasih.', 'RDS01-2003-00001-1-IMG20200305075121-min.jpg', NULL, NULL, '30H', '2020-03-09', 'TEK08', 0, '2020-03-09 03:33:27', '2020-03-10 01:41:06', NULL, 'RDS01', 4, 'RDS01', 1, 'RDS01-2003-00001', NULL, NULL, 'RDS01', '2020-03-10 08:41:06', 'RDS01', NULL, 'PM00698'),
(90, 'Penambahan lampu penerangan di gdg Kerinci', 'Penambahan 2(dua) bh lampu di bawah Dak lantai dua.\r\n\r\nC/P: Pradico', NULL, NULL, NULL, '30H', '2020-03-09', 'TEK07', 1, '2020-03-09 03:49:48', '2020-03-11 07:05:09', NULL, 'PPC01', 4, 'PPC01', 1, 'PPC01-2003-00009', NULL, NULL, 'PPC01', '2020-03-11 14:05:09', 'PPC01', NULL, 'PB00007'),
(91, 'Perbaikan lantai dak atas gdg. Retur', 'Perbaikan lantai dak border gdg Retur (dekat mixer) yg rusak.\r\n\r\nC/P: Pradico', NULL, NULL, NULL, '30H', '2020-03-09', 'TEK06', 4, '2020-03-09 03:57:26', '2020-03-10 08:32:58', NULL, 'PPC01', 4, 'PPC01', 1, 'PPC01-2003-00010', NULL, NULL, 'PPC01', '2020-03-10 15:32:58', 'PPC01', NULL, 'PB00124'),
(92, 'Mesin filling 1 Ltr', 'Layar timbangan tidak berfungsi', NULL, NULL, NULL, '30H', '2020-03-09', 'TEK07', 1, '2020-03-09 03:59:10', '2020-03-09 03:59:10', NULL, 'TDR01', 2, 'TDR01', 1, 'TDR01-2003-00005', NULL, NULL, NULL, NULL, 'TDR01', NULL, 'PM01062'),
(93, 'Penggantian Kran ball valve selang mobile gdg Tidar', 'Penggantian Stop kran selang mobile utk keperluan unloading solvent dari storage tangk gudang ke dlm drum 200 lt.\r\n\r\nC/P : Pradico/Zehan', NULL, NULL, NULL, '30H', '2020-03-09', 'TEK08', 0, '2020-03-09 04:00:38', '2020-03-09 08:09:19', NULL, 'PPC01', 4, 'PPC01', 1, 'PPC01-2003-00011', 'TEK08', '2020-03-09 00:00:00', 'PPC01', '2020-03-09 15:09:19', 'PPC01', NULL, 'OTHERS-FACTORY'),
(94, 'Permintaan stopkontak 1 unit', 'Mohon dibuatkan stopkontak (terminal 6 hole, kabel 2 m, dan stecker) sebanyak 1 unit. \r\nJika memungkinkan mohon dibantu segera. \r\nTerimakasih', NULL, NULL, NULL, '30H', '2020-03-09', 'TEK07', 1, '2020-03-09 04:15:13', '2020-03-09 08:10:07', NULL, 'RDS01', 4, 'RDS01', 1, 'RDS01-2003-00002', 'TEK07', '2020-03-09 00:00:00', 'RDS01', '2020-03-09 15:10:07', 'RDS01', NULL, 'OTHERS-RND'),
(95, 'VIPLAS 40CC', 'SENSOR MATI', NULL, NULL, NULL, '30H', '2020-03-09', 'TEK07', 1, '2020-03-09 04:23:58', '2020-03-09 08:44:37', NULL, 'TGR01', 4, 'TGR01', 1, 'TGR01-2003-00004', 'TEK07', '2020-03-09 00:00:00', 'TGR01', '2020-03-09 15:44:37', 'TGR01', NULL, 'OTHERS-RND'),
(96, 'Perbaikan mesin filling no 5 (3x1kg) karna rusak', 'Las2an pada bagian camp ballvalve.', NULL, 'IJN01-2003-00005-2-15837299099601013500728.jpg', NULL, '30H', '2020-03-09', 'TEK08', 0, '2020-03-09 04:58:55', '2020-03-10 01:08:27', NULL, 'IJN01', 4, 'IJN01', 1, 'IJN01-2003-00005', NULL, NULL, 'IJN01', '2020-03-10 08:08:27', 'IJN01', NULL, 'PM01659'),
(97, 'Mesin filling 1 Ltr', 'Timbangan tidak sama', NULL, NULL, NULL, NULL, NULL, 'TEK08', 0, '2020-03-09 06:02:15', '2020-03-11 06:28:14', NULL, 'TDR01', 4, 'TDR01', 1, 'TDR01-2003-00006', 'TEK08', '2020-03-12 00:00:00', 'TDR01', '2020-03-11 13:28:14', 'TDR01', NULL, 'PM01062'),
(98, 'Perbaikan pompa blagdon 3\" membran jebol', 'Perbaikan pompa blagdon 3\" kk252 di karenakan membran jebol', NULL, NULL, NULL, '30H', '2020-03-09', 'TEK08', 0, '2020-03-09 06:07:40', '2020-03-10 04:04:02', NULL, 'BME01', 4, 'BME01', 1, 'BME01-2003-00008', NULL, NULL, 'BME01', '2020-03-10 11:04:02', 'BME01', NULL, 'PM00682'),
(99, 'Mesin Filling 1 liter', 'Volume filling tidak stabil, antara satu dengan yang lain isi volume tidak sama', NULL, NULL, NULL, '30H', '2020-03-09', 'TEK08', 0, '2020-03-09 06:22:26', '2020-03-12 07:57:09', NULL, 'TDR01', 4, 'TDR01', 1, 'TDR01-2003-00007', NULL, NULL, 'TDR01', '2020-03-12 14:57:09', 'TDR01', NULL, 'PM01062'),
(100, 'Perbaikan Saluran air RND', 'Tolong segera diperbaiki saluran limbah RND Buntu\r\nTerimakasih', NULL, NULL, NULL, '30H', '2020-03-09', 'TEK09', 3, '2020-03-09 06:48:42', '2020-03-13 09:44:56', NULL, 'RDS00', 4, 'RDS00', 1, 'RDS00-2003-00001', NULL, NULL, 'RDS00', '2020-03-13 16:44:56', 'RDS00', NULL, 'OTHERS-RND'),
(101, 'PERBAIKAN MOTOR CRANE RUSAK', 'MOTOR CRANE MATI TIDAK BISA JALAN', NULL, NULL, NULL, '30H', '2020-03-09', 'TEK07', 1, '2020-03-09 06:57:22', '2020-03-31 03:30:39', NULL, 'MRP01', 4, 'MRP01', 1, 'MRP01-2003-00002', 'TEK07', '2020-03-19 00:00:00', 'MRP01', '2020-03-31 10:30:39', 'MRP01', NULL, 'PM01134'),
(102, 'Bangunan Plant Semeru', 'Penggantian atap semeru di atas area tinting dikarenakan sudah berkarat', NULL, NULL, NULL, '90H', '2020-03-09', 'TEK09', 3, '2020-03-09 08:19:04', '2020-03-09 08:19:04', NULL, 'SMR01', 2, 'SMR01', 1, 'SMR01-2003-00014', NULL, NULL, NULL, NULL, 'SMR01', NULL, 'PB00018'),
(103, 'Perbaikan AC JET COOL di lab RND', 'AC Tidak bisa nyala', NULL, NULL, NULL, '30H', '2020-03-09', 'TEK03', 2, '2020-03-09 08:20:42', '2020-03-11 05:51:10', NULL, 'RDS00', 4, 'RDS00', 1, 'RDS00-2003-00002', 'TEK03', '2020-03-10 00:00:00', 'RDS00', '2020-03-11 12:51:10', 'RDS00', NULL, 'OTHERS-RND'),
(104, 'truck W 9904 NR', 'ganti oli mesin km 152257', NULL, NULL, NULL, '30H', '2020-03-10', 'TEK08', 5, '2020-03-10 00:47:14', '2020-03-17 03:17:09', NULL, 'LOG01', 4, 'LOG01', 1, 'LOG01-2003-00007', 'TEK08', '2020-03-10 00:00:00', 'LOG01', '2020-03-17 10:17:09', 'LOG01', NULL, 'PK00030'),
(105, 'Mesin Filling n0.8', 'Sensor counter kaleng tidak stabil, sehingga angka yang muncul tidak sesuai dengan jumlah kaleng yang di melewati sensor.', NULL, NULL, NULL, '30H', '2020-03-10', 'TEK07', 1, '2020-03-10 00:48:30', '2020-03-10 05:59:54', NULL, 'SMR01', 4, 'SMR01', 1, 'SMR01-2003-00015', NULL, NULL, 'SMR01', '2020-03-10 12:59:54', 'SMR01', NULL, 'PM01005'),
(106, 'BELT CONVEYOUR 0.5X4M LANTAI 1', 'TOMBOL ON OFF CONVEYOUR ERROR', NULL, NULL, NULL, '30H', '2020-03-10', 'TEK07', 1, '2020-03-10 00:52:41', '2020-03-10 08:49:22', NULL, 'MHM01', 4, 'MHM01', 1, 'MHM01-2003-00010', NULL, NULL, 'MHM01', '2020-03-10 15:49:22', 'MHM01', NULL, 'OTHERS-FACTORY'),
(107, 'Perbaikan Termo Oil 03', 'Termo oil ngetrip terus', NULL, NULL, NULL, '30H', '2020-03-10', 'TEK07', 1, '2020-03-10 00:53:06', '2020-03-19 08:02:11', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00010', 'TEK07', '2020-03-12 00:00:00', 'RJN02', '2020-03-19 15:02:11', 'RJN02', NULL, 'PM02165'),
(108, 'Perbaikan Valve Boiler 2 (Ebara)', 'Valve boiler 2 rusak tidak bisa dibuat menutup pipa', NULL, NULL, NULL, '30H', '2020-03-10', 'TEK03', 2, '2020-03-10 01:19:58', '2020-03-10 01:19:58', NULL, 'RJN02', 2, 'RJN02', 1, 'RJN02-2003-00011', NULL, NULL, NULL, NULL, 'RJN02', NULL, 'PM00896'),
(109, 'Perbaikan timbangan lantai no 4 karna timbangan error.', 'timbangan lantai error', 'IJN01-2003-00006-1-IMG20200310082839.jpg', NULL, NULL, '30H', '2020-03-10', 'TEK07', 1, '2020-03-10 01:39:21', '2020-03-10 07:32:55', NULL, 'IJN01', 4, 'IJN01', 1, 'IJN01-2003-00006', NULL, NULL, 'IJN01', '2020-03-10 14:32:55', 'IJN01', NULL, 'OTHERS-FACTORY'),
(110, 'forklift 07', 'perbaikkan slang hidrolis forklift 07 putus.', NULL, NULL, NULL, '30H', '2020-03-10', 'TEK08', 5, '2020-03-10 03:02:48', '2020-03-17 03:16:57', NULL, 'LOG01', 4, 'LOG01', 1, 'LOG01-2003-00008', 'TEK08', '2020-03-10 00:00:00', 'LOG01', '2020-03-17 10:16:57', 'LOG01', NULL, 'PK00024'),
(111, 'GANTI RODA KERETA DORONG', '1. MENGGANTI RODA KERETA DORONG', NULL, NULL, NULL, '30H', '2020-03-10', 'TEK08', 0, '2020-03-10 04:15:31', '2020-03-12 07:37:10', NULL, 'TGR01', 4, 'TGR01', 1, 'TGR01-2003-00005', 'TEK08', '2020-03-11 00:00:00', 'TGR01', '2020-03-12 14:37:10', 'TGR01', NULL, 'OTHERS-FACTORY'),
(112, 'Air AC bocor', 'Air AC bocor di lab RND Paint merk mitsubishi yang terletak diatas kulkas. Air keluar di depan lab QC. Mohon dibantu proses perbaikan AC tersebut. Terimakasih \r\nMengenai info lebih lanjut, silahkan hubungi Indah (admin) atau Pak Sutikno. \r\nMohon dibantu segera', NULL, NULL, NULL, '30H', '2020-03-10', 'TEK03', 2, '2020-03-10 04:33:08', '2020-03-11 05:51:48', NULL, 'RDS00', 4, 'RDS00', 1, 'RDS00-2003-00003', 'TEK03', '2020-03-10 00:00:00', 'RDS00', '2020-03-11 12:51:48', 'RDS00', NULL, 'PV00115'),
(113, 'Perbaikan Roda handpallet Krisbow', 'Perbaikan roda handpallet krisbow kapasitas 3000 kg', NULL, NULL, NULL, '30H', '2020-03-10', 'TEK08', 0, '2020-03-10 08:13:19', '2020-04-06 04:32:28', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00012', 'TEK08', '2020-04-03 00:00:00', 'RJN02', '2020-04-06 11:32:28', 'RJN02', NULL, 'OTHERS-FACTORY'),
(114, 'Pemasangan AC Kantor Rinjani', 'Pemasangan AC untuk kantor Produksi Rinjani. (Kata pak iwan ambil ac bekas dr kantor)', NULL, NULL, NULL, '30H', '2020-03-10', 'TEK03', 2, '2020-03-10 08:17:37', '2020-04-03 11:42:49', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00013', 'TEK03', '2020-03-24 00:00:00', 'RJN02', '2020-04-03 18:42:49', 'RJN02', NULL, 'OTHERS-FACTORY'),
(115, 'Ball Valve bocor', 'Perbaikan mesin filling ball Valve bocor', NULL, NULL, NULL, '30H', '2020-03-11', 'TEK08', 0, '2020-03-10 15:19:34', '2020-03-12 00:59:47', NULL, 'MRP01', 4, 'MRP01', 1, 'MRP01-2003-00003', 'TEK08', '2020-03-11 00:00:00', 'MRP01', '2020-03-12 07:59:47', 'MRP01', NULL, 'PM01271'),
(116, 'Modifikasi keranjang tutup', 'Modifikasi keranjang tutup (3 Pcs) sesuai gambar terlampir, atau disamakan seperti sebelumnya yaitu bagian blkg naik 15 cm', 'PSDJ06-2003-00001-1-Kotak.docx', NULL, NULL, '30H', '2020-03-11', 'TEK06', 4, '2020-03-11 00:14:46', '2020-03-11 00:14:46', NULL, 'PSDJ06', 2, 'PSDJ06', 1, 'PSDJ06-2003-00001', NULL, NULL, NULL, NULL, 'PSDJ06', NULL, 'OTHERS-FACTORY'),
(117, 'Saluran sirkulasi', 'Saluran sirkulasi kondensor mampet', NULL, NULL, NULL, '30H', '2020-03-11', 'TEK08', 0, '2020-03-11 00:57:00', '2020-03-12 03:09:17', NULL, 'RDR05', 4, 'RDR05', 1, 'RDR05-2003-00001', NULL, NULL, 'RDR05', '2020-03-12 10:09:17', 'RDR05', NULL, 'OTHERS-RND'),
(118, 'Pembuatan mesin filling 6 kav x 1 Kg', 'Pembuatan mesin filling emulsion 6 kav x 1 Kg untuk produk tinting base \r\n1 Unit', 'BME01-2003-00009-1-image.jpg', NULL, NULL, '90H', '2020-03-11', 'TEK06', 4, '2020-03-11 01:38:15', '2020-03-11 01:38:15', NULL, 'BME01', 2, 'BME01', 1, 'BME01-2003-00009', NULL, NULL, NULL, NULL, 'BME01', NULL, 'OTHERS-FACTORY'),
(119, 'Pemasangan profil tank untuk air proses', 'Pemasangan profil tank untuk project air proses bme', NULL, NULL, NULL, '90H', '2020-03-11', 'TEK09', 3, '2020-03-11 01:41:00', '2020-03-19 04:12:08', NULL, 'BME01', 4, 'BME01', 1, 'BME01-2003-00010', NULL, NULL, 'BME01', '2020-03-19 11:12:08', 'BME01', NULL, 'PB00025'),
(120, 'Terot forklif putus', 'Terot forklif no 13 putus', NULL, NULL, NULL, '30H', '2020-03-11', 'TEK08', 5, '2020-03-11 02:01:54', '2020-03-12 00:59:35', NULL, 'MRP01', 4, 'MRP01', 1, 'MRP01-2003-00004', 'TEK08', '2020-03-11 00:00:00', 'MRP01', '2020-03-12 07:59:35', 'MRP01', NULL, 'PK00226'),
(121, 'Perbaikan mixing monumer reaktor 2', 'Mixing tidak bisa berputar', NULL, NULL, NULL, '30H', '2020-03-11', 'TEK07', 1, '2020-03-11 02:07:23', '2020-03-17 00:52:23', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00014', 'TEK07', '2020-03-11 00:00:00', 'RJN02', '2020-03-17 07:52:23', 'RJN02', NULL, 'PM02054'),
(122, 'PK00226', 'perbaikkan tarrot putus forklift 13', NULL, NULL, NULL, '30H', '2020-03-11', 'TEK08', 5, '2020-03-11 02:42:47', '2020-03-17 03:16:44', NULL, 'LOG01', 4, 'LOG01', 1, 'LOG01-2003-00009', 'TEK08', '2020-03-11 00:00:00', 'LOG01', '2020-03-17 10:16:44', 'LOG01', NULL, 'PK00226'),
(123, 'Perbaikan gedung', 'Pemotongan canal C, di beberapa titik pilar', NULL, NULL, NULL, '30H', '2020-03-11', 'TEK09', 3, '2020-03-11 02:56:09', '2020-03-13 01:08:53', NULL, 'LOG02', 4, 'LOG02', 1, 'LOG02-2003-00003', NULL, NULL, 'LOG02', '2020-03-13 08:08:53', 'LOG02', NULL, 'PB00035'),
(124, 'Forklift 06', 'Ganti filter udara forklift 06.', NULL, NULL, NULL, '30H', '2020-03-11', 'TEK08', 5, '2020-03-11 03:32:41', '2020-03-17 03:16:28', NULL, 'LOG01', 4, 'LOG01', 1, 'LOG01-2003-00010', 'TEK08', '2020-03-11 00:00:00', 'LOG01', '2020-03-17 10:16:28', 'LOG01', NULL, 'PK00023'),
(125, 'Pembuatan bak packing stainless untuk packing manual produk water base. (Giba & No lumut wb)', 'Bak stainless dengan ukuran \r\nDiameter 58 cm\r\nTinggi 45 cm\r\n2 Lubang ballvalve 1 inchi.', 'IJN01-2003-00007-1-IMG20200310114706.jpg', NULL, NULL, '30H', '2020-03-11', 'TEK06', 4, '2020-03-11 03:52:16', '2020-03-17 05:59:21', NULL, 'IJN01', 4, 'IJN01', 1, 'IJN01-2003-00007', NULL, NULL, 'IJN01', '2020-03-17 12:59:21', 'IJN01', NULL, 'OTHERS-FACTORY'),
(126, 'Perbaikan pipa Termo Oil 2 bocor', 'Pipa termo oil 2 ada bocor 2 titik', NULL, NULL, NULL, '30H', '2020-03-11', 'TEK03', 2, '2020-03-11 05:38:41', '2020-03-17 00:41:19', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00015', 'TEK03', '2020-03-13 00:00:00', 'RJN02', '2020-03-17 07:41:19', 'RJN02', NULL, 'PM02123'),
(127, 'Perbaikan pipa Termo Oil 3 bocor', 'Pipa jalur termo oil 3 bocor', NULL, NULL, NULL, '30H', '2020-03-11', 'TEK03', 2, '2020-03-11 05:45:53', '2020-03-17 06:12:26', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00016', 'TEK03', '2020-03-17 00:00:00', 'RJN02', '2020-03-17 13:12:26', 'RJN02', NULL, 'PM02165'),
(128, 'MIXER SERING TRIP', 'MOTOR MIXER SERING BERHENTI KETIKA PROSES PREMIX', 'MRP01-2003-00005-1-IMG-5962.jpg', NULL, NULL, '30H', '2020-03-11', 'TEK07', 1, '2020-03-11 05:57:32', '2020-03-31 05:02:12', NULL, 'MRP01', 4, 'MRP01', 1, 'MRP01-2003-00005', 'TEK07', '2020-03-11 00:00:00', 'MRP01', '2020-03-31 12:02:12', 'MRP01', NULL, 'PM01140'),
(129, 'Perbaikan AC', 'PERBAIKAN AC KANTOR PRODUKSI PUSAT (MAHAMERU)\r\nSERING MATI-MATI SENDIRI', NULL, NULL, NULL, '30H', '2020-03-11', 'TEK03', 2, '2020-03-11 05:58:28', '2020-03-16 12:32:18', NULL, 'PSDJ06', 4, 'PSDJ06', 1, 'PSDJ06-2003-00002', 'TEK03', '2020-03-12 00:00:00', 'PSDJ06', '2020-03-16 19:32:18', 'PSDJ06', NULL, 'OTHERS-FACTORY'),
(130, 'Perbaikan Saluran Wastafel di Lab RND', 'Tolong diperbaiki Saluran air tempat cuci tangan. \r\nKet : Bocor \r\nMohon diganti baru karena sudah sering diperbaiki bengkel.\r\nTerimakasih', NULL, NULL, NULL, '30H', '2020-03-11', 'TEK09', 3, '2020-03-11 05:58:35', '2020-03-24 01:33:26', NULL, 'RDS00', 4, 'RDS00', 1, 'RDS00-2003-00004', NULL, NULL, 'RDS00', '2020-03-24 08:33:26', 'RDS00', NULL, 'OTHERS-RND'),
(131, 'Perbaikan Spraybooth', 'Spraybooth dilab RND keluar suara berisik\r\nTolong dibantu untuk perbaikannya \r\nTerimakasih', NULL, NULL, NULL, '30H', '2020-03-11', 'TEK08', 0, '2020-03-11 06:01:32', '2020-03-19 01:43:11', NULL, 'RDS00', 4, 'RDS00', 1, 'RDS00-2003-00005', 'TEK08', '2020-03-18 00:00:00', 'RDS00', '2020-03-19 08:43:11', 'RDS00', NULL, 'OTHERS-RND'),
(132, 'membuat alat pengungkit pembuka pail', 'rnd mortar butuh di buatkan alat pengungkit pembuka pail sebanyak 2 unit. untuk info lebih lanjut mohon menghubungi gerald atau yuli lab rnd mortar nomor : 617. \r\nTerimakasih', NULL, NULL, NULL, '30H', '2020-03-11', 'TEK06', 4, '2020-03-11 06:23:34', '2020-03-16 08:08:35', NULL, 'RDC02', 4, 'RDC02', 1, 'RDC02-2003-00001', 'TEK06', '2020-03-13 00:00:00', 'RDC02', '2020-03-16 15:08:35', 'RDC02', NULL, 'OTHERS-RND'),
(133, 'BLOWER SPRAY', '1. BUNYI BLOWER SPRAY KASAR', NULL, NULL, NULL, '30H', '2020-03-11', 'TEK08', 0, '2020-03-11 06:30:55', '2020-03-13 02:36:23', NULL, 'TGR01', 4, 'TGR01', 1, 'TGR01-2003-00006', 'TEK08', '2020-03-12 00:00:00', 'TGR01', '2020-03-13 09:36:23', 'TGR01', NULL, 'PM01094'),
(134, 'Penambahan Lampu Penerangan Area Packing', 'Penambahan Lampu Penerangan Area Packing di 6 titik\r\n3 titik area packing No Drop\r\n3titik area paxking aries (let down)', NULL, NULL, NULL, '30H', '2020-03-11', 'TEK07', 1, '2020-03-11 07:44:59', '2020-03-19 02:25:09', NULL, 'PSDJ05', 3, 'PSDJ05', 1, 'PSDJ05-2003-00006', 'TEK07', '2020-03-19 09:25:09', NULL, NULL, 'PSDJ05', NULL, 'PB00017'),
(135, 'pemasangan indikator timbangan', 'pemasangan indikator timbangan pasta ( indikator sudah di bms tinggal masang perlu kabel dll) tipe XK3190-A9', NULL, NULL, NULL, '30H', '2020-03-11', 'TEK07', 1, '2020-03-11 07:58:42', '2020-04-03 02:51:45', NULL, 'BMS01', 4, 'BMS01', 1, 'BMS01-2003-00013', NULL, NULL, 'BMS01', '2020-04-03 09:51:45', 'BMS01', NULL, 'OTHERS-FACTORY'),
(136, 'Tangki reflak reaktor 19  kropos', 'Piping bocor', NULL, NULL, NULL, '30H', '2020-03-12', 'TEK08', 0, '2020-03-12 00:57:33', '2020-03-12 07:32:00', NULL, 'RJN01', 4, 'RJN01', 1, 'RJN01-2003-00001', 'TEK08', '2020-03-12 00:00:00', 'RJN01', '2020-03-12 14:32:00', 'RJN01', NULL, 'PM02154'),
(137, 'PERBAIKAN LAMPU', 'PERBAIKAN LAMPU DI KANTOR POSISI LAMPU YANG MATI DI DEPAN RUANG SERVER IT', NULL, NULL, NULL, '30H', '2020-03-12', 'TEK07', 1, '2020-03-12 01:40:59', '2020-03-16 00:58:14', NULL, 'HRD12', 4, 'HRD12', 1, 'HRD12-2003-00005', 'TEK07', '2020-03-12 00:00:00', 'HRD12', '2020-03-16 07:58:14', 'HRD12', NULL, 'WV00325'),
(138, 'PERBAIKAN LAMPU LUAR PAGAR', '1. LAMPU PARIMETER LUAR SISI BARAT MATI\r\n2. LAMPU YANG MATI BERJUMLAH 8 \r\n3. 1 BOX PENUTUP LAMPU MAU LEPAS', NULL, NULL, NULL, '30H', '2020-03-12', 'TEK07', 1, '2020-03-12 01:54:04', '2020-04-01 00:34:06', NULL, 'HRD12', 4, 'HRD12', 1, 'HRD12-2003-00006', 'TEK07', '2020-03-19 00:00:00', 'HRD12', '2020-04-01 07:34:06', 'HRD12', NULL, 'WV00325'),
(139, 'Pembuatan pengeras manhole reaktor 1', 'Pembuatan pengeras manhole (pengunci tutup manhole) reaktor 1', NULL, NULL, NULL, '30H', '2020-03-12', 'TEK06', 4, '2020-03-12 02:11:45', '2020-04-08 01:55:47', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00017', 'TEK06', '2020-04-07 00:00:00', 'RJN02', '2020-04-08 08:55:47', 'RJN02', NULL, 'PM02037'),
(140, 'Pembuatan pengeras manhole reaktor 2', 'Pembuatan pengeras manhole (pengunci tutup) reaktor 2', NULL, NULL, NULL, '30H', '2020-03-12', 'TEK06', 4, '2020-03-12 02:14:00', '2020-04-08 01:56:07', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00018', 'TEK06', '2020-04-07 00:00:00', 'RJN02', '2020-04-08 08:56:07', 'RJN02', NULL, 'PM02051'),
(141, 'forklift 05', 'perbaikkan pompa hidrolis bocor, boom hidrolis bocor,', NULL, NULL, NULL, '30H', '2020-03-12', 'TEK08', 5, '2020-03-12 02:15:25', '2020-03-19 02:42:38', NULL, 'LOG01', 4, 'LOG01', 1, 'LOG01-2003-00011', NULL, NULL, 'LOG01', '2020-03-19 09:42:38', 'LOG01', NULL, 'PK00013'),
(142, 'Pembuatan pengeras manhole reaktor 3', 'Pembuatan pengeras manhole (Pengunci Tutup) reaktor 3', NULL, NULL, NULL, '30H', '2020-03-12', 'TEK06', 4, '2020-03-12 02:27:24', '2020-04-08 01:56:34', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00019', 'TEK06', '2020-04-07 00:00:00', 'RJN02', '2020-04-08 08:56:34', 'RJN02', NULL, 'PM02057'),
(143, 'Pembuatan pengeras manhole reaktor 4', 'Pembuatan pengeras manhole (Pengunci Tutup) reaktor 4', NULL, NULL, NULL, '30H', '2020-03-12', 'TEK06', 4, '2020-03-12 02:29:24', '2020-04-08 02:02:10', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00020', 'TEK06', '2020-04-07 00:00:00', 'RJN02', '2020-04-08 09:02:10', 'RJN02', NULL, 'PM02064'),
(144, 'Pembuatan pengeras manhole reaktor 5', 'Pembuatan pengeras manhole (Pengunci Tutup) reaktor 5', NULL, NULL, NULL, '30H', '2020-03-12', 'TEK06', 4, '2020-03-12 02:30:13', '2020-04-08 02:02:31', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00021', 'TEK06', '2020-04-07 00:00:00', 'RJN02', '2020-04-08 09:02:31', 'RJN02', NULL, 'PM02072'),
(145, 'Pembuatan pengeras manhole reaktor 6', 'Pembuatan pengeras manhole (Pengunci Tutup) reaktor 6', NULL, NULL, NULL, '30H', '2020-03-12', 'TEK06', 4, '2020-03-12 02:31:22', '2020-04-08 02:03:30', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00022', 'TEK06', '2020-04-07 00:00:00', 'RJN02', '2020-04-08 09:03:30', 'RJN02', NULL, 'PM02076');
INSERT INTO `ticket` (`id`, `judul`, `keterangan`, `attachment_1`, `attachment_2`, `attachment_3`, `prioritas`, `start`, `assignee`, `category_id`, `created_at`, `updated_at`, `user_jawab`, `user_modified`, `status`, `user_created`, `active`, `no_ticket`, `user_request_close`, `request_close_date`, `user_close`, `close_date`, `reldag`, `SPK`, `FACode`) VALUES
(146, 'Pembuatan pengeras manhole reaktor 7', 'Pembuatan pengeras manhole (Pengunci Tutup) reaktor 7', NULL, NULL, NULL, '30H', '2020-03-12', 'TEK06', 4, '2020-03-12 02:32:19', '2020-04-08 02:03:57', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00023', 'TEK06', '2020-04-07 00:00:00', 'RJN02', '2020-04-08 09:03:57', 'RJN02', NULL, 'PM02080'),
(147, 'Pembuatan pengeras manhole reaktor 8', 'Pembuatan pengeras manhole (Pengunci Tutup) reaktor 8', NULL, NULL, NULL, '30H', '2020-03-12', 'TEK06', 4, '2020-03-12 02:33:21', '2020-04-08 02:04:14', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00024', 'TEK06', '2020-04-07 00:00:00', 'RJN02', '2020-04-08 09:04:14', 'RJN02', NULL, 'PM02092'),
(148, 'Pembuatan pengeras manhole Cooling Tank Reaktor 3', 'Pembuatan pengeras manhole (Pengunci Tutup) Cooling Tank reaktor 3', NULL, NULL, NULL, '30H', '2020-03-12', 'TEK06', 4, '2020-03-12 02:35:44', '2020-04-08 02:04:43', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00025', 'TEK06', '2020-04-07 00:00:00', 'RJN02', '2020-04-08 09:04:43', 'RJN02', NULL, 'PM00239'),
(149, 'Kompresor udara MFFT', 'Filter kompresor MFFT (laboratorium resin) rusak sehingga tekanan udara yang keluar kecil.', NULL, NULL, NULL, '30H', '2020-03-12', 'TEK03', 2, '2020-03-12 02:37:30', '2020-03-12 07:34:30', NULL, 'RDR05', 4, 'RDR05', 1, 'RDR05-2003-00002', NULL, NULL, 'RDR05', '2020-03-12 14:34:30', 'RDR05', NULL, 'PM00104'),
(150, 'Pembuatan pengeras manhole Cooling Tank Reaktor 7', 'Pembuatan pengeras manhole (Pengunci Tutup)Cooling Tank reaktor 7', NULL, NULL, NULL, '30H', '2020-03-12', 'TEK06', 4, '2020-03-12 02:42:12', '2020-04-08 03:26:00', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00026', 'TEK06', '2020-04-07 00:00:00', 'RJN02', '2020-04-08 10:26:00', 'RJN02', NULL, 'PM01057'),
(151, 'Ball matic mesin filling', 'Ball matic mesin filling tidak bisa buka', 'MRP01-2003-00006-1-1583981973270316569407.jpg', NULL, NULL, '30H', '2020-03-12', 'TEK08', 0, '2020-03-12 02:59:22', '2020-03-13 03:42:58', NULL, 'MRP01', 4, 'MRP01', 1, 'MRP01-2003-00006', 'TEK08', '2020-03-12 00:00:00', 'MRP01', '2020-03-13 10:42:58', 'MRP01', NULL, 'PM00372'),
(152, 'Grounding lab. resin', 'Tolong dibuatkan grounding di laboratorium resin supaya tidak tersengat listrik.', NULL, NULL, NULL, '30H', '2020-03-12', 'TEK03', 2, '2020-03-12 03:19:23', '2020-03-13 09:13:13', NULL, 'RDR05', 4, 'RDR05', 1, 'RDR05-2003-00003', NULL, NULL, 'RDR05', '2020-03-13 16:13:13', 'RDR05', NULL, 'OTHERS-RND'),
(153, 'Pemasangan sedel dan ban bocor sepeda pancal', 'Tolong dipasangkan sadel pada sepeda warna merah RND, Sedel sudah disiapkan oleh RND . Dan perbaikan ban bocor sepeda tsb. PIC sepeda  bisa hubungi Fauzi RND \r\nTerimakasih', NULL, NULL, NULL, '30H', NULL, NULL, 0, '2020-03-12 05:41:03', '2020-03-13 02:34:48', NULL, 'RDS00', 4, 'RDS00', 1, 'RDS00-2003-00006', 'TEK08', '2020-03-12 00:00:00', 'RDS00', '2020-03-13 09:34:48', 'RDS00', NULL, 'OTHERS-RND'),
(154, 'perbaikan forklift reach truck pfl23', 'perbaikan SEAL MOTOR STERING', NULL, NULL, NULL, '30H', '2020-03-12', 'TEK08', 5, '2020-03-12 05:47:32', '2020-03-12 05:47:32', NULL, 'LOG06', 3, 'LOG06', 1, 'LOG06-2003-00001', 'TEK08', '2020-04-01 00:00:00', NULL, NULL, 'LOG06', NULL, 'PK00263'),
(155, 'Perbaikan pilo box', 'Perbaikan filo box screw hopper 8.16 (rusak)', NULL, NULL, NULL, '30H', '2020-03-12', 'TEK08', 0, '2020-03-12 05:52:40', '2020-03-12 08:00:33', NULL, 'BME01', 4, 'BME01', 1, 'BME01-2003-00011', NULL, NULL, 'BME01', '2020-03-12 15:00:33', 'BME01', NULL, 'PM01388'),
(156, 'forklift 17', 'ganti oli mesin forklift 17', NULL, NULL, NULL, '30H', '2020-03-12', 'TEK08', 5, '2020-03-12 06:00:00', '2020-03-17 03:16:14', NULL, 'LOG01', 4, 'LOG01', 1, 'LOG01-2003-00012', 'TEK08', '2020-03-12 00:00:00', 'LOG01', '2020-03-17 10:16:14', 'LOG01', NULL, 'PK00437'),
(157, 'Perbaikan pipa transfer ZK019 [bocor]', 'Harap diperbaiki pipa transfer ZK019 dr storage tank ke prod Rinjani.\r\nNB: Lokasi di area timbangan dalam prod Rinjani\r\nCP: Dimas/Supono', NULL, NULL, NULL, '30H', '2020-03-12', 'TEK08', 0, '2020-03-12 06:05:01', '2020-03-12 07:34:48', NULL, 'PPC01', 4, 'PPC01', 1, 'PPC01-2003-00012', 'TEK08', '2020-03-12 00:00:00', 'PPC01', '2020-03-12 14:34:48', 'PPC01', NULL, 'PI00049'),
(158, 'Perbaikan indikator tekanan mesin grinding cenomix nomor 4 karna bocor.', 'Indikator tekanan mesin bocor.', 'IJN01-2003-00008-1-IMG20200312131303.jpg', NULL, NULL, '30H', '2020-03-12', 'TEK08', 0, '2020-03-12 06:16:16', '2020-03-13 09:15:07', NULL, 'IJN01', 4, 'IJN01', 1, 'IJN01-2003-00008', 'TEK08', '2020-03-13 00:00:00', 'IJN01', '2020-03-13 16:15:07', 'IJN01', NULL, 'PM01622'),
(159, 'Perbaikan pipa transfer ZK033 [bocor]', 'Harap diperbaiki kebocoran pipa transfer ZK033 dari storage tank ke produksi Rinjani.\r\nNB: Lokasi bocor di area timbang prod Rinjani.\r\nC/P: Dimas/Supono', NULL, NULL, NULL, '30H', NULL, NULL, 0, '2020-03-12 07:09:52', '2020-03-13 07:07:10', NULL, 'PPC01', 4, 'PPC01', 1, 'PPC01-2003-00013', 'TEK08', '2020-03-12 00:00:00', 'PPC01', '2020-03-13 14:07:10', 'PPC01', NULL, 'PM02210'),
(160, 'Modifikasi penutup kotak saringan di weighing storage kk 257 area proses jalur pompa transfer no 11.', 'Untuk mempermudah saat pngecekan dan cleaning saringan .', 'IJN01-2003-00009-1-IMG_20200312_142131.jpg', NULL, NULL, '30H', '2020-03-12', 'TEK06', 4, '2020-03-12 07:30:45', '2020-03-18 03:21:00', NULL, 'IJN01', 4, 'IJN01', 1, 'IJN01-2003-00009', NULL, NULL, 'IJN01', '2020-03-18 10:21:00', 'IJN01', NULL, 'PM00299'),
(161, 'Perbaikan AC Office Ijen', 'Panas', NULL, NULL, NULL, '30H', '2020-03-12', 'TEK03', 2, '2020-03-12 07:42:04', '2020-03-13 06:20:38', NULL, 'IJN01', 4, 'IJN01', 1, 'IJN01-2003-00010', NULL, NULL, 'IJN01', '2020-03-13 13:20:38', 'IJN01', NULL, 'MV00094'),
(162, 'Perbaikan service monting area packing ijen sebelah timur.', 'Service monting ngetrip', NULL, NULL, NULL, '30H', '2020-03-13', 'TEK07', 1, '2020-03-13 01:05:11', '2020-03-13 02:57:35', NULL, 'IJN01', 4, 'IJN01', 1, 'IJN01-2003-00011', NULL, NULL, 'IJN01', '2020-03-13 09:57:35', 'IJN01', NULL, 'OTHERS-FACTORY'),
(163, 'BREAKER RUSAK', 'BREAKER MATI', NULL, NULL, NULL, '30H', '2020-03-13', 'TEK07', 1, '2020-03-13 03:58:41', '2020-03-23 01:00:28', NULL, 'MRP01', 4, 'MRP01', 1, 'MRP01-2003-00007', 'TEK07', '2020-03-19 00:00:00', 'MRP01', '2020-03-23 08:00:28', 'MRP01', NULL, 'PM00121'),
(164, 'Perbaikan pipa outlet tangki penimbangan kk252', 'Perbaikan pipa outlet tangki penimbangan kk252', NULL, NULL, NULL, '30H', '2020-03-13', 'TEK08', 0, '2020-03-13 06:20:19', '2020-03-17 05:58:23', NULL, 'BME01', 4, 'BME01', 1, 'BME01-2003-00012', 'TEK08', '2020-03-17 00:00:00', 'BME01', '2020-03-17 12:58:23', 'BME01', NULL, 'OTHERS-FACTORY'),
(165, 'Perbaikan talang gudang tinplate', 'Harap diperbaiki talang gudang tinplate,yg tersenggol forklift prod Kerinci.(bocor)\r\n\r\nC/P: Pradico/Agus.P', NULL, NULL, NULL, '90H', '2020-03-16', 'TEK09', 3, '2020-03-13 09:24:08', '2020-03-13 09:24:08', NULL, 'PPC01', 2, 'PPC01', 1, 'PPC01-2003-00014', NULL, NULL, NULL, NULL, 'PPC01', NULL, 'PB00006'),
(166, 'MIXER HSD TIDAK BISA MENYALA (URGENT)', 'MIXER TIDAK BISA MENYALA, KETIKA DINYALAKAN MATI KEMBALI\r\n\r\nTIDAK BISA PROSES PRODUKSI', NULL, NULL, NULL, '30H', '2020-03-16', 'TEK07', 1, '2020-03-16 00:50:23', '2020-03-16 00:50:23', NULL, 'MRP01', 3, 'MRP01', 1, 'MRP01-2003-00008', 'TEK07', '2020-03-19 00:00:00', NULL, NULL, 'MRP01', NULL, 'PM01137'),
(167, 'Penggantian Ban Forklift 04', 'Penggantian ban forklift no.4', NULL, NULL, NULL, '30H', '2020-03-16', 'TEK08', 5, '2020-03-16 00:55:06', '2020-03-16 03:18:46', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00027', NULL, NULL, 'RJN02', '2020-03-16 10:18:46', 'RJN02', NULL, 'PK00007'),
(168, 'Penggantian Ban Forklift 25', 'Penggantian ban depan forklift 25', NULL, NULL, NULL, '30H', '2020-03-16', 'TEK08', 5, '2020-03-16 00:56:34', '2020-03-16 03:18:30', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00028', NULL, NULL, 'RJN02', '2020-03-16 10:18:30', 'RJN02', NULL, 'PK00346'),
(169, 'PERBAIKAN LAMPU DI GUDANG MELATI', 'LAMPU MERCURY SEBELAH SELATAN GUDANG MELATI MATI', NULL, NULL, NULL, '30H', '2020-03-16', 'TEK07', 1, '2020-03-16 00:59:53', '2020-04-01 00:33:53', NULL, 'HRD12', 4, 'HRD12', 1, 'HRD12-2003-00007', 'TEK07', '2020-03-24 00:00:00', 'HRD12', '2020-04-01 07:33:53', 'HRD12', NULL, 'WV00325'),
(170, 'LAMPU KAMAR MANDI BM', 'LAMPU MERCURI DEPAN KAMAR MANDI BM MATI', NULL, NULL, NULL, '30H', '2020-03-16', 'TEK07', 1, '2020-03-16 01:01:43', '2020-04-01 00:33:42', NULL, 'HRD12', 4, 'HRD12', 1, 'HRD12-2003-00008', 'TEK07', '2020-03-19 00:00:00', 'HRD12', '2020-04-01 07:33:42', 'HRD12', NULL, 'WV00325'),
(171, 'LAMPU GUDANG EKSPEDISI', 'LAMPU GUDANG EKSPEDISI DEPAN POSISI SEBELAH SELATAN MATI', NULL, NULL, NULL, '30H', '2020-03-16', 'TEK07', 1, '2020-03-16 01:02:59', '2020-04-01 00:33:30', NULL, 'HRD12', 4, 'HRD12', 1, 'HRD12-2003-00009', 'TEK07', '2020-03-19 00:00:00', 'HRD12', '2020-04-01 07:33:30', 'HRD12', NULL, 'WV00325'),
(172, 'PERBAIKAN KAMERA CCTV', 'KAMERA CCTV DEPAN OFFICE MAU POSISINYA MAU JATUH DAN BUTUH PERBAIKAN \r\n(DUDUKAN KAMERA CCTV)', NULL, NULL, NULL, '30H', '2020-03-16', 'TEK03', 2, '2020-03-16 01:06:03', '2020-04-01 00:33:17', NULL, 'HRD12', 4, 'HRD12', 1, 'HRD12-2003-00010', 'TEK03', '2020-03-16 00:00:00', 'HRD12', '2020-04-01 07:33:17', 'HRD12', NULL, 'WV00202'),
(173, 'Perbaikan pillow block', 'Perbaikan pillow block rusak 1 unit silo no 10', NULL, NULL, NULL, '30H', '2020-03-16', 'TEK08', 0, '2020-03-16 01:50:11', '2020-03-16 05:47:08', NULL, 'BME01', 4, 'BME01', 1, 'BME01-2003-00013', NULL, NULL, 'BME01', '2020-03-16 12:47:08', 'BME01', NULL, 'PM01328'),
(174, 'Perbaikan mesin inkjet no 4', 'mesin inkjet tinta tidak mau memancar', NULL, NULL, NULL, '30H', '2020-03-16', 'TEK07', 1, '2020-03-16 02:00:57', '2020-03-19 03:55:33', NULL, 'BMS01', 4, 'BMS01', 1, 'BMS01-2003-00014', 'TEK07', '2020-03-19 00:00:00', 'BMS01', '2020-03-19 10:55:33', 'BMS01', NULL, 'PM00650'),
(175, 'MOTOR CRANE TERBAKAR', 'Mohon perbaikan crane 2 ton, motor terbakar \r\nExisting sementara menggunakan crane 3 ton untuk memindahkan bahan', NULL, NULL, NULL, '30H', '2020-03-16', 'TEK07', 1, '2020-03-16 02:50:44', '2020-03-31 05:01:25', NULL, 'MRP01', 4, 'MRP01', 1, 'MRP01-2003-00009', 'TEK07', '2020-03-19 00:00:00', 'MRP01', '2020-03-31 12:01:25', 'MRP01', NULL, 'PM01134'),
(176, 'CRANE 3 TON MASIH BELUM DAPAT DIGUNAKAN (SETELAH DISLOKASI KE CRANE 2 TON)', 'Rantai los, keadaan di produksi tidak dapat menggunakan crane\r\nMohon perbaikan', NULL, NULL, NULL, '30H', '2020-03-16', 'TEK07', 1, '2020-03-16 02:52:32', '2020-03-31 05:01:01', NULL, 'MRP01', 4, 'MRP01', 1, 'MRP01-2003-00010', 'TEK07', '2020-03-19 00:00:00', 'MRP01', '2020-03-31 12:01:01', 'MRP01', NULL, 'PM01218'),
(177, 'motor tidak menyala', 'motor tidak menyala', NULL, NULL, NULL, '30H', '2020-03-16', 'TEK07', 1, '2020-03-16 02:58:20', '2020-03-17 06:17:53', NULL, 'TGR01', 4, 'TGR01', 1, 'TGR01-2003-00007', 'TEK07', '2020-03-16 00:00:00', 'TGR01', '2020-03-17 13:17:53', 'TGR01', NULL, 'PM01086'),
(178, 'PERBAIKAN GEDUNG', 'PERBAIKAN INSTALASI LISTRIK (RUANGAN BP. SAMSUL)', NULL, NULL, NULL, '30H', '2020-03-16', 'TEK07', 1, '2020-03-16 02:58:20', '2020-04-08 06:52:19', NULL, 'LOG02', 4, 'LOG02', 1, 'LOG02-2003-00004', 'TEK07', '2020-03-17 00:00:00', 'LOG02', '2020-04-08 13:52:19', 'LOG02', NULL, 'PB00028'),
(179, 'TROLI ATAP LEPAS', 'TROLI ATAP LEPAS', NULL, NULL, NULL, '30H', '2020-03-16', 'TEK09', 3, '2020-03-16 03:00:08', '2020-03-18 03:06:22', NULL, 'TGR01', 4, 'TGR01', 1, 'TGR01-2003-00008', 'TEK09', '2020-03-17 00:00:00', 'TGR01', '2020-03-18 10:06:22', 'TGR01', NULL, 'OTHERS-FACTORY'),
(180, 'PERBAIKAN GEDUNG', 'PEMASANGAN PAGAR, PINTU KAMAR MANDI DI AREA KM GD. F, GD. L DAN GDG PRODUKSI TIDAR', NULL, NULL, NULL, '30H', '2020-03-16', 'TEK09', 3, '2020-03-16 04:05:37', '2020-03-17 04:20:49', NULL, 'LOG02', 4, 'LOG02', 1, 'LOG02-2003-00005', NULL, NULL, 'LOG02', '2020-03-17 11:20:49', 'LOG02', NULL, 'PB00034'),
(181, 'Perbaikan hidrolis mixer nomor 4 karna saat menaikkan hidrolis terbentur besi ditembok.', 'As hidrolis tidak bisa turun karna hidrolis terbentur besi tembok.', 'IJN01-2003-00012-1-IMG20200316101001.jpg', NULL, NULL, '30H', '2020-03-16', 'TEK08', 0, '2020-03-16 04:54:19', '2020-03-16 07:45:09', NULL, 'IJN01', 4, 'IJN01', 1, 'IJN01-2003-00012', NULL, NULL, 'IJN01', '2020-03-16 14:45:09', 'IJN01', NULL, 'PM01612'),
(182, 'LIFT BARANG', 'SLOT PENGUNCI PINTU LIFT PATAH, BUTUH PENGELASAN', NULL, NULL, NULL, '30H', '2020-03-16', 'TEK06', 4, '2020-03-16 05:39:10', '2020-03-17 01:58:51', NULL, 'MHM01', 4, 'MHM01', 1, 'MHM01-2003-00011', NULL, NULL, 'MHM01', '2020-03-17 08:58:51', 'MHM01', NULL, 'OTHERS-FACTORY'),
(183, 'KAMAR MANDI KARYAWAN', 'PERBAIKKAN KUNCI PINTU KAMAR MANDI / TOILET MAHAMERU', NULL, NULL, NULL, '30H', '2020-03-16', 'TEK09', 3, '2020-03-16 05:52:11', '2020-03-19 06:44:50', NULL, 'MHM01', 4, 'MHM01', 1, 'MHM01-2003-00012', NULL, NULL, 'MHM01', '2020-03-19 13:44:50', 'MHM01', NULL, 'OTHERS-FACTORY'),
(184, 'Penggantian lampu ruang ganti (locker perempuan) karna lampu mati.', 'Ganti lampu led', NULL, NULL, NULL, '30H', '2020-03-16', 'TEK07', 1, '2020-03-16 07:44:46', '2020-03-17 05:53:50', NULL, 'IJN01', 4, 'IJN01', 1, 'IJN01-2003-00013', NULL, NULL, 'IJN01', '2020-03-17 12:53:50', 'IJN01', NULL, 'PB00084'),
(185, 'Perbaikan atap bocor ruang boiler 1 dan termo oil 1', 'Atab ruang boiler bocor', NULL, NULL, NULL, '30H', '2020-03-17', 'TEK09', 3, '2020-03-17 00:57:51', '2020-03-17 00:57:51', NULL, 'RJN02', 3, 'RJN02', 1, 'RJN02-2003-00029', 'TEK09', '2020-03-18 00:00:00', NULL, NULL, 'RJN02', NULL, 'PB00064'),
(186, 'truck W 9638 NU', 'Ganti Oli Mesin + Oli Versnelling Truck W 9638 NU sopir Aris Ichwan KM 91209', 'LOG01-2003-00013-1-Maintenance.xlsx', NULL, NULL, '30H', '2020-03-17', 'TEK08', 5, '2020-03-17 00:59:18', '2020-03-17 03:15:56', NULL, 'LOG01', 4, 'LOG01', 1, 'LOG01-2003-00013', 'TEK08', '2020-03-17 00:00:00', 'LOG01', '2020-03-17 10:15:56', 'LOG01', NULL, 'SK00016'),
(187, 'perbaikan gedung gd melati', 'perbaikan tembok', NULL, NULL, NULL, '30H', '2020-03-17', 'TEK09', 3, '2020-03-17 01:00:34', '2020-03-23 00:19:04', NULL, 'LOG06', 4, 'LOG06', 1, 'LOG06-2003-00002', 'TEK09', '2020-03-18 00:00:00', 'LOG06', '2020-03-23 07:19:04', 'LOG06', NULL, 'PB00032'),
(188, 'Perbaikan Pompa mesin grinding Dynomill no 1 karna bocor', 'Oli mesin pompa rembes (bocor)', 'IJN01-2003-00014-1-IMG20200317080305.jpg', NULL, NULL, '30H', '2020-03-17', 'TEK08', 0, '2020-03-17 01:06:13', '2020-03-20 01:36:00', NULL, 'IJN01', 4, 'IJN01', 1, 'IJN01-2003-00014', 'TEK08', '2020-03-19 00:00:00', 'IJN01', '2020-03-20 08:36:00', 'IJN01', NULL, 'PM01619'),
(189, 'Perbaikan stop contact (Rusak)', 'Penggantian stop contact 1 unit', NULL, NULL, NULL, '30H', '2020-03-17', 'TEK07', 1, '2020-03-17 01:18:42', '2020-03-19 03:27:59', NULL, 'BME01', 4, 'BME01', 1, 'BME01-2003-00014', NULL, NULL, 'BME01', '2020-03-19 10:27:59', 'BME01', NULL, 'PM01369'),
(190, 'Rotary Bin 5 Tidak Jalan', 'Kalsium tidak keluar, terjadi trip di motor', NULL, NULL, NULL, '30H', '2020-03-17', 'TEK07', 1, '2020-03-17 01:56:32', '2020-03-23 00:59:54', NULL, 'MRP01', 4, 'MRP01', 1, 'MRP01-2003-00011', 'TEK07', '2020-03-19 00:00:00', 'MRP01', '2020-03-23 07:59:54', 'MRP01', NULL, 'PM01101'),
(191, 'Perbaikan pompa blagdon 3\" membran jebol', 'Perbaikan pompa blagdon 3\" mixer no 9 karena membran jebol', NULL, NULL, NULL, '30H', '2020-03-17', 'TEK08', 0, '2020-03-17 02:22:19', '2020-03-19 08:32:08', NULL, 'BME01', 4, 'BME01', 1, 'BME01-2003-00015', NULL, NULL, 'BME01', '2020-03-19 15:32:08', 'BME01', NULL, 'PM00786'),
(192, 'Forklift 33', 'ganti Oli Mesin', NULL, NULL, NULL, '30H', '2020-03-17', 'TEK08', 5, '2020-03-17 03:05:28', '2020-03-19 02:43:15', NULL, 'LOG01', 4, 'LOG01', 1, 'LOG01-2003-00014', NULL, NULL, 'LOG01', '2020-03-19 09:43:15', 'LOG01', NULL, 'PK00397'),
(193, 'Penutupan mainhole storage tank KK252 di Merapi', 'Penutupan mainhole tangki KK252 di merapi (ganti packing/seal,jika dirasa perlu)\r\n\r\nNB: Utk keperluan sehabis sanitasi.', NULL, NULL, NULL, '30H', '2020-03-17', 'TEK08', 0, '2020-03-17 03:21:27', '2020-03-17 05:30:05', NULL, 'PPC01', 4, 'PPC01', 1, 'PPC01-2003-00015', 'TEK08', '2020-03-17 00:00:00', 'PPC01', '2020-03-17 12:30:05', 'PPC01', NULL, 'PM01159'),
(194, 'Perbaikan lampu di gudang Kerinci', 'Perbaikan lampu penerangan dalam gudang Kerinci (mati).\r\n\r\nC/P: Pradico/Kustini', NULL, NULL, NULL, '30H', '2020-03-17', 'TEK07', 1, '2020-03-17 03:23:22', '2020-03-19 03:06:07', NULL, 'PPC01', 4, 'PPC01', 1, 'PPC01-2003-00016', 'TEK07', '2020-03-19 00:00:00', 'PPC01', '2020-03-19 10:06:07', 'PPC01', NULL, 'PB00007'),
(195, 'Forklift 13', 'Ganti Oli Mesin 17 Maret 2020 Forklift 13', NULL, NULL, NULL, '30H', '2020-03-17', 'TEK08', 5, '2020-03-17 03:45:59', '2020-03-18 06:17:13', NULL, 'LOG01', 4, 'LOG01', 1, 'LOG01-2003-00015', 'TEK08', '2020-03-17 00:00:00', 'LOG01', '2020-03-18 13:17:13', 'LOG01', NULL, 'PK00226'),
(196, 'Perbaikan jalur pipa tangki katalis reaktor 20', 'Jalur pipa katalis rusak', NULL, NULL, NULL, '30H', '2020-03-17', 'TEK08', 0, '2020-03-17 03:56:30', '2020-03-18 03:08:09', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00030', 'TEK08', '2020-03-17 00:00:00', 'RJN02', '2020-03-18 10:08:09', 'RJN02', NULL, 'PM02085'),
(197, 'PERBAIKAN TOMBOL CRAN', 'KETERANGAN TOMBOL RUSAK', NULL, NULL, NULL, '30H', '2020-03-17', 'TEK07', 1, '2020-03-17 04:09:33', '2020-03-26 05:25:28', NULL, 'MRP01', 4, 'MRP01', 1, 'MRP01-2003-00012', 'TEK07', '2020-03-19 00:00:00', 'MRP01', '2020-03-26 12:25:28', 'MRP01', NULL, 'PM01218'),
(198, 'PERBAIKAN GEDUNG', 'PENGGANTIAN  KUNCI PINTU KAMAR MANDI GUDANG FLAMBOYAN, LILY, TIDAR', NULL, NULL, NULL, '30H', '2020-03-17', 'TEK09', 3, '2020-03-17 04:24:48', '2020-03-17 04:24:48', NULL, 'LOG02', 2, 'LOG02', 1, 'LOG02-2003-00006', NULL, NULL, NULL, NULL, 'LOG02', NULL, 'PB00034'),
(199, 'Pemindahan Pannel', 'Pemindahan Pannel kantor mahameru ke gudang sparepart karena ruangan akan digunakan sebagai pengganti kantor yg dibongkar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-17 04:33:18', '2020-03-17 04:33:18', NULL, 'PSDJ06', 1, 'PSDJ06', 1, 'PSDJ06-2003-00003', NULL, NULL, NULL, NULL, 'PSDJ06', NULL, 'OTHERS-FACTORY'),
(200, 'Perbaikan mesin karcher', 'Selang mesin karcer bocor', NULL, NULL, NULL, '30H', '2020-03-17', 'TEK08', 0, '2020-03-17 04:33:57', '2020-04-08 07:16:19', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00031', 'TEK08', '2020-04-08 00:00:00', 'RJN02', '2020-04-08 14:16:19', 'RJN02', NULL, 'PM00755'),
(201, 'Pemindahan AC', 'Pemindahan AC dari kantor mahameru ke ruangan sebelah karena kantor akan dibongkar.', NULL, NULL, NULL, '30H', '2020-03-17', 'TEK03', 2, '2020-03-17 04:39:34', '2020-04-02 01:15:54', NULL, 'PSDJ06', 4, 'PSDJ06', 1, 'PSDJ06-2003-00004', 'TEK03', '2020-03-30 00:00:00', 'PSDJ06', '2020-04-02 08:15:54', 'PSDJ06', NULL, 'OTHERS-FACTORY'),
(202, 'HANDPALLET RUSAK NO. 04', '1. MEMPERBAIKI HANDPALLET NO. 04 \r\n2. TIDAK BISA DITURUNKAN', NULL, NULL, NULL, '30H', '2020-03-17', 'TEK08', 0, '2020-03-17 06:19:38', '2020-03-18 03:06:42', NULL, 'TGR01', 4, 'TGR01', 1, 'TGR01-2003-00009', 'TEK08', '2020-03-17 00:00:00', 'TGR01', '2020-03-18 10:06:42', 'TGR01', NULL, 'OTHERS-FACTORY'),
(203, 'PENGGANTIAN WATER JET', 'PENGGANTIAN WATER JET CANON KARENA SUDAH TIDAK LAYAK (BARANG LAMA)\r\nDIGANTI DENGAN MERK K\'A\'RCHER HD 10/25 4S\r\n2 UNIT (ACC PAK GM)', 'MRP01-2003-00013-1-IMG-20200317-WA0007.jpg', 'MRP01-2003-00013-2-IMG-20200317-WA0008.jpg', NULL, '90H', '2020-03-17', 'TEK08', 0, '2020-03-17 06:55:04', '2020-03-17 06:55:04', NULL, 'MRP01', 2, 'MRP01', 1, 'MRP01-2003-00013', NULL, NULL, NULL, NULL, 'MRP01', NULL, 'PM00526'),
(204, 'Penambahan Ventilator', 'Penambahan ventilator area produksi printing\r\n\r\nArea atas oven printing 1 dan printing 2\r\n\r\nDemikian terima kasih,', NULL, NULL, NULL, '30H', '2020-03-18', 'TEK09', 3, '2020-03-17 08:45:57', '2020-03-17 08:45:57', NULL, 'KAL07', 2, 'KAL07', 1, 'KAL07-2003-00001', NULL, NULL, NULL, NULL, 'KAL07', NULL, 'PV00018'),
(205, 'Pembuatan Rak Untuk GRC', 'Tolong dibuatkan Rak Besi untuk penempatan GRC,Desain terlampir .\r\nApabila Ada pertanyaan bisa konfirmasi dengan pak Ganief RND \r\nTerimakasih', 'RDS00-2003-00007-1-WhatsApp Image 2020-03-17 at 10.45.19.jpeg', NULL, NULL, '30H', '2020-03-18', 'TEK06', 4, '2020-03-17 10:49:42', '2020-03-27 12:13:24', NULL, 'RDS00', 4, 'RDS00', 1, 'RDS00-2003-00007', 'TEK06', '2020-03-23 00:00:00', 'RDS00', '2020-03-27 19:13:24', 'RDS00', NULL, 'OTHERS-RND'),
(206, 'Perbaikan Pintu Almari', 'Tolong Diperbaiki Beberapa Pintu Almari kayu Diruang RND terdapat kerusakan Slot kunci.sehingga pintunya tidak bisa dikunci. mohon diganti slot kunci baru\r\nTerimakasih', NULL, NULL, NULL, '30H', '2020-03-18', 'TEK09', 3, '2020-03-17 10:54:01', '2020-03-17 10:54:01', NULL, 'RDS00', 2, 'RDS00', 1, 'RDS00-2003-00008', NULL, NULL, NULL, NULL, 'RDS00', NULL, 'OTHERS-RND'),
(207, 'KUNCI TOILET RUSAK', 'TOILET NO.4 KUNCI RUSAK MOHON UNTUK DIGANTI', NULL, NULL, NULL, '30H', '2020-03-18', 'TEK09', 3, '2020-03-18 00:17:48', '2020-03-18 00:17:48', NULL, 'SMR01', 2, 'SMR01', 1, 'SMR01-2003-00016', NULL, NULL, NULL, NULL, 'SMR01', NULL, 'PB00087'),
(208, 'Timbangan Additif selisih +-10 kg', 'Perlu di Kalibrasi', 'MRP01-2003-00014-1-image.jpg', NULL, NULL, '30H', '2020-03-18', 'TEK07', 1, '2020-03-18 00:45:04', '2020-03-23 00:58:49', NULL, 'MRP01', 4, 'MRP01', 1, 'MRP01-2003-00014', 'TEK07', '2020-03-19 00:00:00', 'MRP01', '2020-03-23 07:58:49', 'MRP01', NULL, 'PM01174'),
(209, 'Mesin Grindmill no.1', 'Mohon untuk ditinggikan talang output pasta karena terlalu pendek untuk tangki kapasitas 1 ton.', NULL, NULL, NULL, '30H', '2020-03-18', 'TEK08', 0, '2020-03-18 01:14:59', '2020-03-26 06:00:41', NULL, 'SMR01', 4, 'SMR01', 1, 'SMR01-2003-00017', 'TEK08', '2020-03-26 00:00:00', 'SMR01', '2020-03-26 13:00:41', 'SMR01', NULL, 'PM00916'),
(210, 'Perbaikan talang gudang Merapi [luber]', 'Perbaikan talang di atas area storage tank gudang merapi ( luber)', NULL, NULL, NULL, '30H', '2020-03-18', 'TEK09', 3, '2020-03-18 01:38:20', '2020-03-18 01:38:20', NULL, 'PPC01', 2, 'PPC01', 1, 'PPC01-2003-00017', NULL, NULL, NULL, NULL, 'PPC01', NULL, 'PB00037'),
(211, 'SAND DRYER SYSTEM', 'MOTOR ROTARY CYCLONE RUSAK', NULL, NULL, NULL, '30H', '2020-03-18', 'TEK07', 1, '2020-03-18 02:15:22', '2020-03-19 06:44:34', NULL, 'MHM01', 4, 'MHM01', 1, 'MHM01-2003-00013', 'TEK07', '2020-03-19 00:00:00', 'MHM01', '2020-03-19 13:44:34', 'MHM01', NULL, 'OTHERS-FACTORY'),
(212, 'peninggian lantai', 'peninggian lantai dan pembuatan portal 2 sisi di area service forklift depan engineering', NULL, NULL, NULL, '90H', '2020-03-18', 'TEK09', 3, '2020-03-18 02:40:29', '2020-03-18 02:40:29', NULL, 'TEK08', 2, 'TEK08', 1, 'TEK08-2003-00001', NULL, NULL, NULL, NULL, 'TEK08', NULL, 'PB00069'),
(213, 'TEMPAT SAMPAH MAHAMERU', 'PEMINDAHAN AREA TEMPAT SAMPAH MAHAMERU (TEMPAT SAMPAH DEPAN LOKER MAHAMERU DIPIDAH KEDEPAN GEDUNG MAHAMERU)', NULL, NULL, NULL, '30H', '2020-03-18', 'TEK06', 4, '2020-03-18 02:50:03', '2020-04-07 01:11:29', NULL, 'MHM01', 4, 'MHM01', 1, 'MHM01-2003-00014', NULL, NULL, 'MHM01', '2020-04-07 08:11:29', 'MHM01', NULL, 'OTHERS-FACTORY'),
(214, 'PERBAIKAN SHAFT PADDLE MIXER TANGKI 47', 'Perbaikan shaft paddle mixer tangki 47 shaft bagian bawah bengkok', NULL, NULL, NULL, '30H', '2020-03-18', 'TEK08', 0, '2020-03-18 03:30:32', '2020-03-19 03:53:59', NULL, 'BMS01', 4, 'BMS01', 1, 'BMS01-2003-00015', 'TEK08', '2020-03-19 00:00:00', 'BMS01', '2020-03-19 10:53:59', 'BMS01', NULL, 'PM01587'),
(215, 'Perbaikan talang cor pada atap BMS (bocor)', 'sudah koordinasi dengan Pak Yono Building terdapat 3 titik yang sering bocor yang parah pada bagian talang cor', NULL, NULL, NULL, '30H', '2020-03-18', 'TEK09', 3, '2020-03-18 03:34:10', '2020-03-23 02:39:38', NULL, 'BMS01', 4, 'BMS01', 1, 'BMS01-2003-00016', NULL, NULL, 'BMS01', '2020-03-23 09:39:38', 'BMS01', NULL, 'PB00025'),
(216, 'Pembuatan penutup pada bak mesin filling nomor 2 (NoDrop Transparan)', 'Karna belum ada penutup pada bak mesin filling dan untuk menghindari masuknya bakteri.', 'IJN01-2003-00015-1-IMG20200318102244.jpg', NULL, NULL, '30H', '2020-03-18', 'TEK06', 4, '2020-03-18 03:35:35', '2020-03-20 04:15:12', NULL, 'IJN01', 4, 'IJN01', 1, 'IJN01-2003-00015', 'TEK06', '2020-03-19 00:00:00', 'IJN01', '2020-03-20 11:15:12', 'IJN01', NULL, 'PM01656'),
(217, 'Perbaikan carton sealer', 'Perbaikan carton sealer bagian bawah tidak bisa mengisolasi (tidak bisa putus)', NULL, NULL, NULL, '30H', '2020-03-18', 'TEK08', 0, '2020-03-18 04:32:15', '2020-03-18 04:56:11', NULL, 'BMS01', 4, 'BMS01', 1, 'BMS01-2003-00017', NULL, NULL, 'BMS01', '2020-03-18 11:56:11', 'BMS01', NULL, 'PM00663'),
(218, 'Forklift 27', 'perbaikkan forklift tdk bisa di starter', NULL, NULL, NULL, '30H', '2020-03-18', 'TEK08', 5, '2020-03-18 06:15:09', '2020-03-19 02:43:36', NULL, 'LOG01', 4, 'LOG01', 1, 'LOG01-2003-00016', NULL, NULL, 'LOG01', '2020-03-19 09:43:36', 'LOG01', NULL, 'PK00365'),
(219, 'perbaikan hand pallet no 3', 'Perbaikan hand pallet ketika dipakai mengangkat beban miring sebelah', NULL, NULL, NULL, '30H', '2020-03-18', 'TEK08', 0, '2020-03-18 08:12:43', '2020-03-19 08:32:20', NULL, 'BMS01', 4, 'BMS01', 1, 'BMS01-2003-00018', 'TEK08', '2020-03-19 00:00:00', 'BMS01', '2020-03-19 15:32:20', 'BMS01', NULL, 'OTHERS-FACTORY'),
(220, 'Pembuatan alat cukit pail', 'Pembuatan 5(lima) bh alat cukit pail utk keperluan gudang retur.\r\nNB: bentuk&ukuran sesuai contoh\r\nC/P: Pradico/Edi (gdg retur)', NULL, NULL, NULL, '30H', '2020-03-19', 'TEK06', 4, '2020-03-19 00:28:31', '2020-03-19 00:28:31', NULL, 'PPC01', 2, 'PPC01', 1, 'PPC01-2003-00018', NULL, NULL, NULL, NULL, 'PPC01', NULL, 'OTHERS-FACTORY'),
(221, 'Memperbaiki forklif no.42', 'mengganti oli forklif no.42(fa code pakai forklif no.41 karena nomer barcode no.42 belum ada)', NULL, NULL, NULL, '30H', '2020-03-19', 'TEK08', 5, '2020-03-19 00:42:49', '2020-03-31 05:01:53', NULL, 'MRP01', 4, 'MRP01', 1, 'MRP01-2003-00015', 'TEK08', '2020-03-20 00:00:00', 'MRP01', '2020-03-31 12:01:53', 'MRP01', NULL, 'PK00434'),
(222, 'Pemindahan tangga untuk office ijen.', 'Pemindahan tangga office ijen karna ada layout baru.', 'IJN01-2003-00016-1-IMG20200319074240.jpg', NULL, NULL, '30H', '2020-03-19', 'TEK06', 4, '2020-03-19 00:52:20', '2020-03-19 00:52:20', NULL, 'IJN01', 2, 'IJN01', 1, 'IJN01-2003-00016', NULL, NULL, NULL, NULL, 'IJN01', NULL, 'PB00016'),
(223, 'Modifikasi dan pembuatan penutup pada bak mesin filling no 1', 'Penambahan penutup pada bak filling untuk menhindari masunya bakteri', 'IJN01-2003-00017-1-IMG20200319084358.jpg', NULL, NULL, '30H', '2020-03-19', 'TEK06', 4, '2020-03-19 01:47:31', '2020-03-27 08:28:05', NULL, 'IJN01', 4, 'IJN01', 1, 'IJN01-2003-00017', 'TEK06', '2020-03-20 00:00:00', 'IJN01', '2020-03-27 15:28:05', 'IJN01', NULL, 'PM01655'),
(224, 'Forklift 01', 'Ganti Oli Mesin forklift 01 19 Mar 2020', NULL, NULL, NULL, '30H', '2020-03-19', 'TEK08', 5, '2020-03-19 02:13:50', '2020-03-20 08:05:23', NULL, 'LOG01', 4, 'LOG01', 1, 'LOG01-2003-00017', NULL, NULL, 'LOG01', '2020-03-20 15:05:23', 'LOG01', NULL, 'PK00004'),
(225, 'Forklift 26', 'ganti oli mesin forklift 26 kamis 19 maret 2020', NULL, NULL, NULL, '30H', '2020-03-19', 'TEK08', 5, '2020-03-19 02:24:21', '2020-03-24 01:16:55', NULL, 'LOG01', 4, 'LOG01', 1, 'LOG01-2003-00018', NULL, NULL, 'LOG01', '2020-03-24 08:16:55', 'LOG01', NULL, 'PK00003'),
(226, 'Forklift 42', 'ganti oli mesin forklift no 42 kamis, 19 maret 2020', NULL, NULL, NULL, '30H', '2020-03-19', 'TEK08', 5, '2020-03-19 02:28:31', '2020-03-27 01:05:10', NULL, 'LOG01', 4, 'LOG01', 1, 'LOG01-2003-00019', 'TEK08', '2020-03-20 00:00:00', 'LOG01', '2020-03-27 08:05:10', 'LOG01', NULL, 'PK00405'),
(227, 'truck nissan W 9928 NS', 'ganti oli mesin truck nissan W 9928 NS, km 285625, kamis 19 Maret 2020.', NULL, NULL, NULL, '30H', '2020-03-19', 'TEK08', 5, '2020-03-19 02:37:50', '2020-03-27 01:05:25', NULL, 'LOG01', 4, 'LOG01', 1, 'LOG01-2003-00020', 'TEK08', '2020-03-26 00:00:00', 'LOG01', '2020-03-27 08:05:25', 'LOG01', NULL, 'PK00256'),
(228, 'Perbaikan pompa blagdon no 15', 'Pompa tidak bisa nyedot.', 'IJN01-2003-00018-1-IMG20200319093134.jpg', NULL, NULL, '30H', '2020-03-19', 'TEK08', 0, '2020-03-19 02:38:00', '2020-03-19 03:57:14', NULL, 'IJN01', 4, 'IJN01', 1, 'IJN01-2003-00018', NULL, NULL, 'IJN01', '2020-03-19 10:57:14', 'IJN01', NULL, 'PM00325'),
(229, 'Forklift 20', 'Ganti Oli Mesin forklift 20 , Kamis 19 Mar 2020', NULL, NULL, NULL, '30H', '2020-03-19', 'TEK08', 5, '2020-03-19 02:53:00', '2020-03-27 01:05:39', NULL, 'LOG01', 4, 'LOG01', 1, 'LOG01-2003-00021', 'TEK08', '2020-03-26 00:00:00', 'LOG01', '2020-03-27 08:05:39', 'LOG01', NULL, 'PK00327'),
(230, 'MESIN FOOTSEALER NO 4', 'ELEMEN PEMANAS MESIN FOOTSEALER TIDAK BISA MATI,', NULL, NULL, NULL, '30H', '2020-03-19', 'TEK07', 1, '2020-03-19 03:41:50', '2020-04-03 08:40:11', NULL, 'MHM01', 4, 'MHM01', 1, 'MHM01-2003-00015', NULL, NULL, 'MHM01', '2020-04-03 15:40:11', 'MHM01', NULL, 'OTHERS-FACTORY'),
(231, 'Perbaikan mixer ganda nonsag no 1 (nonsag hardener) karna suara mixer kasar', 'Mixer Not Ok', 'IJN01-2003-00019-1-1584590758169436525154.jpg', NULL, NULL, '30H', '2020-03-19', 'TEK08', 0, '2020-03-19 04:05:19', '2020-03-24 01:08:05', NULL, 'IJN01', 4, 'IJN01', 1, 'IJN01-2003-00019', NULL, NULL, 'IJN01', '2020-03-24 08:08:05', 'IJN01', NULL, 'PM00237'),
(232, 'Perbaikan contactor cooling tower 05', 'Perbaikan contactor cooling tower 05', NULL, NULL, NULL, '30H', '2020-03-19', 'TEK03', 2, '2020-03-19 04:09:31', '2020-03-20 06:35:34', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00032', NULL, NULL, 'RJN02', '2020-03-20 13:35:34', 'RJN02', NULL, 'PM02136'),
(233, 'Perbaikan valve cooling atas reaktor 22', 'Valve cooling atas rraktor 22bocor', NULL, NULL, NULL, '30H', '2020-03-19', 'TEK08', 0, '2020-03-19 04:26:05', '2020-03-19 08:46:08', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00033', NULL, NULL, 'RJN02', '2020-03-19 15:46:08', 'RJN02', NULL, 'PM02324'),
(234, 'MIXER MINI ORDER', '1. MEMBETULKAN UJUNG MIXER YANG BENGKONG.\r\n2. MEMBUAT 2 BUAH DUPLIKAT MIXER YANG SAMA (1 BUAH UKURAN SAMA, 1 BUAH UKURAN TINGGI 40CM).\r\nPIC : YATMOKO MINI ORDER', NULL, NULL, NULL, '30H', '2020-03-19', 'TEK08', 0, '2020-03-19 07:10:06', '2020-03-24 03:44:26', NULL, 'TGR01', 4, 'TGR01', 1, 'TGR01-2003-00010', 'TEK08', '2020-03-20 00:00:00', 'TGR01', '2020-03-24 10:44:26', 'TGR01', NULL, 'OTHERS-FACTORY'),
(235, 'SCREW 1203', 'RANTAI MOTOR SCREW 1203 BTUH PERBAIKKAN, KENDOR', NULL, NULL, NULL, '30H', '2020-03-19', 'TEK08', 0, '2020-03-19 07:13:41', '2020-03-20 09:22:25', NULL, 'MHM01', 4, 'MHM01', 1, 'MHM01-2003-00016', 'TEK08', '2020-03-19 00:00:00', 'MHM01', '2020-03-20 16:22:25', 'MHM01', NULL, 'OTHERS-FACTORY'),
(236, 'MESIN PACKER JETPACK 12', 'SPOUT 2 MESIN JETPACK 12 MACET', NULL, NULL, NULL, '30H', '2020-03-19', 'TEK08', 0, '2020-03-19 07:23:21', '2020-03-20 00:29:50', NULL, 'MHM01', 4, 'MHM01', 1, 'MHM01-2003-00017', NULL, NULL, 'MHM01', '2020-03-20 07:29:50', 'MHM01', NULL, 'OTHERS-FACTORY'),
(237, 'Perbaikan pompa pendingin nomor 1', 'Karet Kopling Rusak', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-19 08:18:11', '2020-03-19 08:46:26', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00034', NULL, NULL, 'RJN02', '2020-03-19 15:46:26', 'RJN02', NULL, 'PM01667'),
(238, 'Mixer No. 03 Tengger', 'Kecepatan mixer tidak dapat naik dan turun.', NULL, NULL, NULL, '30H', '2020-03-20', 'TEK07', 1, '2020-03-19 23:58:24', '2020-03-24 03:44:43', NULL, 'TGR01', 4, 'TGR01', 1, 'TGR01-2003-00011', 'TEK07', '2020-03-24 00:00:00', 'TGR01', '2020-03-24 10:44:43', 'TGR01', NULL, 'PM00630'),
(239, 'MESIN AUGER 11', 'BUTTERFLY VALVE AUGER TIDAK BISA OPEN CLOSE.... DEFAULT OPEN TERUS', NULL, NULL, NULL, '30H', '2020-03-20', 'TEK08', 0, '2020-03-20 00:31:44', '2020-03-23 02:13:59', NULL, 'MHM01', 4, 'MHM01', 1, 'MHM01-2003-00018', NULL, NULL, 'MHM01', '2020-03-23 09:13:59', 'MHM01', NULL, 'OTHERS-FACTORY'),
(240, 'PERBAIKAN LAMPU TAMAN', 'LAMPU TAMAN SEBELAH SELATAN MATI SECARA SELURUH', NULL, NULL, NULL, '30H', '2020-03-20', 'TEK07', 1, '2020-03-20 00:47:47', '2020-04-01 00:33:04', NULL, 'HRD12', 4, 'HRD12', 1, 'HRD12-2003-00011', 'TEK07', '2020-03-27 08:01:56', 'HRD12', '2020-04-01 07:33:04', 'HRD12', NULL, 'WV00325'),
(241, 'Perbaikan hand pallet BMS 05', 'Perbaikan hand pallet, miring ketika digunakan untuk mengangkat beban', NULL, NULL, NULL, '30H', '2020-03-20', 'TEK08', 0, '2020-03-20 01:50:18', '2020-03-24 07:08:08', NULL, 'BMS01', 4, 'BMS01', 1, 'BMS01-2003-00019', 'TEK08', '2020-03-20 00:00:00', 'BMS01', '2020-03-24 14:08:08', 'BMS01', NULL, 'OTHERS-FACTORY'),
(242, 'Blower Rusak', 'Kerusakan tidak bisa menyala', 'MRP01-2003-00016-1-image.jpg', NULL, NULL, '30H', '2020-03-20', 'TEK07', 1, '2020-03-20 03:17:11', '2020-03-24 03:17:09', NULL, 'MRP01', 4, 'MRP01', 1, 'MRP01-2003-00016', 'TEK07', '2020-03-24 00:00:00', 'MRP01', '2020-03-24 10:17:09', 'MRP01', NULL, 'PM00133'),
(243, 'PIPA PENUTUP OTOMATIS BOCOR', 'PIPA PENUTUP OTOMATIS DIDALAM TANDON AIR KAMAR MANDI DEPAN POS SECURITY MENGALAMI KEBOCORAN', NULL, NULL, NULL, '30H', '2020-03-20', 'TEK03', 2, '2020-03-20 03:20:59', '2020-04-01 00:32:36', NULL, 'HRD12', 4, 'HRD12', 1, 'HRD12-2003-00012', 'TEK03', '2020-03-27 00:00:00', 'HRD12', '2020-04-01 07:32:36', 'HRD12', NULL, 'OTHERS-RND'),
(244, 'Mesin Lifting Kaleng', 'Mohon dibuatkan untuk wadah layer kaleng mesin lifting dengan ukuran Panjang x Lebar x Tinggi = 120 x 20 x 120 cm. Diberi roda yang dapat di kunci', NULL, NULL, NULL, '30H', '2020-03-20', 'TEK06', 4, '2020-03-20 03:39:32', '2020-04-01 03:17:06', NULL, 'SMR01', 4, 'SMR01', 1, 'SMR01-2003-00018', 'TEK06', '2020-03-30 00:00:00', 'SMR01', '2020-04-01 10:17:06', 'SMR01', NULL, 'OTHERS-FACTORY'),
(245, 'Tangki Moving 1 Ton', 'Mohon dibuatkan saringan untuk tangki premix. Ukuran kotak saring 60x60 cm dan ukuran panjang handle saringan atas 40cm dan bawah 40cm', NULL, NULL, NULL, '30H', '2020-03-20', 'TEK08', 0, '2020-03-20 03:47:34', '2020-03-24 03:53:57', NULL, 'SMR01', 4, 'SMR01', 1, 'SMR01-2003-00019', 'TEK08', '2020-03-23 00:00:00', 'SMR01', '2020-03-24 10:53:57', 'SMR01', NULL, 'OTHERS-FACTORY'),
(246, 'PEMBUATAN NEPEL SELANG', '1. MEMBUAT NEPEL SELANG UNTUK MENIUP GIL9950', NULL, NULL, NULL, '30H', '2020-03-20', 'TEK08', 0, '2020-03-20 03:57:20', '2020-03-24 03:44:59', NULL, 'TGR01', 4, 'TGR01', 1, 'TGR01-2003-00012', 'TEK08', '2020-03-20 00:00:00', 'TGR01', '2020-03-24 10:44:59', 'TGR01', NULL, 'OTHERS-FACTORY'),
(247, 'Tangki Tinting 2 ton', 'Mohon dibuatkan saringan untuk pasta ukuran saringan PxL, 60x60 cm. Panjang handle saringan bagian atas 50cm dan bawah 50cm', NULL, NULL, NULL, '30H', '2020-03-20', 'TEK08', 0, '2020-03-20 04:05:05', '2020-03-24 03:54:28', NULL, 'SMR01', 4, 'SMR01', 1, 'SMR01-2003-00020', 'TEK08', '2020-03-23 00:00:00', 'SMR01', '2020-03-24 10:54:28', 'SMR01', NULL, 'PM00979'),
(248, 'Chiller Frigo 01', 'Pembuatan baru ducting chiller dikarenakan waktu cleaning debu masuk ke dalam area proses', NULL, NULL, NULL, '30H', '2020-03-20', 'TEK06', 4, '2020-03-20 04:16:52', '2020-03-20 04:16:52', NULL, 'PSDJ06', 2, 'PSDJ06', 1, 'PSDJ06-2003-00005', NULL, NULL, NULL, NULL, 'PSDJ06', NULL, 'PM01525'),
(249, 'Chiller Frigo 01', 'Perbaikan chiller 01 dikarenakan indikator temperatur yg mencapai 20 derajat', NULL, NULL, NULL, '30H', '2020-03-20', 'TEK03', 2, '2020-03-20 04:21:05', '2020-03-20 04:21:05', NULL, 'PSDJ06', 2, 'PSDJ06', 1, 'PSDJ06-2003-00006', NULL, NULL, NULL, NULL, 'PSDJ06', NULL, 'PM01525'),
(250, 'Mesin Filling 1 liter', 'Sensor Rusak', NULL, NULL, NULL, '30H', '2020-03-20', 'TEK07', 1, '2020-03-20 06:39:14', '2020-03-24 01:23:52', NULL, 'TDR01', 4, 'TDR01', 1, 'TDR01-2003-00008', 'TEK07', '2020-03-24 00:00:00', 'TDR01', '2020-03-24 08:23:52', 'TDR01', NULL, 'PM01062'),
(251, 'Modifikasi baling2 mixer grinding dynomill no 1 dengan ukuran yg lebih besar. (30x8 cm)', 'Modifikasi baling2 mixer agar bisa digunakan untuk tangki kapasitas 1 ton', 'IJN01-2003-00020-1-IMG20200320141123.jpg', NULL, NULL, '30H', '2020-03-20', 'TEK08', 0, '2020-03-20 07:15:25', '2020-03-23 07:50:07', NULL, 'IJN01', 4, 'IJN01', 1, 'IJN01-2003-00020', NULL, NULL, 'IJN01', '2020-03-23 14:50:07', 'IJN01', NULL, 'PM01619'),
(252, 'Forklift 12', 'Perbaikkan kopling bawah rusak , gigi vernelling tdk bisa di masukkan, forklift 12', NULL, NULL, NULL, '30H', '2020-03-20', 'TEK08', 5, '2020-03-20 08:04:40', '2020-03-27 01:11:43', NULL, 'LOG01', 4, 'LOG01', 1, 'LOG01-2003-00022', 'TEK08', '2020-03-26 00:00:00', 'LOG01', '2020-03-27 08:11:43', 'LOG01', NULL, 'PK00076'),
(253, 'SCREEN SEIVING SAND DRYER', 'AYAKAN LEPAS', NULL, NULL, NULL, '30H', '2020-03-24', 'TEK08', 0, '2020-03-20 09:23:36', '2020-03-24 05:05:19', NULL, 'MHM01', 4, 'MHM01', 1, 'MHM01-2003-00019', 'TEK08', '2020-03-23 00:00:00', 'MHM01', '2020-03-24 12:05:19', 'MHM01', NULL, 'OTHERS-FACTORY'),
(254, 'Pemindahan AC', 'Pemindahan AC ruang kantor produksi mortar', NULL, NULL, NULL, '30H', '2020-03-24', 'TEK03', 2, '2020-03-23 00:22:01', '2020-04-02 01:16:55', NULL, 'PSDJ06', 4, 'PSDJ06', 1, 'PSDJ06-2003-00007', 'TEK03', '2020-03-30 00:00:00', 'PSDJ06', '2020-04-02 08:16:55', 'PSDJ06', NULL, 'OTHERS-FACTORY'),
(255, 'TAP SPRAY BOCOR', 'MEMPERBAIKI TAP SPRAY BOCOR', NULL, NULL, NULL, '30H', '2020-03-24', 'TEK08', 0, '2020-03-23 00:52:10', '2020-03-24 06:01:51', NULL, 'TGR01', 4, 'TGR01', 1, 'TGR01-2003-00013', 'TEK08', '2020-03-24 00:00:00', 'TGR01', '2020-03-24 13:01:51', 'TGR01', NULL, 'PM01067'),
(256, 'JALUR BIN 5 BUNTU', 'Bin 4 kalsium habis, sehingga harus ambil dari bin 5, Sedangkan bin 5 buntu', NULL, NULL, NULL, '30H', '2020-03-24', 'TEK08', 0, '2020-03-23 00:57:33', '2020-03-26 04:03:51', NULL, 'MRP01', 4, 'MRP01', 1, 'MRP01-2003-00017', 'TEK08', '2020-03-24 00:00:00', 'MRP01', '2020-03-26 11:03:51', 'MRP01', NULL, 'PM01136'),
(257, 'SUARA MOTOR AIR RUSAK', 'SUARA MOTOR AIR BERBUNYI KERAS', NULL, NULL, NULL, '30H', '2020-03-24', 'TEK08', 0, '2020-03-23 01:29:51', '2020-03-26 06:48:54', NULL, 'MRP01', 4, 'MRP01', 1, 'MRP01-2003-00018', 'TEK08', '2020-03-26 00:00:00', 'MRP01', '2020-03-26 13:48:54', 'MRP01', NULL, 'PM01193'),
(258, 'MESIN AUGER 11', 'AS AUGER ANJLOK', NULL, NULL, NULL, '30H', '2020-03-24', 'TEK08', 0, '2020-03-23 02:14:51', '2020-03-27 04:15:47', NULL, 'MHM01', 4, 'MHM01', 1, 'MHM01-2003-00020', NULL, NULL, 'MHM01', '2020-03-27 11:15:47', 'MHM01', NULL, 'OTHERS-FACTORY'),
(259, 'Perbaikan pompa mesin grinding cenomix no 3 karna rusak.', 'Minta ganti pompa baru.\r\nPompa ada di Bms.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-23 02:30:19', '2020-03-23 07:51:13', NULL, 'IJN01', 4, 'IJN01', 1, 'IJN01-2003-00021', NULL, NULL, 'IJN01', '2020-03-23 14:51:13', 'IJN01', NULL, 'PM01621'),
(260, 'MESIN INKJET PRINT ALPHAJET RUSAK', 'TINTA TIDAK BISA KELUAR', NULL, NULL, NULL, '30H', '2020-03-24', 'TEK07', 1, '2020-03-23 03:02:19', '2020-03-27 17:24:15', NULL, 'TGR01', 4, 'TGR01', 1, 'TGR01-2003-00014', 'TEK07', '2020-03-24 00:00:00', 'TGR01', '2020-03-28 00:24:15', 'TGR01', NULL, 'PM00125'),
(261, 'Pembuatan stop kontak baru', 'Tolong dibuatkan Stopkontak baru isi 6 lubang untuk komputer di Lab RND . Tolong dibantu segera \r\nAsap\r\nuntuk detail lokasi pemasangan bisa koordinasi dengan Indah \r\nTerimakasih', NULL, NULL, NULL, '30H', '2020-03-24', 'TEK07', 1, '2020-03-23 04:48:26', '2020-03-24 01:32:29', NULL, 'RDS00', 4, 'RDS00', 1, 'RDS00-2003-00009', NULL, NULL, 'RDS00', '2020-03-24 08:32:29', 'RDS00', NULL, 'OTHERS-RND'),
(262, 'Perbaikan Pompa Sigma Reaktor 1', 'Penggantian Remes Pompa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-23 05:42:49', '2020-03-23 05:54:00', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00035', NULL, NULL, 'RJN02', '2020-03-23 12:54:00', 'RJN02', NULL, 'PM02050'),
(263, 'HANDPALET NO.3', 'HANDPALET NO.3 MIRING', NULL, NULL, NULL, '30H', '2020-03-24', 'TEK08', 0, '2020-03-23 06:28:58', '2020-03-24 03:54:50', NULL, 'SMR01', 4, 'SMR01', 1, 'SMR01-2003-00021', 'TEK08', '2020-03-24 00:00:00', 'SMR01', '2020-03-24 10:54:50', 'SMR01', NULL, 'OTHERS-FACTORY'),
(264, 'perbaikan forklift reach truck pfl24', 'perbaikan sabuk pengaman boom hidrolis', NULL, NULL, NULL, '30H', '2020-03-24', 'TEK08', 5, '2020-03-23 06:49:16', '2020-03-26 02:56:55', NULL, 'LOG06', 4, 'LOG06', 1, 'LOG06-2003-00003', NULL, NULL, 'LOG06', '2020-03-26 09:56:55', 'LOG06', NULL, 'PK00428'),
(265, 'Perbaikan pompa loading air demin Reaktor 20&21', 'Pompa loading air demin reaktor 20 & 21 rusak', NULL, NULL, NULL, '30H', '2020-03-24', 'TEK03', 2, '2020-03-23 07:40:50', '2020-03-23 07:40:50', NULL, 'RJN02', 3, 'RJN02', 1, 'RJN02-2003-00036', 'TEK03', '2020-03-23 00:00:00', NULL, NULL, 'RJN02', NULL, 'PM02231'),
(266, 'perbaikan gedung gd lily', 'perbaikan instalasi listrik (lampu mercury)', NULL, NULL, NULL, '30H', '2020-03-24', 'TEK07', 1, '2020-03-23 07:50:25', '2020-03-31 07:55:03', NULL, 'LOG06', 3, 'LOG06', 1, 'LOG06-2003-00004', 'TEK07', '2020-03-31 14:55:03', NULL, NULL, 'LOG06', NULL, 'PB00035'),
(267, 'Pemasangan Safety Sign/Rambu K3', 'Mohon dilakukan pemasangan rambu K3, berikut terlampir informasi detail model safety sign, jumlah, dan titik pemasangan rambu k3 tsb.\r\nPemasangan rambu K3 ditempatkan pada area yang mudah terlihat (max. ketinggian 3 meter) dan tidak berpotensi tertutup material (alat/bahan).', 'EHS03-2003-00001-1-Safety Sign 2020.pdf', NULL, NULL, '30H', '2020-03-24', 'TEK09', 3, '2020-03-23 08:28:15', '2020-03-23 08:28:15', NULL, 'EHS03', 2, 'EHS03', 1, 'EHS03-2003-00001', NULL, NULL, NULL, NULL, 'EHS03', NULL, 'OTHERS-FACTORY'),
(268, 'POMPA RUSAK', 'POMPA TIDAK BISA BERPUTAR', NULL, NULL, NULL, '30H', '2020-03-24', 'TEK07', 1, '2020-03-24 01:10:08', '2020-03-26 05:10:14', NULL, 'MRP01', 4, 'MRP01', 1, 'MRP01-2003-00019', 'TEK07', '2020-03-24 14:03:44', 'MRP01', '2020-03-26 12:10:14', 'MRP01', NULL, 'PM01510'),
(269, 'Forklift 28', 'ganti Oli Mesin + Oi Transmisi , Forklift 28', NULL, NULL, NULL, '30H', '2020-03-24', 'TEK08', 5, '2020-03-24 01:16:00', '2020-03-27 01:13:02', NULL, 'LOG01', 4, 'LOG01', 1, 'LOG01-2003-00023', 'TEK08', '2020-03-26 00:00:00', 'LOG01', '2020-03-27 08:13:02', 'LOG01', NULL, 'PK00365'),
(270, 'Forklift 15', 'Forklift 15 Ganti Oli Mesin', NULL, NULL, NULL, '30H', '2020-03-24', 'TEK08', 5, '2020-03-24 01:44:56', '2020-03-27 01:13:17', NULL, 'LOG01', 4, 'LOG01', 1, 'LOG01-2003-00024', 'TEK08', '2020-03-26 00:00:00', 'LOG01', '2020-03-27 08:13:17', 'LOG01', NULL, 'PK00076'),
(271, 'Perbaikan mesin filling no 8 (2x200 cc) karna rusak.', 'Ballvalve aus.\r\nBodi mesin ada yg patah dan bengkok.', 'IJN01-2003-00022-1-IMG20200324084757.jpg', NULL, NULL, '30H', '2020-03-24', 'TEK08', 0, '2020-03-24 02:09:39', '2020-03-24 06:58:31', NULL, 'IJN01', 4, 'IJN01', 1, 'IJN01-2003-00022', NULL, NULL, 'IJN01', '2020-03-24 13:58:31', 'IJN01', NULL, 'PM01662'),
(272, 'Pembongkaran tutup reaktor 19', 'Pembongkaran tutup reaktor 19\r\n(Mngr minta pembongkaran kamis pagi)', NULL, NULL, NULL, '30H', '2020-03-24', 'TEK08', 0, '2020-03-24 02:31:27', '2020-03-26 07:56:27', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00037', NULL, NULL, 'RJN02', '2020-03-26 14:56:27', 'RJN02', NULL, 'PM02153'),
(273, 'perbaikan pompa zigma', 'mesin pompa zigma macet', NULL, NULL, NULL, '30H', '2020-03-24', 'TEK08', 0, '2020-03-24 03:06:57', '2020-03-26 06:09:57', NULL, 'BMS01', 4, 'BMS01', 1, 'BMS01-2003-00020', 'TEK08', '2020-03-26 00:00:00', 'BMS01', '2020-03-26 13:09:57', 'BMS01', NULL, 'PM01589'),
(274, 'pompa bahan baku rusak', 'pompa matin', NULL, NULL, NULL, '30H', NULL, NULL, 0, '2020-03-24 03:16:45', '2020-03-26 05:10:01', NULL, 'MRP01', 4, 'MRP01', 1, 'MRP01-2003-00020', 'TEK08', '2020-03-26 00:00:00', 'MRP01', '2020-03-26 12:10:01', 'MRP01', NULL, 'PM01193'),
(275, 'Perbaikan pintu mesin oven karna rusak', 'Engsel pintu rusak (aus)', 'IJN01-2003-00023-1-IMG20200324111958.jpg', NULL, NULL, '30H', '2020-03-24', 'TEK08', 0, '2020-03-24 04:23:30', '2020-03-26 03:50:45', NULL, 'IJN01', 4, 'IJN01', 1, 'IJN01-2003-00023', NULL, NULL, 'IJN01', '2020-03-26 10:50:45', 'IJN01', NULL, 'PM01666'),
(276, 'Pintu Oven QC Resin (Sidoarjo) Lepas', 'Pintu oven QC Resin (di Lab. QC Resin Sidoarjo) lepas. Tolong dibantu untuk dipasang kembali.', 'QCP05-2003-00001-1-WhatsApp Image 2020-03-24 at 11.36.58 AM.jpeg', NULL, NULL, '30H', '2020-03-24', 'TEK08', 0, '2020-03-24 04:36:51', '2020-03-24 08:54:43', NULL, 'QCP05', 4, 'QCP05', 1, 'QCP05-2003-00001', 'TEK08', '2020-03-24 00:00:00', 'QCP05', '2020-03-24 15:54:43', 'QCP05', NULL, 'OTHERS-FACTORY'),
(277, 'Forklift 11', 'Perbaikkan lampu forklift gudang mati\r\nforklift 11, forklift 14 dan forklift 29', NULL, NULL, NULL, '30H', '2020-03-26', 'TEK08', 5, '2020-03-24 08:57:58', '2020-03-27 01:13:30', NULL, 'LOG01', 4, 'LOG01', 1, 'LOG01-2003-00025', 'TEK08', '2020-03-26 00:00:00', 'LOG01', '2020-03-27 08:13:30', 'LOG01', NULL, 'PK00037'),
(278, 'MESIN MIXER 1', 'KARET SPON UNTUK LIST PINTU MIXER RUSAK BUTUH PENGGANTIAN', NULL, NULL, NULL, '30H', '2020-03-26', 'TEK08', 0, '2020-03-24 11:30:43', '2020-03-26 08:41:43', NULL, 'MHM01', 4, 'MHM01', 1, 'MHM01-2003-00021', NULL, NULL, 'MHM01', '2020-03-26 15:41:43', 'MHM01', NULL, 'OTHERS-FACTORY'),
(279, 'perbaikan forklift reach truck pfl35', 'perbaikan selang /nepel hidrolis ( ganti baru )', NULL, NULL, NULL, '30H', '2020-03-26', 'TEK08', 5, '2020-03-26 02:51:25', '2020-03-26 02:51:25', NULL, 'LOG06', 3, 'LOG06', 1, 'LOG06-2003-00005', 'TEK08', '2020-04-01 00:00:00', NULL, NULL, 'LOG06', NULL, 'PK00431'),
(280, 'perbaikan forklift reach truck pfl24', '1. penggantian roda belakang \r\n2. penggantian bostel\r\n3. penggantian selang hidrolis', NULL, NULL, NULL, '30H', '2020-03-26', 'TEK08', 5, '2020-03-26 02:55:27', '2020-03-26 02:55:27', NULL, 'LOG06', 2, 'LOG06', 1, 'LOG06-2003-00006', NULL, NULL, NULL, NULL, 'LOG06', NULL, 'PK00428'),
(281, 'FORKLIP NO.33', 'PERBAIKAN LAMPU DEPAN SEBELAH KANAN', NULL, NULL, NULL, '30H', '2020-03-26', 'TEK08', 5, '2020-03-26 02:59:31', '2020-03-30 06:39:26', NULL, 'SMR01', 4, 'SMR01', 1, 'SMR01-2003-00022', 'TEK08', '2020-03-30 00:00:00', 'SMR01', '2020-03-30 13:39:26', 'SMR01', NULL, 'PK00397'),
(282, 'Perbaikan Talang', 'Perbaikan paralon talang pecah di area printing dan gudang tinplate', NULL, NULL, NULL, '30H', '2020-03-26', 'TEK09', 3, '2020-03-26 04:32:45', '2020-03-26 08:56:59', NULL, 'KAL07', 4, 'KAL07', 1, 'KAL07-2003-00002', NULL, NULL, 'KAL07', '2020-03-26 15:56:59', 'KAL07', NULL, 'PB00002'),
(283, 'pompa torisima macet', 'pompa tidak biasa berputar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-26 05:18:01', '2020-03-26 05:22:15', NULL, 'MRP01', 4, 'MRP01', 1, 'MRP01-2003-00021', NULL, NULL, 'MRP01', '2020-03-26 12:22:15', 'MRP01', NULL, 'PM01193'),
(284, 'pompa torisima macet', 'pompa tidak bisa berputar', NULL, NULL, NULL, '30H', '2020-03-26', 'TEK08', 0, '2020-03-26 05:24:12', '2020-03-31 01:42:30', NULL, 'MRP01', 4, 'MRP01', 1, 'MRP01-2003-00022', NULL, NULL, 'MRP01', '2020-03-31 08:42:30', 'MRP01', NULL, 'PM01264'),
(285, 'indicator timbangan tidak bisa nyala', 'indicator eror', NULL, NULL, NULL, '30H', '2020-03-26', 'TEK07', 1, '2020-03-26 06:34:08', '2020-03-30 23:58:25', NULL, 'MRP01', 4, 'MRP01', 1, 'MRP01-2003-00023', 'TEK07', '2020-03-26 17:11:16', 'MRP01', '2020-03-31 06:58:25', 'MRP01', NULL, 'PM01266'),
(286, 'Penambahan lampu penerangan di gdg Kana', 'Penambahan lampu penerangan sebanyak 3(tiga)titik di gudang Kana.\r\nPosisi lampu bisa hubungi Pradico/Karim (gdg Kana)', NULL, NULL, NULL, '30H', '2020-03-26', 'TEK07', 1, '2020-03-26 07:20:27', '2020-03-29 07:09:37', NULL, 'PPC01', 3, 'PPC01', 1, 'PPC01-2003-00019', 'TEK07', '2020-03-29 14:09:37', NULL, NULL, 'PPC01', NULL, 'PB00042'),
(287, 'Perbaikan mixer no 7', 'Oli mixer bocor mohon diperbaiki segera', NULL, NULL, NULL, '30H', '2020-03-27', 'TEK08', 0, '2020-03-26 22:30:32', '2020-03-30 01:32:29', NULL, 'BME01', 4, 'BME01', 1, 'BME01-2003-00016', NULL, NULL, 'BME01', '2020-03-30 08:32:29', 'BME01', NULL, 'PM01433'),
(288, 'truck W 9380 NQ', 'perbaikan ganti lampu rem belakang kiri mati. truck W9380 NQ', NULL, NULL, NULL, '30H', '2020-03-27', 'TEK08', 5, '2020-03-27 01:04:39', '2020-03-27 01:04:39', NULL, 'LOG01', 3, 'LOG01', 1, 'LOG01-2003-00026', 'TEK08', '2020-03-30 00:00:00', NULL, NULL, 'LOG01', NULL, 'PK00372'),
(289, 'Perbaikan pompa bahan monomer reaktor 20', 'Pompa nyala tidak bisa nyedot', NULL, NULL, NULL, '30H', '2020-03-27', 'TEK08', 0, '2020-03-27 01:13:11', '2020-03-30 04:02:09', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00038', NULL, NULL, 'RJN02', '2020-03-30 11:02:09', 'RJN02', NULL, 'PM01160'),
(290, 'Perbaikan pompa bahan monomer reaktor 21', 'Pompa nyala tidak bisa nyedot', NULL, NULL, NULL, '30H', '2020-03-27', 'TEK08', 0, '2020-03-27 01:14:27', '2020-03-30 09:03:31', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00039', NULL, NULL, 'RJN02', '2020-03-30 16:03:31', 'RJN02', NULL, 'PM01167'),
(291, 'Perbaikan pompa kondensor reaktor 19', 'Karet kopling pecah', NULL, NULL, NULL, '30H', '2020-03-27', 'TEK08', 0, '2020-03-27 01:17:06', '2020-03-27 08:05:20', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2003-00040', 'TEK08', '2020-03-27 00:00:00', 'RJN02', '2020-03-27 15:05:20', 'RJN02', NULL, 'PM02153'),
(292, 'perbaikan kloset', 'Perbaikan kloset penampungan air bocor (WC Pak Sungkono)', 'KAL07-2003-00003-1-P_20200327_092109.jpg', 'KAL07-2003-00003-2-P_20200327_092118.jpg', NULL, '30H', '2020-03-27', 'TEK09', 3, '2020-03-27 02:27:21', '2020-04-08 08:22:46', NULL, 'KAL07', 4, 'KAL07', 1, 'KAL07-2003-00003', 'TEK09', '2020-03-27 00:00:00', 'KAL07', '2020-04-08 15:22:46', 'KAL07', NULL, 'PB00001'),
(293, 'Perbaikan Cerobong', 'Perbaikan cerobong atas printing yang bocor.\r\nMinta perbaikan vendor di karenakan menurut pak yono (teknik) tidak bisa mengerjakan,karena berada di area ketinggian.', NULL, NULL, NULL, '90H', '2020-03-27', 'TEK06', 4, '2020-03-27 02:32:11', '2020-03-27 02:32:11', NULL, 'KAL07', 2, 'KAL07', 1, 'KAL07-2003-00004', NULL, NULL, NULL, NULL, 'KAL07', NULL, 'PI00007');
INSERT INTO `ticket` (`id`, `judul`, `keterangan`, `attachment_1`, `attachment_2`, `attachment_3`, `prioritas`, `start`, `assignee`, `category_id`, `created_at`, `updated_at`, `user_jawab`, `user_modified`, `status`, `user_created`, `active`, `no_ticket`, `user_request_close`, `request_close_date`, `user_close`, `close_date`, `reldag`, `SPK`, `FACode`) VALUES
(294, 'Perbaikan trolley karna alas trolley keropos', 'Trolley keropos', 'IJN01-2003-00024-1-IMG20200327130840.jpg', NULL, NULL, '30H', '2020-03-27', 'TEK06', 4, '2020-03-27 06:21:04', '2020-03-27 08:28:46', NULL, 'IJN01', 4, 'IJN01', 1, 'IJN01-2003-00024', NULL, NULL, 'IJN01', '2020-03-27 15:28:46', 'IJN01', NULL, 'OTHERS-FACTORY'),
(295, 'Penambalan lantai bekas boring di gdg.Kana', 'Penutupan kembali lobang bekas boring test tanah di gdg Kana.\r\nC/P: Pradico', NULL, NULL, NULL, '30H', '2020-03-27', 'TEK09', 3, '2020-03-27 06:43:19', '2020-03-30 14:26:53', NULL, 'PPC01', 4, 'PPC01', 1, 'PPC01-2003-00020', 'TEK09', '2020-03-30 00:00:00', 'PPC01', '2020-03-30 21:26:53', 'PPC01', NULL, 'PB00042'),
(296, 'PERBAIKAN  CRAN', 'cran untuk angkat beban rantai crane lepas', NULL, NULL, NULL, '30H', '2020-03-27', 'TEK07', 1, '2020-03-27 06:43:55', '2020-03-27 06:43:55', NULL, 'MRP01', 2, 'MRP01', 1, 'MRP01-2003-00024', NULL, NULL, NULL, NULL, 'MRP01', NULL, 'PM01218'),
(297, 'perbaikan mixer', 'MIXER TIDAK BISA NYALA INVERTER SERING NGETRIP', NULL, NULL, NULL, '30H', '2020-03-27', 'TEK07', 1, '2020-03-27 06:46:15', '2020-03-27 06:46:15', NULL, 'MRP01', 2, 'MRP01', 1, 'MRP01-2003-00025', NULL, NULL, NULL, NULL, 'MRP01', NULL, 'PM01140'),
(298, 'Perbaikan pompa mesin grinding cenomix no 4 karna tidak bisa nyedot', 'Pompa tidak bisa nyedot. \r\nRemes bocor.', 'IJN01-2003-00025-1-IMG20200327162413.jpg', NULL, NULL, '30H', '2020-03-27', 'TEK08', 0, '2020-03-27 09:28:03', '2020-04-01 02:00:37', NULL, 'IJN01', 4, 'IJN01', 1, 'IJN01-2003-00025', NULL, NULL, 'IJN01', '2020-04-01 09:00:37', 'IJN01', NULL, 'PM01622'),
(299, 'Pembuatan instalasi fountain (wastafel 3 unit)', 'Pembuatan wastafel 3 titik\r\n1. Office engineering\r\n2. Workshop 1\r\n3. Workshop 2', NULL, NULL, NULL, '30H', '2020-03-30', 'TEK09', 3, '2020-03-30 01:31:31', '2020-03-30 01:31:31', NULL, 'TEK10', 2, 'TEK10', 1, 'TEK10-2003-00001', NULL, NULL, NULL, NULL, 'TEK10', NULL, 'OTHERS-FACTORY'),
(300, 'Forklift 05', 'Perbaikan rem minyak rem bocor forklift 05', NULL, NULL, NULL, '30H', '2020-03-30', 'TEK08', 5, '2020-03-30 02:11:15', '2020-03-30 02:11:15', NULL, 'LOG01', 3, 'LOG01', 1, 'LOG01-2003-00027', 'TEK08', '2020-04-01 00:00:00', NULL, NULL, 'LOG01', NULL, 'PK00013'),
(301, 'Perbaikan blower exhaust ijen karna mati', 'Blower mati', 'IJN01-2003-00026-1-IMG20200330091100.jpg', NULL, NULL, '30H', '2020-03-30', 'TEK07', 1, '2020-03-30 02:11:30', '2020-03-31 07:38:24', NULL, 'IJN01', 4, 'IJN01', 1, 'IJN01-2003-00026', 'TEK07', '2020-03-30 14:23:44', 'IJN01', '2020-03-31 14:38:24', 'IJN01', NULL, 'PB00016'),
(302, 'Kipas Angin QC Resin Sidoarjo Bermasalah (Bunyi Keras) - Lab QC Resin', 'Kipas angin tiba tiba bunyi keras. Biasanya tidak seperti itu.', NULL, NULL, NULL, '30H', '2020-03-30', 'TEK08', 0, '2020-03-30 03:31:11', '2020-04-01 06:02:59', NULL, 'QCP05', 4, 'QCP05', 1, 'QCP05-2003-00002', 'TEK08', '2020-04-01 00:00:00', 'QCP05', '2020-04-01 13:02:59', 'QCP05', NULL, 'OTHERS-FACTORY'),
(303, 'Rotary feeder cilo no 10 bocor dan bunyi keras', 'Perbaikan rotary feeder 1,5 hp no 10 karena bocor dan bunyi keras', NULL, NULL, NULL, '30H', '2020-03-30', 'TEK08', 0, '2020-03-30 04:26:02', '2020-03-31 01:48:43', NULL, 'BME01', 4, 'BME01', 1, 'BME01-2003-00017', NULL, NULL, 'BME01', '2020-03-31 08:48:43', 'BME01', NULL, 'PM01334'),
(304, 'Penambahan Stop kontak / service mounting pada lantai 2 prod BMS (untuk blower)', 'Penambahan stop kontak / service mounting \r\nPemanjangan kabel untuk blower (10 meter)', NULL, NULL, NULL, '30H', '2020-03-30', 'TEK07', 1, '2020-03-30 07:23:46', '2020-03-31 03:38:00', NULL, 'BMS01', 4, 'BMS01', 1, 'BMS01-2003-00021', 'TEK07', '2020-03-31 10:31:56', 'BMS01', '2020-03-31 10:38:00', 'BMS01', NULL, 'OTHERS-FACTORY'),
(305, 'BALL VALVE BOCOR', 'BALL VALVE PENGISIAN BOCOR', NULL, NULL, NULL, '30H', '2020-03-31', 'TEK08', 0, '2020-03-31 00:00:51', '2020-03-31 05:00:22', NULL, 'MRP01', 4, 'MRP01', 1, 'MRP01-2003-00026', NULL, NULL, 'MRP01', '2020-03-31 12:00:22', 'MRP01', NULL, 'PM00120'),
(306, 'POMPA MACET', 'pompa tidak bisa keluar', NULL, NULL, NULL, '30H', '2020-03-31', 'TEK08', 0, '2020-03-31 01:41:50', '2020-04-03 01:32:18', NULL, 'MRP01', 4, 'MRP01', 1, 'MRP01-2003-00027', NULL, NULL, 'MRP01', '2020-04-03 08:32:18', 'MRP01', NULL, 'PM01193'),
(307, 'membuat stop kontak mesin LAB rnd mortar', 'tolong dibuatkan stop kontak lubang 6,panjang kabel 6 meter untuk instalasi mesin Compresive\r\n\r\ndan untuk instalasi mesin UTM STOP KONTAK lubang 6 panjang kabel 6 meter\r\n\r\njadi total STOP KONTAKnya 2 buah', NULL, NULL, NULL, '30H', '2020-03-31', 'TEK07', 1, '2020-03-31 02:16:47', '2020-03-31 02:16:47', NULL, 'RDC02', 2, 'RDC02', 1, 'RDC02-2003-00002', NULL, NULL, NULL, NULL, 'RDC02', NULL, 'OTHERS-RND'),
(308, 'Forklift 32', 'ganti oli mesin forklift 32', NULL, NULL, NULL, '30H', '2020-03-31', 'TEK08', 5, '2020-03-31 02:54:35', '2020-03-31 02:54:35', NULL, 'LOG01', 3, 'LOG01', 1, 'LOG01-2003-00028', 'TEK08', '2020-04-01 00:00:00', NULL, NULL, 'LOG01', NULL, 'PK00396'),
(309, 'forklift 27', 'ganti Oli Mesin forklift 27', NULL, NULL, NULL, '30H', '2020-03-31', 'TEK08', 5, '2020-03-31 02:55:49', '2020-03-31 02:55:49', NULL, 'LOG01', 3, 'LOG01', 1, 'LOG01-2003-00029', 'TEK08', '2020-04-01 00:00:00', NULL, NULL, 'LOG01', NULL, 'PK00339'),
(310, 'Rotary feeder cilo no 09 bocor', 'Perbaikan rotary feeder no 09 karena bocor,,,', NULL, NULL, NULL, '30H', '2020-03-31', 'TEK08', 0, '2020-03-31 03:08:59', '2020-03-31 06:48:03', NULL, 'BME01', 4, 'BME01', 1, 'BME01-2003-00018', NULL, NULL, 'BME01', '2020-03-31 13:48:03', 'BME01', NULL, 'PM01333'),
(311, 'Pembuatan tutup stainless steel bak penimbangan resin', 'Pembuatan tutup stainless steel bak penimbangan resin KK252 & KK257', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-31 03:19:28', '2020-03-31 03:19:28', NULL, 'BME01', 1, 'BME01', 1, 'BME01-2003-00019', NULL, NULL, NULL, NULL, 'BME01', NULL, 'OTHERS-FACTORY'),
(312, 'FORKLIFT 07', 'PERBAIKAN KABEL KORSLETING FORK LIFT 07', NULL, NULL, NULL, '30H', '2020-03-31', 'TEK08', 5, '2020-03-31 04:27:05', '2020-04-07 01:23:06', NULL, 'LOG01', 4, 'LOG01', 1, 'LOG01-2003-00030', 'TEK08', '2020-04-01 00:00:00', 'LOG01', '2020-04-07 08:23:06', 'LOG01', NULL, 'PK00024'),
(313, 'Kamar Mandi Semeru no.5', 'Saluran pembuangan air pada kamar mandi no.5 tersumbat. Mohon untuk diperbaiki', NULL, NULL, NULL, '30H', '2020-03-31', 'TEK09', 3, '2020-03-31 05:54:16', '2020-04-01 06:39:48', NULL, 'SMR01', 4, 'SMR01', 1, 'SMR01-2003-00023', 'TEK09', '2020-04-01 00:00:00', 'SMR01', '2020-04-01 13:39:48', 'SMR01', NULL, 'PB00087'),
(314, 'FILLING CAT SPRAY NO. 01', 'FILLING CAT SPRAY BOCOR', NULL, NULL, NULL, '30H', '2020-03-31', 'TEK08', 0, '2020-03-31 06:42:06', '2020-04-01 06:33:21', NULL, 'TGR01', 4, 'TGR01', 1, 'TGR01-2003-00015', 'TEK08', '2020-04-01 00:00:00', 'TGR01', '2020-04-01 13:33:21', 'TGR01', NULL, 'PM01067'),
(315, 'Perbaikan Dek lantai 2 area reaktor 21', 'Lantai dek keropos', NULL, NULL, NULL, '30H', '2020-03-31', 'TEK06', 4, '2020-03-31 07:57:50', '2020-03-31 07:57:50', NULL, 'RJN02', 2, 'RJN02', 1, 'RJN02-2003-00041', NULL, NULL, NULL, NULL, 'RJN02', NULL, 'PB00022'),
(316, 'Perbaikan kondensor reaktor 19', 'Cup kondensor reaktor 19 bocor, butuh pengelasan', NULL, NULL, NULL, '30H', '2020-04-01', 'TEK06', 4, '2020-04-01 01:00:17', '2020-04-08 01:15:07', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2004-00001', 'TEK06', '2020-04-03 00:00:00', 'RJN02', '2020-04-08 08:15:07', 'RJN02', NULL, 'PM02153'),
(317, 'Forklift 17', 'perbaikkan forklift 17 , rem lengket tdk berfungsi.', NULL, NULL, NULL, '30H', '2020-04-01', 'TEK08', 5, '2020-04-01 01:17:22', '2020-04-02 00:52:09', NULL, 'LOG01', 4, 'LOG01', 1, 'LOG01-2004-00001', NULL, NULL, 'LOG01', '2020-04-02 07:52:09', 'LOG01', NULL, 'PK00076'),
(318, 'pemasangan stop kontak untuk auto sealer mesin filling 1kg', 'pemasangan stop kontak untuk auto sealer mesin filling 1kg No 11', NULL, NULL, NULL, '30H', '2020-04-01', 'TEK07', 1, '2020-04-01 01:41:55', '2020-04-01 03:02:15', NULL, 'BME01', 4, 'BME01', 1, 'BME01-2004-00001', NULL, NULL, 'BME01', '2020-04-01 10:02:15', 'BME01', NULL, 'PM01611'),
(319, 'Mesin Blagdon 2\"', 'Mesin Blagdon Rusak', NULL, NULL, NULL, '30H', '2020-04-01', 'TEK08', 0, '2020-04-01 02:12:19', '2020-04-01 05:56:20', NULL, 'TDR01', 4, 'TDR01', 1, 'TDR01-2004-00001', NULL, NULL, 'TDR01', '2020-04-01 12:56:20', 'TDR01', NULL, 'PM00806'),
(320, 'BIN 8 RANTAI LEPAS', 'Rantai lepas mohon perbaikan', NULL, NULL, NULL, '30H', '2020-04-01', 'TEK08', 0, '2020-04-01 02:42:06', '2020-04-02 01:36:12', NULL, 'MRP01', 4, 'MRP01', 1, 'MRP01-2004-00001', 'TEK08', '2020-04-01 00:00:00', 'MRP01', '2020-04-02 08:36:12', 'MRP01', NULL, 'OTHERS-FACTORY'),
(321, 'CONVEYOR SAND DRYER', 'KARET CONVEYOR GESER DAN RETAK-RETAK \r\nKARET RAWAN PUTUS\r\nMOHON DI PERSIAPKAN SPAREPART NYA', NULL, NULL, NULL, '30H', '2020-04-01', 'TEK08', 0, '2020-04-01 02:46:50', '2020-04-02 02:54:43', NULL, 'MHM01', 4, 'MHM01', 1, 'MHM01-2004-00001', NULL, NULL, 'MHM01', '2020-04-02 09:54:43', 'MHM01', NULL, 'OTHERS-FACTORY'),
(322, 'HANDPALET NO.7', 'tolong perbaiki hand pallet no.7, kondisi tidak bisa naik-turun dengan lancar', NULL, NULL, NULL, '30H', '2020-04-01', 'TEK08', 0, '2020-04-01 03:19:01', '2020-04-03 06:35:59', NULL, 'SMR01', 4, 'SMR01', 1, 'SMR01-2004-00001', 'TEK08', '2020-04-03 00:00:00', 'SMR01', '2020-04-03 13:35:59', 'SMR01', NULL, 'OTHERS-FACTORY'),
(323, 'Penggantian sourvice mounthing', 'Penggantian sourvice mounthing jat water/kacer milik merapi\r\nKetika ON listrik jeglek\r\ncolokan hangus/kebakar\r\nposisi alat ada di merapi', NULL, NULL, NULL, '30H', '2020-04-01', 'TEK07', 1, '2020-04-01 03:45:02', '2020-04-01 03:45:02', NULL, 'HRD12', 2, 'HRD12', 1, 'HRD12-2004-00001', NULL, NULL, NULL, NULL, 'HRD12', NULL, 'PM02321'),
(324, 'Mesin Chiller', 'Tolong perbaiki saluran pipa chiller bocor', NULL, NULL, NULL, '30H', '2020-04-01', 'TEK03', 2, '2020-04-01 06:41:23', '2020-04-08 01:31:09', NULL, 'SMR01', 4, 'SMR01', 1, 'SMR01-2004-00002', 'TEK03', '2020-04-06 00:00:00', 'SMR01', '2020-04-08 08:31:09', 'SMR01', NULL, 'PM00670'),
(325, 'load cell AWS resin tidak membaca berat secara akurat', 'Untuk KK 257 A hasil uji coba selisih penimbangan + 11kg (61 kg aktual terbaca 72kg)\r\nKK 257 B hasil uji coba selisih penimbangan +9 kg (3363kg aktual terbaca 3372kg)\r\n\r\nKK 59 hasil uji coba selisih penimbangan +8 kg\r\nKK 251 pipa transfer ikut tertimbang', NULL, NULL, NULL, '30H', '2020-04-01', 'TEK07', 1, '2020-04-01 07:28:27', '2020-04-01 07:28:27', NULL, 'MRP01', 2, 'MRP01', 1, 'MRP01-2004-00002', NULL, NULL, NULL, NULL, 'MRP01', NULL, 'PM02342'),
(326, 'Sambungan pipa lama KK252 Jebol', 'Jalur transfer yang sudah dimatikan jebol sehingga tidak bisa transfer resin ke letdown karena sambungan pipa bocor ditengah jalan', NULL, NULL, NULL, '30H', '2020-04-01', 'TEK08', 0, '2020-04-01 07:33:27', '2020-04-03 01:31:53', NULL, 'MRP01', 4, 'MRP01', 1, 'MRP01-2004-00003', NULL, NULL, 'MRP01', '2020-04-03 08:31:53', 'MRP01', NULL, 'PM01146'),
(327, 'Pompa Aro no.3', 'tolong diperbaiki membrane popa bocor', NULL, NULL, NULL, '30H', '2020-04-01', 'TEK08', 0, '2020-04-01 08:08:08', '2020-04-03 06:36:22', NULL, 'SMR01', 4, 'SMR01', 1, 'SMR01-2004-00003', 'TEK08', '2020-04-03 00:00:00', 'SMR01', '2020-04-03 13:36:22', 'SMR01', NULL, 'PM00943'),
(328, 'Perbaikan AC Bocor', 'Perbaikan AC Bocor Lab RND sebanyak 2 unit : \r\n1. Diatas freezer lab RND paint (merk Mitsubishi) \r\n2. Diatas mesin QUV lab RND Cat (merk Panasonic) \r\nMohon segera diperbaiki. Terimakasih', NULL, NULL, NULL, '30H', '2020-04-02', 'TEK03', 2, '2020-04-02 00:45:35', '2020-04-02 00:45:35', NULL, 'RDS00', 3, 'RDS00', 1, 'RDS00-2004-00001', 'TEK03', '2020-04-06 00:00:00', NULL, NULL, 'RDS00', NULL, 'PV00115'),
(329, 'Truck W 8064 NK', 'Truck W 8064 NK Km 234381 Ganti Oli Mesin + Ganti Filter', NULL, NULL, NULL, '30H', '2020-04-02', 'TEK08', 5, '2020-04-02 00:51:29', '2020-04-07 01:22:48', NULL, 'LOG01', 4, 'LOG01', 1, 'LOG01-2004-00002', NULL, NULL, 'LOG01', '2020-04-07 08:22:48', 'LOG01', NULL, 'PK00319'),
(330, 'Penggantian Indikator Temperatur', 'Indikator Temperatur In Out Chiller rusak dan sudah tidak berfungsi', 'PSDJ06-2004-00001-1-Migthymill 04.jpeg', NULL, NULL, '30H', '2020-04-02', 'TEK08', 0, '2020-04-02 01:26:21', '2020-04-06 01:01:15', NULL, 'PSDJ06', 4, 'PSDJ06', 1, 'PSDJ06-2004-00001', 'TEK08', '2020-04-03 00:00:00', 'PSDJ06', '2020-04-06 08:01:15', 'PSDJ06', NULL, 'PM01605'),
(331, 'Forklift 44', 'Ganti Oli Mesin', NULL, NULL, NULL, '30H', '2020-04-02', 'TEK08', 5, '2020-04-02 01:33:15', '2020-04-07 01:23:22', NULL, 'LOG01', 4, 'LOG01', 1, 'LOG01-2004-00003', NULL, NULL, 'LOG01', '2020-04-07 08:23:22', 'LOG01', NULL, 'PK00435'),
(332, 'Pemasangan AC', 'Pemasangan AC diruang SPV', NULL, NULL, NULL, '30H', '2020-04-02', 'TEK03', 2, '2020-04-02 01:40:03', '2020-04-02 01:40:03', NULL, 'MRP01', 2, 'MRP01', 1, 'MRP01-2004-00004', NULL, NULL, NULL, NULL, 'MRP01', NULL, 'PB00017'),
(333, 'Mixer No 6 sering Trip', 'Mixer no. 6 inverter sering trip ketika proses mixer berlangsung', NULL, NULL, NULL, '30H', '2020-04-02', 'TEK07', 1, '2020-04-02 01:56:22', '2020-04-02 01:56:22', NULL, 'PSDJ05', 2, 'PSDJ05', 1, 'PSDJ05-2004-00001', NULL, NULL, NULL, NULL, 'PSDJ05', NULL, 'PM01152'),
(334, 'Pembuatab spatula panjang (PIRIT)', 'pembuatan spatula panjang ( panjang spatula 12cm x 10cm )\r\nGagang spatula 150cm - 3 unit\r\n\r\npembuatan spatula panjang ( panjang spatula 20 x 18m )\r\nGagang spatula 300cm - 2 unit', 'MRP01-2004-00005-1-image.jpg', NULL, NULL, '30H', '2020-04-02', 'TEK06', 4, '2020-04-02 02:14:27', '2020-04-02 02:14:27', NULL, 'MRP01', 2, 'MRP01', 1, 'MRP01-2004-00005', NULL, NULL, NULL, NULL, 'MRP01', NULL, 'OTHERS-FACTORY'),
(335, 'Perbaikan Talang Air Hujan Area Bangunan Reaktor 22', 'Pipa talang lepas', NULL, NULL, NULL, '30H', '2020-04-02', 'TEK09', 3, '2020-04-02 02:14:46', '2020-04-06 01:12:03', NULL, 'RJN02', 4, 'RJN02', 1, 'RJN02-2004-00002', 'TEK09', '2020-04-06 00:00:00', 'RJN02', '2020-04-06 08:12:03', 'RJN02', NULL, 'PB00021'),
(336, 'Perbaikan roda tangki nonsag no 45 karna tangki sulit belok ketika ada beban', 'Roda not ok.', 'IJN01-2004-00001-1-IMG20200402082051.jpg', NULL, NULL, '30H', '2020-04-02', 'TEK08', 0, '2020-04-02 02:47:09', '2020-04-03 01:24:15', NULL, 'IJN01', 4, 'IJN01', 1, 'IJN01-2004-00001', NULL, NULL, 'IJN01', '2020-04-03 08:24:15', 'IJN01', NULL, 'OTHERS-FACTORY'),
(337, 'Penggantian oli mesin untuk forklif ijen nomor 3', '002445 kilometer', NULL, NULL, NULL, '30H', '2020-04-02', 'TEK08', 5, '2020-04-02 03:36:01', '2020-04-02 06:46:30', NULL, 'IJN01', 4, 'IJN01', 1, 'IJN01-2004-00002', 'TEK08', '2020-04-02 00:00:00', 'IJN01', '2020-04-02 13:46:30', 'IJN01', NULL, 'PK00025'),
(338, 'Forklift 3', 'Ganti Oli Mesin Forlift 03', NULL, NULL, NULL, '30H', '2020-04-02', 'TEK08', 5, '2020-04-02 03:39:55', '2020-04-07 01:23:38', NULL, 'LOG01', 4, 'LOG01', 1, 'LOG01-2004-00004', NULL, NULL, 'LOG01', '2020-04-07 08:23:38', 'LOG01', NULL, 'PK00025'),
(339, 'Penambahan pipa loading air demin reaktor20&21', 'Pipa sebelumnya sampai dibawah reaktor 21, dipanjangkan sampai di dekat mixer', NULL, NULL, NULL, '30H', '2020-04-02', 'TEK06', 4, '2020-04-02 06:35:56', '2020-04-02 06:35:56', NULL, 'RJN02', 2, 'RJN02', 1, 'RJN02-2004-00003', NULL, NULL, NULL, NULL, 'RJN02', NULL, 'PM02231'),
(340, 'Pembuatan Tembok', '1. 140 cm x 1200 cm = Plesteran untuk cat (polos)\r\n2. 140 cm x 6000 cm = Plesteran baru di plamir GM 220\r\n\r\nLokasi Perbaikan : Gedung AIC, lantai 5\r\n\r\nNOTE: untuk pengerjaan dapat didiskusikan dengan Bapak Supandi RnD', 'RDS00-2004-00002-1-WhatsApp Image 2020-04-02 at 14.08.37.jpeg', NULL, NULL, '30H', '2020-04-02', 'TEK09', 3, '2020-04-02 07:20:54', '2020-04-02 07:20:54', NULL, 'RDS00', 2, 'RDS00', 1, 'RDS00-2004-00002', NULL, NULL, NULL, NULL, 'RDS00', NULL, 'OTHERS-RND'),
(341, 'Mesin Filling no.5', 'Kaki conveyor tidak sama ketinggiannya, pengatur ketinggiannya tidak berfungsi', NULL, NULL, NULL, '30H', '2020-04-02', 'TEK08', 0, '2020-04-02 08:03:14', '2020-04-06 01:14:47', NULL, 'SMR01', 4, 'SMR01', 1, 'SMR01-2004-00004', 'TEK08', '2020-04-06 00:00:00', 'SMR01', '2020-04-06 08:14:47', 'SMR01', NULL, 'PM01001'),
(342, 'Mesin Filling no. 6', 'Kaki conveyor tidak sama ketinggiannya, pengatur ketinggiannya tidak berfungsi', NULL, NULL, NULL, '30H', '2020-04-02', 'TEK08', 0, '2020-04-02 08:04:10', '2020-04-06 01:15:02', NULL, 'SMR01', 4, 'SMR01', 1, 'SMR01-2004-00005', 'TEK08', '2020-04-06 00:00:00', 'SMR01', '2020-04-06 08:15:02', 'SMR01', NULL, 'PM01008'),
(343, 'Perbaikan tombol lifting kaleng (manual lifting)', 'Perbaikan tombol lifting kaleng BMS yang bagian geser rusak', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-04-02 09:05:42', '2020-04-03 02:52:14', NULL, 'BMS01', 4, 'BMS01', 1, 'BMS01-2004-00001', NULL, NULL, 'BMS01', '2020-04-03 09:52:14', 'BMS01', NULL, 'OTHERS-FACTORY'),
(344, 'truck W 9928 NS', 'truck nissan W 9928 NS muat kalsium Solikin, perbaikkan rem belakang kanan rusak minyak rem keluar master seal.', NULL, NULL, NULL, '30H', '2020-04-03', 'TEK08', 5, '2020-04-03 01:12:30', '2020-04-03 01:12:30', NULL, 'LOG01', 3, 'LOG01', 1, 'LOG01-2004-00005', 'TEK08', '2020-04-03 00:00:00', NULL, NULL, 'LOG01', NULL, 'PK00087'),
(345, 'DRUM DRYER', 'DRUM DRYER PERLU PERBAIKKAN , PLAT PELAPIS LEPAS', NULL, NULL, NULL, '30H', '2020-04-03', 'TEK06', 4, '2020-04-03 01:23:07', '2020-04-07 01:11:07', NULL, 'MHM01', 4, 'MHM01', 1, 'MHM01-2004-00002', NULL, NULL, 'MHM01', '2020-04-07 08:11:07', 'MHM01', NULL, 'OTHERS-FACTORY'),
(346, 'Forklift Reachtruck no24', 'perbaikkan hidrolis bocor forklift reachtruck gd Lily no 24.', NULL, NULL, NULL, '30H', '2020-04-03', 'TEK08', 5, '2020-04-03 01:48:10', '2020-04-03 01:48:10', NULL, 'LOG01', 3, 'LOG01', 1, 'LOG01-2004-00006', 'TEK08', '2020-04-03 00:00:00', NULL, NULL, 'LOG01', NULL, 'PK00428'),
(347, 'PRESS TUTUP RUSAK', 'BAUT PRESS AUS', NULL, NULL, NULL, '30H', '2020-04-03', 'TEK08', 0, '2020-04-03 06:38:49', '2020-04-08 03:48:51', NULL, 'MRP01', 4, 'MRP01', 1, 'MRP01-2004-00006', 'TEK08', '2020-04-08 00:00:00', 'MRP01', '2020-04-08 10:48:51', 'MRP01', NULL, 'PM01271'),
(348, 'hand pallet gudang lily', 'Perbaikan hidrolis (2 hand pallet )\r\nMengganti roda belakang (1 hand pallet)\r\ntotal 3 hand pallet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-04-03 06:41:23', '2020-04-03 06:42:26', NULL, 'LOG02', 4, 'LOG02', 1, 'LOG02-2004-00001', NULL, NULL, 'LOG02', '2020-04-03 13:42:26', 'LOG02', NULL, 'OTHERS-FACTORY'),
(349, 'Hand pallet gudang lily', 'Perbaikan Hand pallet 3 buah\r\n2 hand pallet perbaikan pompa hidrolis\r\n1 hand pallet Mengganti roda belakang', NULL, NULL, NULL, '30H', '2020-04-03', 'TEK08', 0, '2020-04-03 06:51:20', '2020-04-08 06:52:00', NULL, 'LOG02', 4, 'LOG02', 1, 'LOG02-2004-00002', 'TEK08', '2020-04-06 00:00:00', 'LOG02', '2020-04-08 13:52:00', 'LOG02', NULL, 'OTHERS-FACTORY'),
(350, 'DRUM DRYER', 'PENGELASAN BANTALAN PUTAR DRUM DRYER', NULL, NULL, NULL, '30H', '2020-04-03', 'TEK06', 4, '2020-04-03 08:20:10', '2020-04-03 08:20:10', NULL, 'MHM01', 2, 'MHM01', 1, 'MHM01-2004-00003', NULL, NULL, NULL, NULL, 'MHM01', NULL, 'OTHERS-FACTORY'),
(351, 'Penggantian roda mesin filling no 1 (woodeco)', 'Roda mesin filling rusak.', NULL, NULL, NULL, '30H', '2020-04-06', 'TEK08', 0, '2020-04-06 02:29:30', '2020-04-06 04:13:28', NULL, 'IJN01', 4, 'IJN01', 1, 'IJN01-2004-00003', 'TEK08', '2020-04-06 11:02:41', 'IJN01', '2020-04-06 11:13:28', 'IJN01', NULL, 'PM01655'),
(352, 'RODA HAND PALET NO 03 RUSAK', 'RODA HAND PALET NO 03 PECAH', NULL, NULL, NULL, '30H', '2020-04-06', 'TEK08', 0, '2020-04-06 03:39:00', '2020-04-08 03:49:05', NULL, 'MRP01', 4, 'MRP01', 1, 'MRP01-2004-00007', 'TEK08', '2020-04-08 00:00:00', 'MRP01', '2020-04-08 10:49:05', 'MRP01', NULL, 'OTHERS-FACTORY'),
(353, 'Perbaikan jam digital BMS', 'PERBAIKAN JAM DIGITAL BMS (TIDAK COCOK TERLALU CEPAT 2 MENIT AN)', NULL, NULL, NULL, '30H', '2020-04-06', 'TEK07', 1, '2020-04-06 05:38:32', '2020-04-08 00:42:46', NULL, 'BMS01', 4, 'BMS01', 1, 'BMS01-2004-00002', 'TEK07', '2020-04-07 12:15:12', 'BMS01', '2020-04-08 07:42:46', 'BMS01', NULL, 'OTHERS-FACTORY'),
(354, 'Perbaikan weighing indicator', 'Weighing indicator tangki 81 rusak tidak bisa membaca beban (massa)', NULL, NULL, NULL, '30H', '2020-04-06', 'TEK07', 1, '2020-04-06 06:09:13', '2020-04-06 06:09:13', NULL, 'BME01', 2, 'BME01', 1, 'BME01-2004-00002', NULL, NULL, NULL, NULL, 'BME01', NULL, 'PM00812'),
(355, 'Perbaikan shaft mixer 1', 'Shaft mixer bengkok putaran tidak stabil', NULL, NULL, NULL, '30H', '2020-04-06', 'TEK08', 0, '2020-04-06 06:11:35', '2020-04-06 06:11:35', NULL, 'BME01', 2, 'BME01', 1, 'BME01-2004-00003', NULL, NULL, NULL, NULL, 'BME01', NULL, 'PM01415'),
(356, 'HANDPALLET NO 05', 'RODA DEPAN PECAH', NULL, NULL, NULL, '30H', '2020-04-06', 'TEK08', 0, '2020-04-06 08:08:42', '2020-04-08 01:52:20', NULL, 'MHM01', 4, 'MHM01', 1, 'MHM01-2004-00004', NULL, NULL, 'MHM01', '2020-04-08 08:52:20', 'MHM01', NULL, 'OTHERS-FACTORY'),
(357, 'Modifikasi conveyor roll untuk packing dus', 'Modifikasi conveyor meengganti penyangga dengan baut sehingga bisa lepas pasang', NULL, NULL, NULL, '30H', '2020-04-06', 'TEK08', 0, '2020-04-06 08:27:04', '2020-04-08 00:43:16', NULL, 'BMS01', 4, 'BMS01', 1, 'BMS01-2004-00003', NULL, NULL, 'BMS01', '2020-04-08 07:43:16', 'BMS01', NULL, 'OTHERS-FACTORY'),
(358, 'truck W 8064 NK', 'truck W 8064 NK perbaikan pompa solar bocor', NULL, NULL, NULL, '30H', '2020-04-07', 'TEK08', 5, '2020-04-07 01:20:10', '2020-04-07 01:20:10', NULL, 'LOG01', 3, 'LOG01', 1, 'LOG01-2004-00007', 'TEK08', '2020-04-07 00:00:00', NULL, NULL, 'LOG01', NULL, 'PK00319'),
(359, 'forklift 02', 'ganti oli mesin forklift no 02', NULL, NULL, NULL, '30H', '2020-04-07', 'TEK08', 5, '2020-04-07 01:21:23', '2020-04-07 01:21:23', NULL, 'LOG01', 3, 'LOG01', 1, 'LOG01-2004-00008', 'TEK08', '2020-04-07 00:00:00', NULL, NULL, 'LOG01', NULL, 'PK00006'),
(360, 'forklift 39', 'Gati Oli Mesin Forklift no 39', NULL, NULL, NULL, '30H', '2020-04-07', 'TEK08', 5, '2020-04-07 01:22:24', '2020-04-07 01:22:24', NULL, 'LOG01', 3, 'LOG01', 1, 'LOG01-2004-00009', 'TEK08', '2020-04-07 00:00:00', NULL, NULL, 'LOG01', NULL, 'PK00432'),
(361, 'Perbaikan surface mountain', 'Perbaikan Surface mountain area premix leleh 1 unit', 'BME01-2004-00004-1-image.jpg', NULL, NULL, '30H', '2020-04-07', 'TEK07', 1, '2020-04-07 02:58:15', '2020-04-07 03:42:54', NULL, 'BME01', 4, 'BME01', 1, 'BME01-2004-00004', NULL, NULL, 'BME01', '2020-04-07 10:42:54', 'BME01', NULL, 'OTHERS-FACTORY'),
(362, 'BALL VALVE ASS PUTUS', 'BALL VALVE ASS PUTUS', NULL, NULL, NULL, '30H', '2020-04-07', 'TEK08', 0, '2020-04-07 05:09:08', '2020-04-08 06:54:10', NULL, 'MRP01', 4, 'MRP01', 1, 'MRP01-2004-00008', 'TEK08', '2020-04-08 00:00:00', 'MRP01', '2020-04-08 13:54:10', 'MRP01', NULL, 'PM00344'),
(363, 'INDICATOR TIMBANG EROR', 'INDICATOR TIMBANGAN SERING BANJIR', NULL, NULL, NULL, '30H', '2020-04-07', 'TEK07', 1, '2020-04-07 06:06:44', '2020-04-07 06:06:44', NULL, 'MRP01', 2, 'MRP01', 1, 'MRP01-2004-00009', NULL, NULL, NULL, NULL, 'MRP01', NULL, 'PM00372'),
(364, 'Mixer 200Hp No. 6 Pengunci PUTUS', 'Las-lasanpengunci putus, mohon bantuannya', 'MRP01-2004-00010-1-WhatsApp Image 2020-04-07 at 13.22.31.jpeg', NULL, NULL, '30H', '2020-04-07', 'TEK08', 0, '2020-04-07 06:21:55', '2020-04-07 06:21:55', NULL, 'MRP01', 2, 'MRP01', 1, 'MRP01-2004-00010', NULL, NULL, NULL, NULL, 'MRP01', NULL, 'PM00235'),
(365, 'Tutup tangki 6 (Letdown) lepas', 'engsel lepas, tidak ada penahan', NULL, NULL, NULL, '30H', '2020-04-07', 'TEK06', 4, '2020-04-07 06:26:53', '2020-04-07 06:26:53', NULL, 'MRP01', 2, 'MRP01', 1, 'MRP01-2004-00011', NULL, NULL, NULL, NULL, 'MRP01', NULL, 'OTHERS-FACTORY'),
(366, 'MEMPERBAIKI MESIN INJEK PRINT', 'PANCARAN TINTA TIDAK STABIL', NULL, NULL, NULL, '30H', '2020-04-08', 'TEK07', 1, '2020-04-08 00:04:39', '2020-04-08 00:04:39', NULL, 'MRP01', 2, 'MRP01', 1, 'MRP01-2004-00012', NULL, NULL, NULL, NULL, 'MRP01', NULL, 'PM00522'),
(367, 'Forklift 13', 'Perbaikkan Rem dan Stater mesin Forklit no 13', NULL, NULL, NULL, '30H', '2020-04-08', 'TEK08', 5, '2020-04-08 01:03:10', '2020-04-08 01:03:10', NULL, 'LOG01', 3, 'LOG01', 1, 'LOG01-2004-00010', 'TEK08', '2020-04-08 00:00:00', NULL, NULL, 'LOG01', NULL, 'PK00226'),
(368, 'Perbaikan vanble motor cooling tower 7', 'Kipas vanbelt cooling tower 7 minta ganti', NULL, NULL, NULL, '30H', '2020-04-08', 'TEK03', 2, '2020-04-08 01:14:06', '2020-04-08 01:14:06', NULL, 'RJN02', 2, 'RJN02', 1, 'RJN02-2004-00004', NULL, NULL, NULL, NULL, 'RJN02', NULL, 'PM00643'),
(369, 'Perbaikan pompa air duscollector nomor 14 karna karet kopling pompa rusak.', 'Karet pada bagian pompa rusak', 'IJN01-2004-00004-1-IMG20200408090656.jpg', NULL, NULL, '30H', '2020-04-08', 'TEK08', 0, '2020-04-08 02:08:02', '2020-04-08 06:34:20', NULL, 'IJN01', 4, 'IJN01', 1, 'IJN01-2004-00004', 'TEK08', '2020-04-08 00:00:00', 'IJN01', '2020-04-08 13:34:20', 'IJN01', NULL, 'PM01634'),
(370, 'LIFT BARANG', 'lift mancet di lantai 2\r\nposisi lift ada barangnya', NULL, NULL, NULL, '30H', '2020-04-08', 'TEK07', 1, '2020-04-08 03:53:02', '2020-04-08 03:53:02', NULL, 'MHM01', 2, 'MHM01', 1, 'MHM01-2004-00005', NULL, NULL, NULL, NULL, 'MHM01', NULL, 'OTHERS-FACTORY'),
(371, 'toa speaker', 'toa speaker tidak bisa', NULL, NULL, NULL, '30H', '2020-04-08', 'TEK07', 1, '2020-04-08 03:55:36', '2020-04-08 03:55:36', NULL, 'MHM01', 2, 'MHM01', 1, 'MHM01-2004-00006', NULL, NULL, NULL, NULL, 'MHM01', NULL, 'OTHERS-FACTORY'),
(372, 'Pemasangan sekat loading area barat Bougenville.', 'Pemasangan sekat di area loading barat gudang Bougenville utk digunakan sbg gudang bahan baku sementara Tulip.\r\n(Lengkap dg fasilitas kantor darurat)\r\n\r\nSesuai dg SPK manual tgl 08 April 2020 no:000036', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-04-08 05:00:41', '2020-04-08 05:00:41', NULL, 'PPC01', 1, 'PPC01', 1, 'PPC01-2004-00001', NULL, NULL, NULL, NULL, 'PPC01', NULL, 'OTHERS-FACTORY'),
(373, 'GANTI TOMBOL JALUR KALENG', 'GANTI TOMBOL JALUR KALENG MESIN LIFTING', NULL, NULL, NULL, '30H', '2020-04-08', 'TEK07', 1, '2020-04-08 05:31:19', '2020-04-08 05:31:19', NULL, 'SMR01', 2, 'SMR01', 1, 'SMR01-2004-00006', NULL, NULL, NULL, NULL, 'SMR01', NULL, 'OTHERS-FACTORY'),
(374, 'Perbaikan atap bocor kantor produski', 'Bagian bocor nya di ujung atasnya tempat bu Sajum', NULL, NULL, NULL, '30H', '2020-04-08', 'TEK09', 3, '2020-04-08 06:07:32', '2020-04-08 06:07:32', NULL, 'PSDJ06', 2, 'PSDJ06', 1, 'PSDJ06-2004-00002', NULL, NULL, NULL, NULL, 'PSDJ06', NULL, 'PB00009'),
(375, 'Perbaikan lampu area packing BME', 'Perbaikan lampu area packing 5 unit  (Mati)', NULL, NULL, NULL, '30H', '2020-04-08', 'TEK07', 1, '2020-04-08 07:34:24', '2020-04-08 07:34:24', NULL, 'BME01', 2, 'BME01', 1, 'BME01-2004-00005', NULL, NULL, NULL, NULL, 'BME01', NULL, 'PB00025'),
(376, 'Perbaikan tembok pembatas tandon air', 'Perbaikan tembok pembatas antara gudang Merapi 2 dg tandon air Rinjani yg bocor.\r\n\r\nNote: Tandon air rinjani bocor,air masuk ke dalam gudang merapi yg ada di balik belakang tandon tsb.\r\n\r\nCP: Suyadi/Huda (gdg Merapi)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-04-08 08:16:57', '2020-04-08 08:16:57', NULL, 'PPC01', 1, 'PPC01', 1, 'PPC01-2004-00002', NULL, NULL, NULL, NULL, 'PPC01', NULL, 'PB00037'),
(377, 'Instalasi Jalur sanitasi untuk Flushing di Weighing Latex Merapi', '[Hasi Diskusi dengan Pak Hendrik]\r\n\r\n jalur flushing di tang weighing latex :\r\nTidak perlu ada pembuatan jalur baru, bisa memanfaatkan jalur yang ada dengan cara diberi Tee.\r\n\r\nOutput  1 menuju diafragma pump -> latex di pump ke letdown \r\n\r\nOutput 2 menuju ke centrifugal pump ke jalur flexible yang kemudian terintegrasi dengan sprayball yang sudah terlebih dahulu di install di tangki weighing.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-04-08 10:20:43', '2020-04-08 10:20:43', NULL, 'MRP01', 1, 'MRP01', 1, 'MRP01-2004-00013', NULL, NULL, NULL, NULL, 'MRP01', NULL, 'PM00236'),
(378, 'PRINT EROR', 'PRINT SOJET TINTA TIDAK STABIL', NULL, NULL, NULL, '30H', '2020-04-09', 'TEK07', 1, '2020-04-09 00:06:42', '2020-04-09 00:06:42', NULL, 'MRP01', 2, 'MRP01', 1, 'MRP01-2004-00014', NULL, NULL, NULL, NULL, 'MRP01', NULL, 'PM01016'),
(379, 'PERBAIKAN LAMPU', 'LAMPU HRD BELAKANG.,ATAS BU MAR OFF', NULL, NULL, NULL, '30H', '2020-04-09', 'TEK07', 1, '2020-04-09 00:57:46', '2020-04-09 00:57:46', NULL, 'HRD12', 2, 'HRD12', 1, 'HRD12-2004-00002', NULL, NULL, NULL, NULL, 'HRD12', NULL, 'WV00325'),
(380, 'truck W 9904 WK', 'truck W 9904 WK huda  las knalpot rusak.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-04-09 00:59:26', '2020-04-09 00:59:26', NULL, 'LOG01', 1, 'LOG01', 1, 'LOG01-2004-00011', NULL, NULL, NULL, NULL, 'LOG01', NULL, 'PK00015'),
(381, 'forklift no 40', 'Ganti Oli Mesin Forklift no 40', NULL, NULL, NULL, '30H', '2020-04-09', 'TEK08', 0, '2020-04-09 01:00:29', '2020-04-09 01:00:29', NULL, 'LOG01', 2, 'LOG01', 1, 'LOG01-2004-00012', NULL, NULL, NULL, NULL, 'LOG01', NULL, 'PK00433'),
(382, 'Forklift 41', 'Ganti Oli Mesin Forklift no 41', NULL, NULL, NULL, '30H', '2020-04-09', 'TEK08', 0, '2020-04-09 01:01:37', '2020-04-09 01:01:37', NULL, 'LOG01', 2, 'LOG01', 1, 'LOG01-2004-00013', NULL, NULL, NULL, NULL, 'LOG01', NULL, 'PK00434'),
(383, 'Meratakan lantai', 'Meratakan cor-coran bekas mesin grainmill yg sudah dibongkar', NULL, NULL, NULL, '30H', '2020-04-09', 'TEK09', 3, '2020-04-09 01:19:26', '2020-04-09 01:19:26', NULL, 'PSDJ06', 2, 'PSDJ06', 1, 'PSDJ06-2004-00003', NULL, NULL, NULL, NULL, 'PSDJ06', NULL, 'PB00018'),
(384, 'INKJET ALPHAJET', 'TROUBLE', NULL, NULL, NULL, '30H', '2020-04-09', 'TEK07', 1, '2020-04-09 01:38:48', '2020-04-09 01:38:48', NULL, 'SMR01', 2, 'SMR01', 1, 'SMR01-2004-00007', NULL, NULL, NULL, NULL, 'SMR01', NULL, 'PM01011'),
(385, 'TIMBANGAN TIDAK MAU MENCAPAI KAPASITAS (EROR)', 'TIMBANGAN NO 1 EROR', NULL, NULL, NULL, '30H', '2020-04-09', 'TEK07', 1, '2020-04-09 01:44:46', '2020-04-09 01:44:46', NULL, 'MRP01', 2, 'MRP01', 1, 'MRP01-2004-00015', NULL, NULL, NULL, NULL, 'MRP01', NULL, 'PM00881'),
(386, 'Penggantian roda dan alas trolley karna rusak.', 'Roda seret \r\nAlas trolley kropos.', 'IJN01-2004-00005-1-IMG20200409082921.jpg', NULL, NULL, '30H', '2020-04-09', 'TEK08', 6, '2020-04-09 01:45:32', '2020-04-09 01:45:32', NULL, 'IJN01', 2, 'IJN01', 1, 'IJN01-2004-00005', NULL, NULL, NULL, NULL, 'IJN01', NULL, 'OTHERS-FACTORY'),
(387, 'PERBAIKAN LAMPU', 'LAMPU TL POSISI DI RUANGAN PERSONALIA OFF BUTUH GANTI TRAVO', NULL, NULL, NULL, '30H', '2020-04-09', 'TEK07', 1, '2020-04-09 02:05:38', '2020-04-09 02:05:38', NULL, 'HRD12', 2, 'HRD12', 1, 'HRD12-2004-00003', NULL, NULL, NULL, NULL, 'HRD12', NULL, 'WV00325'),
(388, 'IMPROVE PERALATAN SUPORT', 'PEMBUATAN KLEM PENGGANTI KLEM SS DIAMETER 23 CM, 6 PC', NULL, NULL, NULL, '30H', '2020-04-09', 'TEK06', 6, '2020-04-09 02:22:30', '2020-04-09 02:22:30', NULL, 'MHM01', 2, 'MHM01', 1, 'MHM01-2004-00007', NULL, NULL, NULL, NULL, 'MHM01', NULL, 'OTHERS-FACTORY'),
(389, 'Perbaikan valve separator reaktor 11', 'Valve otomatis untuk pembuangan air refluks netes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-04-09 03:34:47', '2020-04-09 03:34:47', NULL, 'RJN02', 1, 'RJN02', 1, 'RJN02-2004-00005', NULL, NULL, NULL, NULL, 'RJN02', NULL, 'PM02110'),
(390, 'Perbaikan pipa udara reaktor 11', 'Pipa udara untuk menjalankan automatic air dari bak tandon ke bak kontrol area reaktor 11 minta dieperbaiki', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-04-09 03:52:17', '2020-04-09 03:52:17', NULL, 'RJN02', 1, 'RJN02', 1, 'RJN02-2004-00006', NULL, NULL, NULL, NULL, 'RJN02', NULL, 'PM02108'),
(391, 'Penambahan stop kontak di area reaktor 11', 'Penmabahan stop kontak di area reaktor 11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-04-09 04:40:30', '2020-04-09 04:40:30', NULL, 'RJN02', 1, 'RJN02', 1, 'RJN02-2004-00007', NULL, NULL, NULL, NULL, 'RJN02', NULL, 'OTHERS-FACTORY'),
(392, 'Pelepasan kipas ruang spv', 'Melepas kipas jika ac sudah terpasang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-04-09 06:25:41', '2020-04-09 06:25:41', NULL, 'MRP01', 1, 'MRP01', 1, 'MRP01-2004-00016', NULL, NULL, NULL, NULL, 'MRP01', NULL, 'PB00017');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_level_id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `avatar_id` int(11) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `address` text DEFAULT NULL,
  `phone` text DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active` int(1) NOT NULL,
  `user_modified` int(11) DEFAULT NULL,
  `last_activity` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `user_level_id`, `firstname`, `lastname`, `avatar_id`, `email`, `address`, `phone`, `gender`, `birthdate`, `username`, `password`, `active`, `user_modified`, `last_activity`, `created_at`, `updated_at`) VALUES
(1, 1, 'Super', 'Admin', 0, 'superadmin@admin.com', 'Jl Madura xxxxxxx', '08383xxxxxxx', 'male', '1986-07-25', 'superadmin', '$2y$10$TkX/dDYrtvIEXidPOag5T.V8qbyluUHJg5ssBjKe6WlVqpItuN8uy', 1, 1, '2019-01-03 03:54:50', '2017-03-13 20:51:35', '2019-01-03 03:54:50'),
(2, 2, 'Admin', 'Admin', 0, 'admin@admin.com', NULL, NULL, 'male', NULL, 'admin', '$2y$10$PQaUY4b0YsSo5qAuK8Cc.OB.WeEJHrJJ0FDgk6YE9xhXboVRou3We', 1, 1, '2019-01-02 03:17:02', '2017-04-19 14:29:01', '2019-01-02 03:17:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_levels`
--

CREATE TABLE `user_levels` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `active` int(1) DEFAULT NULL,
  `user_modified` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_levels`
--

INSERT INTO `user_levels` (`id`, `name`, `active`, `user_modified`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 1, 1, '2017-06-28 06:18:17', '2017-06-28 06:18:17'),
(2, 'Admin', 1, 1, '2018-06-02 15:59:51', '2018-06-02 15:59:51'),
(3, 'User', 1, 1, '2018-06-03 04:19:49', '2018-06-03 04:19:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_ticket`
--

CREATE TABLE `user_ticket` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` text DEFAULT NULL,
  `reldag` varchar(45) DEFAULT NULL,
  `tipe` varchar(10) DEFAULT NULL,
  `user_level` varchar(15) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_modified` varchar(15) NOT NULL,
  `last_activity` datetime DEFAULT NULL,
  `area` varchar(45) DEFAULT NULL,
  `email_kabag` varchar(100) DEFAULT NULL,
  `no_HP` varchar(45) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_ticket`
--

INSERT INTO `user_ticket` (`id`, `username`, `password`, `reldag`, `tipe`, `user_level`, `name`, `email`, `created_at`, `updated_at`, `user_modified`, `last_activity`, `area`, `email_kabag`, `no_HP`) VALUES
(1, 'donny', '', 'donny', 'AD', 'VSUPER', 'Donny', 'it_2@avianbrands.com', '2019-09-06 08:17:44', '2020-04-09 06:33:32', 'donny', '2020-04-09 13:33:32', '', NULL, NULL),
(2, 'adi', '', 'adi', 'AD', 'VSUPER', 'Adi', 'it_1@avianbrands.com', '2019-09-06 08:21:59', '2020-01-17 00:28:00', 'donny', '2020-01-17 07:28:00', NULL, NULL, NULL),
(3, 'ysa', '', 'ysa', 'AD', 'VSUPER', 'Yenny', 'it_5@avianbrands.com', '2019-09-06 08:22:13', '2020-02-05 06:33:16', 'donny', '2020-02-05 13:33:16', '', NULL, NULL),
(4, 'effie', NULL, 'effie', 'AD', 'VSUPER', 'Effie', 'it_3@avianbrands.com', '2020-02-05 01:07:46', '2020-04-02 03:35:30', 'donny', '2020-04-02 10:35:30', NULL, NULL, NULL),
(5, 'nat', NULL, 'nat', 'AD', 'VADM', 'Natalia', 'it_4@avianbrands.com', '2020-02-05 03:56:44', '2020-02-05 03:59:00', 'donny', '2020-02-05 10:58:35', NULL, NULL, NULL),
(6, 'BME01', '827ccb0eea8a706c4c34a16891f84e7b', 'BME01', 'AGEN', 'USER', 'Pak Darno', 'bme01@avian.com', '2020-02-06 07:17:15', '2020-04-08 07:31:49', 'effie', '2020-04-08 14:31:49', NULL, NULL, NULL),
(7, 'BMS01', '5a306e17f3f46848117aed0eba98c093', 'BMS01', 'AGEN', 'USER', 'Pak Suroso', 'bms01@avian.com', '2020-02-06 07:22:38', '2020-04-08 06:07:49', 'effie', '2020-04-08 13:07:49', NULL, NULL, NULL),
(8, 'TDR01', '827ccb0eea8a706c4c34a16891f84e7b', 'TDR01', 'AGEN', 'USER', 'Pak Samu', 'tdr01@avian.com', '2020-02-06 08:29:02', '2020-04-02 01:00:55', 'effie', '2020-04-02 08:00:55', NULL, NULL, NULL),
(9, 'effiechan', '827ccb0eea8a706c4c34a16891f84e7b', 'effiechan', 'AGEN', 'USER', 'effiechan', 'effie@avian.com', '2020-02-06 08:29:50', '2020-02-25 07:04:59', 'effie', '2020-02-25 14:04:59', NULL, NULL, NULL),
(10, 'deviana', '827ccb0eea8a706c4c34a16891f84e7b', 'deviana', 'AD', 'VSUPER', 'deviana', 'it_3@avianbrands.com', '2020-02-06 08:43:28', '2020-04-06 01:35:08', 'effie', '2020-04-06 08:35:08', NULL, NULL, NULL),
(11, 'TGR02', '827ccb0eea8a706c4c34a16891f84e7b', 'TGR02', 'AGEN', 'USER', 'Pak Supri', 'tgr02@avian.com', '2020-02-06 09:07:13', '2020-02-28 10:03:45', 'deviana', NULL, NULL, 'tgr01@avian.com', NULL),
(12, 'SMR01', '827ccb0eea8a706c4c34a16891f84e7b', 'SMR01', 'AGEN', 'USER', 'Pak Swan', 'smr01@avian.com', '2020-02-06 09:15:28', '2020-04-09 01:36:23', 'deviana', '2020-04-09 08:36:23', NULL, NULL, NULL),
(13, 'MRP02', '827ccb0eea8a706c4c34a16891f84e7b', 'MRP02', 'AGEN', 'USER', 'Pak Wiyadi', 'mrp01@avian.com', '2020-02-07 00:45:06', '2020-02-28 10:02:34', 'deviana', NULL, NULL, 'mrp01@avian.com', NULL),
(14, 'IJN01', '827ccb0eea8a706c4c34a16891f84e7b', 'IJN01', 'AGEN', 'USER', 'Pak Rahmad', 'ijn01@avian.com', '2020-02-07 00:46:53', '2020-04-09 05:27:28', 'deviana', '2020-04-09 12:27:28', NULL, NULL, NULL),
(15, 'MHM01', '268e11ee0f9d33842497924dac5da5c7', 'MHM01', 'AGEN', 'USER', 'Pak Nanang', 'mhm01@avian.com', '2020-02-07 00:51:33', '2020-04-09 02:18:59', 'deviana', '2020-04-09 09:18:59', NULL, NULL, NULL),
(16, 'PSDJ05', '827ccb0eea8a706c4c34a16891f84e7b', 'PSDJ05', 'AGEN', 'USER', 'Hasan', 'psdj05@avian.com', '2020-02-07 00:53:49', '2020-04-09 01:20:34', 'deviana', '2020-04-09 08:20:34', NULL, NULL, NULL),
(17, 'PSDJ06', '827ccb0eea8a706c4c34a16891f84e7b', 'PSDJ06', 'AGEN', 'USER', 'David', 'PSDJ06@avian.com', '2020-02-07 00:54:51', '2020-04-09 06:18:41', 'deviana', '2020-04-09 13:18:41', NULL, NULL, NULL),
(18, 'PSDJ01', NULL, 'PSDJ01', 'AD', 'VADM', 'Pak Budi', 'psdj_1@avianbrands.com', '2020-02-21 02:45:38', '2020-03-19 01:10:21', 'effie', '2020-03-19 08:10:21', NULL, NULL, NULL),
(19, 'EHS01', NULL, 'EHS01', 'AD', 'USER', 'Eko Hajar P', 'ehs_1@avianbrands.com', '2020-02-21 07:09:02', '2020-02-27 01:33:44', 'deviana', '2020-02-27 08:33:44', NULL, NULL, NULL),
(20, 'EHS04', NULL, 'EHS04', 'AD', 'USER', 'Yunita Tria', 'ehs_4@avianbrands.com', '2020-02-21 07:09:34', '2020-02-28 09:49:39', 'deviana', NULL, NULL, 'ehs_1@avianbrands.com', NULL),
(21, 'PPC01', '827ccb0eea8a706c4c34a16891f84e7b', 'PPC01', 'AGEN', 'USER', 'Pak Yan', 'ppc_1@avianbrands.com', '2020-02-24 07:56:15', '2020-04-09 06:33:28', 'deviana', '2020-04-09 13:33:28', NULL, NULL, NULL),
(22, 'PPC12', '827ccb0eea8a706c4c34a16891f84e7b', 'PPC12', 'AGEN', 'USER', 'Pradico', 'ppc12@avian.com', '2020-02-24 07:59:08', '2020-02-24 07:59:08', 'deviana', NULL, NULL, NULL, NULL),
(23, 'RJN01', '827ccb0eea8a706c4c34a16891f84e7b', 'RJN01', 'AGEN', 'USER', 'Pono', 'rjn_1@avianbrands.com', '2020-02-24 08:05:58', '2020-03-12 07:31:36', 'deviana', '2020-03-12 14:31:36', NULL, NULL, NULL),
(24, 'RJN02', '827ccb0eea8a706c4c34a16891f84e7b', 'RJN02', 'AGEN', 'USER', 'Dimas', 'rjn02@avian.com', '2020-02-24 08:08:01', '2020-04-09 03:32:34', 'deviana', '2020-04-09 10:32:34', NULL, 'rjn_1@avianbrands.com', NULL),
(25, 'KAL02', NULL, 'KAL02', 'AGEN', 'USER', 'Andri', 'kal02@avian.com', '2020-02-24 08:08:59', '2020-02-28 09:57:41', 'deviana', NULL, NULL, 'kal01@avian.com', NULL),
(26, 'KAL03', '827ccb0eea8a706c4c34a16891f84e7b', 'KAL03', 'AGEN', 'USER', 'Alex', 'kal03@avian.com', '2020-02-24 08:10:59', '2020-03-27 01:57:38', 'deviana', '2020-03-27 08:57:38', NULL, 'kal01@avian.com', NULL),
(27, 'KAL04', '827ccb0eea8a706c4c34a16891f84e7b', 'KAL04', 'AGEN', 'USER', 'Nurkolis', 'kal04@avian.com', '2020-02-24 08:11:36', '2020-04-09 06:30:22', 'deviana', '2020-04-09 13:30:22', NULL, 'kal01@avian.com', NULL),
(28, 'KAL05', '827ccb0eea8a706c4c34a16891f84e7b', 'KAL05', 'AGEN', 'USER', 'Pak Suyono', 'kal05@avian.com', '2020-02-24 08:12:49', '2020-03-27 01:57:54', 'deviana', '2020-03-27 08:57:54', NULL, 'kal01@avian.com', NULL),
(29, 'KAL06', '827ccb0eea8a706c4c34a16891f84e7b', 'KAL06', 'AGEN', 'USER', 'Rizal', 'kal06@avian.com', '2020-02-24 08:13:12', '2020-03-27 01:58:38', 'deviana', '2020-03-27 08:58:38', NULL, 'kal01@avian.com', NULL),
(30, 'KAL07', '827ccb0eea8a706c4c34a16891f84e7b', 'KAL07', 'AGEN', 'USER', 'Richo', 'kal07@avian.com', '2020-02-24 08:13:35', '2020-04-08 07:32:08', 'deviana', '2020-04-08 14:32:08', NULL, 'kal01@avian.com', NULL),
(31, 'LOG02', '827ccb0eea8a706c4c34a16891f84e7b', 'LOG02', 'AGEN', 'USER', 'Sulistyani', 'log02@avian.com', '2020-02-24 08:15:40', '2020-04-08 06:51:21', 'deviana', '2020-04-08 13:51:21', NULL, 'log01@avian.com', NULL),
(32, 'LOG06', '827ccb0eea8a706c4c34a16891f84e7b', 'LOG06', 'AGEN', 'USER', 'Denny', 'log06@avian.com', '2020-02-24 08:18:24', '2020-03-26 02:43:30', 'deviana', '2020-03-26 09:43:30', NULL, 'log01@avian.com', NULL),
(33, 'TEK01', '827ccb0eea8a706c4c34a16891f84e7b', 'TEK01', 'AGEN', 'USER', 'Nicholas W', 'tek_1@avianbrands.com', '2020-02-24 08:19:39', '2020-02-27 01:43:27', 'deviana', '2020-02-27 08:43:27', NULL, NULL, NULL),
(34, 'TEK03', '827ccb0eea8a706c4c34a16891f84e7b', 'TEK03', 'AGEN', 'VADM', 'Randi Agung S', 'tek_3@avianbrands.com', '2020-02-24 08:20:12', '2020-04-06 06:02:38', 'effie', '2020-04-06 13:02:38', NULL, 'tek_1@avianbrands.com', NULL),
(35, 'TEK04', '827ccb0eea8a706c4c34a16891f84e7b', 'TEK04', 'AGEN', 'VADM', 'Eko Utomo', 'tek04@avian.com', '2020-02-24 08:22:22', '2020-03-02 07:38:16', 'effie', '2020-03-02 09:13:53', NULL, 'tek_1@avianbrands.com', NULL),
(36, 'TEK06', '827ccb0eea8a706c4c34a16891f84e7b', 'TEK06', 'AGEN', 'VADM', 'Aripin', 'tek06@avian.com', '2020-02-24 08:22:50', '2020-04-08 10:17:44', 'effie', '2020-04-08 17:17:44', NULL, 'tek_1@avianbrands.com', NULL),
(37, 'TEK07', '827ccb0eea8a706c4c34a16891f84e7b', 'TEK07', 'AGEN', 'VADM', 'Nasrodin', 'tek07@avian.com', '2020-02-24 08:23:41', '2020-04-09 06:27:02', 'effie', '2020-04-09 13:27:02', NULL, 'tek_1@avianbrands.com', NULL),
(38, 'TEK08', '827ccb0eea8a706c4c34a16891f84e7b', 'TEK08', 'AGEN', 'VADM', 'Harmanto', 'tek08@avian.com', '2020-02-24 08:26:15', '2020-04-09 05:35:28', 'effie', '2020-04-09 12:35:28', NULL, 'tek_1@avianbrands.com', NULL),
(39, 'TEK09', '827ccb0eea8a706c4c34a16891f84e7b', 'TEK09', 'AGEN', 'VADM', 'Suyono', 'tek09@avian.com', '2020-02-24 08:28:43', '2020-04-07 05:42:03', 'effie', '2020-04-07 12:42:03', NULL, 'tek_1@avianbrands.com', NULL),
(40, 'TEK10', '827ccb0eea8a706c4c34a16891f84e7b', 'TEK10', 'AGEN', 'VADM', 'Chamim', 'tek10@avian.com', '2020-02-24 08:32:41', '2020-04-09 02:44:32', 'deviana', '2020-04-09 09:44:32', NULL, 'tek_1@avianbrands.com', NULL),
(41, 'TEK11', '827ccb0eea8a706c4c34a16891f84e7b', 'TEK11', 'AGEN', 'USER', 'Harmanto', 'tek11@avian.com', '2020-02-24 08:33:58', '2020-02-28 10:03:24', 'deviana', '2020-02-24 15:47:39', NULL, 'tek_1@avianbrands.com', NULL),
(42, 'HRD01', '827ccb0eea8a706c4c34a16891f84e7b', 'HRD01', 'AGEN', 'USER', 'Bu Mar', 'hrd_1@avianbrands.com', '2020-02-24 08:36:47', '2020-03-05 07:06:58', 'deviana', '2020-02-24 16:18:42', NULL, NULL, NULL),
(43, 'RDS00', '827ccb0eea8a706c4c34a16891f84e7b', 'RDS00', 'AGEN', 'USER', 'Tri Indahyani', 'RDS00@avian.com', '2020-02-25 04:11:10', '2020-04-04 01:11:22', 'deviana', '2020-04-04 08:11:22', NULL, 'angelica.jozar@avianbrands.com', NULL),
(44, 'deviana-user', '827ccb0eea8a706c4c34a16891f84e7b', 'deviana-user', 'AGEN', 'USER', 'Deviana - User', 'deviana@avian.com', '2020-02-25 04:19:07', '2020-03-05 07:25:01', 'deviana', '2020-03-05 14:25:01', NULL, NULL, NULL),
(46, 'QCP01', '827ccb0eea8a706c4c34a16891f84e7b', 'QCP01', 'AGEN', 'USER', 'Agung', 'QCP01@avian.com', '2020-02-27 01:37:23', '2020-02-27 01:48:34', 'effie', '2020-02-27 08:48:34', NULL, NULL, NULL),
(47, 'QCP05', NULL, 'QCP05', 'AD', 'USER', 'David', 'QCP05@avian.com', '2020-02-27 01:38:39', '2020-04-01 06:02:24', 'deviana', '2020-04-01 13:02:24', NULL, 'QCP01@avian.com', NULL),
(48, 'QCP02', NULL, 'QCP02', 'AD', 'USER', 'Dandi', 'QCP02@avian.com', '2020-02-27 01:39:11', '2020-02-28 10:04:28', 'deviana', NULL, NULL, 'QCP01@avian.com', NULL),
(49, 'EHS03', NULL, 'EHS03', 'AD', 'USER', 'Yunita', 'ehs03@avian.com', '2020-02-27 01:39:53', '2020-04-01 03:49:06', 'deviana', '2020-04-01 10:49:06', NULL, 'ehs_1@avianbrands.com', NULL),
(50, 'Tek05', NULL, 'Tek05', 'AD', 'VADM', 'Nurul Maimunah', 'Tek05@avian.com', '2020-02-27 01:43:04', '2020-03-02 07:39:40', 'effie', '2020-02-27 15:03:25', NULL, 'tek_1@avianbrands.com', NULL),
(51, 'SCM01', NULL, 'SCM01', 'AD', 'USER', 'Pak Tri', 'scm01@avian.com', '2020-02-27 01:43:45', '2020-02-27 01:44:00', 'effie', '2020-02-27 08:44:00', NULL, NULL, NULL),
(52, 'MRP01', NULL, 'MRP01', 'AD', 'USER', 'Wiyadi', 'MPR01@avian.com', '2020-02-27 01:45:25', '2020-04-09 06:22:09', 'effie', '2020-04-09 13:22:09', NULL, NULL, NULL),
(53, 'TGR01', NULL, 'TGR01', 'AD', 'USER', 'Supriyanto', 'tgr01@avian.com', '2020-02-27 01:46:23', '2020-04-03 01:31:08', 'effie', '2020-04-03 08:31:08', NULL, NULL, NULL),
(54, 'QCP07', '827ccb0eea8a706c4c34a16891f84e7b', 'QCP07', 'AGEN', 'USER', 'Rusdi', 'qcp07@avian.com', '2020-02-27 01:50:44', '2020-02-28 09:57:18', 'deviana', NULL, NULL, 'QCP01@avian.com', NULL),
(55, 'QCP06', '827ccb0eea8a706c4c34a16891f84e7b', 'QCP06', 'AGEN', 'USER', 'Widia', 'qcp06@avian.com', '2020-02-27 01:51:19', '2020-02-28 09:56:51', 'deviana', NULL, NULL, 'QCP01@avian.com', NULL),
(56, 'QCP04', '827ccb0eea8a706c4c34a16891f84e7b', 'QCP04', 'AGEN', 'USER', 'Yayuk', 'qcp04@avian.com', '2020-02-27 01:51:52', '2020-02-28 10:04:42', 'deviana', NULL, NULL, 'QCP01@avian.com', NULL),
(57, 'HRD12', '827ccb0eea8a706c4c34a16891f84e7b', 'HRD12', 'AD', 'USER', 'Bu Dita', 'hrd12@avian.com', '2020-02-27 01:53:05', '2020-04-09 00:39:46', 'deviana', '2020-04-09 07:39:46', NULL, 'hrd_1@avianbrands.com', NULL),
(58, 'LOG01', 'b9989f9f6e873e96f8de3660e3d199d8', 'LOG01', 'AGEN', 'USER', 'Pak Tris', 'log01@avian.com', '2020-02-27 02:24:03', '2020-04-09 00:52:57', 'effie', '2020-04-09 07:52:57', NULL, NULL, NULL),
(59, 'TEK02', NULL, 'TEK02', 'AD', 'VADM', 'Ainur Rofik', 'tek02@avian.com', '2020-02-27 09:02:47', '2020-04-09 03:15:14', 'effie', '2020-04-09 10:15:14', NULL, 'tek_1@avianbrands.com', NULL),
(60, 'RDS01', '827ccb0eea8a706c4c34a16891f84e7b', 'RDS01', 'AGEN', 'USER', 'Sylviana', 'rds_1@avianbrands.com', '2020-02-28 03:34:06', '2020-03-12 09:58:01', 'deviana', '2020-03-12 16:58:01', NULL, 'angelica.jozar@avianbrands.com', NULL),
(61, 'RDP05', '827ccb0eea8a706c4c34a16891f84e7b', 'RDP05', 'AGEN', 'USER', 'Angelica', 'angelica.jozar@avianbrands.com', '2020-02-28 08:17:51', '2020-02-28 08:17:51', 'deviana', NULL, NULL, NULL, NULL),
(62, 'RDC02', '827ccb0eea8a706c4c34a16891f84e7b', 'RDC02', 'AGEN', 'USER', 'Gerald', 'RDC02@avian.com', '2020-03-04 04:55:13', '2020-04-02 01:48:33', 'deviana', '2020-04-02 08:48:33', NULL, 'rds_1@avianbrands.com', NULL),
(63, 'RDCS02', '827ccb0eea8a706c4c34a16891f84e7b', 'RDCS02', 'AGEN', 'USER', 'Richard', 'RDCS02@avian.com', '2020-03-04 04:55:51', '2020-03-10 03:01:04', 'deviana', '2020-03-04 14:41:15', NULL, 'rds_1@avianbrands.com', NULL),
(64, 'RDR05', '827ccb0eea8a706c4c34a16891f84e7b', 'RDR05', 'AGEN', 'USER', 'Alan', 'RDR05@avian.com', '2020-03-04 04:56:24', '2020-04-08 06:53:07', 'deviana', '2020-04-08 13:53:07', NULL, 'rds_1@avianbrands.com', NULL),
(65, 'RDP11', '827ccb0eea8a706c4c34a16891f84e7b', 'RDP11', 'AGEN', 'USER', 'Sutikno', 'RDP11@avian.com', '2020-03-04 04:56:52', '2020-03-10 03:01:32', 'deviana', '2020-03-04 14:36:45', NULL, 'rds_1@avianbrands.com', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `access_control`
--
ALTER TABLE `access_control`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `assignee`
--
ALTER TABLE `assignee`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `media_library`
--
ALTER TABLE `media_library`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_levels`
--
ALTER TABLE `user_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_ticket`
--
ALTER TABLE `user_ticket`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `access_control`
--
ALTER TABLE `access_control`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `assignee`
--
ALTER TABLE `assignee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `media_library`
--
ALTER TABLE `media_library`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=393;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `user_levels`
--
ALTER TABLE `user_levels`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user_ticket`
--
ALTER TABLE `user_ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
