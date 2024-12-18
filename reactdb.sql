-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2024 at 03:04 PM
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
-- Database: `reactdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
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
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `summary`, `content`, `author_id`, `created_at`, `updated_at`) VALUES
(1, 'Основы JavaScript', 'Краткий гайд по основам JavaScript', '<h2>Полное руководство по основам JavaScript, включая синтаксис, типы данных и функции.</h2><pre class=\"ql-syntax\" spellcheck=\"false\">&nbsp; &nbsp; <span class=\"hljs-keyword\">return</span> (\n&nbsp; &nbsp; &nbsp; &nbsp; <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">div</span> <span class=\"hljs-attr\">className</span>=<span class=\"hljs-string\">\"d-flex flex-column min-vh-100 bg-primary\"</span>&gt;</span>\n&nbsp; &nbsp; &nbsp;dsdasdasdasd &nbsp; &nbsp; &nbsp; <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">div</span> <span class=\"hljs-attr\">className</span>=<span class=\"hljs-string\">\"container p-5 bg-white rounded shadow-lg min-vh-100\"</span> <span class=\"hljs-attr\">style</span>=<span class=\"hljs-string\">{{</span> <span class=\"hljs-attr\">width:</span> \'<span class=\"hljs-attr\">100</span>%\', <span class=\"hljs-attr\">maxWidth:</span> \'<span class=\"hljs-attr\">1200px</span>\' }}&gt;</span>\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">h1</span> <span class=\"hljs-attr\">className</span>=<span class=\"hljs-string\">\"mb-4\"</span>&gt;</span>{article.title}<span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">h1</span>&gt;</span>\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">p</span>&gt;&lt;<span class=\"hljs-name\">strong</span>&gt;</span>Автор: {article.authorName}<span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">strong</span>&gt;&lt;/<span class=\"hljs-name\">p</span>&gt;</span>\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">p</span>&gt;&lt;<span class=\"hljs-name\">strong</span>&gt;</span>Создано:<span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">strong</span>&gt;</span> {new Date(article.created_at).toLocaleDateString()}<span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">p</span>&gt;</span>\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">p</span>&gt;&lt;<span class=\"hljs-name\">strong</span>&gt;&lt;/<span class=\"hljs-name\">strong</span>&gt;</span> {article.summary}<span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">p</span>&gt;</span>\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">div</span> <span class=\"hljs-attr\">className</span>=<span class=\"hljs-string\">\"mb-4\"</span>&gt;</span>\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">strong</span>&gt;</span>Тэги: <span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">strong</span>&gt;</span>\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {article.tags.length &gt; 0 ? article.tags.map(tag =&gt; (\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">span</span> <span class=\"hljs-attr\">key</span>=<span class=\"hljs-string\">{tag}</span> <span class=\"hljs-attr\">className</span>=<span class=\"hljs-string\">\"badge bg-secondary me-2\"</span>&gt;</span>{tag}<span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">span</span>&gt;</span>\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; )) : \"Нет отмеченных тегов.\"}\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">div</span>&gt;</span>\n&nbsp; &nbsp; &nbsp; &nbsp; <span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">div</span>&gt;</span>\n\n\n&nbsp; &nbsp; );\n</pre><p>asdasd</p><h1><em style=\"color: rgb(255, 153, 0);\"><s><u>ghjfghjg     hj    dddd   ddd</u></s></em></h1><pre class=\"ql-syntax\" spellcheck=\"false\">ghjghjghjgh\n</pre><blockquote>dfsgdsfdsfdsfdsfdsf</blockquote><blockquote><br></blockquote><h1><span style=\"background-color: rgb(102, 185, 102);\">fvcxvcxvcxvcxvcxvcxvcxvcx</span></h1><p><br></p><iframe class=\"ql-video\" frameborder=\"0\" allowfullscreen=\"true\" src=\"https://www.youtube.com/embed/WmG_e-u_Ktw?showinfo=0\"></iframe><p><br></p><p><br></p><p><a href=\"https://docs.google.com/spreadsheets/d/1T4xH4lPaO1L5oNqDmI-CzFhsc_Mrr0OItAxQBQbHCKA/edit?pli=1&amp;gid=1692378025#gid=1692378025\" rel=\"noopener noreferrer\" target=\"_blank\">https://docs.google.com/spreadsheets/d/1T4xH4lPaO1L5oNqDmI-CzFhsc_Mrr0OItAxQBQbHCKA/edit?pli=1&amp;gid=1692378025#gid=1692378025</a></p>', 43, '2024-11-11 18:28:32', '2024-12-03 21:42:24'),
(2, 'Создание веб-приложения с React', 'Пошаговый гайд по созданию веб-приложения на React', 'Детальный разбор процесса создания SPA с использованием React и современных библиотек.', 44, '2024-11-11 18:28:32', NULL),
(3, 'Настройка Git и GitHub', 'Учимся работать с Git и GitHub', 'Практическое руководство по установке, настройке и основам работы с Git и GitHub.', 45, '2024-11-11 18:28:32', NULL),
(4, 'Работа с MySQL', 'Основы работы с реляционными базами данных на примере MySQL', 'Операции CRUD, работа с индексами и оптимизация запросов в MySQL.', 43, '2024-11-11 18:28:32', NULL),
(5, 'Основы Python для начинающих', 'Краткий гайд по Python для новичков', '<p>Основы Python, включая типы данных, циклы и функции.</p>', 44, '2024-11-11 18:28:32', '2024-12-03 22:19:33'),
(6, 'Алгоритмы и структуры данных', 'Гид по алгоритмам и структурам данных', 'Разбираем основные алгоритмы: сортировки, поиска и структуры данных.', 45, '2024-11-11 18:28:32', NULL),
(7, 'DevOps: Введение в Docker', 'Основы Docker для начинающих DevOps инженеров', 'Объяснение работы Docker, создание контейнеров и управление ими.', 43, '2024-11-11 18:28:32', NULL),
(8, 'Пишем SQL-запросы', 'Гайд по написанию SQL-запросов для начинающих', 'Полное руководство по созданию запросов в SQL: SELECT, JOIN, GROUP BY.', 44, '2024-11-11 18:28:32', NULL),
(9, 'Создание REST API на Node.js', 'Создаем API с помощью Express и Node.js', 'Подробное руководство по созданию RESTful API с использованием Node.js и Express.', 45, '2024-11-11 18:28:32', NULL),
(10, 'Тестирование кода на JavaScript', 'Гид по тестированию кода на JavaScript', 'Пошаговое руководство по написанию и запуску тестов для JavaScript кода.', 43, '2024-11-11 18:28:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `article_tags`
--

CREATE TABLE `article_tags` (
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `article_tags`
--

INSERT INTO `article_tags` (`article_id`, `tag_id`) VALUES
(1, 4),
(1, 5),
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
-- Table structure for table `comments`
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
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `article_id`, `user_id`, `parent_comment_id`, `content`, `created_at`) VALUES
(21, 3, 1, NULL, 'dsad', '2024-11-16 20:53:21'),
(22, 3, 1, NULL, 'asd', '2024-11-16 20:53:22'),
(35, 1, 48, NULL, 'Ты тоже', '2024-11-16 21:30:22'),
(54, 1, 1, 35, 'тветат', '2024-11-16 22:26:26'),
(78, 1, 1, NULL, 'asdffфывфывфывфыв', '2024-11-26 19:19:30'),
(81, 1, 45, 54, 'выфв', '2024-11-30 17:54:29'),
(82, 1, 45, 54, 'фывфыв', '2024-11-30 17:54:32'),
(83, 1, 45, 54, 'фыв', '2024-11-30 17:54:35'),
(85, 1, 45, 83, 'фывфыв', '2024-11-30 17:54:41'),
(86, 1, 45, 83, 'ыфвфывxzcxzc', '2024-11-30 17:54:42'),
(90, 1, 45, 85, 'вввв', '2024-11-30 17:56:02'),
(93, 1, 45, 90, 'asdasdasdasddsfdsfdsf', '2024-11-30 18:05:53'),
(113, 1, 1, 93, 'Комментарий', '2024-11-30 18:55:20'),
(114, 1, 1, 113, 'Комментарий', '2024-11-30 18:55:22'),
(115, 1, 1, 114, 'Комментарий', '2024-11-30 18:55:23'),
(116, 1, 1, 115, '', '2024-11-30 18:55:25'),
(117, 1, 1, 116, 'Комментарий', '2024-11-30 18:55:27'),
(118, 1, 1, 117, 'Комментарий', '2024-11-30 18:55:28'),
(119, 1, 1, 118, 'Комментарий', '2024-11-30 18:55:29'),
(120, 1, 1, 119, 'Комментарий', '2024-11-30 18:55:31'),
(121, 1, 1, 120, 'Комментарий', '2024-11-30 18:55:33'),
(122, 1, 1, 121, 'Комментарий', '2024-11-30 18:55:34'),
(123, 1, 1, 122, 'Комментарий', '2024-11-30 18:55:36'),
(124, 1, 1, 123, 'Комментарий', '2024-11-30 18:55:37'),
(125, 1, 1, 124, 'Комментарий', '2024-11-30 18:55:40'),
(126, 1, 1, 125, 'Комментарий', '2024-11-30 18:55:41'),
(127, 1, 1, 126, 'Комментарий', '2024-11-30 18:55:43'),
(128, 1, 1, 127, 'Комментарий', '2024-11-30 18:55:46'),
(129, 1, 1, 128, 'Комментарий', '2024-11-30 18:55:47'),
(130, 1, 1, 129, 'Комментарий', '2024-11-30 18:55:48'),
(136, 1, 1, NULL, 'const token = Cookies.get(\"auth_token\");\n        try {asdasdasd\n            await updateCommentById(commentId, { content: editingContent }, token);\n            setEditingCommentId(null);\n            fetchComments();\n        } catch (error) {\n            console.error(\"Error editing comment:\", error);\n        }', '2024-11-30 19:32:56'),
(143, 1, 1, 78, 'ыфвфывфывфыв', '2024-11-30 20:17:06'),
(144, 1, 1, 143, 'фывфывфы', '2024-11-30 20:17:10'),
(145, 1, 45, 130, 'dsf', '2024-12-01 09:09:19'),
(146, 1, 45, 145, 'sdfsdf', '2024-12-01 09:09:20'),
(147, 1, 45, 146, 'dsf', '2024-12-01 09:09:22'),
(148, 1, 45, 147, 'sdfdsf', '2024-12-01 09:09:24'),
(149, 1, 1, 143, 'dsf', '2024-12-03 19:14:39');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tags`
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
-- Table structure for table `users`
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
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `dateRegistration`, `isAdmin`) VALUES
(1, 'Admin', 'cebotarenkodima@gmail.com', '$2b$10$WWA25AmSE9TOgjd3accXAuI7FsKLcXHNKfVl5IsbCs4kZ5bO8vwbi', '2024-11-12', 1),
(43, 'Иван Петров', 'ivan.petrov@example.com', '$2b$10$rw8H6ii7Zl6PoVoyEYSe/OLlgJPlVq267DNfT5arJO8EpbIRb2FIC', '2024-11-17', NULL),
(44, 'Мария Сидорова', 'maria.sidorova@example.com', '$2b$10$j5NhqfRzKQWNXKkX5/HWE.h18kYq1atOVgINxZCtqswzGz4gi7e8G', '2024-11-17', NULL),
(45, 'Алексей Смирнов', 'alexey.smirnov@example.com', '$2b$10$G8w4YwUNmXMVC8sT3anYq.tSSTY8a./aDygWdq/lSV.Ha6PPU9omW', '2024-11-17', NULL),
(48, 'Ysell', 'soniaov24@gmail.com', '$2b$10$CGlqa.3626GkrszGjKKIReQAC2bh7y6PwlbTGqbsNGT/1SErxYcBK', '2024-11-17', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `article_tags`
--
ALTER TABLE `article_tags`
  ADD PRIMARY KEY (`article_id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_id` (`article_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `parent_comment_id` (`parent_comment_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`ID`) ON DELETE SET NULL;

--
-- Constraints for table `article_tags`
--
ALTER TABLE `article_tags`
  ADD CONSTRAINT `article_tags_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `article_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`parent_comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
