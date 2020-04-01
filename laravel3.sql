-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 01 2020 г., 13:25
-- Версия сервера: 5.7.23
-- Версия PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `laravel3`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `author` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `author`, `comment`, `created_at`, `updated_at`) VALUES
(1, 1, 'user1', '12345678', '2019-12-12 11:14:04', '2019-12-12 11:14:04'),
(2, 4, 'user12', '12345678', '2019-12-12 13:39:19', '2019-12-12 13:39:19');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_12_11_093803_create_posts_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(12, 'ЗаголовокСидер', 'ОписаниеСидер', '2020-03-19 15:38:19', '2020-03-19 15:38:19'),
(13, 'ЗаголовокСидер1', 'ОписаниеСидер1', '2020-03-19 15:38:19', '2020-03-19 15:38:19'),
(14, 'ЗаголовокСидер2', 'ОписаниеСидер2', '2020-03-19 15:38:19', '2020-03-19 15:38:19');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `api_token`, `login`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'f3309d90ZiBBYRY15pru7ssuDXLYDDguguOdKonQc2sgmxj74N0AFPpkbEAfcaXilYoUt2U1AXzuoXj9', 'user1', '$2y$10$mCSgbfOfzlJOOOFk7ZZi2uwGWGgPKm6cCQSp2pxS28Ax3k.AqcAQu', NULL, '2019-12-12 10:19:48', '2019-12-12 10:19:48'),
(2, 'aLj3kU4XDFS1XpNAvsU6mCJZyLgS5Jr2REL8t743Y6Dh1xJOqAQYaY2HlM8BkuKhrDb1gWJTf22NDsHa', 'user1', '$2y$10$qswmfpRmJu6njiviGn.By.Zt3SSEQY2Vy.5XMsSNhFkfmPeJ3QUUm', NULL, '2019-12-12 10:22:23', '2019-12-12 10:22:23'),
(3, 'N40iEbXo81FBeoRcILxgTdEY3xT1Gs0d9ss8VoXQE31bdmcCHBGSmKvllQOu0UfbpjhD5ZmOb5Pr4x8A', 'user1', '$2y$10$lwahV660eLxrZNk/vDELH.aNDOsnHBZ5hDqc02q0GDzQyFA9hqyBu', NULL, '2019-12-12 10:24:50', '2019-12-12 10:24:50'),
(4, 'vE00QGnyNpsmwp5tqAmpkY9xB35Zg8vxzPj0HvgIi0J3MFNpBzWGYxK0XexweVNgQIEtZF0lCvgl2OqL', 'user121', '$2y$10$7tfGqZKtCb54ONuESWiw8.5bBxSUShxwrFk0tpKbUGPZVE5hSRDDu', NULL, '2019-12-12 21:22:23', '2019-12-12 21:22:23'),
(5, 'rrf3yZvvdFJmqzg2BsZ0xFnR4FVflm9IywNMx14iQVQ7Ro8E1ZMCP6G1arzrSx9lF1j21rtQTSAXKbqJ', 'user1213333', '$2y$10$IWNPqIpb1dpetv.FjIlOKuFnRRIxgdXpUi17w6t8KtNNdQ00sQXU6', NULL, '2019-12-12 21:23:40', '2019-12-12 21:23:40'),
(6, '9GYyQLOrfTWlxSwUrGutbso0trIs3WjgtBp5llU27kx3KRTzdnok43ZiCkzt6nSHSwSkWlm4oSDlaHnk', 'user1213333', '$2y$10$Qhj8z4kldVHiwd2VXwP5ZOxDLoqblla63ody3OzW9AVwwLgJa7xcK', NULL, '2020-03-11 12:38:04', '2020-03-11 12:38:04'),
(7, 'XSBeVwiXfgKjzDDgOBGEfkQL55LY2vTrQ050Qr648skNXp8h04a6vZIAtP3gRDIKaUQzgHsV7ZV40tgV', 'user1213333', '$2y$10$vpZyRBDFAnDUgS.du4CWG.FC6Eyvv2aXz.kzrvvWkKb4PRdc5ithe', NULL, '2020-03-11 12:38:23', '2020-03-11 12:38:23'),
(8, '9Ol2kfzNkGR8GF5HRaotbwjA9219CEsltw8tKIr7VkAc3Lms0gPRNMtlVDvZ6eDYJYGxTQvDm9Q3VW0b', 'user1213333', '$2y$10$rD6oM9uW8pwIT8XHPconAeuWbD6fHjKwx0zDqdgUiJ/OIflN4BoxC', NULL, '2020-03-11 12:38:27', '2020-03-11 12:38:27'),
(9, 'hVdqSxalZb2vNQ0dOoJmDR8hisS7iqNhKnNumJidHJYD1HBhyKfMk9fSVTXX74VYb3CY3GAwKCqUfrIs', 'user1213333', '$2y$10$xgVdRt9AqwvbcSft0Ds1c.VEwkZ0Qt/njiRP4a9DrTwgpCHmSA4sG', NULL, '2020-03-11 12:38:29', '2020-03-11 12:38:29'),
(10, 'L6LdB1UKRw3nLLVGRL5tzWPy5pRWqArZBUTOIJuJNvophFoaREVE4Sn8cq0d1HWNp34Cvkv81ak8kYjd', 'user1213', '$2y$10$8Zdgkc5SBeqx3dLsUdfNL.LB7rc3l9dEtE9SRiqgHM3iRC1G5MXwy', NULL, '2020-03-11 12:38:36', '2020-03-11 12:38:36'),
(11, 'heoOTJivrYvofpNJkKsSdsTb4JRwQ9WraCDEdP4OfrzY6N9E5LGdw0SQ5ncblcrGiEpVGCi5pETz7rDS', 'user121', '$2y$10$mCPRkUaOa8qygDuDffsvzeeD.lLrAVoUx2oGy1qiVuF6EgcyQ/oMW', NULL, '2020-03-11 12:38:43', '2020-03-11 12:38:43');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
