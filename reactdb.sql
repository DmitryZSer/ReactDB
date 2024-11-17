-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 17 2024 г., 20:13
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `reactdb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `summary` text DEFAULT NULL,
  `content` text NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `articles`
--

INSERT INTO `articles` (`id`, `title`, `summary`, `content`, `author_id`, `created_at`, `updated_at`) VALUES
(1, 'Основы JavaScript', 'Краткий гайд по основам JavaScript', 'Полное руководство по основам JavaScript, включая синтаксис, типы данных и функции.', 43, '2024-11-11 18:28:32', NULL),
(2, 'Создание веб-приложения с React', 'Пошаговый гайд по созданию веб-приложения на React', 'Детальный разбор процесса создания SPA с использованием React и современных библиотек.', 44, '2024-11-11 18:28:32', NULL),
(3, 'Настройка Git и GitHub', 'Учимся работать с Git и GitHub', 'Практическое руководство по установке, настройке и основам работы с Git и GitHub.', 45, '2024-11-11 18:28:32', NULL),
(4, 'Работа с MySQL', 'Основы работы с реляционными базами данных на примере MySQL', 'Операции CRUD, работа с индексами и оптимизация запросов в MySQL.', 43, '2024-11-11 18:28:32', NULL),
(5, 'Основы Python для начинающих', 'Краткий гайд по Python для новичков', 'Основы Python, включая типы данных, циклы и функции.', 44, '2024-11-11 18:28:32', NULL),
(6, 'Алгоритмы и структуры данных', 'Гид по алгоритмам и структурам данных', 'Разбираем основные алгоритмы: сортировки, поиска и структуры данных.', 45, '2024-11-11 18:28:32', NULL),
(7, 'DevOps: Введение в Docker', 'Основы Docker для начинающих DevOps инженеров', 'Объяснение работы Docker, создание контейнеров и управление ими.', 43, '2024-11-11 18:28:32', NULL),
(8, 'Пишем SQL-запросы', 'Гайд по написанию SQL-запросов для начинающих', 'Полное руководство по созданию запросов в SQL: SELECT, JOIN, GROUP BY.', 44, '2024-11-11 18:28:32', NULL),
(9, 'Создание REST API на Node.js', 'Создаем API с помощью Express и Node.js', 'Подробное руководство по созданию RESTful API с использованием Node.js и Express.', 45, '2024-11-11 18:28:32', NULL),
(10, 'Тестирование кода на JavaScript', 'Гид по тестированию кода на JavaScript', 'Пошаговое руководство по написанию и запуску тестов для JavaScript кода.', 43, '2024-11-11 18:28:32', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `article_tags`
--

CREATE TABLE `article_tags` (
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `article_tags`
--

INSERT INTO `article_tags` (`article_id`, `tag_id`) VALUES
(1, 1),
(1, 6),
(2, 2),
(2, 8),
(3, 2),
(3, 10),
(4, 3),
(4, 9),
(5, 1),
(5, 7),
(6, 1),
(6, 5),
(7, 2),
(7, 4),
(8, 3),
(8, 9),
(9, 2),
(9, 6),
(10, 2),
(10, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `parent_comment_id` int(11) DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `article_id`, `user_id`, `parent_comment_id`, `content`, `created_at`) VALUES
(21, 3, 1, NULL, 'dsad', '2024-11-16 20:53:21'),
(22, 3, 1, NULL, 'asd', '2024-11-16 20:53:22'),
(35, 1, 48, NULL, 'Ты тоже', '2024-11-16 21:30:22'),
(52, 1, 1, NULL, 'Xsadasd', '2024-11-16 22:22:34'),
(53, 1, 1, 35, 'ввыв', '2024-11-16 22:26:20'),
(54, 1, 1, 35, 'тветат', '2024-11-16 22:26:26'),
(55, 1, 1, 53, 'увйцу', '2024-11-16 22:26:32'),
(57, 1, 1, 53, 'фыв', '2024-11-16 22:26:55'),
(58, 1, 1, 53, 'ыфвфывфыфывasdasd', '2024-11-17 08:43:35'),
(59, 1, 1, 57, 'фвфыв', '2024-11-17 08:43:40'),
(60, 1, 1, 57, 'фыв', '2024-11-17 08:43:42'),
(61, 1, 1, 35, 'выфвыфывфы', '2024-11-17 10:30:26'),
(63, 1, 43, NULL, 'asdasdasdasdxzc', '2024-11-17 16:18:44');

-- --------------------------------------------------------

--
-- Структура таблицы `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `tags`
--

INSERT INTO `tags` (`id`, `name`) VALUES
(4, 'DevOps'),
(10, 'Git'),
(6, 'JavaScript'),
(7, 'Python'),
(8, 'React'),
(9, 'SQL'),
(5, 'Алгоритмы'),
(3, 'Базы данных'),
(2, 'Веб-разработка'),
(1, 'Программирование');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `dateRegistration` date NOT NULL DEFAULT current_timestamp(),
  `isAdmin` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `dateRegistration`, `isAdmin`) VALUES
(1, 'Admin', 'cebotarenkodima@gmail.com', '$2b$10$WWA25AmSE9TOgjd3accXAuI7FsKLcXHNKfVl5IsbCs4kZ5bO8vwbi', '2024-11-12', 1),
(43, 'Иван Петров', 'ivan.petrov@example.com', '$2b$10$rw8H6ii7Zl6PoVoyEYSe/OLlgJPlVq267DNfT5arJO8EpbIRb2FIC', '2024-11-17', NULL),
(44, 'Мария Сидорова', 'maria.sidorova@example.com', '$2b$10$j5NhqfRzKQWNXKkX5/HWE.h18kYq1atOVgINxZCtqswzGz4gi7e8G', '2024-11-17', NULL),
(45, 'Алексей Смирнов', 'alexey.smirnov@example.com', '$2b$10$r84oDvB5mwF2JDoUU/r3CuDyInQ39BRLautCnH6DfTmLEbajS0abC', '2024-11-17', NULL),
(48, 'Ysell', 'soniaov24@gmail.com', '$2b$10$CGlqa.3626GkrszGjKKIReQAC2bh7y6PwlbTGqbsNGT/1SErxYcBK', '2024-11-17', NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`);

--
-- Индексы таблицы `article_tags`
--
ALTER TABLE `article_tags`
  ADD PRIMARY KEY (`article_id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_id` (`article_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `parent_comment_id` (`parent_comment_id`);

--
-- Индексы таблицы `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT для таблицы `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`ID`) ON DELETE SET NULL;

--
-- Ограничения внешнего ключа таблицы `article_tags`
--
ALTER TABLE `article_tags`
  ADD CONSTRAINT `article_tags_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `article_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`parent_comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
